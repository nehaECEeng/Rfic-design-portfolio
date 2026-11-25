v {xschem version=3.4.5 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
T {3  Gilbert mixer, sky130, VDD 1.8 V: current-bleed PMOS, 2 mA gm, 1 mA switches} -420 -380 0 0 0.6 0.6 {}
C {devices/code_shown.sym} -420 -330 0 0 {name=MODELS only_toplevel=true format="tcleval( @value )" value=".lib $::env(SKYWATER_MODELS)/sky130.lib.spice tt"}
N 120 -300 220 -300 {lab=}
N 220 -300 610 -300 {lab=}
N 610 -300 1100 -300 {lab=}
C {devices/vdd.sym} 610 -300 0 0 {name=l1 lab=VDD}
C {sky130_fd_pr/nfet_01v8.sym} 200 0 0 0 {name=M3 L=0.15 W=10 nf=1 ad="'int((nf+1)/2) * W/nf * 0.29'" as="'int((nf+2)/2) * W/nf * 0.29'" pd="'2*int((nf+1)/2) * (W/nf + 0.29)'" ps="'2*int((nf+2)/2) * (W/nf + 0.29)'" nrd="'0.29 / W'" nrs="'0.29 / W'" sa=0 sb=0 sd=0 mult=1 m=1 model=nfet_01v8 spiceprefix=X hide_texts=true}
N 220 0 240 0 {lab=}
C {devices/gnd.sym} 240 0 0 0 {name=l2 lab=GND}
N 180 0 140 0 {lab=}
C {devices/lab_pin.sym} 140 0 0 0 {name=p3 sig_type=std_logic lab=g3}
T {M3  10/0.15} 250 -12 0 0 0.3 0.3 {}
C {sky130_fd_pr/nfet_01v8.sym} 460 0 0 0 {name=M4 L=0.15 W=10 nf=1 ad="'int((nf+1)/2) * W/nf * 0.29'" as="'int((nf+2)/2) * W/nf * 0.29'" pd="'2*int((nf+1)/2) * (W/nf + 0.29)'" ps="'2*int((nf+2)/2) * (W/nf + 0.29)'" nrd="'0.29 / W'" nrs="'0.29 / W'" sa=0 sb=0 sd=0 mult=1 m=1 model=nfet_01v8 spiceprefix=X hide_texts=true}
N 480 0 500 0 {lab=}
C {devices/gnd.sym} 500 0 0 0 {name=l4 lab=GND}
N 440 0 400 0 {lab=}
C {devices/lab_pin.sym} 400 0 0 0 {name=p5 sig_type=std_logic lab=g4}
T {M4  10/0.15} 510 -12 0 0 0.3 0.3 {}
C {sky130_fd_pr/nfet_01v8.sym} 720 0 0 0 {name=M5 L=0.15 W=10 nf=1 ad="'int((nf+1)/2) * W/nf * 0.29'" as="'int((nf+2)/2) * W/nf * 0.29'" pd="'2*int((nf+1)/2) * (W/nf + 0.29)'" ps="'2*int((nf+2)/2) * (W/nf + 0.29)'" nrd="'0.29 / W'" nrs="'0.29 / W'" sa=0 sb=0 sd=0 mult=1 m=1 model=nfet_01v8 spiceprefix=X hide_texts=true}
N 740 0 760 0 {lab=}
C {devices/gnd.sym} 760 0 0 0 {name=l6 lab=GND}
N 700 0 660 0 {lab=}
C {devices/lab_pin.sym} 660 0 0 0 {name=p7 sig_type=std_logic lab=g5}
T {M5  10/0.15} 770 -12 0 0 0.3 0.3 {}
C {sky130_fd_pr/nfet_01v8.sym} 980 0 0 0 {name=M6 L=0.15 W=10 nf=1 ad="'int((nf+1)/2) * W/nf * 0.29'" as="'int((nf+2)/2) * W/nf * 0.29'" pd="'2*int((nf+1)/2) * (W/nf + 0.29)'" ps="'2*int((nf+2)/2) * (W/nf + 0.29)'" nrd="'0.29 / W'" nrs="'0.29 / W'" sa=0 sb=0 sd=0 mult=1 m=1 model=nfet_01v8 spiceprefix=X hide_texts=true}
N 1000 0 1020 0 {lab=}
C {devices/gnd.sym} 1020 0 0 0 {name=l8 lab=GND}
N 960 0 920 0 {lab=}
C {devices/lab_pin.sym} 920 0 0 0 {name=p9 sig_type=std_logic lab=g6}
T {M6  10/0.15} 1030 -12 0 0 0.3 0.3 {}
N 120 60 180 60 {lab=}
N 180 60 220 60 {lab=}
N 220 30 220 60 {lab=}
N 220 60 350 60 {lab=}
N 350 60 480 60 {lab=}
N 480 60 480 30 {lab=}
N 180 60 180 100 {lab=}
C {devices/lab_pin.sym} 180 100 0 0 {name=p10 sig_type=std_logic lab=n1}
N 740 30 740 60 {lab=}
N 740 60 870 60 {lab=}
N 870 60 940 60 {lab=}
N 940 60 1000 60 {lab=}
N 1000 30 1000 60 {lab=}
N 1000 60 1100 60 {lab=}
N 940 60 940 100 {lab=}
C {devices/lab_pin.sym} 940 100 0 0 {name=p11 sig_type=std_logic lab=n2}
N 220 -30 220 -70 {lab=}
N 220 -70 220 -100 {lab=}
N 220 -70 170 -70 {lab=}
C {devices/lab_pin.sym} 170 -70 0 0 {name=p12 sig_type=std_logic lab=outn}
N 1000 -30 1000 -70 {lab=}
N 1000 -70 1050 -70 {lab=}
C {devices/lab_pin.sym} 1050 -70 0 0 {name=p13 sig_type=std_logic lab=outn}
C {devices/res.sym} 220 -130 0 0 {name=Rload2 value=500 footprint=1206 device=resistor m=1 hide_texts=true}
N 220 -160 220 -300 {lab=}
T {Rload2 500} 235 -136 0 0 0.3 0.3 {}
N 480 -30 480 -120 {lab=}
N 480 -120 610 -120 {lab=}
N 610 -120 740 -120 {lab=}
N 740 -120 740 -30 {lab=}
N 610 -120 610 -90 {lab=}
C {devices/lab_pin.sym} 610 -90 0 0 {name=p14 sig_type=std_logic lab=outp}
C {devices/res.sym} 610 -210 0 0 {name=Rload1 value=500 footprint=1206 device=resistor m=1 hide_texts=true}
N 610 -180 610 -120 {lab=}
N 610 -240 610 -300 {lab=}
T {Rload1 500} 625 -216 0 0 0.3 0.3 {}
C {sky130_fd_pr/pfet_01v8.sym} 100 30 2 1 {name=MP1 L=0.5 W=4 nf=1 ad="'int((nf+1)/2) * W/nf * 0.29'" as="'int((nf+2)/2) * W/nf * 0.29'" pd="'2*int((nf+1)/2) * (W/nf + 0.29)'" ps="'2*int((nf+2)/2) * (W/nf + 0.29)'" nrd="'0.29 / W'" nrs="'0.29 / W'" sa=0 sb=0 sd=0 mult=8 m=8 model=pfet_01v8 spiceprefix=X hide_texts=true}
N 120 0 120 -300 {lab=}
N 120 30 140 30 {lab=}
C {devices/vdd.sym} 140 30 0 0 {name=l15 lab=VDD}
N 80 30 60 30 {lab=}
C {devices/lab_pin.sym} 60 30 0 0 {name=p16 sig_type=std_logic lab=nbp}
T {MP1 4/0.5 x8} 30 -30 0 0 0.3 0.3 {}
C {sky130_fd_pr/pfet_01v8.sym} 1080 30 2 1 {name=MP2 L=0.5 W=4 nf=1 ad="'int((nf+1)/2) * W/nf * 0.29'" as="'int((nf+2)/2) * W/nf * 0.29'" pd="'2*int((nf+1)/2) * (W/nf + 0.29)'" ps="'2*int((nf+2)/2) * (W/nf + 0.29)'" nrd="'0.29 / W'" nrs="'0.29 / W'" sa=0 sb=0 sd=0 mult=8 m=8 model=pfet_01v8 spiceprefix=X hide_texts=true}
N 1100 0 1100 -300 {lab=}
N 1100 30 1120 30 {lab=}
C {devices/vdd.sym} 1120 30 0 0 {name=l17 lab=VDD}
N 1060 30 1040 30 {lab=}
C {devices/lab_pin.sym} 1040 30 0 0 {name=p18 sig_type=std_logic lab=nbp}
T {MP2 4/0.5 x8} 1130 -30 0 0 0.3 0.3 {}
C {sky130_fd_pr/nfet_01v8.sym} 330 170 0 0 {name=M1 L=0.15 W=4 nf=1 ad="'int((nf+1)/2) * W/nf * 0.29'" as="'int((nf+2)/2) * W/nf * 0.29'" pd="'2*int((nf+1)/2) * (W/nf + 0.29)'" ps="'2*int((nf+2)/2) * (W/nf + 0.29)'" nrd="'0.29 / W'" nrs="'0.29 / W'" sa=0 sb=0 sd=0 mult=10 m=10 model=nfet_01v8 spiceprefix=X hide_texts=true}
N 350 140 350 60 {lab=}
N 350 200 350 220 {lab=}
N 350 170 370 170 {lab=}
N 370 170 370 220 {lab=}
N 370 220 350 220 {lab=}
C {devices/gnd.sym} 350 220 0 0 {name=l19 lab=GND}
T {M1 4/0.15 x10} 390 130 0 0 0.3 0.3 {}
N 310 170 290 170 {lab=}
N 290 170 290 220 {lab=}
N 290 220 220 220 {lab=}
N 290 220 290 250 {lab=}
C {devices/res.sym} 220 250 0 0 {name=Rbg1 value=10k footprint=1206 device=resistor m=1 hide_texts=true}
N 220 280 220 310 {lab=}
C {devices/lab_pin.sym} 220 310 0 0 {name=p20 sig_type=std_logic lab=nb}
C {devices/capa.sym} 290 280 0 0 {name=Cc1 value=2p m=1 footprint=1206 device="ceramic capacitor" hide_texts=true}
N 290 310 290 340 {lab=}
C {devices/lab_pin.sym} 290 340 0 0 {name=p21 sig_type=std_logic lab=rfp}
T {Rbg1 10k} 150 245 0 0 0.3 0.3 {}
T {Cc1 2p} 305 275 0 0 0.3 0.3 {}
C {sky130_fd_pr/nfet_01v8.sym} 850 170 0 0 {name=M2 L=0.15 W=4 nf=1 ad="'int((nf+1)/2) * W/nf * 0.29'" as="'int((nf+2)/2) * W/nf * 0.29'" pd="'2*int((nf+1)/2) * (W/nf + 0.29)'" ps="'2*int((nf+2)/2) * (W/nf + 0.29)'" nrd="'0.29 / W'" nrs="'0.29 / W'" sa=0 sb=0 sd=0 mult=10 m=10 model=nfet_01v8 spiceprefix=X hide_texts=true}
N 870 140 870 60 {lab=}
N 870 200 870 220 {lab=}
N 870 170 890 170 {lab=}
N 890 170 890 220 {lab=}
N 890 220 870 220 {lab=}
C {devices/gnd.sym} 870 220 0 0 {name=l22 lab=GND}
T {M2 4/0.15 x10} 910 130 0 0 0.3 0.3 {}
N 830 170 810 170 {lab=}
N 810 170 810 220 {lab=}
N 810 220 740 220 {lab=}
N 810 220 810 250 {lab=}
C {devices/res.sym} 740 250 0 0 {name=Rbg2 value=10k footprint=1206 device=resistor m=1 hide_texts=true}
N 740 280 740 310 {lab=}
C {devices/lab_pin.sym} 740 310 0 0 {name=p23 sig_type=std_logic lab=nb}
C {devices/capa.sym} 810 280 0 0 {name=Cc2 value=2p m=1 footprint=1206 device="ceramic capacitor" hide_texts=true}
N 810 310 810 340 {lab=}
C {devices/lab_pin.sym} 810 340 0 0 {name=p24 sig_type=std_logic lab=rfn}
T {Rbg2 10k} 670 245 0 0 0.3 0.3 {}
T {Cc2 2p} 825 275 0 0 0.3 0.3 {}
T {LO bias + coupling for the switch gates (Rlo to vlocm, Clo from LO)} 60 420 0 0 0.4 0.4 {}
C {devices/res.sym} 50 540 0 0 {name=Rlo3 value=10k footprint=1206 device=resistor m=1 hide_texts=true}
C {devices/capa.sym} 150 540 0 0 {name=Clo3 value=2p m=1 footprint=1206 device="ceramic capacitor" hide_texts=true}
N 50 570 100 570 {lab=}
N 100 570 150 570 {lab=}
N 100 570 100 600 {lab=}
C {devices/lab_pin.sym} 100 600 0 0 {name=p25 sig_type=std_logic lab=g3}
N 50 510 50 480 {lab=}
C {devices/lab_pin.sym} 50 480 0 0 {name=p26 sig_type=std_logic lab=vlocm}
N 150 510 150 480 {lab=}
C {devices/lab_pin.sym} 150 480 0 0 {name=p27 sig_type=std_logic lab=lo_p}
T {Rlo3 10k} 0 535 0 0 0.3 0.3 {}
T {Clo3 2p} 162 535 0 0 0.3 0.3 {}
C {devices/res.sym} 280 540 0 0 {name=Rlo4 value=10k footprint=1206 device=resistor m=1 hide_texts=true}
C {devices/capa.sym} 380 540 0 0 {name=Clo4 value=2p m=1 footprint=1206 device="ceramic capacitor" hide_texts=true}
N 280 570 330 570 {lab=}
N 330 570 380 570 {lab=}
N 330 570 330 600 {lab=}
C {devices/lab_pin.sym} 330 600 0 0 {name=p28 sig_type=std_logic lab=g4}
N 280 510 280 480 {lab=}
C {devices/lab_pin.sym} 280 480 0 0 {name=p29 sig_type=std_logic lab=vlocm}
N 380 510 380 480 {lab=}
C {devices/lab_pin.sym} 380 480 0 0 {name=p30 sig_type=std_logic lab=lo_n}
T {Rlo4 10k} 230 535 0 0 0.3 0.3 {}
T {Clo4 2p} 392 535 0 0 0.3 0.3 {}
C {devices/res.sym} 510 540 0 0 {name=Rlo5 value=10k footprint=1206 device=resistor m=1 hide_texts=true}
C {devices/capa.sym} 610 540 0 0 {name=Clo5 value=2p m=1 footprint=1206 device="ceramic capacitor" hide_texts=true}
N 510 570 560 570 {lab=}
N 560 570 610 570 {lab=}
N 560 570 560 600 {lab=}
C {devices/lab_pin.sym} 560 600 0 0 {name=p31 sig_type=std_logic lab=g5}
N 510 510 510 480 {lab=}
C {devices/lab_pin.sym} 510 480 0 0 {name=p32 sig_type=std_logic lab=vlocm}
N 610 510 610 480 {lab=}
C {devices/lab_pin.sym} 610 480 0 0 {name=p33 sig_type=std_logic lab=lo_p}
T {Rlo5 10k} 460 535 0 0 0.3 0.3 {}
T {Clo5 2p} 622 535 0 0 0.3 0.3 {}
C {devices/res.sym} 740 540 0 0 {name=Rlo6 value=10k footprint=1206 device=resistor m=1 hide_texts=true}
C {devices/capa.sym} 840 540 0 0 {name=Clo6 value=2p m=1 footprint=1206 device="ceramic capacitor" hide_texts=true}
N 740 570 790 570 {lab=}
N 790 570 840 570 {lab=}
N 790 570 790 600 {lab=}
C {devices/lab_pin.sym} 790 600 0 0 {name=p34 sig_type=std_logic lab=g6}
N 740 510 740 480 {lab=}
C {devices/lab_pin.sym} 740 480 0 0 {name=p35 sig_type=std_logic lab=vlocm}
N 840 510 840 480 {lab=}
C {devices/lab_pin.sym} 840 480 0 0 {name=p36 sig_type=std_logic lab=lo_n}
T {Rlo6 10k} 690 535 0 0 0.3 0.3 {}
T {Clo6 2p} 852 535 0 0 0.3 0.3 {}
T {gm bias (sheet 1)} -460 -110 0 0 0.4 0.4 {}
C {devices/isource.sym} -300 0 0 0 {name=Iref value=250u hide_texts=true}
N -300 -30 -300 -60 {lab=}
C {devices/vdd.sym} -300 -60 0 0 {name=l37 lab=VDD}
N -300 30 -300 90 {lab=}
N -360 90 -300 90 {lab=}
N -360 90 -420 90 {lab=}
C {devices/lab_pin.sym} -420 90 0 0 {name=p38 sig_type=std_logic lab=nb}
C {sky130_fd_pr/nfet_01v8.sym} -320 120 0 0 {name=Mb L=0.15 W=4 nf=1 ad="'int((nf+1)/2) * W/nf * 0.29'" as="'int((nf+2)/2) * W/nf * 0.29'" pd="'2*int((nf+1)/2) * (W/nf + 0.29)'" ps="'2*int((nf+2)/2) * (W/nf + 0.29)'" nrd="'0.29 / W'" nrs="'0.29 / W'" sa=0 sb=0 sd=0 mult=1 m=1 model=nfet_01v8 spiceprefix=X hide_texts=true}
N -340 120 -360 120 {lab=}
N -360 120 -360 90 {lab=}
N -300 150 -300 170 {lab=}
N -300 120 -280 120 {lab=}
N -280 120 -280 170 {lab=}
N -280 170 -300 170 {lab=}
C {devices/gnd.sym} -300 170 0 0 {name=l39 lab=GND}
T {Mb 4/0.15} -250 90 0 0 0.3 0.3 {}
T {Iref 250u} -270 -5 0 0 0.3 0.3 {}
T {bleed bias (sheet 2)} -460 300 0 0 0.4 0.4 {}
C {sky130_fd_pr/pfet_01v8.sym} -320 420 2 1 {name=MPb L=0.5 W=4 nf=1 ad="'int((nf+1)/2) * W/nf * 0.29'" as="'int((nf+2)/2) * W/nf * 0.29'" pd="'2*int((nf+1)/2) * (W/nf + 0.29)'" ps="'2*int((nf+2)/2) * (W/nf + 0.29)'" nrd="'0.29 / W'" nrs="'0.29 / W'" sa=0 sb=0 sd=0 mult=1 m=1 model=pfet_01v8 spiceprefix=X hide_texts=true}
N -300 390 -300 370 {lab=}
C {devices/vdd.sym} -300 370 0 0 {name=l40 lab=VDD}
N -300 420 -280 420 {lab=}
N -280 420 -280 370 {lab=}
N -280 370 -300 370 {lab=}
N -340 420 -360 420 {lab=}
N -360 420 -360 450 {lab=}
N -360 450 -300 450 {lab=}
N -360 450 -420 450 {lab=}
C {devices/lab_pin.sym} -420 450 0 0 {name=p41 sig_type=std_logic lab=nbp}
N -300 450 -300 480 {lab=}
C {devices/isource.sym} -300 510 0 0 {name=Ibp value=125u hide_texts=true}
N -300 540 -300 560 {lab=}
C {devices/gnd.sym} -300 560 0 0 {name=l42 lab=GND}
T {MPb 4/0.5} -250 420 0 0 0.3 0.3 {}
T {Ibp 125u} -270 505 0 0 0.3 0.3 {}
T {test sources (all 0 for the DC check)} 1250 -190 0 0 0.4 0.4 {}
N 1300 -30 1300 -60 {lab=}
C {devices/vdd.sym} 1300 -60 0 0 {name=l43 lab=VDD}
C {devices/vsource.sym} 1300 0 0 0 {name=Vdd value=1.8 hide_texts=true}
N 1300 30 1300 60 {lab=}
C {devices/gnd.sym} 1300 60 0 0 {name=l44 lab=GND}
T {Vdd 1.8} 1315 -6 0 0 0.3 0.3 {}
C {devices/vsource.sym} 1430 0 0 0 {name=Vlocm value=1.4 hide_texts=true}
N 1430 -30 1430 -60 {lab=}
C {devices/lab_pin.sym} 1430 -60 0 0 {name=p45 sig_type=std_logic lab=vlocm}
N 1430 30 1430 60 {lab=}
C {devices/gnd.sym} 1430 60 0 0 {name=l46 lab=GND}
T {Vlocm 1.4} 1445 -6 0 0 0.3 0.3 {}
C {devices/vsource.sym} 1560 0 0 0 {name=Vrfp value=0 hide_texts=true}
N 1560 -30 1560 -60 {lab=}
C {devices/lab_pin.sym} 1560 -60 0 0 {name=p47 sig_type=std_logic lab=rfp}
N 1560 30 1560 60 {lab=}
C {devices/gnd.sym} 1560 60 0 0 {name=l48 lab=GND}
T {Vrfp 0} 1575 -6 0 0 0.3 0.3 {}
C {devices/vsource.sym} 1690 0 0 0 {name=Vrfn value=0 hide_texts=true}
N 1690 -30 1690 -60 {lab=}
C {devices/lab_pin.sym} 1690 -60 0 0 {name=p49 sig_type=std_logic lab=rfn}
N 1690 30 1690 60 {lab=}
C {devices/gnd.sym} 1690 60 0 0 {name=l50 lab=GND}
T {Vrfn 0} 1705 -6 0 0 0.3 0.3 {}
C {devices/vsource.sym} 1820 0 0 0 {name=Vlop value=0 hide_texts=true}
N 1820 -30 1820 -60 {lab=}
C {devices/lab_pin.sym} 1820 -60 0 0 {name=p51 sig_type=std_logic lab=lo_p}
N 1820 30 1820 60 {lab=}
C {devices/gnd.sym} 1820 60 0 0 {name=l52 lab=GND}
T {Vlop 0} 1835 -6 0 0 0.3 0.3 {}
C {devices/vsource.sym} 1950 0 0 0 {name=Vlon value=0 hide_texts=true}
N 1950 -30 1950 -60 {lab=}
C {devices/lab_pin.sym} 1950 -60 0 0 {name=p53 sig_type=std_logic lab=lo_n}
N 1950 30 1950 60 {lab=}
C {devices/gnd.sym} 1950 60 0 0 {name=l54 lab=GND}
T {Vlon 0} 1965 -6 0 0 0.3 0.3 {}
C {devices/code_shown.sym} 1250 160 0 0 {name=SIM only_toplevel=false value=".op
.control
op
print v(nb) v(nbp) v(n1) v(n2) v(outp) v(outn) v(g3)
print i(Vdd)
let il1 = (v(vdd)-v(outp))/500
let il2 = (v(vdd)-v(outn))/500
print il1 il2
.endc"}
T {Expect: i(Vdd) about -4.5m, il1 = il2 about 1.05m, outp = outn about 1.27 V\nn1 = n2 about 0.5 V, g3 = 1.4 V} 1250 330 0 0 0.3 0.3 {}
T {IF low-pass filter (2p each side, ~160 MHz) + differential load} 1250 430 0 0 0.4 0.4 {}
C {devices/capa.sym} 1350 540 0 0 {name=Cl1 value=2p m=1 footprint=1206 device="ceramic capacitor" hide_texts=true}
N 1350 510 1350 480 {lab=}
C {devices/lab_pin.sym} 1350 480 0 0 {name=p55 sig_type=std_logic lab=outp}
N 1350 570 1350 600 {lab=}
C {devices/gnd.sym} 1350 600 0 0 {name=l56 lab=GND}
T {Cl1 2p} 1365 534 0 0 0.3 0.3 {}
C {devices/capa.sym} 1470 540 0 0 {name=Cl2 value=2p m=1 footprint=1206 device="ceramic capacitor" hide_texts=true}
N 1470 510 1470 480 {lab=}
C {devices/lab_pin.sym} 1470 480 0 0 {name=p57 sig_type=std_logic lab=outn}
N 1470 570 1470 600 {lab=}
C {devices/gnd.sym} 1470 600 0 0 {name=l58 lab=GND}
T {Cl2 2p} 1485 534 0 0 0.3 0.3 {}
C {devices/res.sym} 1590 540 0 0 {name=Rext value=20k footprint=1206 device=resistor m=1 hide_texts=true}
N 1590 510 1590 480 {lab=}
C {devices/lab_pin.sym} 1590 480 0 0 {name=p59 sig_type=std_logic lab=outp}
N 1590 570 1590 600 {lab=}
C {devices/lab_pin.sym} 1590 600 0 0 {name=p60 sig_type=std_logic lab=outn}
T {Rext 20k} 1605 534 0 0 0.3 0.3 {}
