# SKY130 LNA — FF Process Corner at 27°C

## Overview

This variant evaluates the Q = 8, multiplier = 4 LNA design under the **Fast-Fast (FF) process corner at 27°C**.

- Technology: SKY130A
- Process corner: FF
- Temperature: 27°C
- Supply voltage: 1.8 V
- Centre frequency: 2.4 GHz
- AC sweep: 1–4 GHz, 3001 points
- Noise analysis: 1–5 GHz, 41 points
- Simulator: ngspice 45.2

## Simulated results at 2.4 GHz

| Parameter | Result |
|---|---:|
| S11 | -28.851 dB |
| S21 | +13.473 dB |
| S12 | -56.415 dB |
| S22 | -40.288 dB |
| Input resistance (Rin) | 50.408 Ω |
| Input reactance (Xin) | +3.604 Ω |
| Output resistance (Rout) | 49.464 Ω |
| Output reactance (Xout) | -0.799 Ω |
| Rollet stability factor (K) | 70.061 |
| μ | 59.793 |
| μ′ | 23.148 |
| Noise figure (NF) | 3.044 dB |

## Bandwidth results

| Metric | Lower frequency | Upper frequency | Bandwidth |
|---|---:|---:|---:|
| S11 below -10 dB | 2.176098 GHz | 2.598471 GHz | 422.373 MHz |
| S22 below -10 dB | 2.185785 GHz | 2.684116 GHz | 498.331 MHz |
| S21 within 3 dB of maximum | 1.959231 GHz | 2.785084 GHz | 825.853 MHz |

The minimum S11 is -48.407 dB at 2.377 GHz.

## Plots

The following plots were generated from this variant's own simulation data:

1. `results/plots/lna_corner_ff_27/01_return_loss.png`
2. `results/plots/lna_corner_ff_27/02_gain_isolation.png`
3. `results/plots/lna_corner_ff_27/03_noise_figure.png`
4. `results/plots/lna_corner_ff_27/04_stability.png`
5. `results/plots/lna_corner_ff_27/05_impedances.png`

## Simulation data

- `results/data/lna_corner_ff_27/lna_corner_ff_27.log`
- `results/data/lna_corner_ff_27/lna_corner_ff_27_sparams.dat`
- `results/data/lna_corner_ff_27/lna_corner_ff_27_nf.dat`

The S-parameter export contains 3001 frequency points. The noise export contains 41 frequency points.

## Notes

- This is a simulated process-corner result, not a measured hardware result.
- The schematic uses a fixed gate-bias source; the matching response can shift under process and temperature variations.
- This variant does not include a large-signal power sweep. P1dB, IIP3 and OIP3 are therefore not reported.
- Stability factors are above 1 at 2.4 GHz, indicating unconditional stability at the design frequency under the calculated two-port criteria.
