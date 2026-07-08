import matplotlib
import matplotlib.pyplot as plt
import numpy as np
import polars as pl

matplotlib.style.use("mystyle.mplstyle")
NUM_SAMPLE = 90_000
BINS = 81
RANGE = (60, 220)


def bin_centers(edges):
    edges_left = edges[0 : len(edges) - 1]
    edges_right = edges[1 : len(edges)]
    bin_centers = [(ll + rr) / 2 for ll, rr in zip(edges_left, edges_right)]
    return bin_centers


def gaus(x, mu=0, sigma=1, amp=1):
    return amp / np.sqrt(2 * np.pi * sigma**2) * np.exp(-((x - mu) ** 2) / 2 / sigma**2)


def main():
    df = pl.read_csv("data/e_star_7a.csv").with_row_index()
    df_shuffled = df.sample(df.height, shuffle=True, seed=90225)

    window = df.height // 8

    dfs = []
    dfs_shuffled = []

    start = 0
    stop = window

    while stop < df.height:
        print(start)
        print(stop)
        print(df.slice(start, window))
        dfs.append(df.slice(start, window))
        dfs_shuffled.append(df_shuffled.slice(start, window))
        start = stop
        stop += window

    # scaling_factor = num_rest / NUM_SAMPLE
    # counts_subset, _ = hist_subset

    # err_subset = np.sqrt(counts_subset)

    # normed_residuals = (counts_subset * scaling_factor - counts_rest) / np.sqrt(
    # (np.sqrt(counts_subset) * scaling_factor) ** 2 + np.sqrt(counts_rest) ** 2
    # )

    # counts_subset = counts_subset * scaling_factor
    # err_subset = err_subset * scaling_factor

    markers = ["o", "s", "^", "v", "*", "+", "x", "D"]

    fig, axs = plt.subplots(
        1,
        1,
        layout="tight",
        # sharex="all",
        # sharey="row",
        # height_ratios=[3, 1],
        figsize=(12, 9),
    )
    ax = axs
    # axs = axs.flatten()

    # fig.subplots_adjust(hspace=0, wspace=0)
    # ax = axs[0]
    for idx, df in enumerate(dfs):
        print(df)
        hist = np.histogram(
            df["Estar"],
            bins=BINS,
            range=RANGE,
        )
        counts, edges = hist
        err = np.sqrt(counts)
        e_stars = bin_centers(edges)

        ax.set_ylabel("Counts Scaled")
        ax.errorbar(
            e_stars,
            counts * 10 ** (7 - idx),
            yerr=err * 10 ** (7 - idx),
            ls="",
            marker=markers[idx],
            label=f"$\\tau = {idx}/8$",
            # color="black",
            zorder=idx,
        )
    ax.legend()
    ax.set_yscale("log")
    ax.set_xlim(60, 235)

    plt.savefig("fig/calib/7a_estar_split_8_log.png")
    fig, axs = plt.subplots(
        1,
        1,
        layout="tight",
        # sharex="all",
        # sharey="row",
        # height_ratios=[3, 1],
        figsize=(12, 9),
    )
    ax = axs
    # axs = axs.flatten()

    # fig.subplots_adjust(hspace=0, wspace=0)
    # ax = axs[0]

    e_stars = []

    for idx, df in enumerate(dfs):
        print(df)
        hist = np.histogram(
            df["Estar"],
            bins=BINS,
            range=RANGE,
        )
        counts, edges = hist
        err = np.sqrt(counts)
        e_stars = bin_centers(edges)

        ax.set_ylabel("Counts Scaled")
        ax.errorbar(
            e_stars,
            counts + 150 * (7 - idx),
            yerr=err,
            ls="",
            marker=markers[idx],
            label=f"$\\tau = {idx}/8$",
            # color="black",
            zorder=idx,
        )
    ax.legend()
    ax.set_yscale("linear")
    ax.set_xlim(60, 235)
    plt.savefig("fig/calib/7a_estar_split_8_linear.png")

    counts = []
    err = []
    counts_shuffled = []
    err_shuffled = []

    for idx, df in enumerate(dfs):
        print(df)
        hist = np.histogram(
            df["Estar"],
            bins=BINS,
            range=RANGE,
        )
        counts_this, edges = hist
        err_this = np.sqrt(counts_this)

        counts.append(counts_this)
        err.append(err_this)

        hist = np.histogram(
            dfs_shuffled[idx]["Estar"],
            bins=BINS,
            range=RANGE,
        )
        counts_this, edges = hist
        err_this = np.sqrt(counts_this)

        counts_shuffled.append(counts_this)
        err_shuffled.append(err_this)

    fig, axs = plt.subplots(
        8, 8, layout="constrained", figsize=(12, 9), sharex="all", sharey="all"
    )

    for idx_1 in range(0, 8):
        for idx_2 in range(idx_1 + 1, 8):
            ax = axs[idx_1][idx_2]

            ax.axhline(0, color="grey")

            ax.set_ylim(-3, 3)

            residuals = (counts[idx_1] - counts[idx_2]) / np.sqrt(
                counts[idx_1] + counts[idx_2]
            )
            ax.plot(e_stars, residuals, "ok", ms="2")

            residuals = [ r for r in residuals if not np.isnan(r)]

            print(f"({idx_1}, {idx_2}) : {np.std(residuals)**2}")
            ax = axs[idx_2][idx_1]
            ax.axhline(0, color="grey")

            ax.set_ylim(-3, 3)

            residuals = (counts_shuffled[idx_1] - counts_shuffled[idx_2]) / np.sqrt(
                counts_shuffled[idx_1] + counts_shuffled[idx_2]
            )
            ax.plot(e_stars, residuals, "or", ms="2")

            residuals = [ r for r in residuals if not np.isnan(r)]

            # print(np.std(residuals)**2)
            print(f"sh ({idx_1}, {idx_2}) : {np.std(residuals)**2}")

    axs[4][0].set_ylabel("Std. Residuals")
    axs[7][4].set_xlabel("$E^*$ [MeV]")


    fig.subplots_adjust(hspace=0, wspace=0)
    plt.savefig("fig/calib/monster_std_res.png")

    return  # main


if __name__ == "__main__":
    main()
