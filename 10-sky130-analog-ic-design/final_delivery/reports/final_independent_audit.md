# Final simulation audit

## Mismatch runs

All 25 unique primary logs contain a valid operating-point result, offset and positive supply current. No sample was empty or failed. The seed 23 retry is a duplicate and is not included in the statistics.

The offset range was -2.025530 to 4.138978 mV. The mean was 0.648405 mV and the sample standard deviation was 1.662091 mV.

## Corner measurements

| Corner | Vcm V | A0 dB | UGB MHz | vp raw rad | phase deg | PM deg | Idd µA | Power µW |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| TT | 0.45 | 72.91104 | 11.824420 | -1.772965 | -101.5834 | 78.4166 | 178.3130 | 320.9634 |
| TT | 0.55 | 73.48744 | 12.747890 | -1.756364 | -100.6322 | 79.3678 | 179.8575 | 323.7436 |
| TT | 0.65 | 73.61850 | 12.944990 | -1.754663 | -100.5348 | 79.4652 | 179.9101 | 323.8382 |
| TT | 0.75 | 73.42821 | 13.062050 | -1.757384 | -100.6907 | 79.3093 | 179.7496 | 323.5493 |
| TT | 0.85 | 72.37349 | 13.062760 | -1.764481 | -101.0973 | 78.9027 | 179.2967 | 322.7341 |
| SS | 0.45 | 72.89273 | 11.056880 | -1.785401 | -102.2960 | 77.7040 | 176.2652 | 317.2774 |
| SS | 0.55 | 73.57986 | 12.604390 | -1.766618 | -101.2197 | 78.7803 | 179.0587 | 322.3056 |
| SS | 0.65 | 73.74128 | 12.823000 | -1.763074 | -101.0167 | 78.9833 | 179.1145 | 322.4061 |
| SS | 0.75 | 73.65312 | 12.921450 | -1.765745 | -101.1697 | 78.8303 | 178.7884 | 321.8192 |
| SS | 0.85 | 73.09639 | 12.857470 | -1.772891 | -101.5792 | 78.4208 | 177.8173 | 320.0712 |
| FF | 0.45 | 72.82847 | 12.287580 | -1.759673 | -100.8218 | 79.1782 | 179.7677 | 323.5818 |
| FF | 0.55 | 73.35911 | 12.850470 | -1.746548 | -100.0698 | 79.9302 | 180.6208 | 325.1175 |
| FF | 0.65 | 73.45029 | 13.035470 | -1.746205 | -100.0502 | 79.9498 | 180.6706 | 325.2070 |
| FF | 0.75 | 73.07888 | 13.157480 | -1.749369 | -100.2315 | 79.7685 | 180.5894 | 325.0609 |
| FF | 0.85 | 70.80486 | 13.163360 | -1.758592 | -100.7599 | 79.2401 | 180.3786 | 324.6814 |


Gain, UGB, phase margin and power met their targets at all 15 corner/common-mode combinations. A separate 17-point ICMR screen from 0.50 V to 1.30 V passed 9 points; the contiguous sampled range is 0.50–0.90 V, so the ICMR target did not pass. The separate output-swing test passed all nine DC levels from 0.30 V to 1.50 V within 2.865 mV. Its transient output briefly ranged from 0.2990 V to 1.5077 V. See the ICMR and output-swing reports for test details.

## Noise measurements

The dense TT run used a unity follower at Vcm=0.65 V, a 2 pF load and 1 Hz–1 GHz with 200 points per decade. ngspice reported 124.863200 µV RMS output noise and 720.798000 µV RMS source-referred noise. Integrating the exported samples gave 124.865614 µV RMS output noise and 717.983641 µV RMS source-referred noise.

The independent noise audit matched all 1,801 points of the raw dense spectrum. The density units are V/√Hz, with no unit or scaling error. This is a closed-loop unity-follower, source-referred result, not an open-loop noise measurement. At low frequencies the closed-loop gain is about 1 V/V, so the output and source-referred densities are nearly equal. Above the loop bandwidth, the transfer gain falls. Dividing output noise by that frequency-dependent gain makes the source-referred curve rise; this is expected feedback behavior. Point-by-point division by the measured `|Vout/Vsig|` agrees with ngspice's input spectrum within 9.5e-9 relative error. ngspice reports 124.863 µV output and 720.798 µV source-referred RMS. Trapezoidal integration over the same 1 Hz–1 GHz data gives 124.866 µV and 717.984 µV RMS. The 0.39% difference between source-referred totals comes from using different numerical integration methods on the finite exported grid. No noise target was specified, and no pass/fail claim is made. See `../../noise_debug/noise_debug_report.md`.
