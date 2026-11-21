# SKY130 LNA — FF Corner at 85°C

## Simulation setup
- Process corner: Fast-Fast (FF)
- Temperature: 85°C
- Supply voltage: 1.8 V
- AC sweep: 1–4 GHz
- S-parameter points: 3001
- Noise analysis points: 41
- Simulator: ngspice 45.2

## Results at 2.4 GHz

| Parameter | Simulated value |
|---|---:|
| S11 | -26.11938 dB |
| S21 | +11.22714 dB |
| S12 | -55.62000 dB |
| S22 | -39.23141 dB |
| Input resistance (Rin) | 45.63313 Ω |
| Input reactance (Xin) | +1.81343 Ω |
| Output resistance (Rout) | 49.43987 Ω |
| Output reactance (Xout) | -0.93093 Ω |
| Stability factor (K) | 82.70224 |
| Stability factor (μ) | 59.92277 |
| Stability factor (μ') | 18.04940 |
| Schematic-calculated NF | 4.38893 dB |

## Bandwidth

| Metric | Lower frequency | Upper frequency | Bandwidth |
|---|---:|---:|---:|
| S11 below -10 dB | 2.198200 GHz | 2.596515 GHz | 398.315 MHz |
| S22 below -10 dB | 2.186388 GHz | 2.685106 GHz | 498.718 MHz |
| S21 within 3 dB of maximum | 1.973958 GHz | 2.780501 GHz | 806.543 MHz |

Minimum S11: -26.79155 dB at 2.389 GHz.

## DC power

- Supply current: approximately 2.327329 mA
- Supply voltage: 1.8 V
- DC power: approximately 4.189 mW

## Noise figure reference-temperature caveat

The schematic calculates noise figure using a fixed 300.15 K reference temperature. The device simulation temperature is 85°C (358.15 K).

Therefore, 4.38893 dB is the value produced by the schematic's existing noise-figure formula. It should not be interpreted as a conventional noise figure referenced to the actual 85°C device temperature without recalculating the formula.

## Plots

1. [Return loss](results/plots/lna_corner_ff_85/01_return_loss.png)
2. [Gain and isolation](results/plots/lna_corner_ff_85/02_gain_isolation.png)
3. [Noise figure](results/plots/lna_corner_ff_85/03_noise_figure.png)
4. [Stability](results/plots/lna_corner_ff_85/04_stability.png)
5. [Input and output impedances](results/plots/lna_corner_ff_85/05_impedances.png)

## Raw simulation data

- S-parameters and related data: `results/data/lna_corner_ff_85/lna_corner_ff_85_sparams.dat`
- Noise data: `results/data/lna_corner_ff_85/lna_corner_ff_85_nf.dat`
- Simulation log: `results/data/lna_corner_ff_85/lna_corner_ff_85.log`

## Large-signal analysis

No large-signal power sweep was performed for this corner schematic. P1dB, IIP3 and OIP3 are therefore not reported.
