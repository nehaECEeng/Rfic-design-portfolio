# SKY130 op-amp design report

## Circuit

The selected circuit has complementary NMOS and PMOS input pairs. The first stage uses current mirrors. A common-source second stage provides more gain. A 2 kΩ resistor and a MIM capacitor provide Miller compensation. This version does not use the folded-cascode devices from the original circuit. The schematic and transistor sizes are in `../final/`.

Several earlier candidates had connection or compensation problems. The selected v8 candidate was kept as the baseline. Its NMOS input devices are wide, and the compensation capacitor is larger than in the earlier version. These choices improved bias headroom and stability in the simulations. The dimensions are listed in `../final/opamp_rri_final.spice`.

## Simulation setup

The simulations used ngspice 45.2 and the SKY130A models at 27 °C. Supply voltage was 1.8 V and load capacitance was 2 pF. The loop-gain test used a 0 V DC / 1 V AC source in series at the feedback return. It measured the first descending 0 dB crossing.

ngspice `vp()` returns phase in radians. The testbench converts it to degrees and unwraps the phase before calculating phase margin: 180° plus the phase at the unity-gain crossing. Raw measurements are in `../results/final_loopgain_full.log`. The extended TT, SS and FF results are in `extended_verification.md`.

## TT results at the five tested input voltages

| Vcm (V) | Gain at 1 Hz (dB) | UGB (MHz) | Phase at crossing (rad) | Phase (deg) | PM (deg) | Idd (µA) | Power (µW) |
|---:|---:|---:|---:|---:|---:|---:|---:|
| 0.45 | 72.91 | 11.824 | -1.772965 | -101.58 | 78.42 | 178.313 | 320.963 |
| 0.55 | 73.49 | 12.748 | -1.756364 | -100.63 | 79.37 | 179.858 | 323.744 |
| 0.65 | 73.62 | 12.945 | -1.754663 | -100.53 | 79.47 | 179.910 | 323.838 |
| 0.75 | 73.43 | 13.062 | -1.757384 | -100.69 | 79.31 | 179.750 | 323.549 |
| 0.85 | 72.37 | 13.063 | -1.764481 | -101.10 | 78.90 | 179.297 | 322.734 |

Gain, UGB, phase margin and power met their targets at these points. The corner tests also met those four targets at all five tested input voltages in TT, SS and FF. This does not mean the full design specification has passed.

## Bias and transient results

The earlier 41-point common-mode sweep showed both input pairs conducting and their currents changing smoothly. A later 17-point ICMR screen from 0.50 V to 1.30 V passed 9 points, giving a contiguous verified sampled range of 0.50–0.90 V. The first failing point was 0.95 V, where the PMOS tail loses saturation headroom. The 1.30 V endpoint also fails tracking, gain and UGB checks. See `../../icmr_verification/icmr_report.md`. The NMOS input pair operates in weak inversion at the five points in the device table.

At Vcm=0.65 V, a 100 mV unity-follower step with a 2 pF load gave 3.69 V/µs rising and 6.72 V/µs falling slew. Both are below the 10 V/µs target, so the slew-rate target failed. The measured 10–90% rise time was 22.22 ns and the 90–10% fall time was 25.07 ns.

The older unity-follower output-transfer sweep recorded 0.102–1.112 V in TT, 0.102–1.183 V in SS and 0.103–1.046 V in FF. It mixed output range with input common-mode range. A later separate closed-loop output-swing test passed all nine DC requests from 0.30 V to 1.50 V within 2.865 mV; during the step test, the output briefly ranged from 0.2990 V to 1.5077 V. See `../../output_swing_verification/output_swing_report.md`.

Plots are in `../results/`. The data and logs used to make them are stored alongside the plots.

## Specification status

| Requirement | Target | Measured result | Status |
|---|---:|---:|:---|
| Gain | ≥60 dB | 70.80–73.74 dB across tested corners and points | Pass in tested cases |
| UGB | ≥10 MHz | 11.057–13.163 MHz | Pass in tested cases |
| Phase margin | ≥60° | 77.70–79.95° | Pass in tested cases |
| Power | <500 µW | 317.28–325.21 µW | Pass in tested cases |
| Slew rate | ≥10 V/µs | Rising 3.67–3.72; falling magnitude 6.60–6.86 V/µs | Fail |
| ICMR | 0.50–1.30 V | 9 of 17 points pass; sampled range 0.50–0.90 V | Partial; target not passed |
| Output swing | 0.30–1.50 V | Nine separate closed-loop DC points pass within 2.865 mV | Pass for tested points |
| Noise | No target stated | 1 Hz–1 GHz unity-follower result; see noise audit for both integration methods | Measured; no pass/fail target |
| CMRR, PSRR, temperature | — | Not tested | Not done |

The output-swing test is separate from the ICMR sweep. Its transient output briefly reached 0.2990–1.5077 V during switching. The project has not passed the complete specification.

## Schematic and physical design

The Xschem source uses SKY130 transistor and capacitor symbols. Its device lines match the SPICE circuit in the documented comparison. The portfolio also includes a cleaned wired schematic image and a separate netlist comparison for that candidate.

No transistor-level layout was made. Layout, DRC, LVS, extraction, and post-layout simulation are still pending. See `physical_verification.md`.
