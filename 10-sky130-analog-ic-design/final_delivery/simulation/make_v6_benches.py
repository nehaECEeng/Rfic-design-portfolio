"""Generate candidate-v6 characterization benches without touching final benches."""
from pathlib import Path

root = Path(__file__).resolve().parents[1]
specs = {
    "tb_common_mode_sweep.spice": ("tb_v6_common_mode.spice", "../results/v6_common_mode_sweep.dat", "../results/common_mode_sweep.dat"),
    "tb_output_swing.spice": ("tb_v6_output_swing.spice", "../results/v6_output_swing.dat", "../results/output_swing.dat"),
    "tb_transient_slew.spice": ("tb_v6_transient.spice", "../results/v6_transient_step.dat", "../results/transient_step.dat"),
    "tb_ac_plot.spice": ("tb_v6_ac_plot.spice", "../results/v6_ac_loopgain.dat", "../results/ac_loopgain_vcm065.dat"),
}
for source_name, (target_name, output_name, old_output) in specs.items():
    text = (root / "simulation" / source_name).read_text()
    text = text.replace("../final/opamp_rri_final.spice", "../candidates/rri_tail_headroom_v6.spice")
    text = text.replace(old_output, output_name)
    (root / "simulation" / target_name).write_text(text)
