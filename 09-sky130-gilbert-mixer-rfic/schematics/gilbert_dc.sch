v {xschem version=3.4.5 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
T {SUPPLY AND TEST SOURCES (DC op: AC sources = 0 V)} 0 -120 0 0 0.5 0.5 {layer=8}
C {devices/vsource.sym} 120 0 0 0 {name=Vdd value=1.8}
N 120 -30 120 -50 {}
N 120 -50 140 -50 {}
C {devices/lab_pin.sym} 140 -50 0 0 {name=p1 sig_type=std_logic lab=VDD}
N 120 30 120 50 {}
N 120 50 140 50 {}
C {devices/lab_pin.sym} 140 50 0 0 {name=p2 sig_type=std_logic lab=GND}
C {devices/vsource.sym} 440 0 0 0 {name=Vrfp value=0}
N 440 -30 440 -50 {}
N 440 -50 460 -50 {}
C {devices/lab_pin.sym} 460 -50 0 0 {name=p3 sig_type=std_logic lab=rfp}
N 440 30 440 50 {}
N 440 50 460 50 {}
C {devices/lab_pin.sym} 460 50 0 0 {name=p4 sig_type=std_logic lab=GND}
C {devices/vsource.sym} 760 0 0 0 {name=Vrfn value=0}
N 760 -30 760 -50 {}
N 760 -50 780 -50 {}
C {devices/lab_pin.sym} 780 -50 0 0 {name=p5 sig_type=std_logic lab=rfn}
N 760 30 760 50 {}
N 760 50 780 50 {}
C {devices/lab_pin.sym} 780 50 0 0 {name=p6 sig_type=std_logic lab=GND}
C {devices/vsource.sym} 1080 0 0 0 {name=Vlop value=0}
N 1080 -30 1080 -50 {}
N 1080 -50 1100 -50 {}
C {devices/lab_pin.sym} 1100 -50 0 0 {name=p7 sig_type=std_logic lab=lop}
N 1080 30 1080 50 {}
N 1080 50 1100 50 {}
C {devices/lab_pin.sym} 1100 50 0 0 {name=p8 sig_type=std_logic lab=GND}
C {devices/vsource.sym} 120 200 0 0 {name=Vlon value=0}
N 120 170 120 150 {}
N 120 150 140 150 {}
C {devices/lab_pin.sym} 140 150 0 0 {name=p9 sig_type=std_logic lab=lon}
N 120 230 120 250 {}
N 120 250 140 250 {}
C {devices/lab_pin.sym} 140 250 0 0 {name=p10 sig_type=std_logic lab=GND}
T {1. GM STAGE AND ITS BIAS} 0 480 0 0 0.5 0.5 {layer=8}
C {devices/isource.sym} 120 600 0 0 {name=Iref value=250u}
N 120 570 120 550 {}
N 120 550 140 550 {}
C {devices/lab_pin.sym} 140 550 0 0 {name=p11 sig_type=std_logic lab=VDD}
N 120 630 120 650 {}
N 120 650 140 650 {}
C {devices/lab_pin.sym} 140 650 0 0 {name=p12 sig_type=std_logic lab=nb}
C {sky130_fd_pr/nfet_01v8.sym} 440 600 0 0 {name=Mb L=0.25 W=5 nf=1 mult=1 ad="'int((nf+1)/2) * W/nf * 0.29'" pd="'2*int((nf+1)/2) * (W/nf + 0.29)'" as="'int((nf+2)/2) * W/nf * 0.29'" ps="'2*int((nf+2)/2) * (W/nf + 0.29)'" nrd="'0.29 / W'" nrs="'0.29 / W'" sa=0 sb=0 sd=0 model=nfet_01v8 spiceprefix=X}
N 460 570 460 550 {}
N 460 550 480 550 {}
C {devices/lab_pin.sym} 480 550 0 0 {name=p13 sig_type=std_logic lab=nb}
N 420 600 400 600 {}
C {devices/lab_pin.sym} 400 600 2 0 {name=p14 sig_type=std_logic lab=nb}
N 460 630 460 650 {}
N 460 650 480 650 {}
C {devices/lab_pin.sym} 480 650 0 0 {name=p15 sig_type=std_logic lab=GND}
N 460 600 480 600 {}
C {devices/lab_pin.sym} 480 600 0 0 {name=p16 sig_type=std_logic lab=GND}
C {devices/res.sym} 760 600 0 0 {name=Rb1 value=20k}
N 760 570 760 550 {}
N 760 550 780 550 {}
C {devices/lab_pin.sym} 780 550 0 0 {name=p17 sig_type=std_logic lab=nb}
N 760 630 760 650 {}
N 760 650 780 650 {}
C {devices/lab_pin.sym} 780 650 0 0 {name=p18 sig_type=std_logic lab=gp}
C {devices/res.sym} 1080 600 0 0 {name=Rb2 value=20k}
N 1080 570 1080 550 {}
N 1080 550 1100 550 {}
C {devices/lab_pin.sym} 1100 550 0 0 {name=p19 sig_type=std_logic lab=nb}
N 1080 630 1080 650 {}
N 1080 650 1100 650 {}
C {devices/lab_pin.sym} 1100 650 0 0 {name=p20 sig_type=std_logic lab=gn}
C {devices/capa.sym} 120 800 0 0 {name=Cc1 value=10p}
N 120 770 120 750 {}
N 120 750 140 750 {}
C {devices/lab_pin.sym} 140 750 0 0 {name=p21 sig_type=std_logic lab=rfp}
N 120 830 120 850 {}
N 120 850 140 850 {}
C {devices/lab_pin.sym} 140 850 0 0 {name=p22 sig_type=std_logic lab=gp}
C {devices/capa.sym} 440 800 0 0 {name=Cc2 value=10p}
N 440 770 440 750 {}
N 440 750 460 750 {}
C {devices/lab_pin.sym} 460 750 0 0 {name=p23 sig_type=std_logic lab=rfn}
N 440 830 440 850 {}
N 440 850 460 850 {}
C {devices/lab_pin.sym} 460 850 0 0 {name=p24 sig_type=std_logic lab=gn}
C {sky130_fd_pr/nfet_01v8.sym} 760 800 0 0 {name=M1 L=0.25 W=5 nf=8 mult=1 ad="'int((nf+1)/2) * W/nf * 0.29'" pd="'2*int((nf+1)/2) * (W/nf + 0.29)'" as="'int((nf+2)/2) * W/nf * 0.29'" ps="'2*int((nf+2)/2) * (W/nf + 0.29)'" nrd="'0.29 / W'" nrs="'0.29 / W'" sa=0 sb=0 sd=0 model=nfet_01v8 spiceprefix=X}
N 780 770 780 750 {}
N 780 750 800 750 {}
C {devices/lab_pin.sym} 800 750 0 0 {name=p25 sig_type=std_logic lab=n1}
N 740 800 720 800 {}
C {devices/lab_pin.sym} 720 800 2 0 {name=p26 sig_type=std_logic lab=gp}
N 780 830 780 850 {}
N 780 850 800 850 {}
C {devices/lab_pin.sym} 800 850 0 0 {name=p27 sig_type=std_logic lab=GND}
N 780 800 800 800 {}
C {devices/lab_pin.sym} 800 800 0 0 {name=p28 sig_type=std_logic lab=GND}
C {sky130_fd_pr/nfet_01v8.sym} 1080 800 0 0 {name=M2 L=0.25 W=5 nf=8 mult=1 ad="'int((nf+1)/2) * W/nf * 0.29'" pd="'2*int((nf+1)/2) * (W/nf + 0.29)'" as="'int((nf+2)/2) * W/nf * 0.29'" ps="'2*int((nf+2)/2) * (W/nf + 0.29)'" nrd="'0.29 / W'" nrs="'0.29 / W'" sa=0 sb=0 sd=0 model=nfet_01v8 spiceprefix=X}
N 1100 770 1100 750 {}
N 1100 750 1120 750 {}
C {devices/lab_pin.sym} 1120 750 0 0 {name=p29 sig_type=std_logic lab=n2}
N 1060 800 1040 800 {}
C {devices/lab_pin.sym} 1040 800 2 0 {name=p30 sig_type=std_logic lab=gn}
N 1100 830 1100 850 {}
N 1100 850 1120 850 {}
C {devices/lab_pin.sym} 1120 850 0 0 {name=p31 sig_type=std_logic lab=GND}
N 1100 800 1120 800 {}
C {devices/lab_pin.sym} 1120 800 0 0 {name=p32 sig_type=std_logic lab=GND}
T {2. PMOS BLEED AND ITS BIAS} 0 1080 0 0 0.5 0.5 {layer=8}
C {devices/isource.sym} 120 1200 0 0 {name=Ibp value=125u}
N 120 1170 120 1150 {}
N 120 1150 140 1150 {}
C {devices/lab_pin.sym} 140 1150 0 0 {name=p33 sig_type=std_logic lab=nbp}
N 120 1230 120 1250 {}
N 120 1250 140 1250 {}
C {devices/lab_pin.sym} 140 1250 0 0 {name=p34 sig_type=std_logic lab=GND}
C {sky130_fd_pr/pfet_01v8.sym} 440 1200 0 0 {name=Mbp L=0.5 W=5 nf=1 mult=1 ad="'int((nf+1)/2) * W/nf * 0.29'" pd="'2*int((nf+1)/2) * (W/nf + 0.29)'" as="'int((nf+2)/2) * W/nf * 0.29'" ps="'2*int((nf+2)/2) * (W/nf + 0.29)'" nrd="'0.29 / W'" nrs="'0.29 / W'" sa=0 sb=0 sd=0 model=pfet_01v8 spiceprefix=X}
N 460 1230 460 1250 {}
N 460 1250 480 1250 {}
C {devices/lab_pin.sym} 480 1250 0 0 {name=p35 sig_type=std_logic lab=nbp}
N 420 1200 400 1200 {}
C {devices/lab_pin.sym} 400 1200 2 0 {name=p36 sig_type=std_logic lab=nbp}
N 460 1170 460 1150 {}
N 460 1150 480 1150 {}
C {devices/lab_pin.sym} 480 1150 0 0 {name=p37 sig_type=std_logic lab=VDD}
N 460 1200 480 1200 {}
C {devices/lab_pin.sym} 480 1200 0 0 {name=p38 sig_type=std_logic lab=VDD}
C {sky130_fd_pr/pfet_01v8.sym} 760 1200 0 0 {name=Mp1 L=0.5 W=5 nf=8 mult=1 ad="'int((nf+1)/2) * W/nf * 0.29'" pd="'2*int((nf+1)/2) * (W/nf + 0.29)'" as="'int((nf+2)/2) * W/nf * 0.29'" ps="'2*int((nf+2)/2) * (W/nf + 0.29)'" nrd="'0.29 / W'" nrs="'0.29 / W'" sa=0 sb=0 sd=0 model=pfet_01v8 spiceprefix=X}
N 780 1230 780 1250 {}
N 780 1250 800 1250 {}
C {devices/lab_pin.sym} 800 1250 0 0 {name=p39 sig_type=std_logic lab=n1}
N 740 1200 720 1200 {}
C {devices/lab_pin.sym} 720 1200 2 0 {name=p40 sig_type=std_logic lab=nbp}
N 780 1170 780 1150 {}
N 780 1150 800 1150 {}
C {devices/lab_pin.sym} 800 1150 0 0 {name=p41 sig_type=std_logic lab=VDD}
N 780 1200 800 1200 {}
C {devices/lab_pin.sym} 800 1200 0 0 {name=p42 sig_type=std_logic lab=VDD}
C {sky130_fd_pr/pfet_01v8.sym} 1080 1200 0 0 {name=Mp2 L=0.5 W=5 nf=8 mult=1 ad="'int((nf+1)/2) * W/nf * 0.29'" pd="'2*int((nf+1)/2) * (W/nf + 0.29)'" as="'int((nf+2)/2) * W/nf * 0.29'" ps="'2*int((nf+2)/2) * (W/nf + 0.29)'" nrd="'0.29 / W'" nrs="'0.29 / W'" sa=0 sb=0 sd=0 model=pfet_01v8 spiceprefix=X}
N 1100 1230 1100 1250 {}
N 1100 1250 1120 1250 {}
C {devices/lab_pin.sym} 1120 1250 0 0 {name=p43 sig_type=std_logic lab=n2}
N 1060 1200 1040 1200 {}
C {devices/lab_pin.sym} 1040 1200 2 0 {name=p44 sig_type=std_logic lab=nbp}
N 1100 1170 1100 1150 {}
N 1100 1150 1120 1150 {}
C {devices/lab_pin.sym} 1120 1150 0 0 {name=p45 sig_type=std_logic lab=VDD}
N 1100 1200 1120 1200 {}
C {devices/lab_pin.sym} 1120 1200 0 0 {name=p46 sig_type=std_logic lab=VDD}
T {3. LO BIAS AND SWITCHING QUAD} 0 1480 0 0 0.5 0.5 {layer=8}
C {devices/vsource.sym} 120 1600 0 0 {name=Vlocm value=1.1}
N 120 1570 120 1550 {}
N 120 1550 140 1550 {}
C {devices/lab_pin.sym} 140 1550 0 0 {name=p47 sig_type=std_logic lab=locm}
N 120 1630 120 1650 {}
N 120 1650 140 1650 {}
C {devices/lab_pin.sym} 140 1650 0 0 {name=p48 sig_type=std_logic lab=GND}
C {devices/res.sym} 440 1600 0 0 {name=Rl1 value=10k}
N 440 1570 440 1550 {}
N 440 1550 460 1550 {}
C {devices/lab_pin.sym} 460 1550 0 0 {name=p49 sig_type=std_logic lab=locm}
N 440 1630 440 1650 {}
N 440 1650 460 1650 {}
C {devices/lab_pin.sym} 460 1650 0 0 {name=p50 sig_type=std_logic lab=lpg}
C {devices/res.sym} 760 1600 0 0 {name=Rl2 value=10k}
N 760 1570 760 1550 {}
N 760 1550 780 1550 {}
C {devices/lab_pin.sym} 780 1550 0 0 {name=p51 sig_type=std_logic lab=locm}
N 760 1630 760 1650 {}
N 760 1650 780 1650 {}
C {devices/lab_pin.sym} 780 1650 0 0 {name=p52 sig_type=std_logic lab=lng}
C {devices/capa.sym} 1080 1600 0 0 {name=Cl1 value=5p}
N 1080 1570 1080 1550 {}
N 1080 1550 1100 1550 {}
C {devices/lab_pin.sym} 1100 1550 0 0 {name=p53 sig_type=std_logic lab=lop}
N 1080 1630 1080 1650 {}
N 1080 1650 1100 1650 {}
C {devices/lab_pin.sym} 1100 1650 0 0 {name=p54 sig_type=std_logic lab=lpg}
C {devices/capa.sym} 120 1800 0 0 {name=Cl2 value=5p}
N 120 1770 120 1750 {}
N 120 1750 140 1750 {}
C {devices/lab_pin.sym} 140 1750 0 0 {name=p55 sig_type=std_logic lab=lon}
N 120 1830 120 1850 {}
N 120 1850 140 1850 {}
C {devices/lab_pin.sym} 140 1850 0 0 {name=p56 sig_type=std_logic lab=lng}
C {sky130_fd_pr/nfet_01v8.sym} 440 1800 0 0 {name=M3 L=0.15 W=5 nf=4 mult=1 ad="'int((nf+1)/2) * W/nf * 0.29'" pd="'2*int((nf+1)/2) * (W/nf + 0.29)'" as="'int((nf+2)/2) * W/nf * 0.29'" ps="'2*int((nf+2)/2) * (W/nf + 0.29)'" nrd="'0.29 / W'" nrs="'0.29 / W'" sa=0 sb=0 sd=0 model=nfet_01v8 spiceprefix=X}
N 460 1770 460 1750 {}
N 460 1750 480 1750 {}
C {devices/lab_pin.sym} 480 1750 0 0 {name=p57 sig_type=std_logic lab=outp}
N 420 1800 400 1800 {}
C {devices/lab_pin.sym} 400 1800 2 0 {name=p58 sig_type=std_logic lab=lpg}
N 460 1830 460 1850 {}
N 460 1850 480 1850 {}
C {devices/lab_pin.sym} 480 1850 0 0 {name=p59 sig_type=std_logic lab=n1}
N 460 1800 480 1800 {}
C {devices/lab_pin.sym} 480 1800 0 0 {name=p60 sig_type=std_logic lab=GND}
C {sky130_fd_pr/nfet_01v8.sym} 760 1800 0 0 {name=M4 L=0.15 W=5 nf=4 mult=1 ad="'int((nf+1)/2) * W/nf * 0.29'" pd="'2*int((nf+1)/2) * (W/nf + 0.29)'" as="'int((nf+2)/2) * W/nf * 0.29'" ps="'2*int((nf+2)/2) * (W/nf + 0.29)'" nrd="'0.29 / W'" nrs="'0.29 / W'" sa=0 sb=0 sd=0 model=nfet_01v8 spiceprefix=X}
N 780 1770 780 1750 {}
N 780 1750 800 1750 {}
C {devices/lab_pin.sym} 800 1750 0 0 {name=p61 sig_type=std_logic lab=outn}
N 740 1800 720 1800 {}
C {devices/lab_pin.sym} 720 1800 2 0 {name=p62 sig_type=std_logic lab=lng}
N 780 1830 780 1850 {}
N 780 1850 800 1850 {}
C {devices/lab_pin.sym} 800 1850 0 0 {name=p63 sig_type=std_logic lab=n1}
N 780 1800 800 1800 {}
C {devices/lab_pin.sym} 800 1800 0 0 {name=p64 sig_type=std_logic lab=GND}
C {sky130_fd_pr/nfet_01v8.sym} 1080 1800 0 0 {name=M5 L=0.15 W=5 nf=4 mult=1 ad="'int((nf+1)/2) * W/nf * 0.29'" pd="'2*int((nf+1)/2) * (W/nf + 0.29)'" as="'int((nf+2)/2) * W/nf * 0.29'" ps="'2*int((nf+2)/2) * (W/nf + 0.29)'" nrd="'0.29 / W'" nrs="'0.29 / W'" sa=0 sb=0 sd=0 model=nfet_01v8 spiceprefix=X}
N 1100 1770 1100 1750 {}
N 1100 1750 1120 1750 {}
C {devices/lab_pin.sym} 1120 1750 0 0 {name=p65 sig_type=std_logic lab=outn}
N 1060 1800 1040 1800 {}
C {devices/lab_pin.sym} 1040 1800 2 0 {name=p66 sig_type=std_logic lab=lpg}
N 1100 1830 1100 1850 {}
N 1100 1850 1120 1850 {}
C {devices/lab_pin.sym} 1120 1850 0 0 {name=p67 sig_type=std_logic lab=n2}
N 1100 1800 1120 1800 {}
C {devices/lab_pin.sym} 1120 1800 0 0 {name=p68 sig_type=std_logic lab=GND}
C {sky130_fd_pr/nfet_01v8.sym} 120 2000 0 0 {name=M6 L=0.15 W=5 nf=4 mult=1 ad="'int((nf+1)/2) * W/nf * 0.29'" pd="'2*int((nf+1)/2) * (W/nf + 0.29)'" as="'int((nf+2)/2) * W/nf * 0.29'" ps="'2*int((nf+2)/2) * (W/nf + 0.29)'" nrd="'0.29 / W'" nrs="'0.29 / W'" sa=0 sb=0 sd=0 model=nfet_01v8 spiceprefix=X}
N 140 1970 140 1950 {}
N 140 1950 160 1950 {}
C {devices/lab_pin.sym} 160 1950 0 0 {name=p69 sig_type=std_logic lab=outp}
N 100 2000 80 2000 {}
C {devices/lab_pin.sym} 80 2000 2 0 {name=p70 sig_type=std_logic lab=lng}
N 140 2030 140 2050 {}
N 140 2050 160 2050 {}
C {devices/lab_pin.sym} 160 2050 0 0 {name=p71 sig_type=std_logic lab=n2}
N 140 2000 160 2000 {}
C {devices/lab_pin.sym} 160 2000 0 0 {name=p72 sig_type=std_logic lab=GND}
T {4. LOADS AND IF FILTER} 0 2280 0 0 0.5 0.5 {layer=8}
C {devices/res.sym} 120 2400 0 0 {name=RL1 value=700}
N 120 2370 120 2350 {}
N 120 2350 140 2350 {}
C {devices/lab_pin.sym} 140 2350 0 0 {name=p73 sig_type=std_logic lab=VDD}
N 120 2430 120 2450 {}
N 120 2450 140 2450 {}
C {devices/lab_pin.sym} 140 2450 0 0 {name=p74 sig_type=std_logic lab=outp}
C {devices/res.sym} 440 2400 0 0 {name=RL2 value=700}
N 440 2370 440 2350 {}
N 440 2350 460 2350 {}
C {devices/lab_pin.sym} 460 2350 0 0 {name=p75 sig_type=std_logic lab=VDD}
N 440 2430 440 2450 {}
N 440 2450 460 2450 {}
C {devices/lab_pin.sym} 460 2450 0 0 {name=p76 sig_type=std_logic lab=outn}
C {devices/capa.sym} 760 2400 0 0 {name=Cif value=2p}
N 760 2370 760 2350 {}
N 760 2350 780 2350 {}
C {devices/lab_pin.sym} 780 2350 0 0 {name=p77 sig_type=std_logic lab=outp}
N 760 2430 760 2450 {}
N 760 2450 780 2450 {}
C {devices/lab_pin.sym} 780 2450 0 0 {name=p78 sig_type=std_logic lab=outn}
C {devices/code_shown.sym} 1400 -100 0 0 {name=SPICE only_toplevel=false value=".lib $::SKYWATER_MODELS/sky130.lib.spice tt
.control
op
print v(nb) v(nbp) v(gp) v(n1) v(n2) v(outp) v(outn) v(lpg)
print -i(Vdd)
let il1=(1.8-v(outp))/700
let il2=(1.8-v(outn))/700
print il1 il2
.endc"}
