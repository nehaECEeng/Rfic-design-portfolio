# SKY130 two-stage op-amp delivery

This folder contains the selected v8 circuit, its Xschem source, simulation testbenches, raw results, and reports. The circuit has complementary NMOS and PMOS input pairs, current-mirror loads, a common-source second stage, and Miller compensation. It uses SKY130A transistor models and was simulated with ngspice.

This is a circuit-level simulation project, not a fabricated chip or a tapeout-ready design.

## Measured results

The TT, SS, and FF runs used a 1.8 V supply, a 2 pF load, and five common-mode points from 0.45 V to 0.85 V. ICMR and output swing were checked separately.

| Measure | Target | Measured result | Status |
|---|---:|---:|:---|
| DC gain | ≥60 dB | 70.80–73.74 dB | Pass at tested corner points |
| Unity-gain bandwidth | ≥10 MHz | 11.057–13.163 MHz | Pass at tested corner points |
| Phase margin | ≥60° | 77.70–79.95° | Pass at tested corner points |
| Power | <500 µW | 317.28–325.21 µW | Pass at tested corner points |
| Rising slew rate | ≥10 V/µs | 3.67–3.72 V/µs | Fail |
| Falling slew-rate magnitude | ≥10 V/µs | 6.60–6.86 V/µs | Fail |
| ICMR | 0.50–1.30 V | 9 of 17 samples pass; contiguous sampled range 0.50–0.90 V | Partial; target not passed |
| DC output swing | 0.30–1.50 V | Nine requested levels track within 2.865 mV | Pass for those test points |
| Noise | No limit specified | 124.863 µV output and 720.798 µV source-referred RMS, 1 Hz–1 GHz | Measured; no pass/fail limit |

The noise test is a closed-loop unity-gain follower. At low frequencies the closed-loop gain is about 1 V/V, making output and source-referred noise densities nearly equal. Above the loop bandwidth, the transfer gain decreases, so dividing output noise by that frequency-dependent gain makes the source-referred curve rise. This is expected feedback behavior, not a units or scaling error. Trapezoidal integration of the exported samples gives 124.866 µV output and 717.984 µV source-referred RMS over 1 Hz–1 GHz. The difference from ngspice's totals is due to the numerical integration method on the finite frequency grid. No noise pass/fail limit was specified.

The ICMR sweep tested 17 points from 0.50 V to 1.30 V in 0.05 V steps. At 0.95 V, XPTAIL first falls below its model saturation check. These are sampled-point results, not a guarantee between points. The output-swing test used a separate feedback network to keep the input common mode in range; its transient output briefly reached 0.2990–1.5077 V during switching.

The complete design specification has not passed. Slew rate failed, and the ICMR target was not met. CMRR, PSRR, and temperature tests were not done. Layout, DRC, LVS, extraction, and post-layout simulation are incomplete.

## Files in this folder

- `final/` — selected circuit, schematic, and main testbench.
- `simulation/` — main, corner, transient, mismatch, and noise testbenches and analysis scripts.
- `results/` — raw ngspice logs and data, CSV summaries, and plots.
- `reports/` — design, bias, corner, noise, schematic, and physical-design reports.

Separate verification data is kept beside this delivery folder:

- [ICMR report](../icmr_verification/icmr_report.md), with the point-by-point CSV and device data.
- [Output-swing report](../output_swing_verification/output_swing_report.md), with DC and transient data.
- [Noise setup and integration audit](../noise_debug/noise_debug_report.md), with the replay and comparison data.
- [Portfolio schematic/netlist comparison](../reports/schematic_netlist_comparison.md).

## Reproduce the packaged simulations

The testbenches use a SKY130A library path that may need to be updated for a different PDK installation. Run the commands from `simulation/`:

```sh
ngspice -b tb_common_mode_handover.spice
ngspice -b tb_transient_slew.spice
ngspice -b tb_output_swing.spice
ngspice -b extended/tb_loopgain_tt.spice
ngspice -b extended/tb_loopgain_ss.spice
ngspice -b extended/tb_loopgain_ff.spice
ngspice -b extended/tb_noise_tt_dense.spice
ngspice -b extended/tb_noise_gain_check.spice
python3 plot_results.py
python3 make_performance_summary.py
python3 extended/make_corner_summary.py
```

The 25 mismatch benches are named `simulation/extended/tb_mismatch_seed_01.spice` through `tb_mismatch_seed_25.spice`. Run them from `simulation/`. The separate ICMR, output-swing, and noise-audit instructions are in their linked reports.

## Physical-design status

The source schematic was netlisted and compared with the SPICE circuit. A separate cleaned wired schematic candidate also matches the 17 component statements and external port order; see the comparison report. No transistor-level layout was made. Layout, DRC, LVS, parasitic extraction, and post-layout simulation have not been done. No physical-verification pass is claimed.
