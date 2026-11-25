#!/usr/bin/env python3
"""Parse the ICMR ngspice log into point and device CSVs and plots."""
from pathlib import Path
import csv, re, math
import numpy as np
import matplotlib.pyplot as plt
ROOT=Path(__file__).resolve().parent
RAW=ROOT/'icmr_sweep.log'
text=RAW.read_text(errors='replace')
parts=re.split(r'=== ICMR Vcm=([0-9.]+) V ===',text)
if (len(parts)-1)//2 != 17: raise SystemExit(f'Expected 17 points in raw log, found {(len(parts)-1)//2}')
param_re=re.compile(r'@m\.xamp\.(\w+)\.[^\[]+\[(id|vgs|vth|vds|vdsat)\]\s*=\s*([-+0-9.eE]+)',re.I)
number=lambda pat,body: (float(m.group(1)) if (m:=re.search(pat,body,re.I|re.M)) else None)
points=[]; devrows=[]
for i in range(1,len(parts),2):
    vcm=float(parts[i]); body=parts[i+1]
    # ngspice can interleave gmin notices mid-line; remove only these notices before parsing.
    body=re.sub(r'Note: (?:Starting dynamic gmin stepping|Dynamic gmin stepping completed)\s*', '', body)
    def node(n): return number(rf'^\s*v\({re.escape(n)}\)\s*=\s*([-+0-9.eE]+)',body)
    vals={}
    for dev,key,val in param_re.findall(body): vals.setdefault(dev.lower(),{})[key.lower()]=float(val)
    metrics={k:number(rf'^\s*{k}\s*=\s*([-+0-9.eE]+)',body) for k in ('a0_db','ugb','phaseradatugb','phasedegatugb','pm_deg','idd','pwr')}
    vin,vout=node('inp'),node('out')
    if vin is None or vout is None: raise SystemExit(f'Missing input/output OP at {vcm:.2f} V')
    err=(vout-vin)*1e3
    states={}
    for d in ('xbn','xntail','xbp','xptail','xbp2','xmn1','xmn2','xmp1','xmp2','xpl1','xpl2','xnl1','xnl2','xm6','xm7'):
        dv=vals.get(d,{})
        if not all(k in dv for k in ('id','vgs','vth','vds','vdsat')):
            raise SystemExit(f'Missing model values for {d} at {vcm:.2f} V: {dv}')
        current=abs(dv['id']); margin=abs(dv['vds'])-abs(dv['vdsat'])
        state='low-current' if current < 1e-6 else ('saturation' if margin >= 0 else 'triode')
        states[d]=state
        devrows.append([vcm,d,dv['id']*1e6,dv['vgs'],dv['vth'],dv['vds'],dv['vdsat'],dv['vgs']-dv['vth'],margin,state])
    n_pair=all(states[d]=='saturation' and abs(vals[d]['id'])>=1e-6 for d in ('xmn1','xmn2'))
    p_pair=all(states[d]=='saturation' and abs(vals[d]['id'])>=1e-6 for d in ('xmp1','xmp2'))
    pair_state='NMOS pair active' if n_pair and not p_pair else ('PMOS pair active' if p_pair and not n_pair else ('both pairs active' if p_pair and n_pair else 'no complete saturated input pair'))
    core=tuple(d for d in ('xbn','xntail','xbp','xptail','xbp2','xpl1','xpl2','xnl1','xnl2','xm6','xm7') if states[d]!='saturation')
    region_detail={d:{'vds':vals[d]['vds'],'vdsat':vals[d]['vdsat'],'margin':abs(vals[d]['vds'])-abs(vals[d]['vdsat'])} for d in states}
    op_ok=(n_pair or p_pair) and not core
    phasecheck=(metrics['phaseradatugb'] is not None and metrics['phasedegatugb'] is not None and metrics['pm_deg'] is not None and abs(metrics['phaseradatugb']*180/math.pi-metrics['phasedegatugb'])<0.03 and abs(180+metrics['phasedegatugb']-metrics['pm_deg'])<0.03)
    converged=('No. of Data Rows : 361' in body and len(vals)==15 and all(all(k in vals[d] for k in ('id','vgs','vth','vds','vdsat')) for d in states))
    track_ok=abs(err)<=10
    ac_ok=all(metrics[k] is not None for k in ('a0_db','ugb','phaseradatugb','phasedegatugb','pm_deg')) and phasecheck
    spec_ok=ac_ok and metrics['a0_db']>=60 and metrics['ugb']>=10e6 and metrics['pm_deg']>=60 and metrics['idd'] is not None and 1.8*metrics['idd']<500e-6
    point_ok=converged and track_ok and spec_ok and op_ok
    def current(d): return vals[d]['id']*1e6
    points.append(dict(vcm=vcm,vin=vin,vout=vout,error=err,a0=metrics['a0_db'],ugb=metrics['ugb'],phase_rad=metrics['phaseradatugb'],phase_deg=metrics['phasedegatugb'],pm=metrics['pm_deg'],idd=metrics['idd'],power=metrics['pwr'],n_tail=current('xntail'),p_tail=current('xptail'),n_pair_sum=current('xmn1')+current('xmn2'),p_pair_sum=current('xmp1')+current('xmp2'),n_pair_state=('sat' if n_pair else 'not-sat'),p_pair_state=('sat' if p_pair else 'not-sat'),active_pair=pair_state,core_region_issues=';'.join(core) or 'none',converged=converged,track_ok=track_ok,ac_ok=ac_ok,spec_ok=spec_ok,op_ok=op_ok,passed=point_ok,region_detail=region_detail))
if len(points)!=17: raise SystemExit('point count failure')
summary_path=ROOT/'icmr_summary.csv'
with summary_path.open('w',newline='') as f:
    w=csv.writer(f); w.writerow(['Vcm_V','Vin_V','Vout_V','tracking_error_mV','A0_dB_at_1Hz','UGB_MHz','phase_raw_rad_at_UGB','phase_deg_at_UGB','PM_deg','Idd_uA','XMNT_uA','XMPT_uA','NMOS_pair_sum_uA','PMOS_pair_sum_uA','NMOS_pair_model_state','PMOS_pair_model_state','active_input_pair','non_input_core_region_issues','OP_AC_converged','tracking_within_10mV','AC_metrics_valid','gain_UGB_PM_power_pass','operating_region_pass','point_pass'])
    for p in points: w.writerow([f'{p["vcm"]:.2f}',f'{p["vin"]:.8g}',f'{p["vout"]:.8g}',f'{p["error"]:.5f}',p['a0'],None if p['ugb'] is None else f'{p["ugb"]/1e6:.6f}',p['phase_rad'],p['phase_deg'],p['pm'],None if p['idd'] is None else f'{p["idd"]*1e6:.5f}',f'{p["n_tail"]:.5f}',f'{p["p_tail"]:.5f}',f'{p["n_pair_sum"]:.5f}',f'{p["p_pair_sum"]:.5f}',p['n_pair_state'],p['p_pair_state'],p['active_pair'],p['core_region_issues'],p['converged'],p['track_ok'],p['ac_ok'],p['spec_ok'],p['op_ok'],p['passed']])
with (ROOT/'icmr_device_operating_points.csv').open('w',newline='') as f:
    w=csv.writer(f); w.writerow(['Vcm_V','device','Id_uA','VGS_model_V','VTH_model_V','VDS_model_V','VDSAT_model_V','VGS_minus_VTH_V','VDS_minus_VDSAT_V','model_region_check'])
    w.writerows(devrows)
# Contiguous passing range, sampled at 50 mV. Keep any gaps visible.
passed=[p['vcm'] for p in points if p['passed']]
ranges=[]
for p in points:
    if p['passed']:
        if not ranges or abs(p['vcm']-ranges[-1][-1]-.05)>1e-8: ranges.append([p['vcm']])
        else:ranges[-1].append(p['vcm'])
first_fail=next((p for p in points if not p['passed']),None)
# Figures: direct values and criterion lines.
x=np.array([p['vcm'] for p in points]); outv=np.array([p['vout'] for p in points]); err=np.array([p['error'] for p in points])
fig,axs=plt.subplots(2,2,figsize=(10,7))
axs[0,0].plot(x,x,'k--',label='ideal follower'); axs[0,0].plot(x,outv,'o-',label='simulated output'); axs[0,0].set(ylabel='Voltage (V)',title='DC output tracking'); axs[0,0].legend(); axs[0,0].grid(True,alpha=.3)
axs[0,1].plot(x,err,'o-'); axs[0,1].axhline(10,color='r',ls='--'); axs[0,1].axhline(-10,color='r',ls='--'); axs[0,1].set(ylabel='Output − input (mV)',title='Tracking error (±10 mV criterion)'); axs[0,1].grid(True,alpha=.3)
axs[1,0].plot(x,[p['a0'] if p['a0'] is not None else np.nan for p in points],'o-'); axs[1,0].axhline(60,color='r',ls='--'); axs[1,0].set(xlabel='Input common-mode voltage (V)',ylabel='Gain (dB)',title='DC loop gain'); axs[1,0].grid(True,alpha=.3)
ax=axs[1,1]; ax.plot(x,[p['ugb']/1e6 if p['ugb'] is not None else np.nan for p in points],'o-',label='UGB (MHz)'); ax.axhline(10,color='C0',ls='--'); ax.set(xlabel='Input common-mode voltage (V)',ylabel='UGB (MHz)',title='Unity-gain bandwidth'); ax.grid(True,alpha=.3); ax2=ax.twinx(); ax2.plot(x,[p['pm'] if p['pm'] is not None else np.nan for p in points],'s-',color='C1',label='PM'); ax2.axhline(60,color='C1',ls=':'); ax2.set_ylabel('Phase margin (degrees)'); fig.tight_layout(); fig.savefig(ROOT/'icmr_metrics.png',dpi=170); plt.close(fig)
fig,axs=plt.subplots(2,1,figsize=(9,6),sharex=True)
axs[0].plot(x,[p['n_tail'] for p in points],'o-',label='NMOS tail XMNT'); axs[0].plot(x,[p['p_tail'] for p in points],'o-',label='PMOS tail XMPT'); axs[0].set_ylabel('Tail current (µA)'); axs[0].legend(); axs[0].grid(True,alpha=.3)
axs[1].plot(x,[p['n_pair_sum'] for p in points],'o-',label='NMOS pair sum'); axs[1].plot(x,[p['p_pair_sum'] for p in points],'o-',label='PMOS pair sum'); axs[1].set(xlabel='Input common-mode voltage (V)',ylabel='Pair current (µA)'); axs[1].legend(); axs[1].grid(True,alpha=.3); fig.tight_layout(); fig.savefig(ROOT/'icmr_bias_currents.png',dpi=170); plt.close(fig)
# Discrete device status map: 2=saturation, 1=triode, 0=low current.
devnames=['xbn','xntail','xbp','xptail','xbp2','xmn1','xmn2','xmp1','xmp2','xpl1','xpl2','xnl1','xnl2','xm6','xm7']; code={'low-current':0,'triode':1,'saturation':2}
mat=np.array([[code[next(r[-1] for r in devrows if abs(r[0]-p['vcm'])<1e-8 and r[1]==d)] for p in points] for d in devnames])
fig,ax=plt.subplots(figsize=(11,5)); im=ax.imshow(mat,aspect='auto',interpolation='nearest',origin='lower',extent=[x[0]-.025,x[-1]+.025,-.5,len(devnames)-.5],vmin=0,vmax=2,cmap=plt.matplotlib.colors.ListedColormap(['#bb3e03','#ee9b00','#2a9d8f'])); ax.set_yticks(range(len(devnames)),devnames); ax.set_xticks(x); ax.set_xlabel('Input common-mode voltage (V)'); ax.set_title('Model VDS versus VDSAT check'); cb=fig.colorbar(im,ax=ax,ticks=[0,1,2],fraction=.025,pad=.02); cb.ax.set_yticklabels(['low current (<1 µA)','triode','saturation']); ax.grid(False); fig.tight_layout(); fig.savefig(ROOT/'icmr_device_regions.png',dpi=170); plt.close(fig)
fmt=lambda z:'n/a' if z is None else f'{z:.3f}'
errvals=[abs(p['error']) for p in points]
valid=[p for p in points if p['a0'] is not None and p['ugb'] is not None and p['pm'] is not None]
first_reason=[]
if first_fail:
    if not first_fail['converged']: first_reason.append('ngspice did not complete both OP and AC data rows')
    if not first_fail['track_ok']: first_reason.append(f'output tracking error {first_fail["error"]:+.3f} mV exceeds ±10 mV')
    if not first_fail['ac_ok']: first_reason.append('loop-gain measurement missing or phase calculation check failed')
    elif not first_fail['spec_ok']: first_reason.append(f'gain={fmt(first_fail["a0"])} dB, UGB={fmt(None if first_fail["ugb"] is None else first_fail["ugb"]/1e6)} MHz, PM={fmt(first_fail["pm"])} deg, power={fmt(None if first_fail["pwr"] is None else first_fail["pwr"]*1e6)} µW')
    if not first_fail['op_ok']:
        details=[]
        for d in first_fail['core_region_issues'].split(';') if first_fail['core_region_issues']!='none' else []:
            q=first_fail['region_detail'][d]
            details.append(f'{d.upper()} is below saturation: VDS={abs(q["vds"]):.4f} V, VDSAT={abs(q["vdsat"]):.4f} V (margin {q["margin"]*1e3:+.1f} mV)')
        first_reason.append('; '.join(details)+'; input pairs: '+first_fail['active_pair'])
report=['# ICMR verification report','','## Test setup','',f'The target is 0.50–1.30 V. The new sweep tested {len(points)} points at 0.05 V steps, using the existing unity-follower and series-injection loop-gain setup. It used SKY130A TT models at 27 °C, a 1.8 V supply and a 2 pF load.','', 'At each point, the test measured the DC output, loop gain, UGB, phase margin, supply current, both input-pair currents and both tail currents. It also recorded Id, VGS, VTH, VDS and model VDSAT for the bias, input, mirror and second-stage devices.','', 'A point passes only if output error is within ±10 mV, gain is at least 60 dB, UGB is at least 10 MHz, PM is at least 60°, power is below 500 µW, the OP and AC analyses complete, and the current sources/mirrors/gain devices pass the model VDS≥VDSAT check. At least one complete NMOS or PMOS input pair must conduct at ≥1 µA per device and pass that model check. The 10 mV tracking and 1 µA conduction limits are explicit screening criteria, not new circuit specifications.','', '## Results','',f'- Points tested: {len(points)}.','- Maximum absolute output tracking error: '+f'{max(errvals):.3f} mV.','- Gain across points with valid measurements: '+(f'{min(p["a0"] for p in valid):.2f}–{max(p["a0"] for p in valid):.2f} dB.' if valid else 'No valid gain measurements.'),'- UGB across points with valid measurements: '+(f'{min(p["ugb"] for p in valid)/1e6:.3f}–{max(p["ugb"] for p in valid)/1e6:.3f} MHz.' if valid else 'No valid UGB measurements.'),'- Phase margin across points with valid measurements: '+(f'{min(p["pm"] for p in valid):.2f}–{max(p["pm"] for p in valid):.2f}°.' if valid else 'No valid phase-margin measurements.'),'']
if ranges: report.append('- Actual verified sampled range(s): '+', '.join(f'{a[0]:.2f}–{a[-1]:.2f} V' for a in ranges)+'.')
else: report.append('- Actual verified sampled range: none; no point met every screening criterion.')
report += ['', 'Output tracking stays within ±10 mV through 1.00 V. It first exceeds that limit at 1.05 V; the error there is '+f'{next(p["error"] for p in points if abs(p["vcm"]-1.05)<1e-9):+.3f} mV.'+' The strict verified range ends earlier because a tail device leaves saturation at 0.95 V.','', 'The range is verified only at the listed 0.05 V sample points; the test does not prove behavior between points.','']
if first_fail: report += [f'First failing point from the low end: **{first_fail["vcm"]:.2f} V**. '+(' '.join(first_reason) if first_reason else 'One or more screening criteria failed; see the CSV and raw log.')+'.','']
else: report += ['No sampled point failed the screening criteria.','']
report += ['## Later failure points','','At 0.95 V, XPTAIL has VDS=0.2291 V and VDSAT=0.2594 V, so the model check places it in triode. At 1.00 V, gain is 52.11 dB (below 60 dB) and XMN2 is below VDSAT by 6.5 mV. At 1.05 V, tracking error is -19.800 mV and UGB is 9.875 MHz. At 1.30 V, output error is -196.231 mV, gain is 30.58 dB and UGB is 3.246 MHz; neither complete input pair passes the saturation check.','','## Changes to consider later','','No circuit changes were made. A later design pass should first address PMOS tail headroom near 0.95 V, then check high-side input-pair headroom, gain and output tracking.','']
status='PASS' if len(passed)==17 else ('PARTIAL' if ranges else 'FAIL')
report += ['## Reproduce','','From this folder, run `ngspice -b tb_icmr_0p50_1p30.spice`, then run `python3 parse_icmr_results.py` to rebuild the CSVs, plots and report.','']
report += [f'## Target status: {status}','',f'{len(passed)} of {len(points)} sampled points pass all screening criteria. The target is not counted as passed unless all 17 points pass. No circuit changes were made. Any required bias or device changes should be considered separately after reviewing the failure points.','','## Files','', '- `tb_icmr_0p50_1p30.spice` — new testbench.','- `icmr_sweep.log` — raw ngspice output.','- `icmr_summary.csv` — point-by-point tracking and AC summary.','- `icmr_device_operating_points.csv` — model operating-point values and region checks.','- `icmr_metrics.png`, `icmr_bias_currents.png`, `icmr_device_regions.png` — plots.','- `parse_icmr_results.py` — parser and plotting script.','']
(ROOT/'icmr_report.md').write_text('\n'.join(report))
print(f'Parsed {len(points)} points; point passes={len(passed)}; first fail={None if first_fail is None else first_fail["vcm"]}; working ranges={ranges}')
