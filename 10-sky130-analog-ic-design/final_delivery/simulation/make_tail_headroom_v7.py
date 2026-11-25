"""Create an isolated stronger complementary-overlap candidate."""
from pathlib import Path
root = Path(__file__).resolve().parents[1]
src = (root / "final/opamp_rri_final.spice").read_text()
src = src.replace("XBN ibn ibn vss vss sky130_fd_pr__nfet_01v8_lvt L=2 W=20", "XBN ibn ibn vss vss sky130_fd_pr__nfet_01v8_lvt L=2 W=80")
src = src.replace("XNTAIL tn ibn vss vss sky130_fd_pr__nfet_01v8_lvt L=2 W=20", "XNTAIL tn ibn vss vss sky130_fd_pr__nfet_01v8_lvt L=2 W=80")
src = src.replace("XMN1 n1 inn tn vss sky130_fd_pr__nfet_01v8_lvt L=1 W=10", "XMN1 n1 inn tn vss sky130_fd_pr__nfet_01v8_lvt L=1 W=320")
src = src.replace("XMN2 n1st inp tn vss sky130_fd_pr__nfet_01v8_lvt L=1 W=10", "XMN2 n1st inp tn vss sky130_fd_pr__nfet_01v8_lvt L=1 W=320")
out = root / "candidates"
(out / "rri_tail_headroom_v7.spice").write_text(src)
tb = (root / "final/tb_opamp_rri_final.spice").read_text().replace(".include opamp_rri_final.spice", ".include rri_tail_headroom_v7.spice")
(out / "tb_rri_tail_headroom_v7.spice").write_text(tb)
