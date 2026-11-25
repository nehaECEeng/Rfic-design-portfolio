"""Create a v7 stability trial with doubled MIM compensation capacitance."""
from pathlib import Path
root=Path(__file__).resolve().parents[1]
src=(root/"candidates/rri_tail_headroom_v7.spice").read_text()
src=src.replace("XCc z out sky130_fd_pr__cap_mim_m3_1 W=32 L=32", "XCc z out sky130_fd_pr__cap_mim_m3_1 W=64 L=32")
out=root/"candidates"
(out/"rri_tail_headroom_v7_2xCc.spice").write_text(src)
tb=(root/"candidates/tb_rri_tail_headroom_v7.spice").read_text().replace("rri_tail_headroom_v7.spice","rri_tail_headroom_v7_2xCc.spice")
(out/"tb_rri_tail_headroom_v7_2xCc.spice").write_text(tb)
