# 2.4 GHz Low-Noise Amplifier Using Infineon BFP740F

## Project Overview

Design and simulation of a 2.4 GHz low-noise amplifier (LNA) using the Infineon BFP740F SiGe:C RF transistor.

The amplifier uses a common-emitter configuration with a 3 V supply and 50 Ω input/output matching networks.

## Design Specifications

- Operating frequency: 2.4 GHz
- Transistor: Infineon BFP740F
- Topology: Common-emitter
- Supply voltage: 3 V
- Collector current: Approximately 11 mA
- Simulation tool: Keysight ADS 2017

## Simulation Results

| Parameter | Result |
|---|---:|
| Forward gain (S21) | 16.365 dB |
| Input return loss (S11) | -22.442 dB |
| Output return loss (S22) | -35.902 dB |
| Stability factor μ | 2.149 |
| Stability factor μ' | 1.948 |
| Transistor NFmin | 0.737 dB |
| IIP3 | -0.90 dBm |
| OIP3 | +15.45 dBm |

## Design Work

- Transistor bias point selection
- Input and output impedance matching
- S-parameter analysis
- Stability analysis
- Noise parameter evaluation
- Two-tone linearity analysis

## Detailed Report

See [LNA Design Report](LNA_2.4GHz_BFP740F_report_polished.docx).

## Tools

Keysight ADS 2017 | RF Circuit Design | SiGe:C Technology
