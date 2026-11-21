# CMOS LNA SKY130

## Overview

This project contains the schematic design and simulation variants of a CMOS low-noise amplifier (LNA) targeting the **2.4 GHz RF band**, implemented using the **SkyWater SKY130A** process design kit.

The project focuses on the LNA schematic and its evaluation across different simulation setups, including bandwidth-oriented and two-tone analyses, as well as process-corner and temperature cases.

## Project contents

### Schematic

- `lna_bw300.sch` — bandwidth-focused LNA schematic variant.
- `lna_q8_m4.sch` — LNA schematic variant labelled Q8/M4.
- `corner-schematics/` — process-corner and temperature schematic variants:
  - `lna_corner_ff_27.sch`
  - `lna_corner_ff_85.sch`
  - `lna_corner_ss_27.sch`
  - `lna_corner_ss_85.sch`
  - `lna_corner_tt_85.sch`

### Simulation

- `lna_twotone_final.sch` — schematic for the two-tone simulation setup.

## Technology

- **Process:** SkyWater SKY130A
- **Circuit:** CMOS low-noise amplifier
- **Target RF band:** 2.4 GHz
- **Design files:** `.sch` schematic files

## How to explore

Open the schematic files in a compatible schematic editor configured for the SKY130A device libraries. Use the relevant SKY130A models and simulation setup when reproducing or extending the analyses.

## Notes

The repository contains the design schematics and simulation variants. Add verified simulation plots and numerical performance results (such as gain, input matching, noise figure, bandwidth, and linearity) when the corresponding final results are ready to publish.

---

*Part of the RF and Electronics Design Portfolio.*
