import argparse
from copy import copy

import matplotlib.pyplot as plt
import numpy as np
import polars as pl
from scipy.optimize import curve_fit


def main():
    cao_data = "data/e_rel_7a_cao_fig.dat"
    cao_data = pl.read_csv(cao_data, separator="\t").with_columns(
        err=pl.col("counts").sqrt()
    )

    natowitz_data = "data/e_star_7a_natowitz_cao.dat"
    natowitz_data = pl.read_csv(natowitz_data, separator="\t").with_columns(
        err=pl.col("counts").sqrt()
    )

    print(natowitz_data["counts"].sum())

    cao_data_repro = "data/e_rel_7a_cao_fig_repro.dat"
    cao_data_repro = pl.read_csv(cao_data_repro, separator="\t").with_columns(
        err=pl.col("counts").sqrt()
    )

    depastas_data = "data/e_rel_7a_depastas_fig_4.dat"
    depastas_data = pl.read_csv(depastas_data, separator="\t").with_columns(
        err=pl.col("counts").sqrt()
    )

    amd_data = "data/e_rel_7a_amd_cao_fig.dat"
    amd_data = pl.read_csv(amd_data, separator="\t").with_columns(
        err=pl.col("counts").sqrt()
    )

    fig, axs = plt.subplots(1, 1)

    # ax = axs[0]

    # ax.errorbar(
    # cao_data["e_star"],
    # cao_data["counts"],
    # yerr=cao_data["err"],
    # ls="",
    # ms=10,
    # marker="o",
    # color="red",
    # )

    # ax.set_xlim(50, 250)
    ax = axs
    ax.errorbar(
        depastas_data["e_star"],
        depastas_data["counts"] / depastas_data["counts"].sum(),
        ls="",
        marker="s",
        color="green",
        ms=10,
        label="Cao (Depastas)",
    )

    ax.errorbar(
        natowitz_data["e_star"],
        natowitz_data["counts"] / natowitz_data["counts"].sum() ,
        # yerr=cao_data["err"],
        ls="-",
        # ms=10,
        marker="",
        color="green",
        alpha=1,
        label="Cao (Natowitz)",
    )
    ax.set_xlim(50, 250)
    ax.errorbar(
        cao_data_repro["e_star"],
        cao_data_repro["counts"] / cao_data_repro["counts"].sum(),
        # yerr=cao_data["err"],
        ls="",
        ms=15,
        marker="o",
        color="red",
        alpha=0.2,
        label="Cao (Harvey w/ Plot Digitizer)",
    )
    ax.errorbar(
        cao_data["e_star"],
        cao_data["counts"] / cao_data["counts"].sum(),
        # yerr=cao_data["err"],
        ls="",
        ms=10,
        marker="o",
        color="red",
        alpha=1,
        label="Cao (Cao)",
    )
    ax.legend()

    plt.show()


if __name__ == "__main__":
    main()
