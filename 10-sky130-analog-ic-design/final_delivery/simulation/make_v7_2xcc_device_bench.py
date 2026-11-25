from pathlib import Path
root = Path(__file__).resolve().parents[1]
text = (root / "simulation/tb_device_op.spice").read_text()
text = text.replace("../final/opamp_rri_final.spice", "../candidates/rri_tail_headroom_v7_2xCc.spice")
(root / "simulation/tb_device_op_v7_2xCc.spice").write_text(text)
