v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {Expect: i(Vd) = +1.0m (1 mA, x8 mirror)nv(nbp) = VDD - Vsg at 125u} 380 40 0 0 0.3 0.3 {}
N 80 60 80 90 {lab=
VDD}
N 80 120 100 120 {lab=
VDD}
N 100 60 100 120 {lab=
VDD}
N 80 60 100 60 {lab=
VDD}
N 0 210 0 240 {lab=
GND}
N 0 150 20 150 {lab=
nbp}
N 20 150 80 150 {lab=
nbp}
N 20 120 40 120 {lab=
nbp}
N 20 120 20 150 {lab=
nbp}
N 80 150 120 150 {lab=
nbp}
N 120 150 180 150 {lab=
nbp}
N 120 150 120 180 {lab=
nbp}
N 180 120 180 150 {lab=
nbp}
N 180 120 200 120 {lab=
nbp}
N 240 60 240 90 {lab=
VDD}
N 240 120 260 120 {lab=
VDD}
N 260 60 260 120 {lab=
VDD}
N 240 60 260 60 {lab=
VDD}
N 240 150 240 165 {lab=
d1}
N 240 165 240 180 {lab=
d1}
N 240 165 270 165 {lab=
d1}
N 240 240 240 270 {lab=
GND}
N -100 90 -100 120 {lab=
VDD}
N -100 180 -100 210 {lab=
GND}
C {sky130_fd_pr/pfet_01v8.sym} 60 120 2 1 {name=MPb L=0.5 W=4 nf=1 ad="'int((nf+1)/2) * W/nf * 0.29'" as="'int((nf+2)/2) * W/nf * 0.29'" pd="'2*int((nf+1)/2) * (W/nf + 0.29)'" ps="'2*int((nf+2)/2) * (W/nf + 0.29)'" nrd="'0.29 / W'" nrs="'0.29 / W'" sa=0 sb=0 sd=0 mult=1 m=1 model=pfet_01v8 spiceprefix=X}
C {devices/vdd.sym} 80 60 0 0 {name=l1 lab=VDD}
C {devices/isource.sym} 0 180 0 0 {name=Ibp value=125u}
C {devices/gnd.sym} 0 240 0 0 {name=l2 lab=GND}
C {devices/lab_pin.sym} 120 180 0 0 {name=p3 sig_type=std_logic lab=nbp}
C {sky130_fd_pr/pfet_01v8.sym} 220 120 2 1 {name=MP1 L=0.5 W=4 nf=1 ad="'int((nf+1)/2) * W/nf * 0.29'" as="'int((nf+2)/2) * W/nf * 0.29'" pd="'2*int((nf+1)/2) * (W/nf + 0.29)'" ps="'2*int((nf+2)/2) * (W/nf + 0.29)'" nrd="'0.29 / W'" nrs="'0.29 / W'" sa=0 sb=0 sd=0 mult=8 m=8 model=pfet_01v8 spiceprefix=X}
C {devices/vdd.sym} 240 60 0 0 {name=l4 lab=VDD}
C {devices/lab_pin.sym} 270 165 0 0 {name=p5 sig_type=std_logic lab=d1}
C {devices/vsource.sym} 240 210 0 0 {name=Vd value=0.6}
C {devices/gnd.sym} 240 270 0 0 {name=l6 lab=GND}
C {devices/code_shown.sym} -40 -60 0 0 {name=MODELS only_toplevel=true format="tcleval( @value )" value=".lib $::env(SKYWATER_MODELS)/sky130.lib.spice tt"}
C {devices/code_shown.sym} 380 180 0 0 {name=SIM only_toplevel=false value=".op
.control
op
print v(nbp) v(d1)
print i(Vd)
.endc"}
C {devices/vsource.sym} -100 150 0 0 {name=Vdd value=1.8}
C {devices/vdd.sym} -100 90 0 0 {name=l7 lab=VDD}
C {devices/gnd.sym} -100 210 0 0 {name=l8 lab=GND}
