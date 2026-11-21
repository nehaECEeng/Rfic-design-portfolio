import numpy as np
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from pathlib import Path

data = Path("results/data/lna_bw300")
out = Path("results/plots/lna_bw300")
out.mkdir(parents=True, exist_ok=True)

sp = np.genfromtxt(data / "lna_bw300_sparams.dat", names=True)
nf = np.genfromtxt(data / "lna_bw300_nf.dat", names=True)

f = sp["frequency"] / 1e9
fn = nf["frequency"] / 1e9

def save(name, title, xlabel, ylabel, series, labels):
    plt.figure(figsize=(9, 5.5))
    for y, label in zip(series, labels):
        plt.plot(f, y, label=label)
    plt.title(title)
    plt.xlabel(xlabel)
    plt.ylabel(ylabel)
    plt.grid(True, alpha=0.35)
    plt.legend()
    plt.tight_layout()
    plt.savefig(out / name, dpi=300)
    plt.close()

save("01_return_loss.png", "LNA Return Loss",
     "Frequency (GHz)", "Magnitude (dB)",
     [sp["s11db"], sp["s22db"]], ["S11", "S22"])

save("02_gain_isolation.png", "LNA Gain and Reverse Isolation",
     "Frequency (GHz)", "Magnitude (dB)",
     [sp["s21db"], sp["s12db"]], ["S21", "S12"])

plt.figure(figsize=(9, 5.5))
plt.plot(fn, nf["nf"], label="Noise figure")
plt.xlabel("Frequency (GHz)")
plt.ylabel("Noise figure (dB)")
plt.title("LNA Noise Figure")
plt.grid(True, alpha=0.35)
plt.legend()
plt.tight_layout()
plt.savefig(out / "03_noise_figure.png", dpi=300)
plt.close()

plt.figure(figsize=(9, 5.5))
plt.plot(f, sp["kfac"], label="Rollet K")
plt.plot(f, sp["mu"], label="Mu")
plt.plot(f, sp["mup"], label="Mu-prime")
plt.axhline(1, linestyle="--", linewidth=1, label="Stability limit")
plt.xlabel("Frequency (GHz)")
plt.ylabel("Stability factor")
plt.title("LNA Stability")
plt.grid(True, alpha=0.35)
plt.legend()
plt.tight_layout()
plt.savefig(out / "04_stability.png", dpi=300)
plt.close()

plt.figure(figsize=(9, 5.5))
plt.plot(f, sp["rin"], label="Input resistance")
plt.plot(f, sp["xin"], label="Input reactance")
plt.plot(f, sp["rout"], label="Output resistance")
plt.plot(f, sp["xout"], label="Output reactance")
plt.xlabel("Frequency (GHz)")
plt.ylabel("Impedance (ohms)")
plt.title("LNA Input and Output Impedances")
plt.grid(True, alpha=0.35)
plt.legend()
plt.tight_layout()
plt.savefig(out / "05_impedances.png", dpi=300)
plt.close()

print("Created plots:")
for p in sorted(out.glob("*.png")):
    print(p, f"{p.stat().st_size} bytes")
