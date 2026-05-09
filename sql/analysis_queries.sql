-- First analysis query:
-- Count rows for each indicator

SELECT
    di.indicator_name,
    COUNT(*) AS row_count
FROM fact_economic_data fed
JOIN dim_indicator di
    ON fed.indicator_id = di.indicator_id
GROUP BY di.indicator_name
ORDER BY row_count DESC;

-- Second analysis query:
-- Average indicator value by administration

SELECT
    da.president_name,
    da.party,
    di.indicator_name,
    ROUND(AVG(fed.value), 2) AS avg_value
FROM fact_economic_data fed
JOIN dim_indicator di
    ON fed.indicator_id = di.indicator_id
LEFT JOIN dim_administration da
    ON fed.administration_id = da.administration_id
GROUP BY
    da.president_name,
    da.party,
    di.indicator_name
ORDER BY
    da.president_name,
    di.indicator_name;

    -- Third analysis query:
-- Average unemployment rate by president

SELECT
    da.president_name,
    da.party,
    ROUND(AVG(fed.value), 2) AS avg_unemployment_rate
FROM fact_economic_data fed
JOIN dim_indicator di
    ON fed.indicator_id = di.indicator_id
JOIN dim_administration da
    ON fed.administration_id = da.administration_id
WHERE di.indicator_name = 'unemployment_rate'
GROUP BY
    da.president_name,
    da.party
ORDER BY avg_unemployment_rate ASC;

-- Fourth analysis query:
-- Share of time in recession by president

SELECT
    da.president_name,
    da.party,
    ROUND(AVG(fed.value) * 100, 2) AS recession_period_pct
FROM fact_economic_data fed
JOIN dim_indicator di
    ON fed.indicator_id = di.indicator_id
JOIN dim_administration da
    ON fed.administration_id = da.administration_id
WHERE di.indicator_name = 'recession_indicator'
GROUP BY
    da.president_name,
    da.party
ORDER BY recession_period_pct DESC;

-- Fifth analysis query:
-- Average unemployment rate by party

SELECT
    da.party,
    ROUND(AVG(fed.value), 2) AS avg_unemployment_rate
FROM fact_economic_data fed
JOIN dim_indicator di
    ON fed.indicator_id = di.indicator_id
JOIN dim_administration da
    ON fed.administration_id = da.administration_id
WHERE di.indicator_name = 'unemployment_rate'
GROUP BY da.party
ORDER BY avg_unemployment_rate ASC;

-- Sixth analysis query:
-- Power BI friendly table with joined fields
-- Only keep rows that match an administration

SELECT
    fed.date,
    fed.value,
    di.indicator_name,
    da.president_name,
    da.party,
    da.start_date AS administration_start_date,
    da.end_date AS administration_end_date
FROM fact_economic_data fed
JOIN dim_indicator di
    ON fed.indicator_id = di.indicator_id
JOIN dim_administration da
    ON fed.administration_id = da.administration_id
ORDER BY fed.date, di.indicator_name;