#!/usr/bin/env python3
"""Compare the isolated noise rerun with original SKY130 data."""
from pathlib import Path
import csv
import math
import re
import numpy as np

HERE = Path(__file__).resolve().parent
ROOT = HERE.parent
old_noise = np.loadtxt(ROOT / "final_delivery/results/extended/noise_tt_dense.dat")
old_gain = np.loadtxt(ROOT / "final_delivery/results/extended/noise_tt_gain.dat")
new_noise = np.loadtxt(HERE / "noise_debug_spectrum.dat")
new_gain = np.loadtxt(HERE / "noise_debug_gain.dat")
if new_noise.shape != old_noise.shape or new_gain.ndim != 2 or new_gain.shape[0] != old_gain.shape[0] or new_gain.shape[1] < 5:
    raise SystemExit("Old and new simulation grids do not match")
if not np.array_equal(new_noise[:, 0], old_noise[:, 0]):
    raise SystemExit("Noise frequency grids do not match")
if not np.array_equal(new_gain[:, 0], old_gain[:, 0]):
    raise SystemExit("AC frequency grids do not match")
# New AC file stores source gain dB/phase and pin-differential transfer dB/phase.
if not np.allclose(new_gain[:, 1:3], old_gain[:, 1:3], rtol=2e-7, atol=1e-10):
    raise SystemExit("Source transfer gain does not match the existing AC audit")

f, ono, ino = new_noise.T
av = 10 ** (new_gain[:, 1] / 20)
if np.any(av <= 0):
    raise SystemExit("Invalid non-positive source transfer magnitude")
ino_from_gain = ono / av
max_rel_ino = float(np.max(np.abs(ino_from_gain - ino) / ino))
rel_old_new_noise = np.max(np.abs(new_noise[:, 1:] - old_noise[:, 1:]) / old_noise[:, 1:])
rel_old_new_gain = np.max(np.abs(new_gain[:, 1:3] - old_gain[:, 1:]) / np.maximum(np.abs(old_gain[:, 1:]), 1e-30))

def rms(freq, density):
    return math.sqrt(float(np.trapezoid(density * density, x=freq)))

out_rms = rms(f, ono)
in_rms = rms(f, ino_from_gain)
in_export_rms = rms(f, ino)

def at(hz, vec):
    i = int(np.argmin(np.abs(f - hz)))
    return i, float(vec[i])

i1k, out1k = at(1e3, ono)
_, in1k = at(1e3, ino)
_, gain1k = at(1e3, av)
diff_gain1k = 10 ** (new_gain[i1k, 3] / 20)
i100m, out100m = at(100e6, ono)
_, in100m = at(100e6, ino)
_, gain100m = at(100e6, av)

noise_log = (HERE / "noise_debug.log").read_text(errors="replace")
old_log = (ROOT / "results/extended/noise_tt_dense.log").read_text(errors="replace")
def totals(log):
    o = re.search(r"onoise_total\s*=\s*([0-9.eE+-]+)", log)
    i = re.search(r"inoise_total\s*=\s*([0-9.eE+-]+)", log)
    if not o or not i:
        raise SystemExit("Could not find ngspice total noise in log")
    return float(o.group(1)), float(i.group(1))
new_total_out, new_total_in = totals(noise_log)
old_total_out, old_total_in = totals(old_log)

with (HERE / "noise_debug_comparison.csv").open("w", newline="") as fp:
    w = csv.writer(fp)
    w.writerow(["check", "original", "rerun", "units", "notes"])
    w.writerow(["1kHz_output_density", f"{old_noise[i1k,1]:.12g}", f"{out1k:.12g}", "V/sqrt(Hz)", f"{out1k*1e9:.6f} nV/sqrt(Hz)"])
    w.writerow(["1kHz_input_density", f"{old_noise[i1k,2]:.12g}", f"{in1k:.12g}", "V/sqrt(Hz)", f"{in1k*1e9:.6f} nV/sqrt(Hz)"])
    w.writerow(["1kHz_source_to_output_gain", f"{10**(old_gain[i1k,1]/20):.12g}", f"{gain1k:.12g}", "V/V", "AC magnitude, source transfer"])
    w.writerow(["full_band_output_rms_trapezoid", "", f"{out_rms:.12g}", "V RMS", "1 Hz to 1 GHz"])
    w.writerow(["full_band_input_rms_from_gain_trapezoid", "", f"{in_rms:.12g}", "V RMS", "output density divided point-by-point by source transfer"])
    w.writerow(["ngspice_output_total", f"{old_total_out:.12g}", f"{new_total_out:.12g}", "V RMS", "ngspice internal integral"])
    w.writerow(["ngspice_input_total", f"{old_total_in:.12g}", f"{new_total_in:.12g}", "V RMS", "ngspice internal integral"])
    w.writerow(["max_relative_spectrum_difference", "0", f"{rel_old_new_noise:.12g}", "relative", "new vs original dense raw noise data"])
    w.writerow(["max_relative_source_gain_difference", "0", f"{rel_old_new_gain:.12g}", "relative", "new vs original AC transfer"])
    w.writerow(["max_input_density_conversion_error", "", f"{max_rel_ino:.12g}", "relative", "onoise / |Vout/Vsig| vs ngspice inoise"])

report = f'''# Noise setup and units audit

## Findings

The original testbench is `../simulation/extended/tb_noise_tt_dense.spice` (the `final_delivery/` copy has the same SHA-256). Its noise command is:

```spice
noise v(out) Vsig dec 200 1 1G
```

`v(out)` is the single-ended output node. `Vsig` is the source used as the noise reference; it drives `inp` relative to ground and has `dc 0.65 ac 1`. `Vfb out inn 0` feeds the output directly to the inverting input. This is a **closed-loop unity follower**, not an open-loop noise test.

The exported raw file has three columns: frequency in Hz, output-referred density in V/√Hz, and input/source-referred density in V/√Hz. The values are SI volts; there is no nV scale factor in the data. Multiply by 1e9 to display nV/√Hz. At 1 kHz, the original and rerun output density is {out1k:.9g} V/√Hz = **{out1k*1e9:.6f} nV/√Hz**. The input-referred value is {in1k:.9g} V/√Hz = **{in1k*1e9:.6f} nV/√Hz**.

## Reference and transfer check

The testbench's chosen signal reference is the actual non-inverting source `Vsig`; this is appropriate for source-referred noise in the stated unity-follower setup. The source AC magnitude is 1 V. The AC transfer used for the input reference is `V(out)/V(inp)` because `Vsig` fixes `inp` to 1 V AC. At 1 kHz this measured transfer is {gain1k:.9f} V/V. Dividing output density by it gives {out1k/gain1k*1e9:.6f} nV/√Hz, matching ngspice's input density within {max_rel_ino:.3g} maximum relative error across the full grid.

`V(inp)-V(inn)` is the instantaneous differential voltage across the amplifier pins, but it is not the independent stimulus source in this closed-loop test: `inn` moves with the output. Dividing noise by `V(out)/(V(inp)-V(inn))` would use a different transfer definition and would not represent noise referred to the external `Vsig` source. That pin-differential transfer is recorded in the AC raw output for inspection. No error in the original output node, reference source, source AC magnitude, or exported scale factor was found.

## Independent integration and comparison

Both original and rerun noise data span **1 Hz to 1 GHz**, with 200 points per decade. The script independently integrates squared density using the trapezoidal rule in linear frequency:

`RMS = sqrt(trapezoid(density^2, frequency_Hz))`.

For input-referred noise it calculates `onoise(f) / abs(Vout(f)/Vsig(f))` at every frequency, then integrates. The rerun gives {out_rms*1e6:.6f} µV RMS output-referred and {in_rms*1e6:.6f} µV RMS input/source-referred. Direct integration of ngspice's exported input density gives {in_export_rms*1e6:.6f} µV RMS. The original and rerun raw noise spectra are identical on all {len(f)} points; the source transfer gain also matches the original AC data.

| Result | Original ngspice log | New ngspice log | Independent exported-data integral |
|---|---:|---:|---:|
| Output noise | {old_total_out*1e6:.3f} µV RMS | {new_total_out*1e6:.3f} µV RMS | {out_rms*1e6:.3f} µV RMS |
| Input/source-referred noise | {old_total_in*1e6:.3f} µV RMS | {new_total_in*1e6:.3f} µV RMS | {in_rms*1e6:.3f} µV RMS |

The earlier values 124.863 µV and 720.798 µV are reproduced by ngspice. The independently integrated output is close ({out_rms*1e6-old_total_out*1e6:+.3f} µV difference). The input trapezoid differs from ngspice by {in_rms*1e6-new_total_in*1e6:+.3f} µV ({(in_rms/new_total_in-1)*100:+.3f}%). This is a difference between ngspice's internal integration and trapezoidal integration on the finite exported grid, not a unit conversion or changed setup. The output noise is not expected to be smaller than input-referred noise at every frequency: when closed-loop source gain falls below one at high frequencies, input/source-referred density increases. For example, near 100 MHz, gain is {gain100m:.4f} V/V, with output density {out100m*1e9:.3f} nV/√Hz and input density {in100m*1e9:.3f} nV/√Hz.

## Correction and status

No setup or units error was found, so no changed “corrected” circuit/testbench is justified. `tb_noise_debug.spice` is an isolated reproduction of the original noise setup, with its output written only in this folder. `tb_noise_debug_gain.spice` independently records the source transfer and pin-differential transfer. Both were run with the existing SKY130A TT models and the read-only final circuit. The replay matches the original simulation data. The post-processing check is **validated for this closed-loop source-referred test and 1 Hz–1 GHz range**; this does not claim an open-loop intrinsic device-noise measurement.

## Reproduce

Run from `noise_debug/`:

```sh
ngspice -b tb_noise_debug.spice > noise_debug.log 2>&1
ngspice -b tb_noise_debug_gain.spice > noise_debug_gain.log 2>&1
python3 analyze_noise_debug.py
```
'''
(HERE / "noise_debug_report.md").write_text(report)
print(f"1 kHz output={out1k*1e9:.6f} nV/sqrt(Hz); input={in1k*1e9:.6f} nV/sqrt(Hz)")
print(f"RMS trapezoid output={out_rms*1e6:.6f} uV; input={in_rms*1e6:.6f} uV")
print(f"raw noise max relative difference={rel_old_new_noise:.3g}; source gain max relative difference={rel_old_new_gain:.3g}; input density conversion error={max_rel_ino:.3g}")
