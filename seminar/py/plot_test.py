import argparse
from copy import copy

import matplotlib
import matplotlib.pyplot as plt
import numpy as np
import polars as pl
from scipy.optimize import curve_fit

matplotlib.style.use("mystyle.mplstyle")


def gaussian(x, mu: float, sigma: float, amplitude: float) -> float:
    return (
        amplitude
        / np.sqrt(2 * np.pi * sigma**2)
        * np.exp(-((x - mu) ** 2) / 2 / sigma**2)
    )


def get_gaussian(
    peak_name: str, name: str, plot: bool = False
) -> (float, float, float):
    peak = (
        pl.read_csv(f"data/peaks/{name}_gmm/{peak_name}.tsv", separator="\t")
        .sort(by="x")
        .drop_nulls()
    )
    center_idx = int(np.argmax(peak["y"]))

    params, cov = curve_fit(
        gaussian,
        peak["x"],
        peak["y"],
        p0=[
            peak["x"][center_idx],
            10,
            peak["y"][center_idx],
        ],
    )

    if plot:
        fig, axs = plt.subplots(1, 1, layout="tight", dpi=200)
        ax = axs
        ax.plot(peak["x"], peak["y"], "ok", label=f"{peak_name}_{name}")

        xs = np.linspace(60, 220, num=1000)
        ys = gaussian(xs, *params)
        ax.plot(xs, ys, "-k", label=f"{peak_name}_{name} fit")

    return (params[0], params[1], params[2])


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("-w", default=None, type=int)
    parser.add_argument("-n", default="hannaman", type=str)
    parser.add_argument("--show_nimrod", action="store_true")
    args = parser.parse_args()

    fig, axs = plt.subplots(1, 1, layout="tight", figsize=(8, 8), dpi=200)

    data = "data/e_rel_7a_fig.dat"
    if args.n == "cao":
        # data = "data/e_rel_7a_cao_fig.dat"
        data = "data/e_rel_7a_depastas_fig_4.dat"
        nimrod_data = "data/e_rel_7a_cao_fig.dat"
        nimrod_data = (
            pl.read_csv(nimrod_data, separator="\t")
            .with_columns(err=pl.col("counts").sqrt())
            .sort(by="e_star")
        )

    exp_data = (
        pl.read_csv(data, separator="\t")
        .with_columns(err=pl.col("counts").sqrt())
        .sort(by="e_star")
    )

    if args.n == "cao":
        exp_data = exp_data.with_columns(
            counts=pl.col("counts"), err=pl.col("counts") * 0.25
        )

    g1_params = get_gaussian("G1", args.n)
    g2_params = get_gaussian("G2", args.n)
    g3_params = get_gaussian("G3", args.n)
    g4_params = get_gaussian("G4", args.n)
    g5_params = get_gaussian("G5", args.n)
    g6_params = get_gaussian("G6", args.n)

    # if args.n == "hannaman":
        # g1_params =  1.02 * 63.8, g1_params[1], g1_params[2]
        # g2_params =  1.02 * 73.1, g2_params[1], g2_params[2]
        # g3_params =  1.02 * 85.1, g3_params[1], g3_params[2]
        # g4_params =  1.02 * 101, g4_params[1], g4_params[2]
        # g5_params =  1.02 * 121, g5_params[1], g5_params[2]
        # g6_params =  1.02 * 139, g6_params[1], g6_params[2]

    print(g1_params)
    print(g2_params)
    print(g3_params)
    print(g4_params)
    print(g5_params)
    print(g6_params)

    # g1_params = (g1_params[0], g1_params[0], 0)
    # g6_params = (g6_params[0], g6_params[0], 0)

    x_low, x_high = 60, 180
    y_low, y_high = 50, 5000
    if args.n == "cao":
        x_low, x_high = 60, 230
        y_low, y_high = 3e-5, 0.04

    xs = np.linspace(start=x_low, stop=x_high, num=1000)
    # xs = exp_data["e_star"]

    g1_ys = gaussian(xs, *g1_params)
    g2_ys = gaussian(xs, *g2_params)
    g3_ys = gaussian(xs, *g3_params)
    g4_ys = gaussian(xs, *g4_params)
    g5_ys = gaussian(xs, *g5_params)
    g6_ys = gaussian(xs, *g6_params)

    total_ys = g1_ys + g2_ys + g3_ys + g4_ys + g5_ys + g6_ys

    if args.n == "cao":
        norm_total = 0
        for x in exp_data["e_star"]:
            y = (
                gaussian(x, *g1_params)
                + gaussian(x, *g2_params)
                + gaussian(x, *g3_params)
                + gaussian(x, *g4_params)
                + gaussian(x, *g5_params)
                + gaussian(x, *g6_params)
            )
            norm_total += y
        # exp_data = exp_data.with_columns(
        # counts=pl.col("counts") / pl.col("counts").sum() * norm_total,
        # err=pl.col("err") / pl.col("counts").sum() * norm_total,
        # )

    if args.n == "cao":
        nimrod_data = nimrod_data.with_columns(
            counts=pl.col("counts")
            / nimrod_data["counts"].sum()
            * exp_data["counts"].sum(),
            err=pl.col("err") / nimrod_data["counts"].sum() * exp_data["counts"].sum(),
        )
    ax = axs

    ax.set_ylabel("yield [a.u.]")
    ax.set_xlabel("$E^* [MeV]$")
    colors = [
        "deeppink",
        "red",
        "lime",
        "blue",
        "teal",
        "magenta",
    ]
    if args.n == "cao":
        colors = [
            "blue",
            "purple",
            "red",
            "magenta",
            "lime",
            "olive",
        ]

    ax.plot(xs, g1_ys, lw=3, color=colors[0], label="G1")
    ax.plot(xs, g2_ys, lw=3, color=colors[1], label="G2")
    ax.plot(xs, g3_ys, lw=3, color=colors[2], label="G3")
    ax.plot(xs, g4_ys, lw=3, color=colors[3], label="G4")
    ax.plot(xs, g5_ys, lw=3, color=colors[4], label="G5")
    ax.plot(xs, g6_ys, lw=3, color=colors[5], label="G6")
    ax.plot(xs, total_ys, lw=3, color="black", ls="-")

    ax.errorbar(
        exp_data["e_star"],
        exp_data["counts"],
        yerr=exp_data["err"],
        ls="",
        marker="s",
        color="green",
        markersize=8,
        capsize=5,
        label="org. data",
    )

    if args.n == "cao":
        if args.show_nimrod:
            ax.errorbar(
                nimrod_data["e_star"],
                nimrod_data["counts"],
                yerr=nimrod_data["err"],
                ls="",
                marker="o",
                color="red",
                markersize=8,
                capsize=5,
                label="nimrod data",
            )
    ax.legend(ncol=1)

    ax.set_xlim(x_low, x_high)
    ax.set_ylim(0, y_high)
    plt.savefig(f"fig/recreation/{args.n}_gmm_recreation_lin_no_predictions.png")

    ax.set_ylim(y_low, y_high)
    ax.set_yscale("log")
    # plt.show()
    plt.savefig(f"fig/recreation/{args.n}_gmm_recreation_log.png")
    ax.set_yscale("linear")
    ax.set_ylim(0, y_high)
    plt.savefig(f"fig/recreation/{args.n}_gmm_recreation_lin.png")

    ax.axvline(g1_params[0], color=colors[0])
    ax.axvline(g2_params[0], color=colors[1])
    ax.axvline(g3_params[0], color=colors[2])
    ax.axvline(g4_params[0], color=colors[3])
    ax.axvline(g5_params[0], color=colors[4])
    ax.axvline(g6_params[0], color=colors[5])

    window = args.w
    if window is not None:
        ax.axvspan(
            g1_params[0] - window, g1_params[0] + window, color=colors[0], alpha=0.2
        )
        ax.axvspan(
            g2_params[0] - window, g2_params[0] + window, color=colors[1], alpha=0.2
        )
        ax.axvspan(
            g3_params[0] - window, g3_params[0] + window, color=colors[2], alpha=0.2
        )
        ax.axvspan(
            g4_params[0] - window, g4_params[0] + window, color=colors[3], alpha=0.2
        )
        ax.axvspan(
            g5_params[0] - window, g5_params[0] + window, color=colors[4], alpha=0.2
        )
        ax.axvspan(
            g6_params[0] - window, g6_params[0] + window, color=colors[5], alpha=0.2
        )
        plt.savefig(f"fig/recreation/{args.n}_gmm_recreation_lin_w{window}.png")
        ax.axvline(114, color="black", lw=2)
        ax.axvline(126, color="black", lw=2)
        ax.axvline(138, color="black", lw=2, label="Cao Pred.")
        ax.legend()
        plt.savefig(f"fig/recreation/{args.n}_gmm_recreation_lin_w{window}_w_predictions.png")

        ranges = [
            (g1_params[0] - window, g1_params[0] + window),
            (g2_params[0] - window, g2_params[0] + window),
            (g2_params[0] - window, g2_params[0] + window),
        ]

    else:
        window = g1_params[1]
        ax.axvspan(
            g1_params[0] - window, g1_params[0] + window, color=colors[0], alpha=0.2
        )
        window = g2_params[1]
        ax.axvspan(
            g2_params[0] - window, g2_params[0] + window, color=colors[1], alpha=0.2
        )
        window = g3_params[1]
        ax.axvspan(
            g3_params[0] - window, g3_params[0] + window, color=colors[2], alpha=0.2
        )
        window = g4_params[1]
        ax.axvspan(
            g4_params[0] - window, g4_params[0] + window, color=colors[3], alpha=0.2
        )
        window = g5_params[1]
        ax.axvspan(
            g5_params[0] - window, g5_params[0] + window, color=colors[4], alpha=0.2
        )
        window = g6_params[1]
        ax.axvspan(
            g6_params[0] - window, g6_params[0] + window, color=colors[5], alpha=0.2
        )
        plt.savefig(f"fig/recreation/{args.n}_gmm_recreation_lin_wsigma.png")

        ax.axvline(114, color="black", lw=2)
        ax.axvline(126, color="black", lw=2)
        ax.axvline(138, color="black", lw=2, label="Cao Pred.")
        ax.legend()
        plt.savefig(
            f"fig/recreation/{args.n}_gmm_recreation_lin_wsigma_w_prediction.png"
        )

    # plt.show()
    return


if __name__ == "__main__":
    main()
