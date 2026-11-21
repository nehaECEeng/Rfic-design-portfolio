import numpy as np
import matplotlib.pyplot as plt
from pathlib import Path

data_dir = Path("results/data/lna_q8_m4")
plot_dir = Path("results/plots/q8_m4")
plot_dir.mkdir(parents=True, exist_ok=True)

# Load actual ngspice-exported data
sp = np.loadtxt(data_dir / "q8_m4_sparams.dat", skiprows=1)
nf = np.loadtxt(data_dir / "q8_m4_nf.dat", skiprows=1)

f = sp[:, 0] / 1e9
fnf = nf[:, 0] / 1e9

def finish_plot(fig, filename):
    fig.tight_layout()
    fig.savefig(plot_dir / filename, dpi=300, bbox_inches="tight")
    plt.close(fig)
    print("Created:", plot_dir / filename)

def mark_24(ax):
    ax.axvline(2.4, color="gray", linestyle="--",
               linewidth=1, label="2.4 GHz")

# 1. Input and output return loss
fig, ax = plt.subplots(figsize=(10, 6))
ax.plot(f, sp[:, 1], label="S11")
ax.plot(f, sp[:, 4], label="S22")
mark_24(ax)
ax.set(title="Q8/M4 LNA — Input and Output Return Loss",
       xlabel="Frequency (GHz)", ylabel="Magnitude (dB)")
ax.set_xlim(1, 4)
ax.set_ylim(-80, 0)
ax.grid(True, alpha=0.3)
ax.legend()
finish_plot(fig, "01_return_loss.png")

# 2. Forward and reverse transmission
fig, ax = plt.subplots(figsize=(10, 6))
ax.plot(f, sp[:, 2], label="S21 — Forward Gain")
ax.plot(f, sp[:, 3], label="S12 — Reverse Isolation")
mark_24(ax)
ax.set(title="Q8/M4 LNA — Forward Gain and Reverse Isolation",
       xlabel="Frequency (GHz)", ylabel="Magnitude (dB)")
ax.set_xlim(1, 4)
ax.grid(True, alpha=0.3)
ax.legend()
finish_plot(fig, "02_gain_isolation.png")

# 3. Noise figure
fig, ax = plt.subplots(figsize=(10, 6))
ax.plot(fnf, nf[:, 1], label="Noise Figure")
mark_24(ax)
ax.set(title="Q8/M4 LNA — Noise Figure",
       xlabel="Frequency (GHz)", ylabel="Noise Figure (dB)")
ax.set_xlim(1, 5)
ax.grid(True, alpha=0.3)
ax.legend()
finish_plot(fig, "03_noise_figure.png")

# 4. Stability factors
fig, ax = plt.subplots(figsize=(10, 6))
ax.plot(f, sp[:, 9], label="Rollet K")
ax.plot(f, sp[:, 11], label="Mu")
ax.plot(f, sp[:, 12], label="Mu-prime")
ax.axhline(1, color="black", linestyle=":", label="Stability threshold")
mark_24(ax)
ax.set(title="Q8/M4 LNA — Stability Factors",
       xlabel="Frequency (GHz)", ylabel="Stability Factor")
ax.set_xlim(1, 4)
ax.set_ylim(bottom=0)
ax.grid(True, alpha=0.3)
ax.legend()
finish_plot(fig, "04_stability.png")

# 5. Input and output impedances
fig, axes = plt.subplots(2, 1, figsize=(10, 9), sharex=True)

axes[0].plot(f, sp[:, 5], label="Input Resistance")
axes[0].plot(f, sp[:, 7], label="Output Resistance")
axes[0].set_ylabel("Resistance (Ohms)")
axes[0].set_title("Q8/M4 LNA — Input and Output Impedance")
axes[0].grid(True, alpha=0.3)
axes[0].legend()
mark_24(axes[0])

axes[1].plot(f, sp[:, 6], label="Input Reactance")
axes[1].plot(f, sp[:, 8], label="Output Reactance")
axes[1].set_xlabel("Frequency (GHz)")
axes[1].set_ylabel("Reactance (Ohms)")
axes[1].grid(True, alpha=0.3)
axes[1].legend()
mark_24(axes[1])

axes[1].set_xlim(1, 4)
finish_plot(fig, "05_impedances.png")

print("\nAll five Q8/M4 plots generated successfully.")
