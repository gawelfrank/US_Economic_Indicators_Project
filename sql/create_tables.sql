-- create_tables.sql

DROP TABLE IF EXISTS fact_economic_data;
DROP TABLE IF EXISTS dim_indicator;
DROP TABLE IF EXISTS dim_administration;

CREATE TABLE dim_indicator (
    indicator_id SERIAL PRIMARY KEY,
    indicator_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE dim_administration (
    administration_id INT PRIMARY KEY,
    president_name VARCHAR(100) NOT NULL,
    party VARCHAR(50) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE fact_economic_data (
    economic_data_id SERIAL PRIMARY KEY,
    date DATE NOT NULL,
    value NUMERIC(18,4),
    indicator_id INT NOT NULL,
    administration_id INT,
    CONSTRAINT fk_indicator
        FOREIGN KEY (indicator_id)
        REFERENCES dim_indicator(indicator_id),
    CONSTRAINT fk_administration
        FOREIGN KEY (administration_id)
        REFERENCES dim_administration(administration_id)
);