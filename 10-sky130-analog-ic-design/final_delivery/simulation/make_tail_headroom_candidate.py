"""Create an isolated trial with a weaker NMOS tail and stronger NMOS pair."""
from pathlib import Path

root = Path(__file__).resolve().parents[1]
source = (root / "final/opamp_rri_final.spice").read_text()
source = source.replace("XNTAIL tn ibn vss vss sky130_fd_pr__nfet_01v8_lvt L=2 W=20", "XNTAIL tn ibn vss vss sky130_fd_pr__nfet_01v8_lvt L=2 W=10")
source = source.replace("XMN1 n1 inn tn vss sky130_fd_pr__nfet_01v8_lvt L=1 W=10", "XMN1 n1 inn tn vss sky130_fd_pr__nfet_01v8_lvt L=1 W=40")
source = source.replace("XMN2 n1st inp tn vss sky130_fd_pr__nfet_01v8_lvt L=1 W=10", "XMN2 n1st inp tn vss sky130_fd_pr__nfet_01v8_lvt L=1 W=40")
outdir = root / "candidates"
(outdir / "rri_tail_headroom_v5.spice").write_text(source)
tb = (root / "final/tb_opamp_rri_final.spice").read_text()
tb = tb.replace(".include opamp_rri_final.spice", ".include rri_tail_headroom_v5.spice")
(outdir / "tb_rri_tail_headroom_v5.spice").write_text(tb)
op = (root / "simulation/tb_device_op.spice").read_text()
op = op.replace("../final/opamp_rri_final.spice", "rri_tail_headroom_v5.spice")
(outdir / "tb_device_op_v5.spice").write_text(op)
