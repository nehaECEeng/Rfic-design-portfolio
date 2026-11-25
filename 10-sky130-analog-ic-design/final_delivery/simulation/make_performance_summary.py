"""Extract nominal metrics from the raw five-point ngspice run."""
from pathlib import Path
import re

root=Path(__file__).resolve().parents[1]
raw=(root/"results/final_loopgain_full.log").read_text()
parts=re.split(r"=== Vcm=([0-9.]+) V ===",raw)
rows=[]
for i in range(1,len(parts),2):
    vcm=float(parts[i]); body=parts[i+1]
    def value(name):
        match=re.search(rf"\b{name}\s*=\s*([-+0-9.eE]+)",body)
        if not match: raise SystemExit(f"Missing {name} at Vcm={vcm}")
        return float(match.group(1))
    rows.append((vcm,value("a0_db"),value("ugb")/1e6,value("phaseradatugb"),value("phasedegatugb"),value("pm_deg"),value("idd")*1e6,value("pwr")*1e6))
if len(rows)!=5: raise SystemExit(f"Expected five points; got {len(rows)}")
lines=["vcm_V,a0_at_1Hz_dB,ugb_MHz,phase_raw_rad,phase_continuous_deg,phase_margin_deg,idd_uA,power_uW,status\n"]
for vcm,g,u,pr,pd,pm,idd,pwr in rows:
    ok=g>=60 and u>=10 and pm>=60 and pwr<500
    lines.append(f"{vcm:.2f},{g:.5f},{u:.5f},{pr:.6f},{pd:.4f},{pm:.4f},{idd:.4f},{pwr:.4f},{'pass' if ok else 'fail'}\n")
(root/"results/performance_summary.csv").write_text("".join(lines))
