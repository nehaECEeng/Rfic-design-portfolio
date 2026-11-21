# SKY130A LNA — 300 MHz design (lna_bw300)

## Simulation setup
- PDK: SKY130A
- Simulator: ngspice
- Temperature: 27 °C (TNOM = 27 °C)
- Supply: 1.8 V
- AC sweep: 1–4 GHz, 3001 points
- Noise sweep: 1–5 GHz, 41 points
- Schematic: `schematic/lna_bw300.sch`

## S-parameters and impedance at 2.4 GHz

| Parameter | Simulated value |
|---|---:|
| S11 | -53.3606 dB |
| S21 | 13.3478 dB |
| S12 | -57.8594 dB |
| S22 | -65.2379 dB |
| Input resistance | 50.0315 ohm |
| Input reactance | -0.2125 ohm |
| Output resistance | 49.9521 ohm |
| Output reactance | -0.0264 ohm |
| Rollet K | 84.0551 |
| Mu | 153.9158 |
| Mu-prime | 123.5085 |
| Noise figure (nearest noise point) | 1.1560 dB |

## Bandwidth measurements
- S11 below -10 dB: 2.246600–2.567029 GHz (width 320.43 MHz)
- S22 below -10 dB: 2.178937–2.710823 GHz (width 531.89 MHz)
- S21 within 3 dB of its sweep maximum: 1.995464–2.706751 GHz (width 711.29 MHz)

## Large-signal power sweep

IIP3/OIP3 values are gain-compression estimates, not results from a two-tone simulation.

| Pin (dBm) | Pout (dBm) | Gain (dB) | IIP3 estimate (dBm) | OIP3 estimate (dBm) | Pdc (W) |
|---:|---:|---:|---:|---:|---:|
| -50 | -36.668 | 13.332 | -22.691 | -9.3435 | 0.0034633 |
| -30 | -16.682 | 13.318 | -5.3687 | 7.9791 | 0.0035017 |
| -20 | -6.8159 | 13.184 | -2.7121 | 10.636 | 0.0038619 |
| -18 | -4.9117 | 13.088 | -2.688 | 10.66 | 0.0040961 |
| -16 | -3.0782 | 12.922 | -2.7997 | 10.548 | 0.0044607 |
| -15 | -2.2012 | 12.799 | -2.871 | 10.477 | 0.004709 |
| -14 | -1.3653 | 12.635 | -2.9664 | 10.381 | 0.0050079 |
| -13 | -0.5893 | 12.411 | -3.0976 | 10.25 | 0.005357 |
| -12 | 0.10718 | 12.107 | -3.2418 | 10.106 | 0.005752 |
| -11 | 0.70965 | 11.71 | -3.3523 | 9.9955 | 0.0061846 |
| -10 | 1.2127 | 11.213 | -3.3832 | 9.9646 | 0.0066343 |
| -9 | 1.6319 | 10.632 | -3.2897 | 10.058 | 0.0070534 |
| -8 | 1.9764 | 9.9764 | -3.0743 | 10.273 | 0.0074943 |
| -6 | 2.5634 | 8.5634 | -2.2688 | 11.079 | 0.0082877 |

## Files
- `results/data/lna_bw300/lna_bw300_sparams.dat`
- `results/data/lna_bw300/lna_bw300_nf.dat`
- `results/data/lna_bw300/lna_bw300_power_sweep.csv`
- `results/data/lna_bw300/lna_bw300.log`
- `results/netlists/lna_bw300.spice`

## Plots
![Return loss](../plots/lna_bw300/01_return_loss.png)
![Gain and isolation](../plots/lna_bw300/02_gain_isolation.png)
![Noise figure](../plots/lna_bw300/03_noise_figure.png)
![Stability](../plots/lna_bw300/04_stability.png)
![Impedances](../plots/lna_bw300/05_impedances.png)
