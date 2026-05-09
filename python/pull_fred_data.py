# pull_fred_data.py

import pandas as pd
import requests
from config import RAW_DATA_DIR, FRED_SERIES


BASE_FRED_URL = "https://fred.stlouisfed.org/graph/fredgraph.csv?id="


def download_fred_series(series_name, series_id):
    """
    Download one FRED series and save it as a CSV file.
    """
    url = f"{BASE_FRED_URL}{series_id}"
    response = requests.get(url, timeout=30)
    response.raise_for_status()

    output_file = RAW_DATA_DIR / f"{series_name}.csv"

    with open(output_file, "wb") as file:
        file.write(response.content)

    print(f"Saved: {output_file}")


def main():
    """
    Download all FRED series listed in config.py
    """
    RAW_DATA_DIR.mkdir(parents=True, exist_ok=True)

    for series_name, series_id in FRED_SERIES.items():
        print(f"Downloading {series_name} ({series_id})...")
        download_fred_series(series_name, series_id)

    print("All raw FRED files downloaded successfully.")


if __name__ == "__main__":
    main()