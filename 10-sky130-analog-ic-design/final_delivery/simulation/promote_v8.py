"""Promote the v8 tail-headroom candidate and retain the v7 state as backup."""
from pathlib import Path
import shutil
root=Path(__file__).resolve().parents[1]
backup=root/"backups/pre_v8"
backup.mkdir(parents=True,exist_ok=True)
for rel in (
    "final/opamp_rri_final.spice",
    "final/opamp_rri.sch",
    "final/tb_opamp_rri_final.spice",
    "simulation/xschem_netlist/opamp_rri.sch.spice",
    "results/final_loopgain_full.log",
    "results/common_mode_handover.log",
    "results/common_mode_handover.dat",
    "results/device_op.log",
    "results/performance_summary.csv",
    "reports/design_report.md",
    "reports/final_device_operating_points.md",
):
    shutil.copy2(root/rel,backup/Path(rel).name)
shutil.copy2(root/"candidates/rri_tail_headroom_v8.spice",root/"final/opamp_rri_final.spice")
sch=root/"final/opamp_rri.sch"
text=sch.read_text()
for before,after in (
    ("name=BN L=2 W=80","name=BN L=2 W=160"),
    ("name=NTAIL L=2 W=80","name=NTAIL L=2 W=160"),
):
    if text.count(before)!=1:
        raise SystemExit(f"Expected one schematic property {before!r}, got {text.count(before)}")
    text=text.replace(before,after)
sch.write_text(text)
