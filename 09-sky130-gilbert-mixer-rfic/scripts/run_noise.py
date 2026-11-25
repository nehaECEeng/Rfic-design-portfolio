"""Coarse quasi-static noise estimate; this is not periodic steady-state noise.
Freeze the LO at four evenly spaced phases and average output-noise power at 50 MHz.
Run: python3 run_noise.py (ngspice required)."""
import subprocess, math, os
LIB="/home/nehan/.volare/volare/sky130/versions/0fe599b2afb6708d281543108caf8310912f54af/sky130A/libs.tech/ngspice/sky130.lib.spice"
RS_DIFF=100.0       # two 50-ohm sources in series
CG_DB=8.8303        # corrected transient small-signal gain from p1db_new.txt
T=300.15; KB=1.380649e-23
PHASES=[0, math.pi/2, math.pi, 3*math.pi/2]
S_LIST=[math.sin(p) for p in PHASES]  # four uniform snapshots over a complete LO cycle
BODY="""XM3 outn g3 n1 0 sky130_fd_pr__nfet_01v8 L=0.15 W=10 nf=1 ad=2.9 as=2.9 pd=20.58 ps=20.58 nrd=0.029 nrs=0.029 sa=0 sb=0 sd=0 mult=1 m=1
XM4 outp g4 n1 0 sky130_fd_pr__nfet_01v8 L=0.15 W=10 nf=1 ad=2.9 as=2.9 pd=20.58 ps=20.58 nrd=0.029 nrs=0.029 sa=0 sb=0 sd=0 mult=1 m=1
XM5 outp g5 n2 0 sky130_fd_pr__nfet_01v8 L=0.15 W=10 nf=1 ad=2.9 as=2.9 pd=20.58 ps=20.58 nrd=0.029 nrs=0.029 sa=0 sb=0 sd=0 mult=1 m=1
XM6 outn g6 n2 0 sky130_fd_pr__nfet_01v8 L=0.15 W=10 nf=1 ad=2.9 as=2.9 pd=20.58 ps=20.58 nrd=0.029 nrs=0.029 sa=0 sb=0 sd=0 mult=1 m=1
Rload2 VDD outn 500
Rload1 VDD outp 500
XMP1 n1 nbp VDD VDD sky130_fd_pr__pfet_01v8 L=0.5 W=4 nf=1 ad=1.16 as=1.16 pd=8.58 ps=8.58 nrd=0.0725 nrs=0.0725 sa=0 sb=0 sd=0 mult=8 m=8
XMP2 n2 nbp VDD VDD sky130_fd_pr__pfet_01v8 L=0.5 W=4 nf=1 ad=1.16 as=1.16 pd=8.58 ps=8.58 nrd=0.0725 nrs=0.0725 sa=0 sb=0 sd=0 mult=8 m=8
XM1 n1 gg1 0 0 sky130_fd_pr__nfet_01v8 L=0.15 W=4 nf=1 ad=1.16 as=1.16 pd=8.58 ps=8.58 nrd=0.0725 nrs=0.0725 sa=0 sb=0 sd=0 mult=10 m=10
Rbg1 gg1 nb 10k
Cc1 gg1 rfp 1m
XM2 n2 gg2 0 0 sky130_fd_pr__nfet_01v8 L=0.15 W=4 nf=1 ad=1.16 as=1.16 pd=8.58 ps=8.58 nrd=0.0725 nrs=0.0725 sa=0 sb=0 sd=0 mult=10 m=10
Rbg2 gg2 nb 10k
Cc2 gg2 rfn 1m
Iref VDD nb 250u
XMb nb nb 0 0 sky130_fd_pr__nfet_01v8 L=0.15 W=4 nf=1 ad=1.16 as=1.16 pd=8.58 ps=8.58 nrd=0.0725 nrs=0.0725 sa=0 sb=0 sd=0 mult=1 m=1
XMPb nbp nbp VDD VDD sky130_fd_pr__pfet_01v8 L=0.5 W=4 nf=1 ad=1.16 as=1.16 pd=8.58 ps=8.58 nrd=0.0725 nrs=0.0725 sa=0 sb=0 sd=0 mult=1 m=1
Ibp nbp 0 125u
Vdd VDD 0 1.8
Cl1 outp 0 2p
Cl2 outn 0 2p
Rext outp outn 20k"""
def deck(sv,tag,extra=""):
    hi=1.4+0.4*sv; lo=1.4-0.4*sv
    return (f"* noise snapshot s={sv:.4f}\n.lib {LIB} tt\n"+BODY+"\n"
      "Cnb nb 0 10p\n"+extra+"\n"
      f"Vg3 g3 0 {hi:.5f}\nVg5 g5 0 {hi:.5f}\nVg4 g4 0 {lo:.5f}\nVg6 g6 0 {lo:.5f}\n"
      "Rs1 rinp rfp 50\nVinp rinp 0 dc 0 ac 0.5\nRs2 rinn rfn 50\nVinn rinn 0 dc 0 ac -0.5\n"
      f".control\nnoise v(outp,outn) Vinp lin 1 50meg 50meg\nsetplot noise1\nwrdata snap_{tag}.txt onoise_spectrum\nac lin 1 50meg 50meg\nlet hr = real(v(outp)-v(outn))\nwrdata gain_{tag}.txt hr\n.endc\n.end\n")
def run(label,extra):
    vals=[]; hs=[]
    print("  s_LO    onoise (nV/rtHz)   diff gain h (V/V)")
    for i,sv in enumerate(S_LIST):
        fn=f"noise_new_{label}_{i}.cir"; open(fn,"w").write(deck(sv,f"{label}_{i}",extra))
        r=subprocess.run(["ngspice","-b",fn],capture_output=True,text=True)
        try:
            last=[l.split() for l in open(f"snap_{label}_{i}.txt") if l.strip()][-1]
            v=float(last[-1])
            g=[l.split() for l in open(f"gain_{label}_{i}.txt") if l.strip()][-1]
            h=float(g[-1])
        except Exception as e:
            print("snapshot",i,"failed:",e); print(r.stdout[-1500:]+r.stderr[-1500:]); raise SystemExit(1)
        vals.append(v); hs.append(h); print(f"  {sv:.4f}   {v*1e9:8.3f}          {h:8.4f}")
        os.remove(f"snap_{label}_{i}.txt"); os.remove(f"gain_{label}_{i}.txt")
    N=sum(v*v for v in vals)/len(vals)
    # The input is 1 V differential AC. The lower-sideband gain is half
    # the first-harmonic amplitude of the frozen-LO transfer function.
    gq=abs(sum(h*s for h,s in zip(hs,S_LIST)))/len(S_LIST)
    print(f"average output noise = {math.sqrt(N)*1e9:.2f} nV/rtHz (differential)")
    print(f"quasi-static sideband gain (phase projection) = {20*math.log10(gq):.2f} dB")
    g=10**(CG_DB/20)
    F=N/(g*g*4*KB*T*RS_DIFF)
    print(f"NF using measured transient gain {CG_DB:.2f} dB: SSB = {10*math.log10(F):.2f} dB; DSB = {10*math.log10(F/2):.2f} dB")
for label,extra in (("base",""),("bypass","Cnbp nbp 0 20p")):
    print("\n==",label,"==")
    run(label,extra)
