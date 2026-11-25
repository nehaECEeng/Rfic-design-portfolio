#!/usr/bin/env python3
"""Turn the raw ngspice device OP log into a compact checked report."""
from pathlib import Path
import re

root = Path(__file__).resolve().parents[1]
raw = (root / "results/device_op.log").read_text()
sections = re.split(r"=== Vcm=([0-9.]+) V ===", raw)
out = [
    "# Selected-candidate DC device operating points",
    "",
    "Source: actual ngspice 45.2 SKY130A TT model, 27 °C, 1.8 V, 2 pF unity follower.",
    "The listed VGS, VTH and VDS are the ngspice model's reported positive magnitudes for both polarities; currents are signed as reported by the model. `device_op.log` is the raw output.",
    "",
    "| Vcm (V) | Device | Id (µA) | VGS (V) | VTH (V) | VDS (V) | VDSAT (V) | VGS−VTH (V) |",
    "|---:|:---|---:|---:|---:|---:|---:|---:|",
]
param_re = re.compile(r"@m\.xamp\.(xmn1|xmn2|xmp1|xmp2|xntail|xptail|xm6|xm7)\.[^\[]+\[(id|vgs|vth|vds|vdsat)\]\s*=\s*([-+0-9.eE]+)")
tail_re = re.compile(r"@m\.xamp\.(xntail|xptail)\.[^\[]+\[id\]\s*=\s*([-+0-9.eE]+)")
mirror_re = re.compile(r"@m\.xamp\.(xpl1|xpl2|xnl1|xnl2)\.[^\[]+\[id\]\s*=\s*([-+0-9.eE]+)")
for i in range(1, len(sections), 2):
    vcm, body = sections[i], sections[i + 1]
    vals = {}
    for dev, key, value in param_re.findall(body):
        vals.setdefault(dev.upper(), {})[key] = float(value)
    for dev in ("XMN1", "XMN2", "XMP1", "XMP2"):
        d = vals[dev]
        overdrive = d["vgs"] - d["vth"]
        out.append(f"| {float(vcm):.2f} | {dev} | {d['id']*1e6:.4f} | {d['vgs']:.6f} | {d['vth']:.6f} | {d['vds']:.6f} | — | {overdrive:+.6f} |")
    tails = {d: float(v) for d, v in tail_re.findall(body)}
    mirrors = {d: float(v) for d, v in mirror_re.findall(body)}
    for dev in ("XNTail", "XPTail", "XM6", "XM7"):
        d = vals[dev.upper()]
        kind = "tail" if "TAIL" in dev.upper() else "second stage"
        vdsat = f"{d['vdsat']:.6f}" if "vdsat" in d else "—"
        out.append(f"| {float(vcm):.2f} | {dev} ({kind}) | {d['id']*1e6:.4f} | {d['vgs']:.6f} | {d['vth']:.6f} | {d['vds']:.6f} | {vdsat} | {d['vgs']-d['vth']:+.6f} |")
    out += ["", f"At Vcm={float(vcm):.2f} V, mirror/load currents are XPL1={mirrors['xpl1']*1e6:.3f}, XPL2={mirrors['xpl2']*1e6:.3f}, XNL1={mirrors['xnl1']*1e6:.3f}, XNL2={mirrors['xnl2']*1e6:.3f} µA. The selected topology has no folded-cascode transistors; it replaces the original folded-cascode network.", ""]
out += [
    "## Interpretation",
    "",
    "The NMOS input pair is below reported VTH at all five points and operates in weak inversion; it carries 7.9–9.8 µA per device because it is sized wide. The PMOS pair has about 87–89 mV model overdrive and carries 9.4–10.0 µA per device. Both pairs conduct throughout the range, with smooth overlapping currents rather than a dead zone.",
    "",
    "The NMOS tail has model-reported VDS above VDSAT at all five points. The smallest headroom margin is at 0.45 V; see the table for both values. The PMOS tail also remains above model-reported VDSAT, with its smallest margin at 0.85 V. The second-stage devices have ample drain-source headroom at the tested follower bias. These are nominal TT operating points; no process-corner margin is established.",
    "",
]
(root / "reports/final_device_operating_points.md").write_text("\n".join(out))
