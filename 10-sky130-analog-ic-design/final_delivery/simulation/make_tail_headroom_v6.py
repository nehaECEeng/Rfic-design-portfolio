"""Create an isolated high-W, low-overdrive NMOS-pair/tail trial."""
from pathlib import Path
root = Path(__file__).resolve().parents[1]
src = (root / "final/opamp_rri_final.spice").read_text()
src = src.replace("XBN ibn ibn vss vss sky130_fd_pr__nfet_01v8_lvt L=2 W=20", "XBN ibn ibn vss vss sky130_fd_pr__nfet_01v8_lvt L=2 W=80")
src = src.replace("XNTAIL tn ibn vss vss sky130_fd_pr__nfet_01v8_lvt L=2 W=20", "XNTAIL tn ibn vss vss sky130_fd_pr__nfet_01v8_lvt L=2 W=32")
src = src.replace("XMN1 n1 inn tn vss sky130_fd_pr__nfet_01v8_lvt L=1 W=10", "XMN1 n1 inn tn vss sky130_fd_pr__nfet_01v8_lvt L=1 W=80")
src = src.replace("XMN2 n1st inp tn vss sky130_fd_pr__nfet_01v8_lvt L=1 W=10", "XMN2 n1st inp tn vss sky130_fd_pr__nfet_01v8_lvt L=1 W=80")
out = root / "candidates"
(out / "rri_tail_headroom_v6.spice").write_text(src)
tb = (root / "final/tb_opamp_rri_final.spice").read_text().replace(".include opamp_rri_final.spice", ".include rri_tail_headroom_v6.spice")
(out / "tb_rri_tail_headroom_v6.spice").write_text(tb)
op = (root / "simulation/tb_device_op.spice").read_text().replace("../final/opamp_rri_final.spice", "rri_tail_headroom_v6.spice")
(out / "tb_device_op_v6.spice").write_text(op)
