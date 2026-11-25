# Clean schematic comparison

The portfolio schematic candidate is `schematics/opamp_rri_clean.sch`. It uses the existing SKY130 symbols and the circuit connectivity from the reference netlist.

## Check performed

`schematics/opamp_rri_clean.spice` was generated from the candidate schematic and compared with `final_delivery/final/opamp_rri_final.spice`. The comparison covered all 17 component statements, including terminal nets, models, and parameter values.

| Check | Result |
|---|---|
| Component statements | 17 in each netlist |
| MOS, resistor and capacitor connections and parameters | Identical |
| External port order | `inp inn out vdd vss ibn ibp ibp2` in both |
| PNG export | `images/opamp_rri_clean.png`, 6000 x 3200 pixels |

The candidate uses visible wire segments for internal connections. Supply and ground symbols use the same `vdd` and `vss` nets as the reference. The drawing layout changed; circuit connectivity and component parameters did not.

## Source preservation

The source schematic and reference netlist were not edited. Their SHA-256 values at the time of this check were:

- `final_delivery/final/opamp_rri.sch`: `17d90cddf3f879bedc433d261fff002e2430fd8a1652529194a7097809c244e6`
- `final_delivery/final/opamp_rri_final.spice`: `4b9478e7af952bc724edc2d7e6bab723367ce34561b663644550e05f05bfdc7e`

This comparison confirms schematic-to-netlist connectivity and component parameters. It is not a simulation, DRC, or LVS result.
