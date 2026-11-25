"""Create a lower-overdrive tail-reference trial."""
from pathlib import Path
root=Path(__file__).resolve().parents[1]
src=(root/"candidates/rri_tail_headroom_v7_2xCc.spice").read_text()
src=src.replace("XBN ibn ibn vss vss sky130_fd_pr__nfet_01v8_lvt L=2 W=80", "XBN ibn ibn vss vss sky130_fd_pr__nfet_01v8_lvt L=2 W=160")
src=src.replace("XNTAIL tn ibn vss vss sky130_fd_pr__nfet_01v8_lvt L=2 W=80", "XNTAIL tn ibn vss vss sky130_fd_pr__nfet_01v8_lvt L=2 W=160")
out=root/"candidates"
(out/"rri_tail_headroom_v8.spice").write_text(src)
tb=(root/"candidates/tb_rri_tail_headroom_v7_2xCc.spice").read_text().replace("rri_tail_headroom_v7_2xCc.spice","rri_tail_headroom_v8.spice")
(out/"tb_rri_tail_headroom_v8.spice").write_text(tb)
op=(root/"simulation/tb_device_op.spice").read_text().replace("../final/opamp_rri_final.spice","../candidates/rri_tail_headroom_v8.spice")
(root/"simulation/tb_device_op_v8.spice").write_text(op)
