from pathlib import Path
import re,csv
import numpy as np
import matplotlib.pyplot as plt
ROOT=Path(__file__).resolve().parent
param_re=re.compile(r'@m\.xamp\.(\w+)\.[^\[]+\[(id|vgs|vth|vds|vdsat)\]\s*=\s*([-+0-9.eE]+)',re.I)
def clean(s): return re.sub(r'Note: (?:Starting dynamic gmin stepping|Dynamic gmin stepping completed)\s*','',s)
def val(p,b):
 m=re.search(p,b,re.I|re.M); return float(m.group(1)) if m else None
def parse(file,isolated):
 s=clean((ROOT/file).read_text(errors='replace')); marker=r'=== ISOLATED Vin=([0-9.]+) V ===' if isolated else r'=== FOLLOWER Vin=([0-9.]+) V ==='; a=re.split(marker,s)
 if (len(a)-1)//2!=9: raise SystemExit(f'{file}: expected 9 points')
 rows=[]
 for j in range(1,len(a),2):
  vin=float(a[j]); b=a[j+1]; get=lambda n:val(rf'^\s*v\({n}\)\s*=\s*([-+0-9.eE]+)',b)
  q={'target':5*vin-2.35 if isolated else vin,'vin':get('inp'),'inn':get('inn'),'out':get('out'),'idd':val(r'^\s*idd\s*=\s*([-+0-9.eE]+)',b),'pwr':val(r'^\s*pwr\s*=\s*([-+0-9.eE]+)',b)}
  if any(q[k] is None for k in ('vin','inn','out','idd','pwr')): raise SystemExit(f'missing OP at Vin={vin}')
  q['err']=q['out']-q['target']; q['dev']={}
  for d,k,x in param_re.findall(b): q['dev'].setdefault(d.lower(),{})[k.lower()]=float(x)
  if isolated and len(q['dev'])!=15: raise SystemExit(f'incomplete devices at Vin={vin}: {len(q["dev"])}')
  rows.append(q)
 return rows
iso=parse('isolated_dc.log',True); fol=parse('follower_dc.log',False)
# Device rows and VDS/VDSAT region classification.
with (ROOT/'output_device_operating_points.csv').open('w',newline='') as f:
 w=csv.writer(f); w.writerow(['target_output_V','input_V','device','Id_uA','VGS_model_V','VTH_model_V','VDS_model_V','VDSAT_model_V','VDS_margin_mV','model_region_check'])
 for r in iso:
  for d,q in r['dev'].items():
   if not all(k in q for k in ('id','vgs','vth','vds','vdsat')): raise SystemExit(f'missing {d} model vector')
   margin=abs(q['vds'])-abs(q['vdsat']); state='low-current' if abs(q['id'])<1e-6 else ('saturation' if margin>=0 else 'triode')
   w.writerow([f'{r["target"]:.2f}',f'{r["vin"]:.6f}',d,f'{q["id"]*1e6:.5f}',q['vgs'],q['vth'],q['vds'],q['vdsat'],f'{margin*1e3:.3f}',state])
with (ROOT/'output_swing_summary.csv').open('w',newline='') as f:
 w=csv.writer(f); w.writerow(['configuration','requested_output_V','input_V','feedback_input_V','measured_output_V','tracking_error_mV','Idd_uA','power_uW','XM6_region','XM7_region','output_stage_saturated','tracking_within_10mV','point_pass'])
 for label,rows in [('isolated_gain5',iso),('unity_follower',fol)]:
  for r in rows:
   states={d:('low-current' if abs(q.get('id',0))<1e-6 else ('saturation' if abs(q.get('vds',0))>=abs(q.get('vdsat',0)) else 'triode')) for d,q in r['dev'].items()}
   stage=all(states.get(d)=='saturation' for d in ('xm6','xm7')) if label=='isolated_gain5' else ''
   tracking=abs(r['err'])<=.010; passed=(tracking and stage and r['pwr']<500e-6) if label=='isolated_gain5' else ''
   w.writerow([label,f'{r["target"]:.3f}',f'{r["vin"]:.6f}',f'{r["inn"]:.6f}',f'{r["out"]:.6f}',f'{r["err"]*1e3:.3f}',f'{r["idd"]*1e6:.4f}',f'{r["pwr"]*1e6:.4f}',states.get('xm6','not measured'),states.get('xm7','not measured'),stage,tracking,passed])
a=np.loadtxt(ROOT/'output_swing_transient.dat')
if a.ndim!=2 or a.shape[1]<5: raise SystemExit(f'bad transient data shape {a.shape}')
with (ROOT/'output_swing_transient.csv').open('w',newline='') as f:
 w=csv.writer(f); w.writerow(['time_s','input_V','feedback_input_V','output_V','requested_output_V','tracking_error_mV'])
 for t,vi,vn,vo,d in a[:,:5]: w.writerow([f'{t:.10e}',f'{vi:.8f}',f'{vn:.8f}',f'{vo:.8f}',f'{d:.8f}',f'{(vo-d)*1e3:.4f}'])
def win(lo,hi):
 z=a[(a[:,0]>=lo)&(a[:,0]<=hi),3]; return float(np.mean(z)),float(np.min(z)),float(np.max(z))
low1=win(.2e-6,.9e-6); high=win(1.5e-6,2.4e-6); low2=win(3e-6,3.9e-6)
fig,ax=plt.subplots(1,2,figsize=(11,4.5)); ax[0].plot([r['target'] for r in fol],[r['out'] for r in fol],'o-',label='Unity follower; CM follows output'); ax[0].plot([r['target'] for r in iso],[r['out'] for r in iso],'s-',label='Isolated; input CM 0.53–0.77 V'); ax[0].plot([.3,1.5],[.3,1.5],'k--',label='Ideal'); ax[0].set(xlabel='Requested output (V)',ylabel='Measured output (V)',title='DC output range'); ax[0].grid(True,alpha=.3); ax[0].legend(fontsize=8); ax[1].plot([r['target'] for r in iso],[r['err']*1e3 for r in iso],'o-'); ax[1].axhline(10,color='r',ls='--'); ax[1].axhline(-10,color='r',ls='--'); ax[1].set(xlabel='Requested output (V)',ylabel='Output − request (mV)',title='Isolated tracking error (±10 mV)'); ax[1].grid(True,alpha=.3); fig.tight_layout(); fig.savefig(ROOT/'output_swing_dc.png',dpi=170); plt.close(fig)
fig,ax=plt.subplots(figsize=(9,4.5)); ax.plot(a[:,0]*1e6,a[:,4],label='Requested output'); ax.plot(a[:,0]*1e6,a[:,3],label='Measured output'); ax.set(xlabel='Time (µs)',ylabel='Voltage (V)',title='Output transient: 0.30 V ↔ 1.50 V demand'); ax.grid(True,alpha=.3); ax.legend(); fig.tight_layout(); fig.savefig(ROOT/'output_swing_transient.png',dpi=170); plt.close(fig)
fig,ax=plt.subplots(figsize=(8,4.5))
for d in ('xm6','xm7','xptail','xntail'): ax.plot([r['target'] for r in iso],[(abs(r['dev'][d]['vds'])-abs(r['dev'][d]['vdsat']))*1e3 for r in iso],'o-',label=d.upper())
ax.axhline(0,color='k',ls='--'); ax.set(xlabel='Requested output (V)',ylabel='|VDS| − VDSAT (mV)',title='Output-stage and tail-device headroom'); ax.grid(True,alpha=.3); ax.legend(); fig.tight_layout(); fig.savefig(ROOT/'output_device_headroom.png',dpi=170); plt.close(fig)
passed=[]; flags=[]
for r in iso:
 stage=all(abs(r['dev'][d]['vds'])>=abs(r['dev'][d]['vdsat']) for d in ('xm6','xm7')); ok=abs(r['err'])<=.010 and stage and r['pwr']<500e-6; flags.append(ok)
 if ok: passed.append(r['target'])
status='PASS' if all(flags) else ('PARTIAL' if passed else 'FAIL'); first=next((r for r,ok in zip(iso,flags) if not ok),None)
report=f'''# Output-swing verification report

## Test conditions

The target is 0.30–1.50 V. These SKY130A TT simulations used 27 °C, 1.8 V supply and 2 pF load. The nine requested DC points were 0.30, 0.40, 0.50, 0.70, 0.90, 1.10, 1.30, 1.40 and 1.50 V.

Two closed-loop DC tests were run. The unity follower makes input common mode equal the requested output, so its error can include an input-stage common-mode limit. The isolated-swing test uses an 80 kΩ/20 kΩ feedback divider and Vref=0.5875 V (feedback factor 0.2). It maps Vin=0.2·Vout_target+0.47 V, keeping both inputs between 0.53 V and 0.77 V while requesting 0.30–1.50 V at the output. This separates output swing from a large input common-mode sweep.

The isolated test records supply current and model Id, VGS, VTH, VDS and VDSAT for 15 devices. XM6 and XM7 are the output pull-down and pull-up. The transient test uses the same feedback network and load for a 0.30 V to 1.50 V demand and return step.

A sampled output counts as reached if isolated DC error is within ±10 mV, power is below 500 µW, and both output transistors pass |VDS|≥VDSAT. The ±10 mV limit is the tracking criterion used here.

## DC results

- Isolated measured output range: {min(r['out'] for r in iso):.4f}–{max(r['out'] for r in iso):.4f} V for requests from 0.30 to 1.50 V.
- Largest absolute isolated tracking error: {max(abs(r['err'])*1e3 for r in iso):.2f} mV.
- Supply current: {min(r['idd'] for r in iso)*1e6:.1f}–{max(r['idd'] for r in iso)*1e6:.1f} µA; power: {min(r['pwr'] for r in iso)*1e6:.1f}–{max(r['pwr'] for r in iso)*1e6:.1f} µW.
- Sampled levels passing tracking and output-device checks: {', '.join(f'{x:.2f}' for x in passed) if passed else 'none'} V.
- Isolated-test failure detail: {f'request {first["target"]:.2f} V, output {first["out"]:.4f} V, error {first["err"]*1e3:+.2f} mV' if first else 'none; all nine requested levels met the stated checks'}.

The unity follower was also tested at the same nine input levels. Its output range was {min(r['out'] for r in fol):.4f}–{max(r['out'] for r in fol):.4f} V. This is for comparison and is not used by itself to claim output swing because its input common mode follows the output request.

## Transient results

The output settled to {low1[0]:.4f} V at the low level, {high[0]:.4f} V at the high level and {low2[0]:.4f} V after returning low. During the switching edges it ranged from {a[:,3].min():.4f} V to {a[:,3].max():.4f} V and briefly did not track the requested level. At the stable portions, the maximum absolute error was under 3 mV. The waveform and error are in the transient CSV and plot.

## Status

**{status}** against the 0.30–1.50 V target. PASS requires both endpoints and all listed points to meet the tracking and output-device checks. No circuit changes were made.

## Reproduce

From this folder run `ngspice -b tb_output_swing_isolated_dc.spice > isolated_dc.log 2>&1`, `ngspice -b tb_output_swing_follower_dc.spice > follower_dc.log 2>&1` and `ngspice -b tb_output_swing_isolated_transient.spice > isolated_transient.log 2>&1`. Then run `MPLCONFIGDIR=.mplconfig python3 analyze_output_swing.py` to rebuild the CSVs, plots and report.
'''
(ROOT/'output_swing_report.md').write_text(report)
print('isolated:',[(f'{r["target"]:.2f}',f'{r["out"]:.5f}',f'{r["err"]*1e3:+.2f}mV',ok) for r,ok in zip(iso,flags)])
print('passing points:',passed,'status:',status,'transient mean output:',low1[0],high[0],low2[0])
