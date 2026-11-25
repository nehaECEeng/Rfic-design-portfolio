# Compact Dual-Port Slotted MIMO Patch Antenna at 3.6 GHz

**Application:** 5G NR n78 / Sub-6 GHz IoT  
**Tool:** ANSYS HFSS 2024 R2 Student  
**Project Type:** B.Tech Honours Project (Team of Two)  
**Status:** Simulation only — no fabrication or measurement

## Project Overview

Design and simulation of a compact dual-port slotted MIMO patch antenna operating around 3.5–3.6 GHz, targeting the 5G NR n78 frequency band.

The design uses two orthogonally placed antenna elements on a common substrate to achieve MIMO operation.

## Design Specifications

| Parameter | Specification |
|---|---|
| Substrate | FR4 |
| Relative permittivity (εr) | 4.4 |
| Loss tangent (tan δ) | 0.02 |
| Substrate thickness | 1.6 mm |
| Single-element size | 30 × 30 mm |
| Patch geometry | Rectangular patch with L-shaped slots/stubs |
| Feeding technique | Inset feed |
| Ground plane | No ground cuts |
| MIMO configuration | Two orthogonally placed elements |

## Simulation Results

| Metric | Single Element | Two-Port MIMO |
|---|---:|---:|
| Operating frequency | 3.52 GHz | ~3.6 GHz |
| S11 | -36.7 dB | -31.6 dB |
| S22 | — | -30.8 dB |
| Isolation (S12/S21) | — | ~-25 dB |
| VSWR | 1.4 | 1.32 |
| Gain | 2.48 dB | 2.13 dB |
| ECC (S-parameter based) | — | ~9 × 10⁻⁶ |
| Bandwidth | 237.5 MHz around 3.52 GHz | To be verified |

**Note:** Reported metrics have different marker frequencies (3.52, 3.6 and 3.66–3.67 GHz). A consistent-frequency comparison is still required.

## ECC Consideration

The reported envelope correlation coefficient (ECC) is calculated from S-parameters using a lossless-antenna assumption. Since FR4 is a lossy substrate, this value may underestimate the actual correlation. Far-field-based ECC analysis is recommended for more reliable evaluation.

## Project Limitations

- Simulation-based design; no fabricated prototype or measurement results.
- Performance metrics should be compared at consistent frequencies.
- Radiation-null filtering and the reported 30% size reduction have not yet been independently demonstrated with supporting plots or calculations.
- Far-field ECC validation remains necessary.

## Repository Structure

```text
08-nbiot-slotted-mimo-antenna-hfss/
├── README.md
├── hfss/       # HFSS project files (.aedt)
├── geometry/   # STEP/DXF exports and dimension table
├── results/    # S-parameters, plots and radiation patterns
└── docs/       # Honours project report (PDF)
```

## Project Supervision

**Supervisors:**
- Dr. Samarendra Nath Sur
- Dr. Arun Kumar Singh

**Institution:** Sikkim Manipal Institute of Technology

