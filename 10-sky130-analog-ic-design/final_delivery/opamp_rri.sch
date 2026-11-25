v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 300 -150 0 0 {name=BN L=2 W=160 nf=1 mult=1 model=nfet_01v8_lvt spiceprefix=X}
C {devices/lab_wire.sym} 320 -180 0 0 {name=l_XBN_D lab=ibn}
C {devices/lab_wire.sym} 280 -150 0 0 {name=l_XBN_G lab=ibn}
C {devices/lab_wire.sym} 320 -120 0 0 {name=l_XBN_S lab=vss}
C {devices/lab_wire.sym} 320 -150 0 0 {name=l_XBN_B lab=vss}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 500 -150 0 0 {name=NTAIL L=2 W=160 nf=1 mult=1 model=nfet_01v8_lvt spiceprefix=X}
C {devices/lab_wire.sym} 520 -180 0 0 {name=l_XNTAIL_D lab=tn}
C {devices/lab_wire.sym} 480 -150 0 0 {name=l_XNTAIL_G lab=ibn}
C {devices/lab_wire.sym} 520 -120 0 0 {name=l_XNTAIL_S lab=vss}
C {devices/lab_wire.sym} 520 -150 0 0 {name=l_XNTAIL_B lab=vss}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 800 -150 0 0 {name=BP L=2 W=20 nf=1 mult=1 model=pfet_01v8_lvt spiceprefix=X}
C {devices/lab_wire.sym} 820 -120 0 0 {name=l_XBP_D lab=ibp}
C {devices/lab_wire.sym} 780 -150 0 0 {name=l_XBP_G lab=ibp}
C {devices/lab_wire.sym} 820 -180 0 0 {name=l_XBP_S lab=vdd}
C {devices/lab_wire.sym} 820 -150 0 0 {name=l_XBP_B lab=vdd}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 1000 -150 0 0 {name=PTAIL L=2 W=20 nf=1 mult=1 model=pfet_01v8_lvt spiceprefix=X}
C {devices/lab_wire.sym} 1020 -120 0 0 {name=l_XPTAIL_D lab=tp}
C {devices/lab_wire.sym} 980 -150 0 0 {name=l_XPTAIL_G lab=ibp}
C {devices/lab_wire.sym} 1020 -180 0 0 {name=l_XPTAIL_S lab=vdd}
C {devices/lab_wire.sym} 1020 -150 0 0 {name=l_XPTAIL_B lab=vdd}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 1200 -150 0 0 {name=BP2 L=2 W=20 nf=1 mult=1 model=pfet_01v8_lvt spiceprefix=X}
C {devices/lab_wire.sym} 1220 -120 0 0 {name=l_XBP2_D lab=ibp2}
C {devices/lab_wire.sym} 1180 -150 0 0 {name=l_XBP2_G lab=ibp2}
C {devices/lab_wire.sym} 1220 -180 0 0 {name=l_XBP2_S lab=vdd}
C {devices/lab_wire.sym} 1220 -150 0 0 {name=l_XBP2_B lab=vdd}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 350 -450 0 0 {name=MN1 L=1 W=320 nf=4 mult=1 model=nfet_01v8_lvt spiceprefix=X}
C {devices/lab_wire.sym} 370 -480 0 0 {name=l_XMN1_D lab=n1}
C {devices/lab_wire.sym} 330 -450 0 0 {name=l_XMN1_G lab=inn}
C {devices/lab_wire.sym} 370 -420 0 0 {name=l_XMN1_S lab=tn}
C {devices/lab_wire.sym} 370 -450 0 0 {name=l_XMN1_B lab=vss}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 600 -450 0 0 {name=MN2 L=1 W=320 nf=4 mult=1 model=nfet_01v8_lvt spiceprefix=X}
C {devices/lab_wire.sym} 620 -480 0 0 {name=l_XMN2_D lab=n1st}
C {devices/lab_wire.sym} 580 -450 0 0 {name=l_XMN2_G lab=inp}
C {devices/lab_wire.sym} 620 -420 0 0 {name=l_XMN2_S lab=tn}
C {devices/lab_wire.sym} 620 -450 0 0 {name=l_XMN2_B lab=vss}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 950 -450 0 0 {name=MP1 L=1 W=20 nf=4 mult=1 model=pfet_01v8_lvt spiceprefix=X}
C {devices/lab_wire.sym} 970 -420 0 0 {name=l_XMP1_D lab=p1}
C {devices/lab_wire.sym} 930 -450 0 0 {name=l_XMP1_G lab=inn}
C {devices/lab_wire.sym} 970 -480 0 0 {name=l_XMP1_S lab=tp}
C {devices/lab_wire.sym} 970 -450 0 0 {name=l_XMP1_B lab=vdd}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 1200 -450 0 0 {name=MP2 L=1 W=20 nf=4 mult=1 model=pfet_01v8_lvt spiceprefix=X}
C {devices/lab_wire.sym} 1220 -420 0 0 {name=l_XMP2_D lab=n1st}
C {devices/lab_wire.sym} 1180 -450 0 0 {name=l_XMP2_G lab=inp}
C {devices/lab_wire.sym} 1220 -480 0 0 {name=l_XMP2_S lab=tp}
C {devices/lab_wire.sym} 1220 -450 0 0 {name=l_XMP2_B lab=vdd}
C {sky130_fd_pr/pfet_01v8.sym} 350 -750 0 0 {name=PL1 L=2 W=20 nf=2 mult=1 model=pfet_01v8 spiceprefix=X}
C {devices/lab_wire.sym} 370 -720 0 0 {name=l_XPL1_D lab=n1}
C {devices/lab_wire.sym} 330 -750 0 0 {name=l_XPL1_G lab=n1}
C {devices/lab_wire.sym} 370 -780 0 0 {name=l_XPL1_S lab=vdd}
C {devices/lab_wire.sym} 370 -750 0 0 {name=l_XPL1_B lab=vdd}
C {sky130_fd_pr/pfet_01v8.sym} 600 -750 0 0 {name=PL2 L=2 W=20 nf=2 mult=1 model=pfet_01v8 spiceprefix=X}
C {devices/lab_wire.sym} 620 -720 0 0 {name=l_XPL2_D lab=n1st}
C {devices/lab_wire.sym} 580 -750 0 0 {name=l_XPL2_G lab=n1}
C {devices/lab_wire.sym} 620 -780 0 0 {name=l_XPL2_S lab=vdd}
C {devices/lab_wire.sym} 620 -750 0 0 {name=l_XPL2_B lab=vdd}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 950 -750 0 0 {name=NL1 L=2 W=20 nf=2 mult=1 model=nfet_01v8_lvt spiceprefix=X}
C {devices/lab_wire.sym} 970 -780 0 0 {name=l_XNL1_D lab=p1}
C {devices/lab_wire.sym} 930 -750 0 0 {name=l_XNL1_G lab=p1}
C {devices/lab_wire.sym} 970 -720 0 0 {name=l_XNL1_S lab=vss}
C {devices/lab_wire.sym} 970 -750 0 0 {name=l_XNL1_B lab=vss}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 1200 -750 0 0 {name=NL2 L=2 W=20 nf=2 mult=1 model=nfet_01v8_lvt spiceprefix=X}
C {devices/lab_wire.sym} 1220 -780 0 0 {name=l_XNL2_D lab=n1st}
C {devices/lab_wire.sym} 1180 -750 0 0 {name=l_XNL2_G lab=p1}
C {devices/lab_wire.sym} 1220 -720 0 0 {name=l_XNL2_S lab=vss}
C {devices/lab_wire.sym} 1220 -750 0 0 {name=l_XNL2_B lab=vss}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 1600 -450 0 0 {name=M6 L=2 W=80 nf=8 mult=1 model=nfet_01v8_lvt spiceprefix=X}
C {devices/lab_wire.sym} 1620 -480 0 0 {name=l_XM6_D lab=out}
C {devices/lab_wire.sym} 1580 -450 0 0 {name=l_XM6_G lab=n1st}
C {devices/lab_wire.sym} 1620 -420 0 0 {name=l_XM6_S lab=vss}
C {devices/lab_wire.sym} 1620 -450 0 0 {name=l_XM6_B lab=vss}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 1600 -750 0 0 {name=M7 L=2 W=80 nf=8 mult=1 model=pfet_01v8_lvt spiceprefix=X}
C {devices/lab_wire.sym} 1620 -720 0 0 {name=l_XM7_D lab=out}
C {devices/lab_wire.sym} 1580 -750 0 0 {name=l_XM7_G lab=ibp2}
C {devices/lab_wire.sym} 1620 -780 0 0 {name=l_XM7_S lab=vdd}
C {devices/lab_wire.sym} 1620 -750 0 0 {name=l_XM7_B lab=vdd}
C {devices/res.sym} 1800 -250 0 0 {name=Rz value=2k m=1}
C {devices/lab_wire.sym} 1800 -280 0 0 {name=l_Rz_P lab=n1st}
C {devices/lab_wire.sym} 1800 -220 0 0 {name=l_Rz_M lab=z}
C {sky130_fd_pr/cap_mim_m3_1.sym} 1950 -250 0 0 {name=Cc model=cap_mim_m3_1 W=64 L=32 MF=1 spiceprefix=X}
C {devices/lab_wire.sym} 1950 -280 0 0 {name=l_XCc_0 lab=z}
C {devices/lab_wire.sym} 1950 -220 0 0 {name=l_XCc_1 lab=out}
C {devices/ipin.sym} 100 -1000 0 0 {name=port_inp lab=inp}
C {devices/ipin.sym} 250 -1000 0 0 {name=port_inn lab=inn}
C {devices/opin.sym} 400 -1000 0 0 {name=port_out lab=out}
C {devices/ipin.sym} 550 -1000 0 0 {name=port_vdd lab=vdd}
C {devices/ipin.sym} 700 -1000 0 0 {name=port_vss lab=vss}
C {devices/ipin.sym} 850 -1000 0 0 {name=port_ibn lab=ibn}
C {devices/ipin.sym} 1000 -1000 0 0 {name=port_ibp lab=ibp}
C {devices/ipin.sym} 1150 -1000 0 0 {name=port_ibp2 lab=ibp2}
C {devices/title.sym} 80 -1080 0 0 {name=title author="Codex"}
T {SKY130 complementary input, mirror-loaded two-stage OTA} 80 -1140 0 0 0.45 0.45 {}
T {Bias references and mirrored tails: top row} 80 -70 0 0 0.35 0.35 {}
T {Complementary differential input pairs and current-mirror loads} 80 -360 0 0 0.35 0.35 {}
T {Stage 2 and series Miller compensation} 1500 -80 0 0 0.35 0.35 {}
