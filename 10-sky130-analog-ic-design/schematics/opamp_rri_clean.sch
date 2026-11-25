v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 500 -700 0 0 {name=BN L=2 W=160 nf=1 mult=1 model=nfet_01v8_lvt spiceprefix=X}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 800 -1000 0 0 {name=NTAIL L=2 W=160 nf=1 mult=1 model=nfet_01v8_lvt spiceprefix=X}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 500 -1800 0 0 {name=BP L=2 W=20 nf=1 mult=1 model=pfet_01v8_lvt spiceprefix=X}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 1800 -1500 0 0 {name=PTAIL L=2 W=20 nf=1 mult=1 model=pfet_01v8_lvt spiceprefix=X}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 3300 -1800 0 0 {name=BP2 L=2 W=20 nf=1 mult=1 model=pfet_01v8_lvt spiceprefix=X}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 1500 -700 0 0 {name=MN1 L=1 W=320 nf=4 mult=1 model=nfet_01v8_lvt spiceprefix=X}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 2100 -700 0 0 {name=MN2 L=1 W=320 nf=4 mult=1 model=nfet_01v8_lvt spiceprefix=X}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 1500 -1200 0 0 {name=MP1 L=1 W=20 nf=4 mult=1 model=pfet_01v8_lvt spiceprefix=X}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 2100 -1200 0 0 {name=MP2 L=1 W=20 nf=4 mult=1 model=pfet_01v8_lvt spiceprefix=X}
C {sky130_fd_pr/pfet_01v8.sym} 1500 -2200 0 0 {name=PL1 L=2 W=20 nf=2 mult=1 model=pfet_01v8 spiceprefix=X}
C {sky130_fd_pr/pfet_01v8.sym} 2100 -2200 0 0 {name=PL2 L=2 W=20 nf=2 mult=1 model=pfet_01v8 spiceprefix=X}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 1000 -350 0 0 {name=NL1 L=2 W=20 nf=2 mult=1 model=nfet_01v8_lvt spiceprefix=X}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 2700 -350 0 0 {name=NL2 L=2 W=20 nf=2 mult=1 model=nfet_01v8_lvt spiceprefix=X}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 3300 -700 0 0 {name=M6 L=2 W=80 nf=8 mult=1 model=nfet_01v8_lvt spiceprefix=X}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 3300 -2200 0 0 {name=M7 L=2 W=80 nf=8 mult=1 model=pfet_01v8_lvt spiceprefix=X}
C {devices/res.sym} 3800 -1000 0 0 {name=Rz value=2k m=1}
C {sky130_fd_pr/cap_mim_m3_1.sym} 4200 -1000 0 0 {name=Cc model=cap_mim_m3_1 W=64 L=32 MF=1 spiceprefix=X}
C {devices/ipin.sym} 2300 -950 0 0 {name=port_inp lab=inp}
C {devices/ipin.sym} 1400 -950 0 0 {name=port_inn lab=inn}
C {devices/opin.sym} 4700 -1000 0 0 {name=port_out lab=out}
C {devices/ipin.sym} 200 -2500 0 0 {name=port_vdd lab=vdd}
C {devices/ipin.sym} 200 -100 0 0 {name=port_vss lab=vss}
C {devices/ipin.sym} 200 -730 0 0 {name=port_ibn lab=ibn}
C {devices/ipin.sym} 200 -1770 0 0 {name=port_ibp lab=ibp}
C {devices/ipin.sym} 3500 -1770 0 0 {name=port_ibp2 lab=ibp2}
C {devices/vdd.sym} 520 -1830 0 0 {name=vpwr_bp lab=vdd}
C {devices/vdd.sym} 1820 -1530 0 0 {name=vpwr_ptail lab=vdd}
C {devices/vdd.sym} 3320 -1830 0 0 {name=vpwr_bp2 lab=vdd}
C {devices/vdd.sym} 1520 -2230 0 0 {name=vpwr_pl1 lab=vdd}
C {devices/vdd.sym} 2120 -2230 0 0 {name=vpwr_pl2 lab=vdd}
C {devices/vdd.sym} 3320 -2230 0 0 {name=vpwr_m7 lab=vdd}
C {devices/gnd.sym} 520 -670 0 0 {name=vgnd_bn lab=vss}
C {devices/gnd.sym} 820 -970 0 0 {name=vgnd_ntail lab=vss}
C {devices/gnd.sym} 1020 -320 0 0 {name=vgnd_nl1 lab=vss}
C {devices/gnd.sym} 2720 -320 0 0 {name=vgnd_nl2 lab=vss}
C {devices/gnd.sym} 3320 -670 0 0 {name=vgnd_m6 lab=vss}
C {devices/vdd.sym} 1560 -1200 0 0 {name=vpwr_mp1 lab=vdd}
C {devices/vdd.sym} 2160 -1200 0 0 {name=vpwr_mp2 lab=vdd}
C {devices/gnd.sym} 1560 -700 0 0 {name=vgnd_mn1 lab=vss}
C {devices/gnd.sym} 2160 -700 0 0 {name=vgnd_mn2 lab=vss}
C {devices/lab_wire.sym} 1300 -1800 0 0 {name=lnet1_n1 lab=n1}
C {devices/lab_wire.sym} 2700 -1000 0 0 {name=lnet2_n1st lab=n1st}
C {devices/lab_wire.sym} 1200 -600 0 0 {name=lnet3_p1 lab=p1}
C {devices/lab_wire.sym} 1800 -550 0 0 {name=lnet4_tn lab=tn}
C {devices/lab_wire.sym} 1800 -1300 0 0 {name=lnet5_tp lab=tp}
C {devices/lab_wire.sym} 3900 -1000 0 0 {name=lnet6_z lab=z}
N 200 -2500 4400 -2500 {}
N 200 -100 4400 -100 {}
N 820 -1030 700 -1030 {}
N 700 -1030 700 -200 {}
N 700 -200 1560 -200 {}
N 1560 -200 1560 -550 {}
N 1560 -550 2080 -550 {}
N 1520 -670 1560 -670 {}
N 1560 -670 1560 -550 {}
N 2120 -670 1900 -670 {}
N 1900 -670 1900 -550 {}
N 1900 -550 2080 -550 {}
N 1820 -430 1820 -550 {}
N 1400 -1250 1400 -650 {}
N 1400 -1200 1480 -1200 {}
N 1400 -700 1480 -700 {}
N 2300 -1270 2300 -650 {}
N 2080 -1200 2040 -1200 {}
N 2040 -1200 2040 -1270 {}
N 2040 -1270 2300 -1270 {}
N 2080 -700 2040 -700 {}
N 2040 -700 2040 -650 {}
N 2040 -650 2300 -650 {}
N 1520 -1230 1560 -1230 {}
N 1560 -1230 1560 -1300 {}
N 1560 -1300 2080 -1300 {}
N 2120 -1230 2080 -1230 {}
N 2080 -1230 2080 -1300 {}
N 1820 -1470 1820 -1300 {}
N 1520 -2170 1300 -2170 {}
N 1300 -2170 1300 -730 {}
N 1520 -730 1300 -730 {}
N 1480 -2200 1480 -2100 {}
N 2080 -2200 2080 -2100 {}
N 1300 -2100 2080 -2100 {}
N 1520 -1170 1600 -1170 {}
N 1600 -1170 1600 -1350 {}
N 1600 -1350 1200 -1350 {}
N 1200 -1350 1200 -250 {}
N 1020 -380 1200 -380 {}
N 980 -350 920 -350 {}
N 920 -350 920 -250 {}
N 920 -250 1200 -250 {}
N 2680 -350 2600 -350 {}
N 2600 -350 2600 -250 {}
N 2600 -250 1200 -250 {}
N 2120 -2170 2700 -2170 {}
N 2120 -1170 2200 -1170 {}
N 2200 -1170 2200 -1350 {}
N 2200 -1350 2700 -1350 {}
N 2120 -730 2000 -730 {}
N 2000 -730 2000 -600 {}
N 2000 -600 2700 -600 {}
N 2700 -600 2700 -730 {}
N 2720 -380 2700 -380 {}
N 2700 -2170 2700 -380 {}
N 2700 -700 3280 -700 {}
N 2700 -1030 3800 -1030 {}
N 3800 -970 3900 -970 {}
N 3900 -970 3900 -1030 {}
N 3900 -1030 4200 -1030 {}
N 4200 -970 4500 -970 {}
N 3320 -2170 4500 -2170 {}
N 3320 -730 4500 -730 {}
N 4500 -2170 4500 -730 {}
N 4500 -1000 4700 -1000 {}
N 200 -730 450 -730 {}
N 520 -730 450 -730 {}
N 450 -730 450 -700 {}
N 450 -700 480 -700 {}
N 450 -730 430 -730 {}
N 430 -730 430 -1150 {}
N 430 -1150 780 -1150 {}
N 780 -1150 780 -1000 {}
N 200 -1770 450 -1770 {}
N 450 -1770 520 -1770 {}
N 480 -1800 450 -1800 {}
N 450 -1800 450 -1770 {}
N 450 -1770 400 -1770 {}
N 400 -1770 400 -1600 {}
N 400 -1600 1780 -1600 {}
N 1780 -1600 1780 -1500 {}
N 3500 -1770 3320 -1770 {}
N 3320 -1770 3260 -1770 {}
N 3260 -1770 3260 -1800 {}
N 3260 -1800 3280 -1800 {}
N 3280 -1800 3280 -2200 {}
N 520 -1830 520 -1800 {}
N 1820 -1530 1820 -1500 {}
N 3320 -1830 3320 -1800 {}
N 1520 -2230 1520 -2200 {}
N 2120 -2230 2120 -2200 {}
N 3320 -2230 3320 -2200 {}
N 520 -700 520 -670 {}
N 820 -1000 820 -970 {}
N 1020 -350 1020 -320 {}
N 2720 -350 2720 -320 {}
N 3320 -700 3320 -670 {}
N 1520 -1200 1560 -1200 {}
N 2120 -1200 2160 -1200 {}
N 1520 -700 1560 -700 {}
N 2120 -700 2160 -700 {}
