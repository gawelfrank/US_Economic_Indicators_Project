# clean_data.py

import pandas as pd
from config import RAW_DATA_DIR, CLEANED_DATA_DIR, FRED_SERIES


def clean_one_file(series_name):
    """
    Read one raw FRED CSV and clean it into a standard format.
    """
    file_path = RAW_DATA_DIR / f"{series_name}.csv"
    df = pd.read_csv(file_path)

    # Rename columns to a standard format
    df.columns = ["date", "value"]

    # Add indicator name
    df["indicator_name"] = series_name

    # Convert date column to datetime
    df["date"] = pd.to_datetime(df["date"], errors="coerce")

    # Convert value column to numeric
    df["value"] = pd.to_numeric(df["value"], errors="coerce")

    # Drop rows where date is missing
    df = df.dropna(subset=["date"])

    return df


def main():
    """
    Clean all raw FRED files and combine into one long-format dataset.
    """
    CLEANED_DATA_DIR.mkdir(parents=True, exist_ok=True)

    cleaned_dfs = []

    for series_name in FRED_SERIES.keys():
        print(f"Cleaning {series_name}...")
        cleaned_df = clean_one_file(series_name)
        cleaned_dfs.append(cleaned_df)

    combined_df = pd.concat(cleaned_dfs, ignore_index=True)

    output_file = CLEANED_DATA_DIR / "economic_indicators_long.csv"
    combined_df.to_csv(output_file, index=False)

    print(f"Cleaned file saved to: {output_file}")
    print(f"Total rows: {len(combined_df):,}")


if __name__ == "__main__":
    main()