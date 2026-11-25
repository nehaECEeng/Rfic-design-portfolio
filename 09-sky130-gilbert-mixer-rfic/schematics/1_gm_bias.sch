v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {Expect: i(Vd) = -2.0m (2 mA, x8 mirror)nv(nb) = Vgs at 250u, about 0.55 to 0.65 V} 380 40 0 0 0.3 0.3 {}
N 0 30 0 90 {lab=
nb}
N 0 90 20 90 {lab=
nb}
N 20 90 80 90 {lab=
nb}
N 80 90 120 90 {lab=
nb}
N 120 90 160 90 {lab=
nb}
N 120 60 120 90 {lab=
nb}
N 20 120 40 120 {lab=
nb}
N 20 90 20 120 {lab=
nb}
N 80 150 80 180 {lab=
GND}
N 80 120 100 120 {lab=
GND}
N 100 120 100 180 {lab=
GND}
N 80 180 100 180 {lab=
GND}
N 160 150 160 180 {lab=
#net1}
N 160 180 200 180 {lab=
#net1}
N 240 210 240 240 {lab=
GND}
N 240 180 260 180 {lab=
GND}
N 260 180 260 240 {lab=
GND}
N 240 240 260 240 {lab=
GND}
N 240 150 270 150 {lab=
d1}
N 270 150 300 150 {lab=
d1}
N 270 120 270 150 {lab=
d1}
N 300 210 300 240 {lab=
GND}
C {devices/isource.sym} 0 0 0 0 {name=Iref value=250u}
C {devices/vdd.sym} 0 -30 0 0 {name=l1 lab=VDD}
C {devices/lab_pin.sym} 120 60 0 0 {name=p2 sig_type=std_logic lab=nb}
C {sky130_fd_pr/nfet_01v8.sym} 60 120 0 0 {name=Mb L=0.15 W=4 nf=1 ad="'int((nf+1)/2) * W/nf * 0.29'" as="'int((nf+2)/2) * W/nf * 0.29'" pd="'2*int((nf+1)/2) * (W/nf + 0.29)'" ps="'2*int((nf+2)/2) * (W/nf + 0.29)'" nrd="'0.29 / W'" nrs="'0.29 / W'" sa=0 sb=0 sd=0 mult=1 m=1 model=nfet_01v8 spiceprefix=X}
C {devices/gnd.sym} 80 180 0 0 {name=l3 lab=GND}
C {devices/res.sym} 160 120 0 0 {name=Rbg1 value=10k footprint=1206 device=resistor m=1}
C {sky130_fd_pr/nfet_01v8.sym} 220 180 0 0 {name=M1 L=0.15 W=4 nf=1 ad="'int((nf+1)/2) * W/nf * 0.29'" as="'int((nf+2)/2) * W/nf * 0.29'" pd="'2*int((nf+1)/2) * (W/nf + 0.29)'" ps="'2*int((nf+2)/2) * (W/nf + 0.29)'" nrd="'0.29 / W'" nrs="'0.29 / W'" sa=0 sb=0 sd=0 mult=8 m=8 model=nfet_01v8 spiceprefix=X}
C {devices/gnd.sym} 240 240 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 270 120 0 0 {name=p5 sig_type=std_logic lab=d1}
C {devices/vsource.sym} 300 180 0 0 {name=Vd value=0.6}
C {devices/gnd.sym} 300 240 0 0 {name=l6 lab=GND}
C {devices/code_shown.sym} 380 -160 0 0 {name=MODELS only_toplevel=true format="tcleval( @value )" value=".lib $::env(SKYWATER_MODELS)/sky130.lib.spice tt"}
C {devices/code_shown.sym} 380 -100 0 0 {name=SIM only_toplevel=false value=".op
.control
op
print v(nb) v(g1) v(d1)
print i(Vd)
.endc"}
