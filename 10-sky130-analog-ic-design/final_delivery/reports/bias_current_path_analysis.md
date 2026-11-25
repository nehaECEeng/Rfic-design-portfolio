# Bias and current paths

The values below are from SKY130A TT simulations at 27 °C, with a 1.8 V supply and 2 pF load. The selected v8 circuit has complementary NMOS and PMOS input pairs, current-mirror loads and a second gain stage. It does not contain the original folded-cascode devices.

A 41-point DC sweep showed no gap in the measured branch currents. At Vcm=0.45 V, the NMOS and PMOS tail currents were 16.44 µA and 19.88 µA. At 0.85 V, they were 19.76 µA and 18.92 µA. Each NMOS input branch rose from about 8.0 µA to about 10.0 µA. Each PMOS branch fell from about 10.0 µA to about 9.4 µA. The two pairs overlap, but their combined current is not constant.

At the five checked points, the NMOS input VGS was below model VTH. Those devices conduct in weak inversion. The PMOS pair also conducts, with about 87–89 mV of model overdrive.

At 0.45 V, the NMOS tail VDS was 61.43 mV and its model VDSAT was 55.40 mV. At 0.85 V, those values were 392.80 mV and 55.40 mV. The PMOS tail stays above its model VDSAT at the checked points; at 0.85 V, VSD is 305.95 mV and VDSAT is about 259.33 mV. The low-end NMOS margin is small.

The mirror currents and second-stage operating points are listed in `final_device_operating_points.md`. The raw device log is `../results/device_op.log`. This five-point device check does not establish the full ICMR or operation at other process and temperature conditions. A later 17-point ICMR screen passed 9 points, with a contiguous sampled range of 0.50–0.90 V; the 0.50–1.30 V target was not passed. See `../../icmr_verification/icmr_report.md`.
