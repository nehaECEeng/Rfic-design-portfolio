"""Plot RF, LO and IF: time waveforms and frequency spectrum.
Run after:   ngspice -b sim_signals.cir      (creates signals.txt)
Then:        pip install numpy matplotlib     (once)
             python3 plot_signals.py
Saves plot_signals_time.png and plot_signals_spectrum.png."""
import numpy as np, matplotlib.pyplot as plt

rows=[]
for line in open("signals.txt"):
    p=line.split()
    try: rows.append([float(x) for x in p])
    except ValueError: pass
d=np.array(rows)
if d.shape[1]>=6: t,rf,lo,vd=d[:,0],d[:,1],d[:,3],d[:,5]   # wrdata repeats the time column
else:             t,rf,lo,vd=d[:,0],d[:,1],d[:,2],d[:,3]
dt=5e-12; tu=np.arange(t[0],t[-1],dt)
rf,lo,vd=[np.interp(tu,t,x) for x in (rf,lo,vd)]
t0=tu[-1]-100e-9; ms=(tu>=t0)

# ---- time waveforms ----
fig,ax=plt.subplots(3,1,figsize=(9,7))
z=ms&(tu<t0+3e-9)
ax[0].plot((tu[z]-t0)*1e9,rf[z]*1e3,color="tab:red");   ax[0].set_ylabel("RF diff (mV)");  ax[0].set_title("RF 2.45 GHz, first 3 ns")
ax[1].plot((tu[z]-t0)*1e9,lo[z],color="tab:purple");    ax[1].set_ylabel("LO diff (V)");   ax[1].set_title("LO 2.4 GHz, first 3 ns"); ax[1].set_xlabel("time (ns)")
ax[2].plot((tu[ms]-t0)*1e9,vd[ms]*1e3,color="tab:green"); ax[2].set_ylabel("IF diff (mV)"); ax[2].set_title("IF output 50 MHz, 100 ns"); ax[2].set_xlabel("time (ns)")
for a in ax: a.grid(alpha=.3)
plt.tight_layout(); plt.savefig("plot_signals_time.png",dpi=150)

# ---- spectrum ----
w=np.hanning(len(tu)); f=np.fft.rfftfreq(len(tu),dt)
def spec(x): return np.abs(np.fft.rfft((x-x.mean())*w))*2/np.sum(w)
S={n:spec(x) for n,x in (("RF input",rf),("LO drive",lo),("IF output",vd))}
fig,ax=plt.subplots(2,1,figsize=(9,7))
k=(f>5e6)&(f<10e9)
for (n,m),c in zip(S.items(),("tab:red","tab:purple","tab:green")):
    ax[0].semilogx(f[k],20*np.log10(m[k]+1e-12),color=c,label=n,lw=.9)
for fr,name in ((50e6,"IF 50 MHz"),(2.4e9,"LO 2.4 GHz"),(2.45e9,"RF 2.45 GHz")):
    ax[0].axvline(fr,color="gray",ls=":",lw=.8); ax[0].text(fr,-5,name,rotation=90,va="top",ha="right",fontsize=8)
ax[0].set_ylim(-140,10); ax[0].set_xlabel("frequency (Hz)"); ax[0].set_ylabel("level (dBV peak)"); ax[0].legend(loc="lower left"); ax[0].grid(alpha=.3,which="both"); ax[0].set_title("Spectrum of RF, LO and IF")
k2=f<300e6
ax[1].plot(f[k2]/1e6,20*np.log10(S["IF output"][k2]+1e-12),color="tab:green")
ax[1].set_xlabel("frequency (MHz)"); ax[1].set_ylabel("IF level (dBV peak)"); ax[1].set_ylim(-140,0); ax[1].grid(alpha=.3); ax[1].set_title("IF band, zoom")
plt.tight_layout(); plt.savefig("plot_signals_spectrum.png",dpi=150)

pk=lambda m,fc: m[(f>fc-3e6)&(f<fc+3e6)].max()
print(f"RF peak {pk(S['RF input'],2.45e9)*1e3:.2f} mV   LO peak {pk(S['LO drive'],2.4e9):.3f} V   IF peak {pk(S['IF output'],50e6)*1e3:.2f} mV")
print(f"conversion gain = {20*np.log10(pk(S['IF output'],50e6)/pk(S['RF input'],2.45e9)):.2f} dB")
plt.show()
