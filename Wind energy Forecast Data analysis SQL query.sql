SELECT MIN(wind_speed_10m_mps) AS min_wind_10m, MAX(wind_speed_10m_mps)AS max_wind_10m,
MIN(wind_speed_100m_mps)AS min_wind_100m,MAX(wind_speed_100m_mps)AS max_wind_100m, 
MIN(temperature_c) AS min_temp, MAX(temperature_c) AS max_temp, 
MIN(pressure_hpa) AS min_pressure, MAX(pressure_hpa) AS max_pressure,
MIN(energy_output_kwh)AS min_energy_prod, MAX(energy_output_kwh) AS max_energy_prod
FROM wind_energy_cleaned_dataset;

SELECT state, 
MIN(wind_speed_10m_mps) AS min_wind_10m, MAX(wind_speed_10m_mps)AS max_wind_10m,
MIN(wind_speed_100m_mps)AS min_wind_100m,MAX(wind_speed_100m_mps)AS max_wind_100m,
MIN(temperature_c) AS min_temp, MAX(temperature_c) AS max_temp, 
MIN(pressure_hpa) AS min_pressure, MAX(pressure_hpa) AS max_pressure,
MIN(energy_output_kwh)AS min_energy_prod, MAX(energy_output_kwh) AS max_energy_prod
FROM wind_energy_cleaned_dataset
GROUP BY state;


-- AVERAGE Wind SPEED CALCULATION AS PER LOCATION

SELECT Location, AVG(Wind_Speed_10m_mps) AS AvgWind10,AVG(Wind_Speed_100m_mps) AS AvgWind100
FROM wind_energy_cleaned_dataset
GROUP BY Location;

SELECT Location, AVG(avg_wind_speed_mps)
FROM wind_energy_cleaned_dataset
GROUP BY Location;


-- MAXIMUM TEMPERATURE VS STATE 
SELECT state, MAX(temperature_c)
FROM wind_energy_cleaned_dataset
GROUP BY state;


-- AVERAGE ENERGY OUTPUT AS PER STATE
SELECT state, AVG(energy_output_kwh)
From wind_energy_cleaned_dataset
GROUP BY state;


-- IS HIGH HUMIDITY MAKE ENERGY OUTPUT LOW?
SELECT humidity_level, AVG(energy_output_kwh), COUNT(energy_output_kwh)
FROM wind_energy_cleaned_dataset
GROUP BY humidity_level;


-- HOURLY TRENDS
SELECT state, time_in_hrs, AVG(wind_speed_100m_mps)
FROM wind_energy_cleaned_dataset
GROUP BY state, time_in_hrs
ORDER BY State ASC, time_in_hrs Asc;


-- DATE WISE TRENDS
SELECT 
    DATE(date1) AS `Day`,
    SUM(energy_output_kwh) AS DayEnergy
FROM wind_energy_cleaned_dataset
GROUP BY `Day`
ORDER BY `Day` ASC;


-- WINDSPEED MAKES INCREASE IN ENERGY PRODUCTION 
SELECT 
    ROUND(wind_speed_100m_mps),
    AVG(energy_output_kWh) AS AvgEnergy
FROM wind_energy_cleaned_dataset
GROUP BY ROUND(wind_speed_100m_mps)
ORDER BY ROUND(wind_speed_100m_mps);


-- MONTHLY TRENDS
SELECT 
    month_name,
    AVG(energy_output_kWh) AS AvgEnergy
FROM wind_energy_cleaned_dataset
GROUP BY month_name;


-- Identifing Low-Performance Days
SELECT 
    date1,
    AVG(energy_output_kwh) AS total_energy
FROM wind_energy_cleaned_dataset
GROUP BY date1
HAVING total_energy < 
(
    SELECT AVG(energy_output_kwh) 
    FROM wind_energy_cleaned_dataset
);

SELECT *
FROM wind_kanniyakumari_tn_2024
WHERE Energy_Output_kWh IS NULL;