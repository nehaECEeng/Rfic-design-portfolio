* =====================================================================
* Double-balanced Gilbert-cell mixer, SKY130 (1.8 V devices only)
* RF 2.4 GHz, LO 2.39 GHz, IF 10 MHz  (change in run_sim.py)
*
* Features (all chosen for low noise / efficiency):
*   - Current-bleeding PMOS: gm stage runs 2 mA/side, switches only 1 mA/side
*     -> lower switch noise + flicker, allows larger RL (more gain) at 1.8 V
*   - No tail transistor: gm sources straight to ground (headroom, noise)
*   - Bias by 1/8-size replica mirrors -> current set by Iref, not by Vth/corner
*   - Differential IF cap for LO/RF feed-through filtering
*
* Sizing summary (W is PER FINGER in sky130 models, total = W*nf):
*   M1,M2  gm stage   nfet_01v8  W=5  nf=8  L=0.25   -> 40 um / 0.25 um
*   M3-M6  LO quad    nfet_01v8  W=5  nf=4  L=0.15   -> 20 um / 0.15 um
*   MP1,2  bleed      pfet_01v8  W=5  nf=8  L=0.50   -> 40 um / 0.50 um
*   RL     700 ohm (ideal first; swap for res_high_po_1p41 after sizing)
* =====================================================================
.subckt gilbert rfp rfn lop lon outp outn vdd gnd

* ---- gm-stage bias: diode replica (1/8 size) ----
Iref   vdd nb 250u
XMb    nb nb gnd gnd sky130_fd_pr__nfet_01v8 L=0.25 W=5 nf=1
Rb1    nb gp 20k
Rb2    nb gn 20k
Cc1    rfp gp 10p
Cc2    rfn gn 10p

* ---- gm stage ----
XM1    n1 gp gnd gnd sky130_fd_pr__nfet_01v8 L=0.25 W=5 nf=8
XM2    n2 gn gnd gnd sky130_fd_pr__nfet_01v8 L=0.25 W=5 nf=8

* ---- PMOS current bleed (1 mA each, mirror 1/8 size) ----
Ibp    nbp gnd 125u
XMbp   nbp nbp vdd vdd sky130_fd_pr__pfet_01v8 L=0.5 W=5 nf=1
XMp1   n1 nbp vdd vdd sky130_fd_pr__pfet_01v8 L=0.5 W=5 nf=8
XMp2   n2 nbp vdd vdd sky130_fd_pr__pfet_01v8 L=0.5 W=5 nf=8

* ---- LO bias + coupling ----
Vlocm  locm gnd 1.1
Rl1    locm lpg 10k
Rl2    locm lng 10k
Cl1    lop lpg 5p
Cl2    lon lng 5p

* ---- switching quad ----
XM3    outp lpg n1 gnd sky130_fd_pr__nfet_01v8 L=0.15 W=5 nf=4
XM4    outn lng n1 gnd sky130_fd_pr__nfet_01v8 L=0.15 W=5 nf=4
XM5    outn lpg n2 gnd sky130_fd_pr__nfet_01v8 L=0.15 W=5 nf=4
XM6    outp lng n2 gnd sky130_fd_pr__nfet_01v8 L=0.15 W=5 nf=4

* ---- loads + IF filter ----
RL1    vdd outp 700
RL2    vdd outn 700
Cif    outp outn 2p
.ends gilbert
