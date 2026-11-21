# SKY130A 2.4 GHz LNA — Master Comparison Report

## Project overview

This project contains seven ngspice-simulated low-noise amplifier (LNA) variants using the SKY130A process. The variants investigate bandwidth, resonator quality factor, process corners, and operating temperature.

All results are circuit simulations, not measured silicon results.

## Common simulation conditions

- Technology: SKY130A
- Supply voltage: 1.8 V
- Centre frequency: 2.4 GHz
- AC sweep: 1–4 GHz, 3001 points
- Noise sweep: 1–5 GHz, 41 points
- Simulator: ngspice

## Performance comparison at 2.4 GHz

| Variant | S11 (dB) | S21 (dB) | S12 (dB) | S22 (dB) | NF (dB) | K |
|---|---:|---:|---:|---:|---:|---:|
| BW300 baseline | -53.3606 | 13.3478 | -57.8594 | -65.2379 | 1.1560 | 84.0551 |
| Q8 / M4 | -39.90756 | 13.23085 | -57.56603 | -56.94001 | 3.108142 | 82.35687 |
| FF, 27°C | -28.85073 | 13.47334 | -56.41519 | -40.28834 | 3.044028 | 70.06133 |
| FF, 85°C | -26.11938 | 11.22714 | -55.62000 | -39.23141 | 4.388930 | 82.70224 |
| SS, 27°C | -25.21654 | 12.51113 | -58.69553 | -41.58603 | 3.290570 | 101.5927 |
| SS, 85°C | -20.36095 | 10.51280 | -57.97312 | -42.13079 | 4.651122 | 116.9374 |
| TT, 85°C | -25.17457 | 11.13400 | -56.78181 | -55.77124 | 4.436565 | 95.51022 |

## Bandwidth comparison

| Variant | S11 below -10 dB | S22 below -10 dB | S21 within 3 dB |
|---|---:|---:|---:|
| BW300 baseline | 320.430 MHz | 531.890 MHz | 711.290 MHz |
| Q8 / M4 | 420.652 MHz | 493.269 MHz | 825.109 MHz |
| FF, 27°C | 422.373 MHz | 498.331 MHz | 825.853 MHz |
| FF, 85°C | 398.315 MHz | 498.718 MHz | 806.543 MHz |
| SS, 27°C | 413.872 MHz | 488.501 MHz | 820.879 MHz |
| SS, 85°C | 396.079 MHz | 488.886 MHz | 810.461 MHz |
| TT, 85°C | 399.546 MHz | 493.680 MHz | 809.541 MHz |

Bandwidth definitions:
- S11 bandwidth: frequency range where input return loss is below -10 dB.
- S22 bandwidth: frequency range where output return loss is below -10 dB.
- S21 bandwidth: frequency range within 3 dB of the maximum simulated gain.

## DC operating point

| Variant | Supply current | DC power |
|---|---:|---:|
| Q8 / M4 | approximately 2.518 mA | approximately 4.53 mW |
| FF, 85°C | approximately 2.327329 mA | approximately 4.189 mW |
| SS, 27°C | approximately 2.035121 mA | approximately 3.663 mW |
| SS, 85°C | approximately 1.725402 mA | approximately 3.106 mW |
| TT, 85°C | approximately 2.073425 mA | approximately 3.732 mW |

DC values are included where confirmed in the individual simulation records.

## Stability

All seven variants have a Rollett stability factor K greater than 1 at 2.4 GHz. The simulated μ and μ' values are also documented in each individual variant report.

These point values should not replace a full frequency-range stability assessment. Refer to each variant's stability plot.

## Power sweep and linearity limitations

- The BW300 baseline and Q8/M4 variants include 14-point input-power sweeps.
- Their IIP3/OIP3 figures are gain-compression-based estimates, not results from a conventional two-tone third-order intermodulation simulation.
- No large-signal power sweep was performed for the five process-corner variants.
- P1dB and IIP3/OIP3 are therefore not reported for those five variants.

## Noise figure interpretation

The corner simulations use a schematic noise-figure calculation with a fixed 300.15 K reference temperature.

At 27°C, this reference is approximately aligned with the device simulation temperature. At 85°C, the device simulation temperature is 358.15 K, so the reported schematic-calculated NF should not be interpreted as a conventional noise figure referenced to 85°C.

Use this caveat when comparing the 85°C noise-figure values.

## Individual variant reports

1. `README_lna_bw300.md`
2. `README_lna_q8_m4.md`
3. `README_lna_corner_ff_27.md`
4. `README_lna_corner_ff_85.md`
5. `README_lna_corner_ss_27.md`
6. `README_lna_corner_ss_85.md`
7. `README_lna_corner_tt_85.md`

## Results organization

- `results/data/` — exported S-parameter data, noise data, simulation logs, and power-sweep CSV files.
- `results/plots/` — five plots per variant: return loss, gain/isolation, noise figure, stability, and impedances.
- `results/netlists/` — generated ngspice netlists.
- `schematic/` — xschem circuit schematics, including process-corner variants.

## Conclusion

The seven simulations provide a comparison of baseline and Q8/M4 LNA configurations across selected SKY130A process corners and temperatures.

The results show differences in gain, matching, noise figure, and bandwidth under the simulated conditions. They provide a basis for further optimization and verification, including consistent noise-temperature treatment and more rigorous two-tone linearity analysis.
