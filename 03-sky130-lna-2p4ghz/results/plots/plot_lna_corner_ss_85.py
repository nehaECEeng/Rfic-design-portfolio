from pathlib import Path
import csv
import matplotlib.pyplot as plt

data_dir = Path("results/data/lna_corner_ss_85")
plot_dir = Path("results/plots/lna_corner_ss_85")
plot_dir.mkdir(parents=True, exist_ok=True)

def read_data(path):
    with open(path) as file:
        reader = csv.DictReader(file, delimiter=" ", skipinitialspace=True)
        return [
            {k: float(v) for k, v in row.items() if k and v}
            for row in reader
        ]

sp = read_data(data_dir / "lna_corner_ss_85_sparams.dat")
nf = read_data(data_dir / "lna_corner_ss_85_nf.dat")

f = [r["frequency"] / 1e9 for r in sp]
fn = [r["frequency"] / 1e9 for r in nf]
nf24 = min(nf, key=lambda r: abs(r["frequency"] - 2.4e9))["nf"]

def save(name):
    plt.tight_layout()
    plt.savefig(plot_dir / name, dpi=200, bbox_inches="tight")
    plt.close()

plt.figure(figsize=(9, 5))
plt.plot(f, [r["s11db"] for r in sp], label="S11")
plt.plot(f, [r["s22db"] for r in sp], label="S22")
plt.axhline(-10, linestyle="--", label="-10 dB")
plt.axvline(2.4, linestyle=":", label="2.4 GHz")
plt.xlabel("Frequency (GHz)")
plt.ylabel("Magnitude (dB)")
plt.title("SS Corner at 85°C — Return Loss")
plt.grid(True)
plt.legend()
save("01_return_loss.png")

plt.figure(figsize=(9, 5))
plt.plot(f, [r["s21db"] for r in sp], label="S21 (Forward Gain)")
plt.plot(f, [r["s12db"] for r in sp], label="S12 (Reverse Isolation)")
plt.axvline(2.4, linestyle=":")
plt.xlabel("Frequency (GHz)")
plt.ylabel("Magnitude (dB)")
plt.title("SS Corner at 85°C — Gain and Isolation")
plt.grid(True)
plt.legend()
save("02_gain_isolation.png")

plt.figure(figsize=(9, 5))
plt.plot(fn, [r["nf"] for r in nf], marker="o", markersize=3)
plt.axvline(2.4, linestyle=":", label=f"2.4 GHz: {nf24:.3f} dB")
plt.xlabel("Frequency (GHz)")
plt.ylabel("Noise Figure (dB)")
plt.title("SS Corner at 85°C — Noise Figure")
plt.grid(True)
plt.legend()
save("03_noise_figure.png")

plt.figure(figsize=(9, 5))
plt.plot(f, [r["kfac"] for r in sp], label="Rollet K")
plt.plot(f, [r["mu"] for r in sp], label="μ")
plt.plot(f, [r["mup"] for r in sp], label="μ′")
plt.axhline(1, linestyle="--", label="Stability threshold")
plt.axvline(2.4, linestyle=":")
plt.xlabel("Frequency (GHz)")
plt.ylabel("Stability Factor")
plt.title("SS Corner at 85°C — Stability")
plt.grid(True)
plt.legend()
save("04_stability.png")

plt.figure(figsize=(9, 5))
for key, label in [
    ("rin", "Rin"), ("xin", "Xin"),
    ("rout", "Rout"), ("xout", "Xout")
]:
    plt.plot(f, [r[key] for r in sp], label=label)
plt.axhline(50, linestyle="--", label="50 Ω reference")
plt.axvline(2.4, linestyle=":")
plt.xlabel("Frequency (GHz)")
plt.ylabel("Impedance (Ω)")
plt.title("SS Corner at 85°C — Input and Output Impedances")
plt.grid(True)
plt.legend()
save("05_impedances.png")

print("Created 5 plots in", plot_dir)
print(f"NF at 2.4 GHz: {nf24:.4f} dB")
print(f"Data points: S-parameters={len(sp)}, NF={len(nf)}")
