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
C {devices/gnd.sym} -520 60 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} -300 180 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} 20 180 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 350 -70 0 0 {name=l4 lab=GND}
C {devices/gnd.sym} 420 -140 0 0 {name=l5 lab=GND}
C {devices/gnd.sym} 50 0 0 0 {name=l6 lab=GND}
C {devices/gnd.sym} 50 -100 0 0 {name=l7 lab=GND}
C {devices/lab_pin.sym} -440 0 1 0 {name=p1 sig_type=std_logic lab=nin}
C {devices/lab_pin.sym} 260 -130 1 0 {name=p2 sig_type=std_logic lab=out}
C {devices/code_shown.sym} 480 -300 0 0 {name=s1 only_toplevel=false value="
.lib /home/nehan/.volare/sky130A/libs.tech/ngspice/sky130.lib.spice ff
.GLOBAL GND
.temp 85
.param vamp=0.001
.control
save all

op
print v(nin) v(out) -i(Vdd)

* ---- S-parameters, 2.0 to 2.8 GHz, 1 MHz steps ----
alter vin acmag = 1
alter vout acmag = 0
ac lin 3001 1e9 4e9
let s11 = 2*v(nin)-1
let s21 = 2*v(out)

alter vin acmag = 0
alter vout acmag = 1
ac lin 3001 1e9 4e9
let s22 = 2*v(out)-1
let s12 = 2*v(nin)
let s11 = ac1.s11*1
let s21 = ac1.s21*1
let s11db = db(s11)
let s21db = db(s21)
let s22db = db(s22)
let zin = 50*(1+s11)/(1-s11)
let rin = real(zin)
let xin = imag(zin)
let zout = 50*(1+s22)/(1-s22)
let rout = real(zout)
let xout = imag(zout)
let s12db = db(s12)
let dlt = s11*s22 - s12*s21
let dmag = mag(dlt)
let kfac = (1 - mag(s11)*mag(s11) - mag(s22)*mag(s22) + dmag*dmag)/(2*mag(s12*s21))
let mu = (1 - mag(s11)*mag(s11))/(mag(s22 - dlt*conj(s11)) + mag(s12*s21))
let mup = (1 - mag(s22)*mag(s22))/(mag(s11 - dlt*conj(s22)) + mag(s12*s21))

plot s11db s22db vs frequency title 'S11 and S22 (dB)'
plot s21db vs frequency title 'S21 (dB)'

meas ac s11_2p4G find s11db at=2.4e9
meas ac s21_2p4G find s21db at=2.4e9
meas ac s22_2p4G find s22db at=2.4e9
meas ac rin_2p4G find rin at=2.4e9
meas ac xin_2p4G find xin at=2.4e9
meas ac rout_2p4G find rout at=2.4e9
meas ac xout_2p4G find xout at=2.4e9
meas ac s12_2p4G find s12db at=2.4e9
meas ac k_2p4G find kfac at=2.4e9
meas ac mu_2p4G find mu at=2.4e9
meas ac mup_2p4G find mup at=2.4e9
meas ac f_s11best min_at s11db

* ---- bandwidth ----
meas ac f11_lo when s11db=-10 cross=1
meas ac f11_hi when s11db=-10 cross=2
meas ac f22_lo when s22db=-10 cross=1
meas ac f22_hi when s22db=-10 cross=2
let s21n = s21db - vecmax(s21db)
meas ac f3_lo when s21n=-3 cross=1
meas ac f3_hi when s21n=-3 cross=2

* ---- P1dB, IIP3 and OIP3 estimates: input power sweep at 2.4 GHz ----
set g0 = $&s21_2p4g

* ---- noise figure at 2.4 GHz (Rs = 50 ohm at the input) ----
alter vin acmag = 1
alter vout acmag = 0
noise v(out) vin lin 41 1e9 5e9
setplot noise2
let nf = 10*log10(inoise_spectrum*inoise_spectrum/(4*1.380649e-23*300.15*50))
plot nf vs frequency title 'Noise figure (dB)'
let f24 = frequency[14]
print f24 nf[14]
.endc
"}
T {Corner run: ff, 85 C. Final design (Q = 8, mult=4). S-parameters, K, mu, NF and supply current at 2.4 GHz. Gate bias is a fixed source, so the match detunes in the corners.} -520 220 0 0 0.4 0.4 {}
