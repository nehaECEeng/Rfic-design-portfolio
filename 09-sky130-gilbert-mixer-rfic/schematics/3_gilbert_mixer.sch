v {xschem version=3.4.5 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
C {devices/code_shown.sym} 1250 -250 0 0 {name=MODELS only_toplevel=true format="tcleval( @value )" value=".lib $::SKYWATER_MODELS/sky130.lib.spice tt"}
C {sky130_fd_pr/nfet_01v8.sym} 300 0 0 1 {name=M3 L=0.15 W=10 nf=1 ad="'int((nf+1)/2) * W/nf * 0.29'" as="'int((nf+2)/2) * W/nf * 0.29'" pd="'2*int((nf+1)/2) * (W/nf + 0.29)'" ps="'2*int((nf+2)/2) * (W/nf + 0.29)'" nrd="'0.29 / W'" nrs="'0.29 / W'" sa=0 sb=0 sd=0 mult=1 m=1 model=nfet_01v8 spiceprefix=X hide_texts=true}
C {sky130_fd_pr/nfet_01v8.sym} 500 0 0 0 {name=M5 L=0.15 W=10 nf=1 ad="'int((nf+1)/2) * W/nf * 0.29'" as="'int((nf+2)/2) * W/nf * 0.29'" pd="'2*int((nf+1)/2) * (W/nf + 0.29)'" ps="'2*int((nf+2)/2) * (W/nf + 0.29)'" nrd="'0.29 / W'" nrs="'0.29 / W'" sa=0 sb=0 sd=0 mult=1 m=1 model=nfet_01v8 spiceprefix=X hide_texts=true}
C {sky130_fd_pr/nfet_01v8.sym} 700 0 0 1 {name=M4 L=0.15 W=10 nf=1 ad="'int((nf+1)/2) * W/nf * 0.29'" as="'int((nf+2)/2) * W/nf * 0.29'" pd="'2*int((nf+1)/2) * (W/nf + 0.29)'" ps="'2*int((nf+2)/2) * (W/nf + 0.29)'" nrd="'0.29 / W'" nrs="'0.29 / W'" sa=0 sb=0 sd=0 mult=1 m=1 model=nfet_01v8 spiceprefix=X hide_texts=true}
C {sky130_fd_pr/nfet_01v8.sym} 900 0 0 0 {name=M6 L=0.15 W=10 nf=1 ad="'int((nf+1)/2) * W/nf * 0.29'" as="'int((nf+2)/2) * W/nf * 0.29'" pd="'2*int((nf+1)/2) * (W/nf + 0.29)'" ps="'2*int((nf+2)/2) * (W/nf + 0.29)'" nrd="'0.29 / W'" nrs="'0.29 / W'" sa=0 sb=0 sd=0 mult=1 m=1 model=nfet_01v8 spiceprefix=X hide_texts=true}
N 280 0 260 0 {lab=}
C {devices/gnd.sym} 260 0 0 0 {name=l1 lab=GND}
N 520 0 540 0 {lab=}
C {devices/gnd.sym} 540 0 0 0 {name=l2 lab=GND}
N 680 0 660 0 {lab=}
C {devices/gnd.sym} 660 0 0 0 {name=l3 lab=GND}
N 920 0 940 0 {lab=}
C {devices/gnd.sym} 940 0 0 0 {name=l4 lab=GND}
N 320 0 400 0 {lab=}
N 400 0 480 0 {lab=}
N 720 0 800 0 {lab=}
N 800 0 880 0 {lab=}
N 400 0 400 -300 {lab=}
N 400 -300 400 -330 {lab=}
N 400 -300 440 -300 {lab=}
N 440 -300 440 -330 {lab=}
C {devices/capa.sym} 400 -360 0 0 {name=Clop value=4p m=1 footprint=1206 device="ceramic capacitor" hide_texts=true}
C {devices/res.sym} 440 -360 0 0 {name=Rlop value=5k footprint=1206 device=resistor m=1 hide_texts=true}
N 800 0 800 -300 {lab=}
N 800 -300 800 -330 {lab=}
N 800 -300 760 -300 {lab=}
N 760 -300 760 -330 {lab=}
C {devices/capa.sym} 800 -360 0 0 {name=Clon value=4p m=1 footprint=1206 device="ceramic capacitor" hide_texts=true}
C {devices/res.sym} 760 -360 0 0 {name=Rlon value=5k footprint=1206 device=resistor m=1 hide_texts=true}
N 400 -390 400 -420 {lab=}
N 440 -390 440 -420 {lab=}
N 760 -390 760 -420 {lab=}
N 800 -390 800 -420 {lab=}
N 300 -420 400 -420 {lab=}
N 440 -420 600 -420 {lab=}
N 600 -420 760 -420 {lab=}
N 800 -420 900 -420 {lab=}
C {devices/vsource.sym} 300 -360 0 0 {name=Vlop value=0 hide_texts=true}
N 300 -390 300 -420 {lab=}
C {devices/gnd.sym} 300 -330 0 0 {name=l5 lab=GND}
C {devices/vsource.sym} 600 -360 0 0 {name=Vlocm value=1.4 hide_texts=true}
N 600 -390 600 -420 {lab=}
C {devices/gnd.sym} 600 -330 0 0 {name=l6 lab=GND}
C {devices/vsource.sym} 900 -360 0 0 {name=Vlon value=0 hide_texts=true}
N 900 -390 900 -420 {lab=}
C {devices/gnd.sym} 900 -330 0 0 {name=l7 lab=GND}
N 280 -30 280 -60 {lab=}
N 280 -60 280 -100 {lab=}
N 280 -100 280 -260 {lab=}
N 280 -60 250 -60 {lab=}
C {devices/lab_pin.sym} 250 -60 0 0 {name=p8 sig_type=std_logic lab=outn}
C {devices/res.sym} 220 -150 0 0 {name=Rload2 value=500 footprint=1206 device=resistor m=1 hide_texts=true}
C {devices/vdd.sym} 220 -180 0 0 {name=l9 lab=VDD}
N 220 -120 220 -100 {lab=}
N 220 -100 280 -100 {lab=}
N 280 -260 740 -260 {lab=}
N 740 -260 840 -260 {lab=}
N 840 -260 920 -260 {lab=}
N 920 -260 920 -30 {lab=}
N 520 -30 520 -100 {lab=}
N 520 -100 570 -100 {lab=}
N 570 -100 600 -100 {lab=}
N 600 -100 630 -100 {lab=}
N 630 -100 680 -100 {lab=}
N 680 -100 740 -100 {lab=}
N 680 -30 680 -100 {lab=}
N 600 -100 600 -70 {lab=}
C {devices/lab_pin.sym} 600 -70 0 0 {name=p10 sig_type=std_logic lab=outp}
C {devices/res.sym} 570 -170 0 0 {name=Rload1 value=500 footprint=1206 device=resistor m=1 hide_texts=true}
C {devices/vdd.sym} 570 -200 0 0 {name=l11 lab=VDD}
N 570 -140 570 -100 {lab=}
C {devices/capa.sym} 630 -170 0 0 {name=Cl1 value=2p m=1 footprint=1206 device="ceramic capacitor" hide_texts=true}
C {devices/gnd.sym} 630 -200 2 0 {name=l12 lab=GND}
N 630 -140 630 -100 {lab=}
C {devices/res.sym} 740 -200 0 0 {name=Rext value=20k footprint=1206 device=resistor m=1 hide_texts=true}
N 740 -230 740 -260 {lab=}
N 740 -170 740 -100 {lab=}
C {devices/capa.sym} 840 -230 0 0 {name=Cl2 value=2p m=1 footprint=1206 device="ceramic capacitor" hide_texts=true}
C {devices/gnd.sym} 840 -200 0 0 {name=l13 lab=GND}
C {sky130_fd_pr/pfet_01v8.sym} 60 30 2 1 {name=MP1 L=0.5 W=4 nf=1 ad="'int((nf+1)/2) * W/nf * 0.29'" as="'int((nf+2)/2) * W/nf * 0.29'" pd="'2*int((nf+1)/2) * (W/nf + 0.29)'" ps="'2*int((nf+2)/2) * (W/nf + 0.29)'" nrd="'0.29 / W'" nrs="'0.29 / W'" sa=0 sb=0 sd=0 mult=8 m=8 model=pfet_01v8 spiceprefix=X hide_texts=true}
N 80 0 80 -30 {lab=}
C {devices/vdd.sym} 80 -30 0 0 {name=l14 lab=VDD}
N 80 30 100 30 {lab=}
C {devices/vdd.sym} 100 30 0 0 {name=l15 lab=VDD}
N 40 30 20 30 {lab=}
N 20 30 20 620 {lab=}
C {sky130_fd_pr/pfet_01v8.sym} 1060 60 2 0 {name=MP2 L=0.5 W=4 nf=1 ad="'int((nf+1)/2) * W/nf * 0.29'" as="'int((nf+2)/2) * W/nf * 0.29'" pd="'2*int((nf+1)/2) * (W/nf + 0.29)'" ps="'2*int((nf+2)/2) * (W/nf + 0.29)'" nrd="'0.29 / W'" nrs="'0.29 / W'" sa=0 sb=0 sd=0 mult=8 m=8 model=pfet_01v8 spiceprefix=X hide_texts=true}
N 1040 30 1040 0 {lab=}
C {devices/vdd.sym} 1040 0 0 0 {name=l16 lab=VDD}
N 1040 60 1020 60 {lab=}
C {devices/vdd.sym} 1020 60 0 0 {name=l17 lab=VDD}
N 1080 60 1100 60 {lab=}
N 1100 60 1100 620 {lab=}
N 80 60 280 60 {lab=}
N 280 30 280 60 {lab=}
N 280 60 350 60 {lab=}
N 350 60 450 60 {lab=}
N 450 60 680 60 {lab=}
N 680 30 680 60 {lab=}
N 450 60 450 100 {lab=}
C {devices/lab_pin.sym} 450 100 0 0 {name=p18 sig_type=std_logic lab=n1}
N 520 30 520 90 {lab=}
N 520 90 800 90 {lab=}
N 800 90 860 90 {lab=}
N 860 90 920 90 {lab=}
N 920 90 1040 90 {lab=}
N 920 30 920 90 {lab=}
N 860 90 860 130 {lab=}
C {devices/lab_pin.sym} 860 130 0 0 {name=p19 sig_type=std_logic lab=n2}
C {sky130_fd_pr/nfet_01v8.sym} 330 180 0 0 {name=M1 L=0.15 W=4 nf=1 ad="'int((nf+1)/2) * W/nf * 0.29'" as="'int((nf+2)/2) * W/nf * 0.29'" pd="'2*int((nf+1)/2) * (W/nf + 0.29)'" ps="'2*int((nf+2)/2) * (W/nf + 0.29)'" nrd="'0.29 / W'" nrs="'0.29 / W'" sa=0 sb=0 sd=0 mult=20 m=20 model=nfet_01v8 spiceprefix=X hide_texts=true}
N 350 150 350 60 {lab=}
N 350 210 350 230 {lab=}
N 350 180 370 180 {lab=}
N 370 180 370 230 {lab=}
N 370 230 350 230 {lab=}
C {devices/gnd.sym} 350 230 0 0 {name=l20 lab=GND}
N 310 180 290 180 {lab=}
N 290 180 290 215 {lab=}
N 290 215 290 250 {lab=}
N 290 215 250 215 {lab=}
C {devices/res.sym} 250 245 0 0 {name=Rbg1 value=10k footprint=1206 device=resistor m=1 hide_texts=true}
N 250 275 250 420 {lab=}
C {devices/capa.sym} 290 280 0 0 {name=Cc1 value=2p m=1 footprint=1206 device="ceramic capacitor" hide_texts=true}
C {devices/vsource.sym} 290 340 0 0 {name=Vrfp value=0 hide_texts=true}
C {devices/gnd.sym} 290 370 0 0 {name=l21 lab=GND}
C {sky130_fd_pr/nfet_01v8.sym} 780 180 0 0 {name=M2 L=0.15 W=4 nf=1 ad="'int((nf+1)/2) * W/nf * 0.29'" as="'int((nf+2)/2) * W/nf * 0.29'" pd="'2*int((nf+1)/2) * (W/nf + 0.29)'" ps="'2*int((nf+2)/2) * (W/nf + 0.29)'" nrd="'0.29 / W'" nrs="'0.29 / W'" sa=0 sb=0 sd=0 mult=20 m=20 model=nfet_01v8 spiceprefix=X hide_texts=true}
N 800 150 800 90 {lab=}
N 800 210 800 230 {lab=}
N 800 180 820 180 {lab=}
N 820 180 820 230 {lab=}
N 820 230 800 230 {lab=}
C {devices/gnd.sym} 800 230 0 0 {name=l22 lab=GND}
N 760 180 740 180 {lab=}
N 740 180 740 215 {lab=}
N 740 215 740 250 {lab=}
N 740 215 700 215 {lab=}
C {devices/res.sym} 700 245 0 0 {name=Rbg2 value=10k footprint=1206 device=resistor m=1 hide_texts=true}
N 700 275 700 420 {lab=}
C {devices/capa.sym} 740 280 0 0 {name=Cc2 value=2p m=1 footprint=1206 device="ceramic capacitor" hide_texts=true}
C {devices/vsource.sym} 740 340 0 0 {name=Vrfn value=0 hide_texts=true}
C {devices/gnd.sym} 740 370 0 0 {name=l23 lab=GND}
N 250 420 350 420 {lab=}
N 350 420 420 420 {lab=}
N 420 420 480 420 {lab=}
N 480 420 700 420 {lab=}
N 350 420 350 390 {lab=}
C {devices/lab_pin.sym} 350 390 0 0 {name=p24 sig_type=std_logic lab=nb}
C {devices/isource.sym} 480 360 0 0 {name=Iref value=250u hide_texts=true}
C {devices/vdd.sym} 480 330 0 0 {name=l25 lab=VDD}
N 480 390 480 420 {lab=}
C {sky130_fd_pr/nfet_01v8.sym} 400 480 0 0 {name=Mb L=0.15 W=4 nf=1 ad="'int((nf+1)/2) * W/nf * 0.29'" as="'int((nf+2)/2) * W/nf * 0.29'" pd="'2*int((nf+1)/2) * (W/nf + 0.29)'" ps="'2*int((nf+2)/2) * (W/nf + 0.29)'" nrd="'0.29 / W'" nrs="'0.29 / W'" sa=0 sb=0 sd=0 mult=2 m=2 model=nfet_01v8 spiceprefix=X hide_texts=true}
N 380 480 360 480 {lab=}
N 360 480 360 450 {lab=}
N 360 450 420 450 {lab=}
N 420 450 420 420 {lab=}
N 420 510 420 540 {lab=}
N 420 480 440 480 {lab=}
N 440 480 440 540 {lab=}
N 440 540 420 540 {lab=}
C {devices/gnd.sym} 420 540 0 0 {name=l26 lab=GND}
N 20 620 300 620 {lab=}
N 300 620 620 620 {lab=}
N 620 620 700 620 {lab=}
N 700 620 1100 620 {lab=}
N 300 620 300 590 {lab=}
C {devices/lab_pin.sym} 300 590 0 0 {name=p27 sig_type=std_logic lab=nbp}
C {sky130_fd_pr/pfet_01v8.sym} 600 550 2 1 {name=MPb L=0.5 W=4 nf=1 ad="'int((nf+1)/2) * W/nf * 0.29'" as="'int((nf+2)/2) * W/nf * 0.29'" pd="'2*int((nf+1)/2) * (W/nf + 0.29)'" ps="'2*int((nf+2)/2) * (W/nf + 0.29)'" nrd="'0.29 / W'" nrs="'0.29 / W'" sa=0 sb=0 sd=0 mult=1 m=1 model=pfet_01v8 spiceprefix=X hide_texts=true}
N 620 520 620 490 {lab=}
C {devices/vdd.sym} 620 490 0 0 {name=l28 lab=VDD}
N 620 550 640 550 {lab=}
N 640 550 640 490 {lab=}
N 640 490 620 490 {lab=}
N 580 550 560 550 {lab=}
N 560 550 560 580 {lab=}
N 560 580 620 580 {lab=}
N 620 580 620 620 {lab=}
C {devices/isource.sym} 700 650 0 0 {name=Ibp value=125u hide_texts=true}
C {devices/gnd.sym} 700 680 0 0 {name=l29 lab=GND}
C {devices/vsource.sym} 1250 0 0 0 {name=Vdd value=1.8 hide_texts=true}
C {devices/vdd.sym} 1250 -30 0 0 {name=l30 lab=VDD}
C {devices/gnd.sym} 1250 30 0 0 {name=l31 lab=GND}
C {devices/code_shown.sym} 1250 120 0 0 {name=SIM only_toplevel=false value=".op
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
.endc"}
