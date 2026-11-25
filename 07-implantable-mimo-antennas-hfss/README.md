# Two-Port Implantable MIMO Antennas at 2.45 GHz and 3.6 GHz

## Project Overview
Simulation of compact implantable MIMO antenna designs using ANSYS HFSS.

**Important:** These are two separate single-band designs, not one dual-band antenna.

## Design Specifications
- Tool: ANSYS HFSS
- Substrate: Rogers RO6010
- Single-port antenna size: 4 × 4 mm
- Two-port MIMO antenna size: 4 × 10 mm
- Operating frequencies: 2.45 GHz and 3.6 GHz
- Project status: Simulation only

## Simulation Results

| Parameter | 2.45 GHz | 3.6 GHz |
|---|---:|---:|
| Single-port S11 | -30.03 dB | -40.17 dB |
| MIMO Port 1 S11 | -21.04 dB | -24.36 dB |
| MIMO Port 2 S22 | -20.13 dB | -22.02 dB |
| MIMO isolation | 53.45 dB | 29.13 dB |
| Single-port gain | -8.65 dB | -26.04 dB |
| MIMO gain | -19.74 dB | -29.03 dB |
| Single-port VSWR | 1.065 | 1.0198 |
| MIMO VSWR (Ports 1/2) | 1.1946 / 1.2186 | 1.1289 / 1.1538 |
| MIMO SAR (1 g tissue) | 11.293 W/kg | 1.6 W/kg |

*Values transcribed from the supplied simulation plot filenames. Confirm against the plots and project report.*

Reported bandwidth is approximately 12–15 MHz, depending on the design. Verify the exact bandwidth for each antenna.

## SAR Considerations
- The reported 2.45 GHz SAR is 11.293 W/kg over 1 g of tissue.
- The reported 3.6 GHz SAR is 1.6 W/kg over 1 g of tissue.
- The 2.45 GHz result exceeds the 1.6 W/kg comparison value; the 3.6 GHz result equals it.
- These comparisons do not establish regulatory compliance or biological safety.
- Input power and the simulation tissue model must be documented to interpret SAR correctly.

## ECC
Previously reported S-parameter-based ECC values:
- 2.45 GHz: approximately 1.6 × 10⁻⁷
- 3.6 GHz: approximately 2.9 × 10⁻⁵

These values require verification. S-parameter-based ECC calculations rely on assumptions that may not hold for lossy antennas. Far-field ECC analysis is recommended.

## Repository Structure
- `hfss/` — Original antenna project/model files
- `results/` — Return-loss, isolation, gain, VSWR, SAR and antenna-view plots
- `docs/` — Project report

## Limitations and Future Work
- Simulation only; no fabricated prototype or experimental measurements.
- Verify all reported metrics against the original simulation data.
- Document SAR input power and averaging mass.
- Describe tissue layers, thicknesses and dielectric properties.
- Document encapsulation or biocompatible coating.
- Validate ECC using far-field data.
- Confirm bandwidth separately for each design.

## Tools
- ANSYS HFSS
- Electromagnetic simulation
- MIMO antenna analysis
