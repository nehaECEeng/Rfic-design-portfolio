"""Corners and temperature: conversion gain, output DC level and supply current.
Run:  python3 run_corners.py     (15 simulations, allow several minutes; needs ngspice on the PATH)"""
import subprocess, re
LIB="/home/nehan/.volare/volare/sky130/versions/0fe599b2afb6708d281543108caf8310912f54af/sky130A/libs.tech/ngspice/sky130.lib.spice"
BODY="""XM3 outn g3 n1 0 sky130_fd_pr__nfet_01v8 L=0.15 W=10 nf=1 mult=1 m=1
XM4 outp g4 n1 0 sky130_fd_pr__nfet_01v8 L=0.15 W=10 nf=1 mult=1 m=1
XM5 outp g5 n2 0 sky130_fd_pr__nfet_01v8 L=0.15 W=10 nf=1 mult=1 m=1
XM6 outn g6 n2 0 sky130_fd_pr__nfet_01v8 L=0.15 W=10 nf=1 mult=1 m=1
Rload2 VDD outn 500
Rload1 VDD outp 500
XMP1 n1 nbp VDD VDD sky130_fd_pr__pfet_01v8 L=0.5 W=4 nf=1 mult=8 m=8
XMP2 n2 nbp VDD VDD sky130_fd_pr__pfet_01v8 L=0.5 W=4 nf=1 mult=8 m=8
XM1 n1 gg1 0 0 sky130_fd_pr__nfet_01v8 L=0.15 W=4 nf=1 mult=10 m=10
Rbg1 gg1 nb 10k
Cc1 gg1 rfp 2p
XM2 n2 gg2 0 0 sky130_fd_pr__nfet_01v8 L=0.15 W=4 nf=1 mult=10 m=10
Rbg2 gg2 nb 10k
Cc2 gg2 rfn 2p
Rlo3 vlocm g3 10k
Clo3 lo_p g3 2p
Rlo4 vlocm g4 10k
Clo4 lo_n g4 2p
Rlo5 vlocm g5 10k
Clo5 lo_p g5 2p
Rlo6 vlocm g6 10k
Clo6 lo_n g6 2p
Iref VDD nb 250u
XMb nb nb 0 0 sky130_fd_pr__nfet_01v8 L=0.15 W=4 nf=1 mult=1 m=1
XMPb nbp nbp VDD VDD sky130_fd_pr__pfet_01v8 L=0.5 W=4 nf=1 mult=1 m=1
Ibp nbp 0 125u
Vdd VDD 0 1.8
Vlocm vlocm 0 1.4
Cl1 outp 0 2p
Cl2 outn 0 2p
Rext outp outn 20k"""
SRC="Vrfp rfp 0 sin(0 5m 2.45G)\nVrfn rfn 0 sin(0 -5m 2.45G)\nVlop lo_p 0 sin(0 0.4 2.4G)\nVlon lo_n 0 sin(0 -0.4 2.4G)\n"
CTL=(".control\ntran 10p 300n 100n 10p\nlet vo = v(outp)[0]\nlet idd = -i(vdd)[0]\nlet vd = v(outp)-v(outn)\nlinearize vd\n"
     "let a = 2*mean(vd*cos(2*pi*5e7*time))\nlet b = 2*mean(vd*sin(2*pi*5e7*time))\n"
     "let cgdb = 20*log10(sqrt(a*a+b*b)/0.01)\necho RES $&cgdb $&vo $&idd\n.endc\n")
print("corner  temp   CG(dB)   Vout_dc(V)   Idd(mA)")
for corner in ("tt","ss","ff","sf","fs"):
    for temp in (-40,27,85):
        fn=f"corner_{corner}_{temp}.cir"
        open(fn,"w").write(f"* {corner} {temp}C\n.lib {LIB} {corner}\n.temp {temp}\n"+BODY+"\n"+SRC+CTL+".end\n")
        r=subprocess.run(["ngspice","-b",fn],capture_output=True,text=True)
        m=re.search(r"RES\s+(\S+)\s+(\S+)\s+(\S+)",r.stdout)
        if not m: print(f"{corner:>6} {temp:>5}   failed"); print(r.stdout[-600:]+r.stderr[-600:]); continue
        cg,vo,idd=map(float,m.groups())
        print(f"{corner:>6} {temp:>5}   {cg:6.2f}   {vo:8.3f}    {idd*1e3:7.3f}")
