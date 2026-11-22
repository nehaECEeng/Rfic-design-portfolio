# 2.4 GHz Edge-Coupled (Parallel-Coupled-Line) Microstrip Bandpass Filter (Keysight ADS)

**Status: circuit-model simulation with a generated layout. No EM (Momentum) verification, no fabrication.**

- Tool: Keysight ADS
- Type: 5th-order parallel-coupled-line bandpass filter (six coupled sections) with 50 ohm microstrip feed lines
- Substrate: Rogers RO4350B, h = 0.508 mm, er = 3.66, tan d = 0.0037, copper 0.035 mm, conductivity 5.8e7 S/m
- Sweep: 2.2 - 2.6 GHz in 2 MHz steps

## Dimensions (after optimisation)

| Item | Value |
|---|---|
| Coupled-section length (all sections) | 18.4057 mm (about a quarter wavelength at 2.4 GHz) |
| Feed lines | W = 1.074 mm, L = 2.5 mm |
| Sections 1 and 6 | W = 1.074 mm, S = 0.182 mm |
| Sections 2 and 5 | W = 1.03212 mm, S = 1.24893 mm |
| Sections 3 and 4 | W = 1.01289 mm, S = 1.54019 mm |

Gradient optimisation (300 iterations) tuned widths, gaps and length against goals on dB(S11) and dB(S21).

## Results (circuit-model simulation)

**ADS marker readings** (optimisation iteration 69):

| Metric | Result |
|---|---|
| Insertion loss at 2.400 GHz | 4.809 dB |
| S11 at 2.344 GHz | -9.910 dB |
| S11 at 2.456 GHz | -9.530 dB |
| S11 bandwidth (about -10 dB between those markers) | 112 MHz, 4.67 % fractional bandwidth |

**Read by eye from the plot** (not yet measured with markers):

| Metric | Approximate result |
|---|---|
| Centre frequency | about 2.4 GHz |
| Bandwidth 3 dB below the peak | about 100 MHz |
| Return loss in the middle of the band | better than 15 dB, up to about 22 dB |
| S21 at 2.30 GHz | about -37 dB |
| S21 at 2.50 GHz | about -33 dB |

The skirts are not symmetric: the lower side is steeper.

## Limitations

1. Circuit-model (MCFIL) simulation only; coupled-line models ignore some discontinuities.
2. The 4.7 dB insertion loss is high; narrow-band microstrip filters lose several dB, but this has not been compared with EM results.
3. Layout was generated in ADS but not EM-simulated, fabricated or measured.
4. The first and last coupling gaps are 0.182 mm, which is narrow; check the fabrication tolerance before building it.

## Planned work

- [ ] Momentum EM simulation of the layout and comparison with the circuit model
- [ ] Study insertion loss against substrate and conductor loss

## Repository contents

```
coupled-line-bandpass-filter-2p4ghz-ads/
  README.md
  schematic/     ADS schematic and layout screenshots
  results/       S11 / S21 plots
```
