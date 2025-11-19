# Renewable-Energy-Forecast-Analysis

#🌬️ Wind Energy Forecast Analysis

## 🧠 Project Overview

This project focuses on analyzing and forecasting wind energy generation across multiple Indian locations using meteorological data.
The goal is to understand patterns in wind speed, temperature, humidity, and their impact on energy output, and to create an interactive Excel dashboard for monitoring and decision-making.


Tools used: MySQL, Excel

Locations analyzed:

Davanagere

Kanniyakumari

Jaisalmer

Kutch

Timeline: January – March 2024


📋 Table of Contents

Project Overview

Problem Statement

Data Source

Data Cleaning / Preparation

Excel Dashboard

Dashboard Image

Key Insights

Recommendations

Limitations

❓ Problem Statement

Wind energy is a sustainable alternative to conventional power sources. To optimize energy generation, it is crucial to understand:

How wind speed, temperature, and humidity influence turbine output

Daily, hourly, and monthly energy patterns

Location-wise performance differences

Forecasts for future energy production

The project aims to analyze historical patterns and predict trends to assist decision-making in wind energy management.

🗂️ Data Source

Dataset: Hourly wind energy data from four Indian districts

Timeframe: January – March 2024

Columns included:
Location, Date, Hour, Wind_Speed_10m, Wind_Speed_100m, Temperature, Humidity, Air_Density, Energy_Output_kWh

🧹 Data Cleaning / Preparation

Imported multiple CSV files into MySQL and combined into a unified dataset

Removed duplicate records and verified row counts

Standardized column names and data types

Calculated additional fields: month, date, hour

Verified logical consistency across wind speed, temperature, and energy output

📊 Excel Dashboard

The dashboard was created in Excel to visualize trends and insights:

Line Chart: Hourly wind speed pattern → Peak at 20:00 hrs

Bar Chart: Temperature & humidity vs energy output → Medium humidity & moderate temperature yield maximum

Pie Chart: Humidity-wise energy contribution → Medium humidity highest

Column Chart: Average monthly energy generation → February highest

Forecast Line Chart: Predicted total energy for April → upward trend

Combo Chart: Energy & wind speed comparison across locations → Davanagere highest output

KPI Cards: Total energy, average wind speed, peak hour indicators

🖼️ Dashboard Image

Below is a snapshot of the Excel dashboard:

📈 Key Insights
🔹 Overall Performance Summary

Total Energy Generated: 0.32M kWh

Average Wind Speed (100m): 11.79 m/s

Peak Hour: 20:00 hrs

Temperature Range: 16.6°C – 29.8°C

🔹 Hourly Wind Speed Pattern

Stable around 11.8 m/s at 20:00 hrs → optimal for evening generation

🔹 Temperature & Humidity Impact

Maximum energy (~1.4k kWh) occurs at 24–28°C

Medium humidity improves turbine efficiency

🔹 Humidity-wise Energy Output

Medium humidity contributes the highest average (~5.5 kWh)

High or low humidity slightly reduces output

🔹 Location-wise Comparison

Davanagere: Highest wind speed (12.82 m/s) & energy

Kutch & Kanniyakumari: Moderate wind speed (~11.7–11.8 m/s) & steady generation

Jaisalmer: Balanced speed-output ratio

Coastal & semi-arid regions perform better due to high-altitude winds

🔹 Daily Energy Trend

Fluctuates between 0.02M – 0.04M kWh/day

Peaks mid-month, dips due to natural wind variability

🔹 Forecasting for April

Predicts stable upward trend

Confirms reliability of turbines for near-term production

💡 Recommendations

Optimize turbine deployment based on high-performance locations (Davanagere & coastal regions)

Monitor medium humidity periods to maximize energy output

Plan maintenance and operations around low wind periods to reduce downtime

Leverage forecasting for operational planning and grid management

Use dashboards for continuous monitoring to inform decisions

🚧 Limitations

Dataset limited to Jan–Mar 2024; seasonal variations not fully captured

Forecasts are short-term and may vary with extreme weather conditions

Other factors such as turbine maintenance, mechanical efficiency, and local topography are not included

🏁 Conclusion

Analysis indicates that wind speed, temperature, and humidity significantly influence energy output.
Medium humidity and moderate temperatures yield maximum efficiency, while location and wind patterns are critical for strategic turbine placement.
Forecasting confirms reliable near-term energy production, aiding planning and optimization in wind energy operations.
