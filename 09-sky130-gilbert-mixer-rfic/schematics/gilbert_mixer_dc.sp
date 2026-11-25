* sky130 Gilbert mixer  (generated from the same data as 3_gilbert_mixer.sch)
* EDIT this path to your PDK:
.lib /home/nehan/.volare/volare/sky130/versions/0fe599b2afb6708d281543108caf8310912f54af/sky130A/libs.tech/ngspice/sky130.lib.spice tt

XM3 outn g3 n1 0 sky130_fd_pr__nfet_01v8 L=0.15 W=10 nf=1 ad=2.9 as=2.9 pd=20.58 ps=20.58 nrd=0.029 nrs=0.029 sa=0 sb=0 sd=0 mult=1 m=1
XM5 outp g3 n2 0 sky130_fd_pr__nfet_01v8 L=0.15 W=10 nf=1 ad=2.9 as=2.9 pd=20.58 ps=20.58 nrd=0.029 nrs=0.029 sa=0 sb=0 sd=0 mult=1 m=1
XM4 outp g4 n1 0 sky130_fd_pr__nfet_01v8 L=0.15 W=10 nf=1 ad=2.9 as=2.9 pd=20.58 ps=20.58 nrd=0.029 nrs=0.029 sa=0 sb=0 sd=0 mult=1 m=1
XM6 outn g4 n2 0 sky130_fd_pr__nfet_01v8 L=0.15 W=10 nf=1 ad=2.9 as=2.9 pd=20.58 ps=20.58 nrd=0.029 nrs=0.029 sa=0 sb=0 sd=0 mult=1 m=1
Clop lo_p g3 4p
Rlop vlocm g3 5k
Clon lo_n g4 4p
Rlon vlocm g4 5k
Vlop lo_p 0 0
Vlocm vlocm 0 1.4
Vlon lo_n 0 0
Rload2 VDD outn 500
Rload1 VDD outp 500
Cl1 0 outp 2p
Rext outn outp 20k
Cl2 outn 0 2p
XMP1 n1 nbp VDD VDD sky130_fd_pr__pfet_01v8 L=0.5 W=4 nf=1 ad=1.16 as=1.16 pd=8.58 ps=8.58 nrd=0.0725 nrs=0.0725 sa=0 sb=0 sd=0 mult=8 m=8
XMP2 n2 nbp VDD VDD sky130_fd_pr__pfet_01v8 L=0.5 W=4 nf=1 ad=1.16 as=1.16 pd=8.58 ps=8.58 nrd=0.0725 nrs=0.0725 sa=0 sb=0 sd=0 mult=8 m=8
XM1 n1 gg1 0 0 sky130_fd_pr__nfet_01v8 L=0.15 W=4 nf=1 ad=1.16 as=1.16 pd=8.58 ps=8.58 nrd=0.0725 nrs=0.0725 sa=0 sb=0 sd=0 mult=20 m=20
Rbg1 gg1 nb 10k
Cc1 gg1 rfp 2p
Vrfp rfp 0 0
XM2 n2 gg2 0 0 sky130_fd_pr__nfet_01v8 L=0.15 W=4 nf=1 ad=1.16 as=1.16 pd=8.58 ps=8.58 nrd=0.0725 nrs=0.0725 sa=0 sb=0 sd=0 mult=20 m=20
Rbg2 gg2 nb 10k
Cc2 gg2 rfn 2p
Vrfn rfn 0 0
Iref VDD nb 250u
XMb nb nb 0 0 sky130_fd_pr__nfet_01v8 L=0.15 W=4 nf=1 ad=1.16 as=1.16 pd=8.58 ps=8.58 nrd=0.0725 nrs=0.0725 sa=0 sb=0 sd=0 mult=2 m=2
XMPb nbp nbp VDD VDD sky130_fd_pr__pfet_01v8 L=0.5 W=4 nf=1 ad=1.16 as=1.16 pd=8.58 ps=8.58 nrd=0.0725 nrs=0.0725 sa=0 sb=0 sd=0 mult=1 m=1
Ibp nbp 0 125u
Vdd VDD 0 1.8

.control
op
print v(nb) v(nbp) v(n1) v(n2) v(outp) v(outn) v(g3)
print i(Vdd)
let il1 = (v(vdd)-v(outp))/500
let il2 = (v(vdd)-v(outn))/500
print il1 il2
let ibl = (-i(vdd)-375e-6-il1-il2)/2
let igm = il1+ibl
print ibl igm
.endc
.end
