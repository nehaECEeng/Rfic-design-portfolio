# Xschem and SPICE comparison

The schematic in `../final/opamp_rri.sch` was netlisted with the installed SKY130 Xschem library. The build script wraps the flattened device list as the `opamp_rri_final` subcircuit. It keeps the device connections and parameters.

The ordered device and passive lines, including their geometry continuation lines, matched exactly: 47 of 47 lines. The top-level testbench and subcircuit wrapper are not part of that comparison.

The source schematic remains included. A separate cleaned wired schematic and its PNG export are available in the portfolio folder. The candidate netlist is compared with the reference in `../../reports/schematic_netlist_comparison.md`.
