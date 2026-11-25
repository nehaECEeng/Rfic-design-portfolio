# DC operating points for the selected circuit

These values came from ngspice 45.2 using the SKY130A TT models at 27 °C. The supply was 1.8 V and the load was 2 pF. The amplifier was connected as a unity follower. Voltages and currents are the values reported by the device models. The raw log is `../results/device_op.log`.

The circuit in this version has no folded-cascode devices. The tables list the four input transistors, both tail devices and the second-stage devices at each tested common-mode voltage. They also show the model's threshold and saturation voltages where available.

| Vcm (V) | Device | Id (µA) | VGS (V) | VTH (V) | VDS (V) | VDSAT (V) | VGS−VTH (V) |
|---:|:---|---:|---:|---:|---:|---:|---:|
| 0.45 | XMN1 | 8.2996 | 0.388477 | 0.494672 | 0.567068 | — | -0.106195 |
| 0.45 | XMN2 | 8.1356 | 0.388539 | 0.494672 | 0.502904 | — | -0.106133 |
| 0.45 | XMP1 | 9.9897 | 0.714420 | 0.627792 | 0.646899 | — | +0.086628 |
| 0.45 | XMP2 | 9.8887 | 0.714361 | 0.627792 | 0.599769 | — | +0.086569 |
| 0.45 | XNTail (tail) | 16.4352 | 0.446990 | 0.456725 | 0.061431 | 0.055395 | -0.009735 |
| 0.45 | XPTail (tail) | 19.8783 | 0.749418 | 0.470365 | 0.634547 | 0.259308 | +0.279052 |
| 0.45 | XM6 (second stage) | 81.8296 | 0.564234 | 0.457274 | 0.449670 | — | +0.106960 |
| 0.45 | XM7 (second stage) | 81.8296 | 0.749400 | 0.470958 | 1.349157 | — | +0.278441 |

At Vcm=0.45 V, mirror/load currents are XPL1=8.300, XPL2=8.306, XNL1=9.990, XNL2=10.059 µA. The selected topology has no folded-cascode transistors; it replaces the original folded-cascode network.

| 0.55 | XMN1 | 9.2950 | 0.408572 | 0.510338 | 0.476914 | — | -0.101766 |
| 0.55 | XMN2 | 9.1366 | 0.408650 | 0.510337 | 0.421834 | — | -0.101688 |
| 0.55 | XMP1 | 9.9347 | 0.697781 | 0.610322 | 0.730565 | — | +0.087459 |
| 0.55 | XMP2 | 9.8381 | 0.697706 | 0.610322 | 0.684295 | — | +0.087384 |
| 0.55 | XNTail (tail) | 18.4316 | 0.446988 | 0.456725 | 0.141317 | 0.055395 | -0.009737 |
| 0.55 | XPTail (tail) | 19.7728 | 0.749420 | 0.470365 | 0.551207 | 0.259310 | +0.279055 |
| 0.55 | XM6 (second stage) | 81.4892 | 0.563054 | 0.457274 | 0.549655 | — | +0.105780 |
| 0.55 | XM7 (second stage) | 81.4892 | 0.749402 | 0.470958 | 1.249177 | — | +0.278444 |

At Vcm=0.55 V, mirror/load currents are XPL1=9.295, XPL2=9.301, XNL1=9.935, XNL2=10.002 µA. The selected topology has no folded-cascode transistors; it replaces the original folded-cascode network.

| 0.65 | XMN1 | 9.5624 | 0.425304 | 0.525902 | 0.391052 | — | -0.100598 |
| 0.65 | XMN2 | 9.4054 | 0.425423 | 0.525902 | 0.337471 | — | -0.100478 |
| 0.65 | XMP1 | 9.8652 | 0.680607 | 0.592284 | 0.813756 | — | +0.088323 |
| 0.65 | XMP2 | 9.7687 | 0.680490 | 0.592284 | 0.768217 | — | +0.088207 |
| 0.65 | XNTail (tail) | 18.9677 | 0.446988 | 0.456726 | 0.224543 | 0.055395 | -0.009738 |
| 0.65 | XPTail (tail) | 19.6338 | 0.749423 | 0.470364 | 0.468430 | 0.259313 | +0.279059 |
| 0.65 | XM6 (second stage) | 81.1459 | 0.561919 | 0.457274 | 0.649615 | — | +0.104645 |
| 0.65 | XM7 (second stage) | 81.1459 | 0.749404 | 0.470957 | 1.149222 | — | +0.278446 |

At Vcm=0.65 V, mirror/load currents are XPL1=9.562, XPL2=9.568, XNL1=9.865, XNL2=9.931 µA. The selected topology has no folded-cascode transistors; it replaces the original folded-cascode network.

| 0.75 | XMN1 | 9.7691 | 0.441317 | 0.540906 | 0.305114 | — | -0.099589 |
| 0.75 | XMN2 | 9.6109 | 0.441492 | 0.540906 | 0.252428 | — | -0.099415 |
| 0.75 | XMP1 | 9.7532 | 0.662661 | 0.573677 | 0.896415 | — | +0.088985 |
| 0.75 | XMP2 | 9.6543 | 0.662489 | 0.573676 | 0.851330 | — | +0.088813 |
| 0.75 | XNTail (tail) | 19.3800 | 0.446987 | 0.456726 | 0.308473 | 0.055395 | -0.009738 |
| 0.75 | XPTail (tail) | 19.4075 | 0.749428 | 0.470362 | 0.386444 | 0.259318 | +0.279066 |
| 0.75 | XM6 (second stage) | 80.7984 | 0.560808 | 0.457273 | 0.749560 | — | +0.103534 |
| 0.75 | XM7 (second stage) | 80.7984 | 0.749405 | 0.470957 | 1.049281 | — | +0.278449 |

At Vcm=0.75 V, mirror/load currents are XPL1=9.769, XPL2=9.775, XNL1=9.753, XNL2=9.818 µA. The selected topology has no folded-cascode transistors; it replaces the original folded-cascode network.

| 0.85 | XMN1 | 9.9646 | 0.456877 | 0.555359 | 0.218915 | — | -0.098483 |
| 0.85 | XMN2 | 9.7974 | 0.457165 | 0.555359 | 0.167003 | — | -0.098194 |
| 0.85 | XMP1 | 9.5130 | 0.643299 | 0.554612 | 0.978374 | — | +0.088687 |
| 0.85 | XMP2 | 9.4045 | 0.643013 | 0.554611 | 0.932958 | — | +0.088402 |
| 0.85 | XNTail (tail) | 19.7620 | 0.446987 | 0.456726 | 0.392799 | 0.055394 | -0.009738 |
| 0.85 | XPTail (tail) | 18.9176 | 0.749439 | 0.470359 | 0.305947 | 0.259328 | +0.279080 |
| 0.85 | XM6 (second stage) | 80.4444 | 0.559710 | 0.457273 | 0.849448 | — | +0.102437 |
| 0.85 | XM7 (second stage) | 80.4444 | 0.749407 | 0.470956 | 0.949399 | — | +0.278451 |

At Vcm=0.85 V, mirror/load currents are XPL1=9.965, XPL2=9.970, XNL1=9.513, XNL2=9.577 µA. The selected topology has no folded-cascode transistors; it replaces the original folded-cascode network.


## What the measurements show

The NMOS input devices have model-reported VGS below VTH at all five points. They still conduct, in weak inversion. The PMOS input devices also conduct, with about 87–89 mV of model overdrive. Both input pairs carry current across the tested points. Their currents change smoothly, but the total current is not constant.

The NMOS tail's VDS is above the model VDSAT at each point, but the margin is only about 6 mV at 0.45 V. The PMOS tail also stays above model VDSAT at the five points; its smallest margin is at 0.85 V. The second-stage devices have drain-source headroom at the measured follower operating points. This table covers five nominal TT operating points only. It does not by itself establish ICMR. A separate 17-point screen found 9 passing points and a contiguous sampled range of 0.50–0.90 V; the 0.50–1.30 V target was not passed. See `../../icmr_verification/icmr_report.md`. These values also do not establish operation across temperature or saturation at other process corners.
