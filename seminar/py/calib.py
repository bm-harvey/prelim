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
    num_rest = df.height - NUM_SAMPLE

    hist_rest = np.histogram(
        df["Estar"][NUM_SAMPLE:],
        bins=BINS,
        range=RANGE,
    )
    counts_rest, edges = hist_rest
    err_rest = np.sqrt(counts_rest)
    e_stars = bin_centers(edges)

    hist_rest_shuffled = np.histogram(
        df_shuffled["Estar"][NUM_SAMPLE:],
        bins=BINS,
        range=RANGE,
    )
    err_rest = np.sqrt(counts_rest)
    counts_rest_shuffled, edges = hist_rest_shuffled
    err_rest_shuffled = np.sqrt(counts_rest_shuffled)

    hist_subset = np.histogram(
        df["Estar"][:NUM_SAMPLE],
        bins=BINS,
        range=RANGE,
    )
    hist_subset_shuffled = np.histogram(
        df_shuffled["Estar"][:NUM_SAMPLE],
        bins=BINS,
        range=RANGE,
    )

    scaling_factor = num_rest / NUM_SAMPLE
    counts_subset, _ = hist_subset

    counts_subset_shuffled, _ = hist_subset_shuffled
    err_subset = np.sqrt(counts_subset)
    err_subset_shuffled = np.sqrt(counts_subset_shuffled)

    normed_residuals = (counts_subset * scaling_factor - counts_rest) / np.sqrt(
        (np.sqrt(counts_subset) * scaling_factor) ** 2 + np.sqrt(counts_rest) ** 2
    )
    normed_residuals_shuffled = (
        counts_subset_shuffled * scaling_factor - counts_rest_shuffled
    ) / np.sqrt(
        (np.sqrt(counts_subset_shuffled) * scaling_factor) ** 2
        + np.sqrt(counts_rest_shuffled) ** 2
    )

    counts_subset = counts_subset * scaling_factor
    err_subset = err_subset * scaling_factor
    counts_subset_shuffled = counts_subset_shuffled * scaling_factor
    err_subset_shuffled = err_subset_shuffled * scaling_factor

    fig, axs = plt.subplots(
        2,
        2,
        layout="tight",
        sharex="all",
        sharey="row",
        height_ratios=[3, 1],
        figsize=(12, 9)
    )
    axs = axs.flatten()

    fig.subplots_adjust(hspace=0, wspace=0)

    ax = axs[0]
    ax.set_ylabel("Counts")
    ax.set_title("Time Ordered")
    ax.errorbar(
        e_stars,
        counts_rest,
        yerr=err_rest,
        ls="",
        marker="o",
        label="Last 90k",
        color="black",
        zorder=1
    )
    ax.errorbar(
        e_stars,
        counts_subset,
        yerr=err_subset,
        ls="",
        marker="o",
        label="First 90k",
        color="lightcoral",
        zorder=2
    )
    ax.legend()
    ax.set_yscale("log")

    ax = axs[1]
    ax.set_title("Time Shuffled")
    ax.errorbar(
        e_stars,
        counts_rest_shuffled,
        yerr=err_rest_shuffled,
        ls="",
        marker="o",
        label="Last 90k",
        color="black",
        zorder=1
    )
    ax.errorbar(
        e_stars,
        counts_subset_shuffled,
        yerr=err_subset_shuffled,
        ls="",
        marker="o",
        label="Scaled First 90k",
        color="steelblue",
        zorder=2
    )
    ax.legend()

    ax = axs[2]
    ax.set_ylim(-3, 3)
    ax.set_ylabel("Std. Res.")
    ax.set_xlabel("$E^*$ [MeV]")
    ax.set_ylim(-3, 3)
    ax.axhline(0, ls="-", color="grey")
    ax.axhline(-1, ls="--", color="grey")
    ax.axhline(+1, ls="--", color="grey")
    ax.axhline(-2, ls=":", color="grey")
    ax.axhline(+2, ls=":", color="grey")
    ax.errorbar(
        e_stars,
        normed_residuals,
        # yerr=[1 for _ in normed_residuals],
        ls="",
        marker="o",
        # label="Scaled Subsetted Data",
        color="lightcoral",
        zorder=2
    )
    ax.set_ylim(-3, 3)

    ax = axs[3]
    ax.set_xlabel("$E^*$ [MeV]")
    ax.axhline(0, ls="-", color="grey")
    ax.axhline(-1, ls="--", color="grey")
    ax.axhline(+1, ls="--", color="grey")
    ax.axhline(-2, ls=":", color="grey")
    ax.axhline(+2, ls=":", color="grey")
    ax.errorbar(
        e_stars,
        normed_residuals_shuffled,
        # yerr=[1 for _ in normed_residuals],
        ls="",
        marker="o",
        color="steelblue",
    )
    ax.set_ylim(-3, 3)
    ax.set_xlim(60, 220)

    # normed_residuals = [x for x in normed_residuals if not np.isnan(x)]
    # normed_residuals_shuffled = [
        # x for x in normed_residuals_shuffled if not np.isnan(x)
    # ]

    # print(np.std(normed_residuals) ** 2)
    # print(np.std(normed_residuals_shuffled) ** 2)

    # print(np.sum(np.pow(normed_residuals, 2)) / (len(normed_residuals) - 1))
    # print(
        # np.sum(np.pow(normed_residuals_shuffled, 2))
        # / (len(normed_residuals_shuffled) - 1)
    # )
    plt.savefig("fig/calib/calib_natowitz_split_with_shuffle.png")

    fig, axs = plt.subplots(
        2,
        1,
        layout="tight",
        sharex="all",
        # sharey="row",
        height_ratios=[3, 1],
        figsize=(8, 9)
    )
    axs = axs.flatten()

    fig.subplots_adjust(hspace=0, wspace=0)

    ax = axs[0]
    ax.set_ylabel("Counts")
    ax.set_title("Time Ordered")
    ax.errorbar(
        e_stars,
        counts_rest,
        yerr=err_rest,
        ls="",
        marker="o",
        label="Last 90k",
        color="black",
        zorder=1
    )
    ax.errorbar(
        e_stars,
        counts_subset,
        yerr=err_subset,
        ls="",
        marker="o",
        label="First 90k",
        color="lightcoral",
        zorder=2
    )
    ax.legend()
    ax.set_yscale("log")

    ax = axs[1]
    ax.set_ylim(-3, 3)
    ax.set_ylabel("Std. Res.")
    ax.set_xlabel("$E^*$ [MeV]")
    ax.set_ylim(-3, 3)
    ax.axhline(0, ls="-", color="grey")
    ax.axhline(-1, ls="--", color="grey")
    ax.axhline(+1, ls="--", color="grey")
    ax.axhline(-2, ls=":", color="grey")
    ax.axhline(+2, ls=":", color="grey")
    ax.errorbar(
        e_stars,
        normed_residuals,
        # yerr=[1 for _ in normed_residuals],
        ls="",
        marker="o",
        # label="Scaled Subsetted Data",
        color="lightcoral",
    )
    ax.set_ylim(-3, 3)

    plt.savefig("fig/calib/calib_natowitz_split.png")
    plt.show()

    return  # main


if __name__ == "__main__":
    main()
