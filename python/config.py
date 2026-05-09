# config.py

from pathlib import Path

# Main project folder
BASE_DIR = Path(r"C:\Analist\US_Economic_Indicators_Project")

# Data folders
RAW_DATA_DIR = BASE_DIR / "data" / "raw"
CLEANED_DATA_DIR = BASE_DIR / "data" / "cleaned"

# FRED series we want to download
FRED_SERIES = {
    "gdp_real": "GDPC1",
    "unemployment_rate": "UNRATE",
    "cpi_all_items": "CPIAUCSL",
    "federal_funds_rate": "FEDFUNDS",
    "sp500": "SP500",
    "recession_indicator": "USREC",
    "debt_to_gdp": "FYGFGDQ188S"
}