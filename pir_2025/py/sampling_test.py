import random

import matplotlib.pyplot as plt
import numpy as np

random.seed(2)
np.random.seed(2)


def gaussian(x, mu, sigma, a):
    return a / np.sqrt(2 * np.pi * sigma**2) * np.exp(-((x - mu) ** 2) / 2 / sigma**2)


def edge_centers(edges):
    left = edges[:-1]
    right = edges[1:]
    center = [0.5 * (l + r) for l, r in zip(left, right)]
    return center


def gaussians(x: float, param_list: list[(float, float, float)]) -> float:
    norm = sum([a for _, _, a in param_list])
    normed_params = [(mu, sigma, a / norm) for mu, sigma, a in param_list]

    result = 0
    for mu, sigma, a in normed_params:
        result += gaussian(x, mu, sigma, a)
    return result


def sample(param_list, num, resolution):
    resolution_adjusted_params = [
        (mu, np.sqrt(sigma**2 + resolution**2), a) for mu, sigma, a in param_list
    ]

    weights = [a for _, _, a in param_list]
    result = []
    paramset_selections = random.choices(
        population=resolution_adjusted_params, weights=weights, k=num
    )
    for params in paramset_selections:
        mu, sigma, _ = params
        result.append(np.random.normal(loc=mu, scale=sigma))
    return result


def main():
    faust_resolution = 2.5 / 2.355
    nimrod_resolution = 9.4 / 2.355

    bg_params = (94, 25, 1)

    peak1_params = (114, 0.5, 0.03)
    peak2_params = (126, 0.5, 0.05)
    peak3_params = (138, 0.5, 0.03)

    peaks = [
        bg_params,
        peak1_params,
        peak2_params,
        peak3_params,
    ]

    xs = np.linspace(start=40, stop=180, num=1000)
    ys = [gaussians(x, peaks) for x in xs]

    nimrod_sampling = sample(
        peaks,
        6500,
        nimrod_resolution,
    )
    faust_sampling = sample(
        peaks,
        186000,
        faust_resolution,
    )
    hist_nimrod, edges = np.histogram(nimrod_sampling, bins=240, range=(40, 180))
    hist_nimrod_xs = edge_centers(edges)
    hist_nimrod_err = np.sqrt(hist_nimrod)

    hist_faust, edges = np.histogram(faust_sampling, bins=240, range=(40, 180))
    hist_faust_xs = edge_centers(edges)
    hist_faust_err = np.sqrt(hist_faust)

    hist_nimrod = hist_nimrod
    hist_nimrod_err = hist_nimrod_err

    hist_faust = hist_faust
    hist_faust_err = hist_faust_err

    fig, axs = plt.subplots(1, 3, figsize=(14, 6))
    ax = axs[0]
    ax.errorbar(
        hist_nimrod_xs,
        hist_nimrod,
        yerr=hist_nimrod_err,
        color="k",
        # ls="",
        ms=2,
        marker="o",
        label="N=6.5k; 9.4 MeV FWHM",
    )
    ax.legend()

    ax.plot([94 - 9.4 / 2, 94 + 9.4 / 2], [15, 15], "-r")
    ax.annotate(
        "9.4 MeV FWHM",
        xy=(94, 15),
        xycoords="data",
        horizontalalignment="center",
        verticalalignment="bottom",
    )

    ax.set_ylim(0, None)
    ax = axs[1]
    ax.errorbar(
        hist_faust_xs,
        hist_faust,
        yerr=hist_faust_err,
        color="k",
        # ls="",
        ms=2,
        marker="o",
        label="N=186k; 2.5 MeV FWHM",
    )
    ax.legend()

    ax.plot([94 - 2.5 / 2, 94 + 2.5 / 2], [500, 500], "-r")
    ax.annotate(
        "2.5 MeV FWHM",
        xy=(94, 500),
        xycoords="data",
        horizontalalignment="center",
        verticalalignment="bottom",
    )
    ax.set_ylim(0, None)

    ax.set_ylim(0, None)
    ax = axs[2]
    ax.plot(xs, ys, "-k", label="Underlying Distribution")
    # ax.plot(xs, ys, "-k", label="Underlying Distribution")
    ax.legend()

    ax.set_ylim(0, None)
    plt.savefig("seminar\\fig\\sample_demo.png")
    # plt.show()

    return


if __name__ == "__main__":
    main()
