"""Parse explicit point-by-point ngspice OP values into a plotting table."""
from pathlib import Path
import re

root = Path(__file__).resolve().parents[1]
raw = (root / "results/common_mode_handover.log").read_text()
blocks = re.split(r"=== HANDOVER Vcm=([0-9.]+) ===", raw)
rows = []
for i in range(1, len(blocks), 2):
    vcm, body = float(blocks[i]), blocks[i + 1]
    flat = re.findall(r"v\((inp|out)\)\s*=\s*([-+0-9.eE]+)|@m\.xamp\.(xntail|xptail|xmn1|xmp1|xmn2|xmp2)\.[^\[]+\[id\]\s*=\s*([-+0-9.eE]+)", body)
    vals = {}
    for vname, vval, dname, dval in flat:
        vals[vname or dname] = float(vval or dval)
    keys = ("out", "xntail", "xptail", "xmn1", "xmp1", "xmn2", "xmp2")
    if not all(k in vals for k in keys):
        raise SystemExit(f"Could not parse Vcm={vcm}: found {sorted(vals)}")
    rows.append((vcm, *(vals[k] for k in keys)))
if len(rows) != 41:
    raise SystemExit(f"Expected 41 operating points, found {len(rows)}")
target = root / "results/common_mode_handover.dat"
target.write_text("# Vcm Vout I_XMNT I_XMPT I_XMN1 I_XMP1 I_XMN2 I_XMP2 (A for currents)\n" + "".join(" ".join(f"{x:.10e}" for x in row) + "\n" for row in rows))
print(f"Wrote {target} with {len(rows)} points")
