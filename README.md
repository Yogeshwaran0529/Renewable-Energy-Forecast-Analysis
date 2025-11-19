# Renewable-Energy-Forecast-Analysis
Wind Energy Forecast Analysis
1. Introduction

Renewable energy is a critical alternative to conventional power sources, with wind energy playing a key role in sustainable electricity generation.
This project focuses on understanding and forecasting wind-based power generation patterns using meteorological parameters such as wind speed, temperature, and humidity.

The dataset contains hourly data on wind speed (at 10m & 100m heights), temperature, air density, and energy output (kWh) across multiple Indian locations:

Davanagere

Kanniyakumari

Jaisalmer

Kutch

Timeline: January – March 2024

The project involves data cleaning, analysis, forecasting, and creation of an interactive Excel dashboard to visualize key metrics and trends.

2. Objectives

Combine wind energy data from multiple district-level CSV files into a unified dataset using MySQL.

Clean and organize data including wind speed (10m & 100m), temperature, humidity, pressure, location, and energy output (kWh).

Calculate additional time-based fields: month, date, and hour for temporal analysis.

Analyze relationships between wind speed, temperature, humidity, and total energy generation.

Forecast future wind energy production using historical patterns.

Compare energy generation performance across multiple locations.

Design an interactive Excel dashboard to display metrics, trends, and forecasts for decision-making.

3. Methodology
a) SQL Phase – Database Design, Cleaning, and Insights

Database Setup:

Created wind_energy_project database and tables matching the CSV schema.

Data Verification:

Checked schema and row counts to ensure proper import.

Data Cleaning:

Removed duplicates by aggregating values into cleaned_table.

SQL Insights:

Overall Energy Range: 41.64 kWh – 19,583.9 kWh

State-wise Energy Performance: Highest: Rajasthan (4,643 kWh), Lowest: Karnataka (4,509 kWh)

Wind Speed Distribution (100m & 10m): Avg 11.1 m/s at 100m, Kanniyakumari highest at 11.19 m/s

Wind Speed vs Energy Output: Strong cubic relationship

Temperature Impact: 6.4°C – 40.3°C; moderate temperatures improve efficiency

Humidity Influence: High humidity reduces output; medium humidity optimal

Hourly Wind Patterns: Stable 00:00–06:00 hrs, peaks at 09:00–12:00 hrs

Daily Trends: 300k–530k kWh/day; variable weather patterns

Monthly Comparison: February highest generation (4,639 kWh), March lowest (4,507 kWh)

b) Excel Phase – Dashboard Visualization

Line Chart: Hourly Wind Speed Pattern → Peak at 20:00 hrs

Bar Chart: Temperature & Humidity vs Energy Output → Medium humidity & moderate temperature yield maximum

Pie Chart: Humidity-wise Energy Output → Medium humidity contributes highest share

Column Chart: Average Monthly Energy Generation → February highest

Pie Chart: Month-wise Average Temperature → February 25.1°C

Line Chart: Daily Energy Generation Trend → Peaks on 10th, 13th, 21st

Forecast Line Chart: Predicted total energy for April → steady increase

Combo Chart: Energy & Wind Speed Comparison Across Locations → Davanagere highest wind speed and output

KPI Cards: Summary indicators like total energy, average wind speed, peak hour

4. Results and Insights
i) Overall Performance Summary

Total Energy Generated: 0.32M kWh

Average Wind Speed (100m): 11.79 m/s

Highest Energy Generation: 15.21 kWh

Peak Hour: 20:00 hrs

Temperature Range: 16.6°C – 29.8°C

ii) Hourly Wind Speed Pattern

Stable around 11.8 m/s at 20:00 hrs → optimal for evening generation

iii) Temperature & Humidity Impact

Max energy (~1.4k kWh) occurs at 24–28°C

Moderate humidity improves turbine efficiency

iv) Humidity-wise Energy Output

Medium humidity contributes the highest average (~5.5 kWh)

High or low humidity slightly reduces output

v) Location-wise Comparison

Davanagere: Highest wind speed (12.82 m/s) & energy

Kutch & Kanniyakumari: Moderate wind speed (~11.7–11.8 m/s) & steady generation

Jaisalmer: Balanced speed-output ratio

Coastal & semi-arid regions perform better due to high-altitude winds

vi) Daily Energy Trend

Fluctuates between 0.02M – 0.04M kWh/day

Peaks mid-month, dips due to natural wind variability

vii) Forecasting Total Energy for April

Predicts stable upward trend

Confirms reliability of turbines for near-term production

viii) Temperature Overview

February average: 25.1°C → optimal turbine operation

5. Technologies Used

SQL: MySQL for database creation, cleaning, and insights

Excel: Pivot tables, conditional formatting, forecasting, interactive dashboard

6. Dataset

The dataset contains hourly wind energy data for Jan–Mar 2024 across four districts in India, including:

Wind speed (10m & 100m)

Temperature (°C)

Humidity levels

Air density

Energy output (kWh)
