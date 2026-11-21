v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -520 0 -500 0 {}
N -440 0 -410 0 {}
N -350 0 -300 0 {}
N -300 0 -260 0 {}
N -300 0 -300 30 {}
N -300 90 -300 120 {}
N -140 0 -100 0 {}
N -100 0 -60 0 {}
N -60 0 -20 0 {}
N -60 0 -60 30 {}
N -60 90 -30 90 {}
N -30 90 -30 45 {}
N -30 45 20 45 {}
N 20 30 20 45 {}
N 20 45 20 60 {}
N 20 0 50 0 {}
N 20 -30 20 -70 {}
N 20 -100 50 -100 {}
N -20 -100 -60 -100 {}
N -60 -100 -60 -260 {}
N -60 -260 80 -260 {}
N 80 -260 130 -260 {}
N 130 -260 420 -260 {}
N 130 -260 130 -200 {}
N 420 -260 420 -200 {}
N 20 -130 80 -130 {}
N 80 -130 130 -130 {}
N 130 -130 170 -130 {}
N 130 -140 130 -130 {}
N 80 -140 80 -130 {}
N 230 -130 260 -130 {}
N 260 -130 290 -130 {}
N 320 -130 350 -130 {}
C {sky130_fd_pr/nfet_01v8.sym} 0 0 0 0 {name=M1
L=0.5
W=25
nf=10
mult=4
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
C {sky130_fd_pr/nfet_01v8.sym} 0 -100 0 0 {name=M2
L=0.5
W=25
nf=10
mult=4
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
C {devices/vsource.sym} -520 30 0 0 {name=Vin value="dc 0 ac 1 sin(0 'vamp' 2.4e9)"}
C {devices/res.sym} -470 0 1 0 {name=Rs value=50 m=1}
C {devices/capa.sym} -380 0 1 0 {name=C1 value=20p m=1}
C {devices/ind.sym} -230 0 1 0 {name=Lg value=12.60n m=1}
C {devices/res.sym} -170 0 1 0 {name=Rlg value=23.75 m=1}
C {devices/res.sym} -300 60 0 0 {name=Rb value=10k m=1}
C {devices/vsource.sym} -300 150 0 0 {name=Vbb value=1.0}
C {devices/capa.sym} -60 60 0 0 {name=Cex value=0.01f m=1}
C {devices/ind.sym} 20 90 0 0 {name=Ls value=0.535n m=1}
C {devices/res.sym} 20 150 0 0 {name=Rls value=1.01 m=1}
C {devices/ind.sym} 80 -170 0 0 {name=Ld value=9.62n m=1}
C {devices/res.sym} 80 -230 0 0 {name=Rld value=18.1 m=1}
C {devices/res.sym} 130 -170 0 0 {name=Rd value=902 m=1}
C {devices/capa.sym} 200 -130 1 0 {name=C2 value=442f m=1}
C {devices/res.sym} 320 -130 1 0 {name=RL value=50 m=1}
C {devices/vsource.sym} 350 -100 0 0 {name=Vout value="dc 0 ac 0"}
C {devices/vsource.sym} 420 -170 0 0 {name=Vdd value=1.8}
C {devices/gnd.sym} -520 120 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} -520 90 0 0 {name=Vin2 value="dc 0 ac 0 sin(0 'vamp' 2.41e9)"}
C {devices/gnd.sym} -300 180 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} 20 180 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 350 -70 0 0 {name=l4 lab=GND}
C {devices/gnd.sym} 420 -140 0 0 {name=l5 lab=GND}
C {devices/gnd.sym} 50 0 0 0 {name=l6 lab=GND}
C {devices/gnd.sym} 50 -100 0 0 {name=l7 lab=GND}
C {devices/lab_pin.sym} -440 0 1 0 {name=p1 sig_type=std_logic lab=nin}
C {devices/lab_pin.sym} 260 -130 1 0 {name=p2 sig_type=std_logic lab=out}
C {devices/code_shown.sym} 480 -300 0 0 {name=s1 only_toplevel=false value="
.lib /home/nehan/.volare/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.GLOBAL GND
.param vamp=0.0356
.control
save all

* ---- two-tone test: 2.400 and 2.410 GHz, IM3 at 2.390 and 2.420 GHz ----
* window = 100 ns, so every tone fits a whole number of cycles
foreach pdbm -28 -25 -22
  let amp = sqrt(8*50*1e-3*10^($pdbm/10))
  alterparam vamp = $&amp
  reset
  tran 10p 110n 10n 10p
  let ca = v(out)*cos(2*pi*2.39e9*time)
  let sa = v(out)*sin(2*pi*2.39e9*time)
  let cb = v(out)*cos(2*pi*2.40e9*time)
  let sb = v(out)*sin(2*pi*2.40e9*time)
  let cc = v(out)*cos(2*pi*2.41e9*time)
  let sc = v(out)*sin(2*pi*2.41e9*time)
  let cd = v(out)*cos(2*pi*2.42e9*time)
  let sd = v(out)*sin(2*pi*2.42e9*time)
  meas tran mca integ ca from=10n to=110n
  meas tran msa integ sa from=10n to=110n
  meas tran mcb integ cb from=10n to=110n
  meas tran msb integ sb from=10n to=110n
  meas tran mcc integ cc from=10n to=110n
  meas tran msc integ sc from=10n to=110n
  meas tran mcd integ cd from=10n to=110n
  meas tran msd integ sd from=10n to=110n
  let a_a = 2/1e-7*sqrt(mca*mca+msa*msa)
  let a_b = 2/1e-7*sqrt(mcb*mcb+msb*msb)
  let a_c = 2/1e-7*sqrt(mcc*mcc+msc*msc)
  let a_d = 2/1e-7*sqrt(mcd*mcd+msd*msd)
  let af = (a_b + a_c)/2
  let aim = (a_a + a_d)/2
  let pfund = 10*log10(af*af/100/1e-3)
  let delta = 20*log10(af/aim)
  let iip3 = $pdbm + delta/2
  let oip3 = pfund + delta/2
  echo Pin/tone = $pdbm dBm  Pout/tone = $&pfund dBm  IM3 below fundamental = $&delta dB  IIP3 = $&iip3 dBm  OIP3 = $&oip3 dBm
end
.endc
"}
T {Two-tone IIP3 test on the final design (Q = 8, mult=4): Vin 2.400 GHz and Vin2 2.410 GHz in series, 50 ohm source and load, IM3 at 2.390 and 2.420 GHz.} -520 220 0 0 0.4 0.4 {}
