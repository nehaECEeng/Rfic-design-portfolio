# PIN Diode RF Switch Design Using Keysight ADS

## Project Overview

This project explores PIN-diode-based RF switching circuits using Keysight Advanced Design System (ADS). It includes diode modeling, DC characterization, and multiple RF switch configurations.

## Design Implementations

1. BAR63-02 PIN Diode Model
2. PIN Diode DC I-V Characterization
3. Series SPST RF Switch
4. Series-Shunt SPST RF Switch
5. Series-Shunt SPDT RF Switch
6. SPDT RF Switch

## Simulation Setup

- Tool: Keysight Advanced Design System (ADS)
- DC characterization: 0–5 V, 51 sweep points
- RF S-parameter simulations: 0.5–2.5 GHz
- Simulation logs are included for all five simulation cases.

## BAR63-02 Diode Model

A custom BAR63-02 PIN diode model is included in the ADS schematic files. The model incorporates diode and parasitic components.

## Optimization

The Series-Shunt SPDT design includes an optimization setup with S-parameter goals over the 1.5–2.0 GHz frequency range. These are design targets, not independently verified achieved results.

## Repository Structure

```text
pin-diode-rf-switch-ads/
├── images/
├── schematics/
├── simulation-data/
│   └── logs/
├── data-displays/
└── README.md
