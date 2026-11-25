#!/usr/bin/env python3
"""Wrap the Xschem transistor netlist as the final reusable SPICE subcircuit."""
from pathlib import Path

root = Path(__file__).resolve().parents[1]
source = root / "simulation/xschem_netlist/opamp_rri.sch.spice"
target = root / "final/opamp_rri_final.spice"
lines = [
    "* Generated from final/opamp_rri.sch using the installed SKY130 Xschem symbols.",
    ".subckt opamp_rri_final inp inn out vdd vss ibn ibp ibp2",
]
for line in source.read_text().splitlines():
    if line.startswith("**.subckt ") or line.startswith("**.ends"):
        continue
    if line.startswith("** sch_path:") or line.startswith("**.ipin ") or line.startswith("**.opin "):
        continue
    if line.startswith("*.") or line.startswith("**") or line.strip() == ".end":
        continue
    lines.append(line)
lines.append(".ends opamp_rri_final")
target.write_text("\n".join(lines) + "\n")
print(f"Wrote {target}")
