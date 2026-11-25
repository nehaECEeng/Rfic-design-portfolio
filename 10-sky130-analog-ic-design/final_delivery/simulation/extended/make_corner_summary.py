#!/usr/bin/env python3
"""Parse raw TT/SS/FF ngspice corner logs into a pointwise CSV."""
from pathlib import Path
import re, csv
root=Path(__file__).resolve().parents[2]
rows=[]
for corner in ("tt", "ss", "ff"):
    text=(root / "results" / "extended" / f"loopgain_{corner}.log").read_text(errors="replace")
    blocks=re.split(r"=== Vcm=([0-9.]+) V ===", text)
    for i in range(1, len(blocks), 2):
        cm=float(blocks[i]); body=blocks[i+1]; d={}
        for key in ("a0_db", "ugb", "phaseradatugb", "phasedegatugb", "pm_deg", "idd", "pwr"):
            m=re.search(rf"^\s*{key}\s*=\s*([-+0-9.eE]+)", body, re.M|re.I)
            if not m: raise SystemExit(f"missing {key} in {corner} at Vcm={cm}")
            d[key]=float(m.group(1))
        if abs(d["phaseradatugb"]*180/3.141592653589793-d["phasedegatugb"])>0.02 or abs(180+d["phasedegatugb"]-d["pm_deg"])>0.02: raise SystemExit("phase audit failed")
        if abs(1.8*d["idd"]-d["pwr"])>2e-9: raise SystemExit("current/power audit failed")
        rows.append([corner.upper(),cm,d["a0_db"],d["ugb"]/1e6,d["phaseradatugb"],d["phasedegatugb"],d["pm_deg"],d["idd"]*1e6,d["pwr"]*1e6])
if len(rows)!=15: raise SystemExit(f"expected 15 points; got {len(rows)}")
out=root/"results"/"extended"/"corner_summary.csv"
with out.open("w", newline="") as f:
    w=csv.writer(f); w.writerow(["corner","vcm_V","A0_dB","UGB_MHz","phase_raw_rad","phase_deg","PM_deg","Idd_uA","power_uW","status"]);
    for r in rows: w.writerow(r+["pass" if r[2]>=60 and r[3]>=10 and r[6]>=60 and r[8]<500 else "fail"])
print(f"wrote {out} ({len(rows)} points)")
