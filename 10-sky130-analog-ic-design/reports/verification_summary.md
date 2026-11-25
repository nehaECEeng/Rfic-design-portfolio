# Verification summary

This note points to the measured checks included with the project. The detailed reports, CSV files and raw ngspice logs are kept in their original subfolders.

## Results

- **Gain:** 70.80–73.74 dB; passed the 60 dB target at the tested TT, SS and FF corner points.
- **Unity-gain bandwidth:** 11.057–13.163 MHz; passed the 10 MHz target in those cases.
- **Phase margin:** 77.70–79.95°; passed the 60° target in those cases.
- **Power:** 317.28–325.21 µW; passed the 500 µW limit in those cases.
- **Slew rate:** rising 3.67–3.72 V/µs and falling magnitude 6.60–6.86 V/µs; failed the 10 V/µs target.
- **ICMR:** 9 of 17 samples passed. The contiguous sampled range is 0.50–0.90 V; the 0.50–1.30 V target was not passed.
- **Output swing:** nine separate DC requests from 0.30 V to 1.50 V passed within 2.865 mV. The transient output briefly ranged from 0.2990 V to 1.5077 V during switching.
- **Noise:** closed-loop unity-follower result over 1 Hz–1 GHz. ngspice reported 124.863 µV output and 720.798 µV source-referred RMS. Exported-data trapezoidal integration gave 124.866 µV and 717.984 µV RMS. At low frequencies the transfer gain is near 1 V/V; above loop bandwidth, dividing by the falling gain raises the source-referred curve. No noise limit was set.

CMRR, PSRR and temperature tests were not done. Layout, DRC, LVS, extraction and post-layout simulation were not completed. This is not a complete specification pass.

## Detailed reports

- [Corner, slew and mismatch results](../final_delivery/reports/extended_verification.md)
- [Independent simulation audit](../final_delivery/reports/final_independent_audit.md)
- [ICMR sweep](../icmr_verification/icmr_report.md)
- [Output-swing test](../output_swing_verification/output_swing_report.md)
- [Noise setup and units audit](../noise_debug/noise_debug_report.md)
- [Physical-design status](../final_delivery/reports/physical_verification.md)
