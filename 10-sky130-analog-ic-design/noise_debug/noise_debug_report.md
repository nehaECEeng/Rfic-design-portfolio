# Noise setup and units audit

## Findings

The original testbench is `../final_delivery/simulation/extended/tb_noise_tt_dense.spice` (the `final_delivery/` copy has the same SHA-256). Its noise command is:

```spice
noise v(out) Vsig dec 200 1 1G
```

`v(out)` is the single-ended output node. `Vsig` is the source used as the noise reference; it drives `inp` relative to ground and has `dc 0.65 ac 1`. `Vfb out inn 0` feeds the output directly to the inverting input. This is a **closed-loop unity follower**, not an open-loop noise test.

The exported raw file has three columns: frequency in Hz, output-referred density in V/√Hz, and input/source-referred density in V/√Hz. The values are SI volts; there is no nV scale factor in the data. Multiply by 1e9 to display nV/√Hz. At 1 kHz, the original and rerun output density is 5.58557018e-08 V/√Hz = **55.855702 nV/√Hz**. The input-referred value is 5.58816761e-08 V/√Hz = **55.881676 nV/√Hz**.

## Reference and transfer check

The testbench's chosen signal reference is the actual non-inverting source `Vsig`; this is appropriate for source-referred noise in the stated unity-follower setup. The source AC magnitude is 1 V. The AC transfer used for the input reference is `V(out)/V(inp)` because `Vsig` fixes `inp` to 1 V AC. At 1 kHz this measured transfer is 0.999535191 V/V. Dividing output density by it gives 55.881676 nV/√Hz, matching ngspice's input density within 9.5e-09 maximum relative error across the full grid.

`V(inp)-V(inn)` is the instantaneous differential voltage across the amplifier pins, but it is not the independent stimulus source in this closed-loop test: `inn` moves with the output. Dividing noise by `V(out)/(V(inp)-V(inn))` would use a different transfer definition and would not represent noise referred to the external `Vsig` source. That pin-differential transfer is recorded in the AC raw output for inspection. No error in the original output node, reference source, source AC magnitude, or exported scale factor was found.

## Independent integration and comparison

Both original and rerun noise data span **1 Hz to 1 GHz**, with 200 points per decade. The script independently integrates squared density using the trapezoidal rule in linear frequency:

`RMS = sqrt(trapezoid(density^2, frequency_Hz))`.

For input-referred noise it calculates `onoise(f) / abs(Vout(f)/Vsig(f))` at every frequency, then integrates. The rerun gives 124.865614 µV RMS output-referred and 717.983642 µV RMS input/source-referred. Direct integration of ngspice's exported input density gives 717.983641 µV RMS. The original and rerun raw noise spectra are identical on all 1801 points; the source transfer gain also matches the original AC data.

| Result | Original ngspice log | New ngspice log | Independent exported-data integral |
|---|---:|---:|---:|
| Output noise | 124.863 µV RMS | 124.863 µV RMS | 124.866 µV RMS |
| Input/source-referred noise | 720.798 µV RMS | 720.798 µV RMS | 717.984 µV RMS |

The earlier values 124.863 µV and 720.798 µV are reproduced by ngspice. The independently integrated output is close (+0.002 µV difference). The input trapezoid differs from ngspice by -2.814 µV (-0.390%). This is a difference between ngspice's internal integration and trapezoidal integration on the finite exported grid, not a unit conversion or changed setup. At low frequencies, the closed-loop transfer gain is approximately 1 V/V, so output and source-referred densities are nearly identical. Above the loop bandwidth, the closed-loop transfer gain decreases. Dividing output noise by that frequency-dependent gain makes the source-referred curve rise above the output curve. This is expected feedback behavior, not a unit or scaling error. For example, near 100 MHz, gain is 0.0799 V/V, with output density 5.405 nV/√Hz and source-referred density 67.606 nV/√Hz.

## Correction and status

No setup or units error was found, so no changed “corrected” circuit/testbench is justified. `tb_noise_debug.spice` is an isolated reproduction of the original noise setup, with its output written only in this folder. `tb_noise_debug_gain.spice` independently records the source transfer and pin-differential transfer. Both were run with the existing SKY130A TT models and the read-only final circuit. The replay matches the original simulation data. The post-processing check is **validated for this closed-loop source-referred test and 1 Hz–1 GHz range**; this does not claim an open-loop intrinsic device-noise measurement.

## Reproduce

Run from `noise_debug/`:

```sh
ngspice -b tb_noise_debug.spice > noise_debug.log 2>&1
ngspice -b tb_noise_debug_gain.spice > noise_debug_gain.log 2>&1
python3 analyze_noise_debug.py
```
