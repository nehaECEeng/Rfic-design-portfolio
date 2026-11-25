# ICMR verification report

## Test setup

The target is 0.50–1.30 V. The new sweep tested 17 points at 0.05 V steps, using the existing unity-follower and series-injection loop-gain setup. It used SKY130A TT models at 27 °C, a 1.8 V supply and a 2 pF load.

At each point, the test measured the DC output, loop gain, UGB, phase margin, supply current, both input-pair currents and both tail currents. It also recorded Id, VGS, VTH, VDS and model VDSAT for the bias, input, mirror and second-stage devices.

A point passes only if output error is within ±10 mV, gain is at least 60 dB, UGB is at least 10 MHz, PM is at least 60°, power is below 500 µW, the OP and AC analyses complete, and the current sources/mirrors/gain devices pass the model VDS≥VDSAT check. At least one complete NMOS or PMOS input pair must conduct at ≥1 µA per device and pass that model check. The 10 mV tracking and 1 µA conduction limits are explicit screening criteria, not new circuit specifications.

## Results

- Points tested: 17.
- Maximum absolute output tracking error: 196.231 mV.
- Gain across points with valid measurements: 30.58–73.62 dB.
- UGB across points with valid measurements: 3.246–13.086 MHz.
- Phase margin across points with valid measurements: 77.66–110.15°.

- Actual verified sampled range(s): 0.50–0.90 V.

Output tracking stays within ±10 mV through 1.00 V. It first exceeds that limit at 1.05 V; the error there is -19.800 mV. The strict verified range ends earlier because a tail device leaves saturation at 0.95 V.

The range is verified only at the listed 0.05 V sample points; the test does not prove behavior between points.

First failing point from the low end: **0.95 V**. XPTAIL is below saturation: VDS=0.2291 V, VDSAT=0.2594 V (margin -30.2 mV); input pairs: both pairs active.

## Later failure points

At 0.95 V, XPTAIL has VDS=0.2291 V and VDSAT=0.2594 V, so the model check places it in triode. At 1.00 V, gain is 52.11 dB (below 60 dB) and XMN2 is below VDSAT by 6.5 mV. At 1.05 V, tracking error is -19.800 mV and UGB is 9.875 MHz. At 1.30 V, output error is -196.231 mV, gain is 30.58 dB and UGB is 3.246 MHz; neither complete input pair passes the saturation check.

## Changes to consider later

No circuit changes were made. A later design pass should first address PMOS tail headroom near 0.95 V, then check high-side input-pair headroom, gain and output tracking.

## Reproduce

From this folder, run `ngspice -b tb_icmr_0p50_1p30.spice`, then run `python3 parse_icmr_results.py` to rebuild the CSVs, plots and report.

## Target status: PARTIAL

9 of 17 sampled points pass all screening criteria. The target is not counted as passed unless all 17 points pass. No circuit changes were made. Any required bias or device changes should be considered separately after reviewing the failure points.

## Files

- `tb_icmr_0p50_1p30.spice` — new testbench.
- `icmr_sweep.log` — raw ngspice output.
- `icmr_summary.csv` — point-by-point tracking and AC summary.
- `icmr_device_operating_points.csv` — model operating-point values and region checks.
- `icmr_metrics.png`, `icmr_bias_currents.png`, `icmr_device_regions.png` — plots.
- `parse_icmr_results.py` — parser and plotting script.
