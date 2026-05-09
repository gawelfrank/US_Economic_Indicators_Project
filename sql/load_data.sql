-- load_data.sql

-- Create a temporary staging table for the cleaned CSV
DROP TABLE IF EXISTS staging_economic_data;

CREATE TABLE staging_economic_data (
    date DATE,
    value NUMERIC(18,4),
    indicator_name VARCHAR(100)
);

-- Load administrations
TRUNCATE TABLE dim_administration RESTART IDENTITY CASCADE;

COPY dim_administration (administration_id, president_name, party, start_date, end_date)
FROM 'C:/Analist/US_Economic_Indicators_Project/data/cleaned/administrations.csv'
DELIMITER ','
CSV HEADER;

-- Load cleaned economic data into staging
TRUNCATE TABLE staging_economic_data;

COPY staging_economic_data (date, value, indicator_name)
FROM 'C:/Analist/US_Economic_Indicators_Project/data/cleaned/economic_indicators_long.csv'
DELIMITER ','
CSV HEADER;

-- Load unique indicators
TRUNCATE TABLE dim_indicator RESTART IDENTITY CASCADE;

INSERT INTO dim_indicator (indicator_name)
SELECT DISTINCT indicator_name
FROM staging_economic_data
ORDER BY indicator_name;

-- Load fact table
TRUNCATE TABLE fact_economic_data RESTART IDENTITY CASCADE;

INSERT INTO fact_economic_data (date, value, indicator_id, administration_id)
SELECT
    s.date,
    s.value,
    i.indicator_id,
    a.administration_id
FROM staging_economic_data s
JOIN dim_indicator i
    ON s.indicator_name = i.indicator_name
LEFT JOIN dim_administration a
    ON s.date >= a.start_date
   AND s.date < a.end_date;