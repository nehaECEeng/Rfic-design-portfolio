"""Promote the verified v7/2x-Cc candidate into final, preserving v4 files."""
from pathlib import Path
import shutil

root = Path(__file__).resolve().parents[1]
backup = root / "backups/pre_v7_2xCc"
backup.mkdir(parents=True, exist_ok=True)
preserve = [
    "final/opamp_rri_final.spice",
    "final/tb_opamp_rri_final.spice",
    "results/final_loopgain_full.log",
    "results/common_mode_sweep.log",
    "results/common_mode_sweep.dat",
    "results/output_swing.log",
    "results/output_swing.dat",
    "results/transient_slew.log",
    "results/transient_step.dat",
    "results/ac_loopgain_vcm065.dat",
    "results/performance_summary.csv",
]
for rel in preserve:
    shutil.copy2(root / rel, backup / Path(rel).name)

shutil.copy2(root / "candidates/rri_tail_headroom_v7_2xCc.spice", root / "final/opamp_rri_final.spice")
sch = root / "final/opamp_rri.sch"
text = sch.read_text()
for before, after in (
    ("name=BN L=2 W=20", "name=BN L=2 W=80"),
    ("name=NTAIL L=2 W=20", "name=NTAIL L=2 W=80"),
    ("name=MN1 L=1 W=10", "name=MN1 L=1 W=320"),
    ("name=MN2 L=1 W=10", "name=MN2 L=1 W=320"),
    ("name=Cc model=cap_mim_m3_1 W=32 L=32", "name=Cc model=cap_mim_m3_1 W=64 L=32"),
):
    if text.count(before) != 1:
        raise SystemExit(f"Expected one schematic property {before!r}, got {text.count(before)}")
    text = text.replace(before, after)
sch.write_text(text)
