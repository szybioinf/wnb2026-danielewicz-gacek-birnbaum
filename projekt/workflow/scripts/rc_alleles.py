import sys
import pandas as pd

if "snakemake" in globals():
    input_tsv = snakemake.input[0]
    output_tsv = snakemake.output[0]
else:
    input_tsv, output_tsv = sys.argv[1], sys.argv[2]

df = pd.read_csv(input_tsv, sep="\t", dtype=str, keep_default_na=False)
complement = {"A": "T", "T": "A", "C": "G", "G": "C", "N": "N"}

mask = df["STRAND"] == "-"
df.loc[mask, "REF"] = df.loc[mask, "REF"].map(lambda x: complement.get(x, x))
df.loc[mask, "ALT"] = df.loc[mask, "ALT"].map(lambda x: complement.get(x, x))

df.to_csv(output_tsv, sep="\t", index=False)
