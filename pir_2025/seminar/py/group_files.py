import matplotlib.pyplot as plt
import numpy as np
import polars as pl


def integral(counts):
    integral = 0
    for count in counts:
        integral += count

    return integral


def mean(bin_centers, counts):
    integral = 0
    weighted_sum = 0
    for cent, count in zip(bin_centers, counts):
        integral += count
        weighted_sum += count * cent

    return weighted_sum / integral


df_raw = pl.read_parquet("data\\e_rel_7a.parquet")

print(df_raw.height)


real_file_name = "data\\e_rel_7a.dat"
real_df = pl.read_csv(real_file_name, separator=" ")

limited_mixed_file_name = "data\\e_rel_7a_mixed_limited.dat"
limited_mixed_df = pl.read_csv(limited_mixed_file_name, separator=" ")

mixed_file_name = "data\\e_rel_7a_mixed.dat"
mixed_df = pl.read_csv(mixed_file_name, separator=" ")


q_value = -38.4672


# print(df)

fig, axs = plt.subplots(1, 1, layout="tight")
ax = axs

# plt.hist(df["e_rel_7a_0_MeV"], range=(0, 150), bins=1000, histtype="step", color="k")
ax.errorbar(real_df["bin_center"], real_df["counts"], yerr=real_df["err"], fmt=".k")

# ax.errorbar(
# real_df["bin_left"], real_df["counts"], yerr=real_df["counts"] * 0.05, fmt=".b"
# )
ax.errorbar(
    limited_mixed_df["bin_center"],
    limited_mixed_df["counts"],
    yerr=limited_mixed_df["err"],
    fmt=".r",
    alpha=0.5,
)

ax.errorbar(mixed_df["bin_center"], mixed_df["counts"] * 0.0211, yerr=mixed_df["err"]*0.0211, fmt="-r")


print(integral(real_df["counts"]) / integral(mixed_df["counts"]))

ax.axvline(114)
ax.axvline(126)
ax.axvline(138)

fig, axs = plt.subplots(1, 1, layout="tight")
ax = axs

plt.show()
