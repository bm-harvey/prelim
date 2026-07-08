import cmasher as cmr
import matplotlib.pyplot as plt
import polars as pl


def main():
    df = pl.read_csv("data\\e_star_7a.csv").with_row_index()
    df = df.with_columns(shuffled_Estar=pl.col("Estar").shuffle(seed=34132))

    df_ordered_stats = (
        df.group_by(pl.col("index") // (df.height / 8))
        .agg(
            mean_idx=pl.mean("index"),
            mean=pl.mean("Estar"),
            q_25=pl.quantile("Estar", 0.25),
            q_50=pl.quantile("Estar", 0.50),
            q_75=pl.quantile("Estar", 0.75),
            q_05=pl.quantile("Estar", 0.05),
            q_95=pl.quantile("Estar", 0.95),
        )
        .sort(by="index")
    )
    df_unordered_stats = (
        df.group_by(pl.col("index") // (df.height / 8))
        .agg(
            mean_idx=pl.mean("index"),
            mean=pl.mean("shuffled_Estar"),
            q_25=pl.quantile("shuffled_Estar", 0.25),
            q_50=pl.quantile("shuffled_Estar", 0.50),
            q_75=pl.quantile("shuffled_Estar", 0.75),
            q_05=pl.quantile("shuffled_Estar", 0.05),
            q_95=pl.quantile("shuffled_Estar", 0.95),
        )
        .sort(by="index")
    )

    fig, axs = plt.subplots(1, 2, figsize=(8, 8), layout="tight")
    ax = axs[0]
    ax.hist2d(df["index"], df["Estar"], bins=(8, 200), cmap=cmr.neutral, norm="linear")
    ax.plot(df_ordered_stats["mean_idx"], df_ordered_stats["mean"], "-k")
    ax.plot(df_ordered_stats["mean_idx"], df_ordered_stats["q_25"], "--r")
    ax.plot(df_ordered_stats["mean_idx"], df_ordered_stats["q_75"], "--r")
    ax.plot(df_ordered_stats["mean_idx"], df_ordered_stats["q_50"], "-r")
    ax.plot(df_ordered_stats["mean_idx"], df_ordered_stats["q_95"], ":r")
    ax.plot(df_ordered_stats["mean_idx"], df_ordered_stats["q_05"], ":r")
    ax.set_ylabel("E* [MeV]")
    ax.set_xlabel("Index")

    ax = axs[1]
    ax.hist2d(
        df["index"],
        df["shuffled_Estar"],
        bins=(8, 200),
        cmap=cmr.neutral,
        norm="linear",
    )
    ax.plot(df_unordered_stats["mean_idx"], df_unordered_stats["mean"], "-k")
    ax.plot(df_unordered_stats["mean_idx"], df_unordered_stats["q_25"], "--r")
    ax.plot(df_unordered_stats["mean_idx"], df_unordered_stats["q_75"], "--r")
    ax.plot(df_unordered_stats["mean_idx"], df_unordered_stats["q_50"], "-r")
    ax.plot(df_unordered_stats["mean_idx"], df_unordered_stats["q_95"], ":r")
    ax.plot(df_unordered_stats["mean_idx"], df_unordered_stats["q_05"], ":r")
    ax.set_xlabel("Index")
    plt.savefig("e_star_by_time.png")

    fig, axs = plt.subplots(1, 1, figsize=(8, 8), layout="tight")

    ax = axs
    ax.set_ylabel("E* [MeV]")
    ax.set_xlabel("Index")

    ax.plot(
        df_ordered_stats["mean_idx"], df_ordered_stats["mean"], "-ok", label="left mean"
    )
    ax.plot(
        df_unordered_stats["mean_idx"],
        df_unordered_stats["mean"],
        "--ok",
        label="right mean",
    )
    ax.plot(
        df_ordered_stats["mean_idx"],
        df_ordered_stats["q_50"],
        "-or",
        label="left meadian",
    )
    ax.plot(
        df_unordered_stats["mean_idx"],
        df_unordered_stats["q_50"],
        "--or",
        label="right median",
    )
    ax.legend()

    plt.savefig("e_star_stats_by_time.png")

    plt.show()
    return


if __name__ == "__main__":
    main()
