# Output-swing verification report

## Test conditions

The target is 0.30–1.50 V. These SKY130A TT simulations used 27 °C, 1.8 V supply and 2 pF load. The nine requested DC points were 0.30, 0.40, 0.50, 0.70, 0.90, 1.10, 1.30, 1.40 and 1.50 V.

Two closed-loop DC tests were run. The unity follower makes input common mode equal the requested output, so its error can include an input-stage common-mode limit. The isolated-swing test uses an 80 kΩ/20 kΩ feedback divider and Vref=0.5875 V (feedback factor 0.2). It maps Vin=0.2·Vout_target+0.47 V, keeping both inputs between 0.53 V and 0.77 V while requesting 0.30–1.50 V at the output. This separates output swing from a large input common-mode sweep.

The isolated test records supply current and model Id, VGS, VTH, VDS and VDSAT for 15 devices. XM6 and XM7 are the output pull-down and pull-up. The transient test uses the same feedback network and load for a 0.30 V to 1.50 V demand and return step.

A sampled output counts as reached if isolated DC error is within ±10 mV, power is below 500 µW, and both output transistors pass |VDS|≥VDSAT. The ±10 mV limit is the tracking criterion used here.

## DC results

- Isolated measured output range: 0.3001–1.4971 V for requests from 0.30 to 1.50 V.
- Largest absolute isolated tracking error: 2.86 mV.
- Supply current: 174.2–180.6 µA; power: 313.5–325.0 µW.
- Sampled levels passing tracking and output-device checks: 0.30, 0.40, 0.50, 0.70, 0.90, 1.10, 1.30, 1.40, 1.50 V.
- Isolated-test failure detail: none; all nine requested levels met the stated checks.

The unity follower was also tested at the same nine input levels. Its output range was 0.3007–1.1121 V. This is for comparison and is not used by itself to claim output swing because its input common mode follows the output request.

## Transient results

The output settled to 0.3001 V at the low level, 1.4971 V at the high level and 0.3001 V after returning low. During the switching edges it ranged from 0.2990 V to 1.5077 V and briefly did not track the requested level. At the stable portions, the maximum absolute error was under 3 mV. The waveform and error are in the transient CSV and plot.

## Status

**PASS** against the 0.30–1.50 V target. PASS requires both endpoints and all listed points to meet the tracking and output-device checks. No circuit changes were made.

## Reproduce

From this folder run `ngspice -b tb_output_swing_isolated_dc.spice > isolated_dc.log 2>&1`, `ngspice -b tb_output_swing_follower_dc.spice > follower_dc.log 2>&1` and `ngspice -b tb_output_swing_isolated_transient.spice > isolated_transient.log 2>&1`. Then run `MPLCONFIGDIR=.mplconfig python3 analyze_output_swing.py` to rebuild the CSVs, plots and report.
