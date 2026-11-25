# SKY130 Gilbert Cell Mixer Design

## Overview

Design and simulation of a Gilbert cell RF mixer using the SKY130 process.
The project includes bias circuits, the mixer schematic, transient analysis,
conversion gain, noise analysis and linearity characterization.

## Design Specifications

| Parameter | Value |
|---|---:|
| Technology | SKY130 |
| Process corner | TT |
| Supply voltage | 1.8 V |
| RF frequency | 2.45 GHz |
| LO frequency | 2.40 GHz |
| IF frequency | 50 MHz |
| RF input | 10 mV differential peak |
| LO input | 0.8 V differential peak |
| LO common-mode voltage | 1.4 V |

## DC Operating Point

| Parameter | Simulated value |
|---|---:|
| Supply current | 4.36242 mA |
| Power consumption | 7.85 mW |
| NB | 0.938764 V |
| NBP | 0.1495114 V |
| N1 | 0.4430069 V |
| N2 | 0.4430069 V |
| OUTP | 1.295637 V |
| OUTN | 1.295637 V |

## Bias Circuit Results

| Bias circuit | Simulated current | Target |
|---|---:|---:|
| GM bias | 2.00095 mA | 2 mA |
| Bleed bias | 0.97550 mA | 1 mA |

## Conversion Gain

| Parameter | Result |
|---|---:|
| IF output frequency | 50 MHz |
| Corrected conversion gain | 8.8303 dB |
| Voltage conversion gain | Approximately 2.77 V/V |

The corrected conversion gain is based on the parasitic-corrected
transient simulation deck.

## IF Frequency Response

The following values are from the earlier frequency sweep, before
the parasitic corrections:

| IF frequency | Conversion gain |
|---:|---:|
| 10 MHz | 9.23063 dB |
| 20 MHz | 9.18702 dB |
| 50 MHz | 8.91965 dB |
| 100 MHz | 8.0854 dB |
| 200 MHz | 5.78357 dB |
| 400 MHz | 1.55541 dB |

The earlier sweep indicates an approximate 3 dB bandwidth of 181 MHz.
This bandwidth has not been re-established using a corrected full sweep.

## Noise Analysis

**Preliminary four-phase LO approximation**

| Parameter | Result |
|---|---:|
| Average output noise density | 20.35 nV/√Hz |
| Projected sideband gain | 7.89 dB |
| Gain used for NF calculation | 8.8303 dB |
| Differential source resistance | 100 ohms |
| SSB noise figure | 15.15 dB |
| DSB noise figure | 12.14 dB |

The noise analysis uses four frozen LO phase samples (0°, 90°, 180°,
270°). It is a quasi-static approximation, not a complete periodic
steady-state or cyclostationary noise analysis.

## Linearity

### Input-Referred 1 dB Compression Point

| Parameter | Result |
|---|---:|
| Small-signal conversion gain | 8.8303 dB |
| Gain at compression | 7.8303 dB |
| P1dB differential input | 0.2344 V peak |
| P1dB input per side | 0.1172 V peak |

P1dB is interpolated from the simulated input-amplitude sweep.

### Input Third-Order Intercept Point

| Parameter | Result |
|---|---:|
| Tone pair 1 | 50 MHz / 40 MHz |
| Tone pair 2 | 60 MHz / 70 MHz |
| Fundamental fit slope | 0.986 |
| IM3 fit slope | 3.199 |
| IIP3, tone pair 1 | 0.5763 V |
| IIP3, tone pair 2 | 0.5862 V |
| Average IIP3 | 0.5812 V differential peak per tone |

IIP3 is extrapolated beyond the input range used for fitting and
should be treated as preliminary.

P1dB and IIP3 are reported as voltage amplitudes, not dBm, because
the simulations use ideal voltage sources without a defined input
source impedance.

## Project Structure

```text
09-sky130-gilbert-mixer-rfic/
├── schematics/
├── simulation/
├── scripts/
├── results/
└── README.md
