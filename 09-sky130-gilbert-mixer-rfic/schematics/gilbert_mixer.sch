v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
C {sky130_fd_pr/nfet_01v8.sym} -120 0 0 0 {name=M1
L=0.5
W=25
nf=10
mult=2
ad="'int((nf+1)/2) * W/nf * 0.29'"
as="'int((nf+2)/2) * W/nf * 0.29'"
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'"
nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 120 0 0 0 {name=M2
L=0.5
W=25
nf=10
mult=2
ad="'int((nf+1)/2) * W/nf * 0.29'"
as="'int((nf+2)/2) * W/nf * 0.29'"
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'"
nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -240 -200 0 0 {name=M3
L=0.5
W=25
nf=10
mult=2
ad="'int((nf+1)/2) * W/nf * 0.29'"
as="'int((nf+2)/2) * W/nf * 0.29'"
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'"
nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -120 -200 0 0 {name=M4
L=0.5
W=25
nf=10
mult=2
ad="'int((nf+1)/2) * W/nf * 0.29'"
as="'int((nf+2)/2) * W/nf * 0.29'"
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'"
nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 120 -200 0 0 {name=M5
L=0.5
W=25
nf=10
mult=2
ad="'int((nf+1)/2) * W/nf * 0.29'"
as="'int((nf+2)/2) * W/nf * 0.29'"
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'"
nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 240 -200 0 0 {name=M6
L=0.5
W=25
nf=10
mult=2
ad="'int((nf+1)/2) * W/nf * 0.29'"
as="'int((nf+2)/2) * W/nf * 0.29'"
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'"
nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {devices/res.sym} -220 -290 0 0 {name=RL1 value=1.2k m=1}
C {devices/res.sym} 260 -290 0 0 {name=RL2 value=1.2k m=1}
C {devices/res.sym} -100 60 0 0 {name=Rdeg1 value=25 m=1}
C {devices/res.sym} 140 60 0 0 {name=Rdeg2 value=25 m=1}
C {devices/capa.sym} -340 -260 0 0 {name=CL1 value=1p m=1}
C {devices/capa.sym} 300 -260 0 0 {name=CL2 value=1p m=1}
C {devices/vsource.sym} 380 -290 0 0 {name=Vdd value="1.8"}
C {devices/vsource.sym} -480 -200 0 0 {name=Vlop value="dc 1.3 sin(1.3 'vlo' 2.38e9)"}
C {devices/vsource.sym} -420 -200 0 0 {name=Vlon value="dc 1.3 sin(1.3 '-vlo' 2.38e9)"}
C {devices/vsource.sym} -300 30 0 0 {name=Vrfp value="dc 0.9 sin(0.9 'vrf' 2.40e9)"}
C {devices/vsource.sym} 260 30 0 0 {name=Vrfn value="dc 0.9 sin(0.9 '-vrf' 2.40e9)"}
C {devices/gnd.sym} -300 60 0 0 {name=g1 lab=GND}
C {devices/gnd.sym} 260 60 0 0 {name=g2 lab=GND}
C {devices/gnd.sym} -480 -170 0 0 {name=g3 lab=GND}
C {devices/gnd.sym} -420 -170 0 0 {name=g4 lab=GND}
C {devices/gnd.sym} 380 -260 0 0 {name=g5 lab=GND}
C {devices/gnd.sym} -340 -230 0 0 {name=g6 lab=GND}
C {devices/gnd.sym} 300 -230 0 0 {name=g7 lab=GND}
C {devices/gnd.sym} -100 90 0 0 {name=g8 lab=GND}
C {devices/gnd.sym} 140 90 0 0 {name=g9 lab=GND}
C {devices/gnd.sym} -100 0 0 0 {name=g10 lab=GND}
C {devices/gnd.sym} 140 0 0 0 {name=g11 lab=GND}
C {devices/gnd.sym} -220 -200 0 0 {name=g12 lab=GND}
C {devices/gnd.sym} -100 -200 0 0 {name=g13 lab=GND}
C {devices/gnd.sym} 140 -200 0 0 {name=g14 lab=GND}
C {devices/gnd.sym} 260 -200 0 0 {name=g15 lab=GND}
C {devices/lab_pin.sym} -480 -230 0 0 {name=p1 sig_type=std_logic lab=lop}
C {devices/lab_pin.sym} -260 -200 0 0 {name=p2 sig_type=std_logic lab=lop}
C {devices/lab_pin.sym} 220 -200 0 0 {name=p3 sig_type=std_logic lab=lop}
C {devices/lab_pin.sym} -420 -230 0 0 {name=p4 sig_type=std_logic lab=lon}
C {devices/lab_pin.sym} -140 -200 0 0 {name=p5 sig_type=std_logic lab=lon}
C {devices/lab_pin.sym} 100 -200 0 0 {name=p6 sig_type=std_logic lab=lon}
C {devices/lab_pin.sym} -220 -170 0 0 {name=p7 sig_type=std_logic lab=a}
C {devices/lab_pin.sym} -100 -170 0 0 {name=p8 sig_type=std_logic lab=a}
C {devices/lab_pin.sym} -100 -30 0 0 {name=p9 sig_type=std_logic lab=a}
C {devices/lab_pin.sym} 140 -170 0 0 {name=p10 sig_type=std_logic lab=b}
C {devices/lab_pin.sym} 260 -170 0 0 {name=p11 sig_type=std_logic lab=b}
C {devices/lab_pin.sym} 140 -30 0 0 {name=p12 sig_type=std_logic lab=b}
C {devices/lab_pin.sym} -300 0 0 0 {name=p13 sig_type=std_logic lab=rfp}
C {devices/lab_pin.sym} -140 0 0 0 {name=p14 sig_type=std_logic lab=rfp}
C {devices/lab_pin.sym} 260 0 0 0 {name=p15 sig_type=std_logic lab=rfn}
C {devices/lab_pin.sym} 100 0 0 0 {name=p16 sig_type=std_logic lab=rfn}
C {devices/lab_pin.sym} -100 30 0 0 {name=p17 sig_type=std_logic lab=t1}
C {devices/lab_pin.sym} 140 30 0 0 {name=p18 sig_type=std_logic lab=t2}
C {devices/lab_pin.sym} -220 -260 0 0 {name=p19 sig_type=std_logic lab=ifp}
C {devices/lab_pin.sym} -220 -230 0 0 {name=p20 sig_type=std_logic lab=ifp}
C {devices/lab_pin.sym} 140 -230 0 0 {name=p21 sig_type=std_logic lab=ifp}
C {devices/lab_pin.sym} -340 -290 0 0 {name=p22 sig_type=std_logic lab=ifp}
C {devices/lab_pin.sym} 260 -260 0 0 {name=p23 sig_type=std_logic lab=ifn}
C {devices/lab_pin.sym} 260 -230 0 0 {name=p24 sig_type=std_logic lab=ifn}
C {devices/lab_pin.sym} -100 -230 0 0 {name=p25 sig_type=std_logic lab=ifn}
C {devices/lab_pin.sym} 300 -290 0 0 {name=p26 sig_type=std_logic lab=ifn}
C {devices/lab_pin.sym} -220 -320 0 0 {name=p27 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} 260 -320 0 0 {name=p28 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} 380 -320 0 0 {name=p29 sig_type=std_logic lab=vdd}
C {devices/code_shown.sym} 560 -300 0 0 {name=s1 only_toplevel=false value="
.lib /home/nehan/.volare/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.GLOBAL GND
.param vrf=0.01
.param vlo=0.5
.control
save all @m.xm1.msky130_fd_pr__nfet_01v8[id] @m.xm1.msky130_fd_pr__nfet_01v8[gm] @m.xm1.msky130_fd_pr__nfet_01v8[vdsat] @m.xm2.msky130_fd_pr__nfet_01v8[id] @m.xm2.msky130_fd_pr__nfet_01v8[gm] @m.xm2.msky130_fd_pr__nfet_01v8[vdsat] @m.xm3.msky130_fd_pr__nfet_01v8[id] @m.xm5.msky130_fd_pr__nfet_01v8[id]

* ---- 1. DC bias check (LO gates at their common-mode level) ----
op
print v(a) v(b) v(t1) v(t2) v(ifp) v(ifn)
print @m.xm1.msky130_fd_pr__nfet_01v8[id] @m.xm2.msky130_fd_pr__nfet_01v8[id] @m.xm3.msky130_fd_pr__nfet_01v8[id] @m.xm5.msky130_fd_pr__nfet_01v8[id]
let m1margin = v(a) - v(t1) - @m.xm1.msky130_fd_pr__nfet_01v8[vdsat]
let m2margin = v(b) - v(t2) - @m.xm2.msky130_fd_pr__nfet_01v8[vdsat]
print m1margin m2margin
print -i(Vdd)

* ---- 2. noise figure: hand estimate from the op-point gm (lower bound) ----
* edit rdeg and rl below if you change Rdeg1 and RL1
let gm1 = @m.xm1.msky130_fd_pr__nfet_01v8[gm]
let rdeg = 25
let rl = 1200
let gmeff = gm1/(1+gm1*rdeg)
let cgv = 2/pi*gmeff*rl
let rn = 2*(1/gm1 + rdeg) + 2*rl/(cgv*cgv)
let nfdsb = 10*log10(1 + rn/100)
let nfssb = nfdsb + 3
print gm1 gmeff cgv rn nfdsb nfssb

* ---- 3. conversion gain and compression: RF 2.40 GHz, LO 2.38 GHz, IF 20 MHz ----
option reltol=1e-4
foreach pdbm -30 -25 -20 -15 -12 -9 -6 -3 0
  let vr = sqrt(0.2*10^($pdbm/10))
  alterparam vrf = $&vr
  reset
  tran 10p 120n 20n 10p
  let vr = sqrt(0.2*10^($pdbm/10))
  let vd = v(ifp)-v(ifn)
  let cc = vd*cos(2*pi*20e6*time)
  let sn = vd*sin(2*pi*20e6*time)
  meas tran mc integ cc from=20n to=120n
  meas tran ms integ sn from=20n to=120n
  meas tran idd avg i(vdd) from=20n to=120n
  let vif = 2/1e-7*sqrt(mc*mc+ms*ms)
  let cgdb = 20*log10(vif/(2*vr))
  let pdc = -idd*1.8
  echo Pin = $pdbm dBm  CG = $&cgdb dB  IFpk = $&vif V  Pdc = $&pdc W
end
.endc
"}
T {Double-balanced Gilbert-cell mixer, SKY130, RF 2.40 GHz, LO 2.38 GHz, IF 20 MHz. Pin is referenced to a 100 ohm differential source. Nets are connected by name.} -480 220 0 0 0.4 0.4 {}
