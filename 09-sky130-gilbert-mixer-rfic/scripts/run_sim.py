#!/usr/bin/env python3
"""
Conversion gain / P1dB / IIP3 for gilbert_mixer.sp using ngspice transient + FFT.

Usage:
  export SKY130_LIB=/path/to/sky130A/libs.tech/ngspice/sky130.lib.spice
  export CORNER=tt            # tt ss ff sf fs
  python3 run_sim.py

Conventions
  * Vd = peak differential RF EMF applied at the gates (50 ohm series per side,
    gates are capacitive so gate voltage ~= EMF).
  * Pin(dBm) = Vd^2 / (8*100) / 1 mW   (100 ohm differential reference).
    With a real matching network that gives voltage step-up, true IIP3/P1dB
    referred to the antenna port improve by the matching gain.
  * CG is the VOLTAGE conversion gain, differential IF out / differential RF in.
"""
import os, subprocess, numpy as np

PDK    = os.environ.get("SKY130_LIB", "/path/to/sky130.lib.spice")
CORNER = os.environ.get("CORNER", "tt")
F_LO, F_RF1, F_RF2 = 2390e6, 2400e6, 2401e6   # 2.4 GHz RF, 10 MHz IF
TSTOP, TSTEP, TSETTLE = 4e-6, 10e-12, 1e-6
HERE = os.path.dirname(os.path.abspath(__file__))

def netlist(vd1, vd2, tag):
    a1, a2 = vd1 / 2, vd2 / 2          # per-side amplitude
    return f"""* tb {tag}
.lib "{PDK}" {CORNER}
.include {HERE}/gilbert_mixer.sp
.options method=gear reltol=1e-4
Vdd vdd 0 1.8
Vlop lop 0 SIN(0 0.5 {F_LO})
Vlon lon 0 SIN(0 0.5 {F_LO} 0 0 180)
Vp1 a 0 SIN(0 {a1} {F_RF1})
Vp2 b a SIN(0 {a2} {F_RF2})
Rsp b rfp 50
Vn1 c 0 SIN(0 {a1} {F_RF1} 0 0 180)
Vn2 d c SIN(0 {a2} {F_RF2} 0 0 180)
Rsn d rfn 50
Xdut rfp rfn lop lon outp outn vdd 0 gilbert
.control
tran {TSTEP} {TSTOP}
let vd = v(outp) - v(outn)
linearize vd
wrdata {HERE}/out_{tag}.txt vd
quit
.endc
.end
"""

def run(vd1, vd2=0.0, tag="t"):
    cir = f"{HERE}/tb_{tag}.cir"
    open(cir, "w").write(netlist(vd1, vd2, tag))
    subprocess.run(["ngspice", "-b", cir], check=True, capture_output=True)
    d = np.loadtxt(f"{HERE}/out_{tag}.txt")
    t, v = d[:, 0], d[:, 1]
    m = t >= TSETTLE
    t, v = t[m], v[m]
    w = np.hanning(len(v))
    V = np.abs(np.fft.rfft(v * w)) * 2 / w.sum()
    f = np.fft.rfftfreq(len(v), t[1] - t[0])
    return f, V

def amp(f, V, f0):
    i = np.argmin(abs(f - f0))
    return V[max(i - 2, 0): i + 3].max()

def dbm(vd):
    return 10 * np.log10(vd**2 / (8 * 100) / 1e-3)

if __name__ == "__main__":
    # 1) conversion gain (small signal)
    f, V = run(20e-3, tag="cg")
    cg = amp(f, V, F_RF1 - F_LO) / 20e-3
    print(f"Voltage conversion gain  = {20*np.log10(cg):.2f} dB")

    # 2) P1dB
    vds = np.logspace(np.log10(10e-3), np.log10(600e-3), 14)
    g = []
    for k, vd in enumerate(vds):
        f, V = run(vd, tag=f"p{k}")
        g.append(20 * np.log10(amp(f, V, F_RF1 - F_LO) / vd))
    g = np.array(g); pin = dbm(vds)
    ss = g[0]
    idx = np.where(g < ss - 1)[0]
    if len(idx):
        j = idx[0]
        p1 = np.interp(ss - 1, [g[j], g[j-1]], [pin[j], pin[j-1]])
        print(f"Input P1dB               = {p1:.2f} dBm (ref. 100 ohm diff)")
    else:
        print("P1dB not reached; extend the sweep upward")

    # 3) two-tone IIP3
    vd = 40e-3
    f, V = run(vd, vd, tag="im3")
    p_if  = 20 * np.log10(amp(f, V, F_RF1 - F_LO))
    p_im3 = 20 * np.log10(max(amp(f, V, 2*F_RF1 - F_RF2 - F_LO),
                              amp(f, V, 2*F_RF2 - F_RF1 - F_LO)))
    iip3 = dbm(vd) + (p_if - p_im3) / 2
    print(f"IIP3                     = {iip3:.2f} dBm (ref. 100 ohm diff)")
    print("NF: needs periodic noise analysis (pnoise); see notes.")
