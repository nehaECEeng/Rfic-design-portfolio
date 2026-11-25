# Extended simulation results

These ngspice runs use the SKY130A models at 27 °C, with a 1.8 V supply and 2 pF load. The loop-gain test covers Vcm=0.45, 0.55, 0.65, 0.75 and 0.85 V at TT, SS and FF. The raw logs and data are in `../results/extended/`; the testbenches are in `../simulation/extended/`.

## Gain, bandwidth, phase margin and power

| Corner | Gain range (dB) | UGB range (MHz) | Phase-margin range (deg) | Power range (µW) | Result |
|:---|---:|---:|---:|---:|:---|
| TT | 72.37–73.62 | 11.824–13.063 | 78.42–79.47 | 320.96–323.84 | All four targets pass |
| SS | 72.89–73.74 | 11.057–12.921 | 77.70–78.98 | 317.28–322.41 | All four targets pass |
| FF | 70.80–73.45 | 12.288–13.163 | 79.18–79.95 | 323.58–325.21 | All four targets pass |

Targets were gain ≥60 dB, UGB ≥10 MHz, phase margin ≥60° and power <500 µW. This is not a pass for the complete design specification.

## Slew rate

| Corner | Rising (V/µs) | Falling magnitude (V/µs) | Target | Result |
|---|---:|---:|---:|:---|
| TT | 3.693 | 6.721 | 10 V/µs | Fail |
| SS | 3.670 | 6.596 | 10 V/µs | Fail |
| FF | 3.716 | 6.857 | 10 V/µs | Fail |

All measured slew rates are below the 10 V/µs target.

## Output-transfer sweep

The measured output ranges were 0.102–1.112 V at TT, 0.102–1.183 V at SS and 0.103–1.046 V at FF. In the unity-follower sweep, the output tracked the input within 10 mV through 1.000 V at TT, 1.075 V at SS and 0.975 V at FF. By itself, this older sweep does not verify the full output swing or ICMR; the later separate checks are summarized below.

## Noise

The TT unity-follower noise run used Vcm=0.65 V, a 2 pF load, 1 Hz–1 GHz and 200 points per decade.

The noise setup audit found no units or scaling error. The exported density is in V/√Hz. This is a closed-loop unity-follower, source-referred measurement, not an open-loop noise test. At low frequencies, the closed-loop transfer gain is close to 1 V/V, so output and source-referred densities are nearly equal. Above the loop bandwidth, the transfer gain falls; dividing output noise by this frequency-dependent gain makes the source-referred curve rise above the output curve. This is expected feedback behavior. ngspice reports 124.863 µV RMS output and 720.798 µV RMS source-referred over 1 Hz–1 GHz. Trapezoidal integration of the exported samples gives 124.866 µV and 717.984 µV RMS. The approximately 0.39% difference between source-referred totals comes from applying different numerical integration methods to the finite frequency grid. No noise target was set, so there is no noise pass/fail claim. See `../../noise_debug/noise_debug_report.md`.

## Mismatch

All 25 unique TT mismatch samples at Vcm=0.65 V produced an offset and a positive supply-current reading. The offset range was -2.026 to 4.139 mV. The mean was 0.648 mV and the sample standard deviation was 1.662 mV. This is a small diagnostic sample, not a yield test. The duplicate seed 23 retry is not counted.

## ICMR and output swing

The 0.50–1.30 V ICMR sweep used 17 points at 0.05 V steps. Nine points passed all screening checks. The contiguous verified sampled range is 0.50–0.90 V, so the ICMR target was not passed. The first failing point is 0.95 V, where the PMOS tail falls below its model saturation check. See `../../icmr_verification/icmr_report.md`.

A separate closed-loop output-swing test requested nine DC levels from 0.30 V to 1.50 V while holding the input common mode between 0.53 V and 0.77 V. All nine tracked within 2.865 mV and passed the stated output-device checks. The transient output briefly ranged from 0.2990 V to 1.5077 V during switching. This output-swing result does not imply that the ICMR target passed. See `../../output_swing_verification/output_swing_report.md`.

## Tests not done

CMRR, PSRR and temperature tests have not been done. Layout, DRC, LVS, extraction and post-layout simulation are still pending. See `physical_verification.md`.
