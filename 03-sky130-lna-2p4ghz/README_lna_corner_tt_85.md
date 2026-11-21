# SKY130 LNA — TT Corner at 85°C

## Simulation configuration
- Process corner: Typical-Typical (TT)
- Temperature: 85°C
- Supply voltage: 1.8 V
- Operating frequency: 2.4 GHz
- AC sweep: 1–4 GHz, 3001 points
- Noise sweep: 1–5 GHz, 41 points

## Simulated results at 2.4 GHz

| Parameter | Result |
|---|---:|
| S11 | -25.17457 dB |
| S21 | +11.13400 dB |
| S12 | -56.78181 dB |
| S22 | -55.77124 dB |
| Input resistance | 45.76024 Ω |
| Input reactance | -3.148044 Ω |
| Output resistance | 49.86866 Ω |
| Output reactance | -0.09569325 Ω |
| Rollett stability factor (K) | 95.51022 |
| Stability factor (μ) | 148.9182 |
| Stability factor (μ') | 16.57561 |
| Noise figure | 4.436565 dB |

## Bandwidth

| Metric | Frequency range | Bandwidth |
|---|---|---:|
| S11 below -10 dB | 2.228618–2.628164 GHz | 399.546 MHz |
| S22 below -10 dB | 2.181616–2.675296 GHz | 493.680 MHz |
| S21 within 3 dB of maximum | 1.986699–2.796240 GHz | 809.541 MHz |

- Minimum S11: -27.09651 dB at 2.420 GHz.

## DC operating point
- Supply voltage: 1.8 V
- Supply current: approximately 2.073425 mA
- DC power: approximately 3.732 mW

## Plots
1. `results/plots/lna_corner_tt_85/01_return_loss.png`
2. `results/plots/lna_corner_tt_85/02_gain_isolation.png`
3. `results/plots/lna_corner_tt_85/03_noise_figure.png`
4. `results/plots/lna_corner_tt_85/04_stability.png`
5. `results/plots/lna_corner_tt_85/05_impedances.png`

## Simulation data
- S-parameters: `results/data/lna_corner_tt_85/lna_corner_tt_85_sparams.dat`
- Noise data: `results/data/lna_corner_tt_85/lna_corner_tt_85_nf.dat`
- Simulation log: `results/data/lna_corner_tt_85/lna_corner_tt_85.log`

## Notes
- Results are from the TT-corner ngspice simulation.
- No large-signal power sweep was performed; P1dB and IIP3/OIP3 are not reported.
- Noise figure is the schematic-calculated value using a fixed 300.15 K reference, while the device simulation temperature is 358.15 K. It should not be interpreted as a conventional noise figure referenced to 85°C.
