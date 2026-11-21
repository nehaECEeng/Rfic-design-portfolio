# SKY130 LNA — SS Corner at 85°C

## Simulation configuration
- Process corner: Slow-Slow (SS)
- Temperature: 85°C
- Supply voltage: 1.8 V
- Operating frequency: 2.4 GHz
- AC sweep: 1–4 GHz, 3001 points
- Noise sweep: 1–5 GHz, 41 points

## Simulated results at 2.4 GHz

| Parameter | Result |
|---|---:|
| S11 | -20.36095 dB |
| S21 | +10.51280 dB |
| S12 | -57.97312 dB |
| S22 | -42.13079 dB |
| Input resistance | 45.14332 Ω |
| Input reactance | -7.763405 Ω |
| Output resistance | 50.32006 Ω |
| Output reactance | +0.7167708 Ω |
| Rollett stability factor (K) | 116.9374 |
| Stability factor (μ) | 83.50155 |
| Stability factor (μ') | 9.984500 |
| Noise figure | 4.651122 dB |

## Bandwidth

| Metric | Frequency range | Bandwidth |
|---|---|---:|
| S11 below -10 dB | 2.258678–2.654757 GHz | 396.079 MHz |
| S22 below -10 dB | 2.176935–2.665821 GHz | 488.886 MHz |
| S21 within 3 dB of maximum | 1.998948–2.809409 GHz | 810.461 MHz |

- Minimum S11: -25.85309 dB at 2.449 GHz.

## DC operating point
- Supply voltage: 1.8 V
- Supply current: approximately 1.725402 mA
- DC power: approximately 3.106 mW

## Plots
1. `results/plots/lna_corner_ss_85/01_return_loss.png`
2. `results/plots/lna_corner_ss_85/02_gain_isolation.png`
3. `results/plots/lna_corner_ss_85/03_noise_figure.png`
4. `results/plots/lna_corner_ss_85/04_stability.png`
5. `results/plots/lna_corner_ss_85/05_impedances.png`

## Simulation data
- S-parameters: `results/data/lna_corner_ss_85/lna_corner_ss_85_sparams.dat`
- Noise data: `results/data/lna_corner_ss_85/lna_corner_ss_85_nf.dat`
- Simulation log: `results/data/lna_corner_ss_85/lna_corner_ss_85.log`

## Notes
- Results are from the SS-corner ngspice simulation.
- No large-signal power sweep was performed; P1dB and IIP3/OIP3 are not reported.
- Noise figure is the schematic-calculated value using a fixed 300.15 K reference, while the device simulation temperature is 358.15 K. It should not be interpreted as a conventional noise figure referenced to 85°C.
