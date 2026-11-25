from pathlib import Path
root = Path(__file__).resolve().parents[1]
specs = {
    "tb_output_swing.spice": ("tb_v7_2xCc_output_swing.spice", "../results/v7_2xCc_output_swing.dat", "../results/output_swing.dat"),
    "tb_transient_slew.spice": ("tb_v7_2xCc_transient.spice", "../results/v7_2xCc_transient_step.dat", "../results/transient_step.dat"),
    "tb_ac_plot.spice": ("tb_v7_2xCc_ac_plot.spice", "../results/v7_2xCc_ac_loopgain.dat", "../results/ac_loopgain_vcm065.dat"),
}
for src, (dst, newout, oldout) in specs.items():
    text = (root / "simulation" / src).read_text()
    text = text.replace("../final/opamp_rri_final.spice", "../candidates/rri_tail_headroom_v7_2xCc.spice")
    text = text.replace(oldout, newout)
    (root / "simulation" / dst).write_text(text)
