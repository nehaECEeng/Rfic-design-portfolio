# SKY130 LNA — SS Corner at 27°C

## Simulation configuration
- Process corner: Slow-Slow (SS)
- Temperature: 27°C
- Supply voltage: 1.8 V
- Operating frequency: 2.4 GHz
- AC sweep: 1–4 GHz, 3001 points
- Noise sweep: 1–5 GHz, 41 points

## Simulated results at 2.4 GHz

| Parameter | Result |
|---|---:|
| S11 | -25.21654 dB |
| S21 | +12.51113 dB |
| S12 | -58.69553 dB |
| S22 | -41.58603 dB |
| Input resistance | 48.34990 Ω |
| Input reactance | -5.143621 Ω |
| Output resistance | 50.28549 Ω |
| Output reactance | +0.7852173 Ω |
| Rollett stability factor (K) | 101.5927 |
| Stability factor (μ) | 76.13818 |
| Stability factor (μ') | 16.73976 |
| Noise figure | 3.290570 dB |

## Bandwidth

| Metric | Frequency range | Bandwidth |
|---|---|---:|
| S11 below -10 dB | 2.234525–2.648397 GHz | 413.872 MHz |
| S22 below -10 dB | 2.176788–2.665289 GHz | 488.501 MHz |
| S21 within 3 dB of maximum | 1.985457–2.806336 GHz | 820.879 MHz |

- Minimum S11: -35.60587 dB at 2.432 GHz.

## DC operating point
- Supply voltage: 1.8 V
- Supply current: approximately 2.035121 mA
- DC power: approximately 3.663 mW

## Plots
1. `results/plots/lna_corner_ss_27/01_return_loss.png`
2. `results/plots/lna_corner_ss_27/02_gain_isolation.png`
3. `results/plots/lna_corner_ss_27/03_noise_figure.png`
4. `results/plots/lna_corner_ss_27/04_stability.png`
5. `results/plots/lna_corner_ss_27/05_impedances.png`

## Simulation data
- S-parameters: `results/data/lna_corner_ss_27/lna_corner_ss_27_sparams.dat`
- Noise data: `results/data/lna_corner_ss_27/lna_corner_ss_27_nf.dat`
- Simulation log: `results/data/lna_corner_ss_27/lna_corner_ss_27.log`

## Notes
- Results are from the SS-corner ngspice simulation.
- No large-signal power sweep was performed for this corner schematic; P1dB and IIP3/OIP3 are therefore not reported.
- Noise figure is the schematic-calculated value using the 300.15 K reference, matching the 27°C simulation temperature.
