# U.S. Economic Indicators Dashboard

![U.S. Economic Indicators Dashboard](docs/dashboard_overview.png)

## Introduction
This project is an end-to-end data project where I used Python, SQL, and Power BI to explore major U.S. economic indicators over time. My goal was to build something that felt like a real analyst project from start to finish by collecting public data, cleaning it, storing it in a database, analyzing it with SQL, and turning it into an interactive dashboard.

The dashboard focuses on how key economic indicators changed across U.S. presidential administrations and gives users the ability to filter by party, president, and economic indicator.

## Background
I created this project to practice combining the three main tools I am learning: Python, SQL, and Power BI.

I wanted a project that would help me go beyond just building charts and actually work through the full process:
- pulling data
- cleaning data
- modeling data
- analyzing data
- building a dashboard

I chose U.S. economic indicators because they are public, meaningful, and work well for time-based analysis. I also wanted to explore how different indicators looked during Democratic and Republican administrations without trying to make causal claims. The goal of the project is descriptive analysis, not political argument.

The indicators included in Version 1 are:
- Real GDP
- Unemployment Rate
- CPI (All Items)
- Federal Funds Rate
- S&P 500
- Recession Indicator
- Debt to GDP

## Tools I Used
**Python**  
I used Python to pull data from public sources and clean it into a structured format that could be loaded into SQL.

**PostgreSQL**  
I used PostgreSQL to build the data model, load the cleaned data, and write analysis queries.

**Power BI**  
I used Power BI to create the interactive dashboard and build visuals that compare indicators by president and party.

**VS Code**  
I used VS Code for writing and running both Python and SQL.

## The Analysis
In the SQL portion of the project, I explored questions like:
- How many rows exist for each indicator?
- What was the average unemployment rate by president?
- What percentage of each presidency took place during recession periods?
- What was the average unemployment rate by party?
- How did major indicators vary across administrations?

These analysis steps helped me validate the dataset and also guided which visuals I chose to build in Power BI.

## Dashboard Features
The Power BI dashboard includes:
- **Average Unemployment Rate by President**
- **Recession Period % by President**
- **Indicator Trend Over Time**
- **Party slicer**
- **President slicer**
- **Indicator slicer**

The indicator slicer controls the trend chart so users can focus on one economic indicator at a time. The party and president slicers allow users to narrow the dashboard to specific administrations.

## What I Learned
This project helped me strengthen several important skills:

- pulling and cleaning public economic data with Python
- organizing data for analysis in SQL
- building fact and dimension tables in PostgreSQL
- writing SQL queries for grouped comparisons
- creating DAX measures in Power BI
- designing dashboard interactions and slicers
- thinking more carefully about how to present time series data clearly

One thing I learned quickly is that not all indicators should be placed on the same visual at the same time. Indicators like GDP, unemployment, recession flags, and the S&P 500 have very different scales, so it is much better to let the user focus on one at a time when looking at trends.

## Conclusions
This project gave me hands-on practice with the full analytics workflow using public data. It also helped me get more comfortable moving between Python, SQL, and Power BI in one connected project.

The final dashboard allows users to explore economic trends across presidential administrations in an interactive way, while keeping the analysis descriptive and easy to follow.

## Transparency Statement
This project is part of my learning journey toward becoming a data analyst.

I built this project as hands-on practice using public economic data. I worked through the data collection, cleaning, SQL modeling, analysis queries, and Power BI dashboard development as part of my own learning process.

ChatGPT was used as a learning and productivity tool to help me troubleshoot issues, understand concepts, and structure parts of the project more clearly.

## Project Structure
```text
US_Economic_Indicators_Project/
│
├── data/
│   ├── raw/
│   └── cleaned/
│
├── docs/
│
├── powerbi/
│   └── US_Economic_Indicators_Dashboard.pbix
│
├── python/
│   ├── config.py
│   ├── pull_fred_data.py
│   └── clean_data.py
│
├── sql/
│   ├── create_tables.sql
│   ├── load_data.sql
│   └── analysis_queries.sql
│
└── README.md