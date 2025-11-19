SELECT *
FROM wind_davanagere_ka_2024;

SELECT *
FROM wind_kanniyakumari_tn_2024;

SELECT *
FROM wind_jaisalmar_raj_2024;

SELECT *
FROM wind_kutch_guj_2024;

-- Combine all the dataset
CREATE TABLE wind_energy_forecast_2024 AS
SELECT *
FROM wind_davanagere_ka_2024
UNION ALL
SELECT *
FROM wind_kanniyakumari_tn_2024
UNION ALL
SELECT *
FROM wind_jaisalmar_raj_2024
UNION ALL
SELECT *
FROM wind_kutch_guj_2024;


SELECT *
FROM wind_energy_forecast_2024;

-- Counting the Original dataset

SELECT COUNT(*)
FROM wind_energy_forecast_2024;

-- Changing the numerical column data types to fl
ALTER TABLE wind_energy_forecast_2024
MODIFY COLUMN Wind_Speed_10m_mps FLOAT NULL,
MODIFY COLUMN Wind_Speed_100m_mps FLOAT NULL,
MODIFY COLUMN Temperature_C FLOAT NULL,
MODIFY COLUMN Pressure_hPa FLOAT NULL,
MODIFY COLUMN `Humidity_%` FLOAT NULL,
MODIFY COLUMN Energy_Output_kWh FLOAT NULL;

-- Creating duplicate dataset
CREATE TABLE wind__energy_forecast_2024_dup
LIKE wind_energy_forecast_2024;

INSERT wind__energy_forecast_2024_dup
select *
From wind_energy_forecast_2024;


-- Changing the data type of the column 
ALTER TABLE wind__energy_forecast_2024_dup
MODIFY `Timestamp` TEXT NOT NULL,
MODIFY Location VARCHAR(50) NOT NULL;


--  Changing the column name of all the column to lower case

ALTER TABLE wind__energy_forecast_2024_dup
CHANGE `Timestamp` date_time TEXT,
CHANGE `Location` location VARCHAR(50),
CHANGE `Wind_Speed_10m_mps` wind_speed_10m_mps FLOAT,
CHANGE `Wind_Speed_100m_mps` wind_speed_100m_mps FLOAT,
CHANGE `Temperature_C` temperature_c FLOAT,
CHANGE `Pressure_hPa` pressure_hpa FLOAT,
CHANGE `Humidity_%` humidity_percentage FLOAT,
ADD CONSTRAINT chk_humidity CHECK (humidity_percentage <=100),
CHANGE `Energy_Output_kWh` energy_output_kwh FLOAT;


-- Checking the null values 
SELECT date_time, location, wind_speed_10m_mps, wind_speed_100m_mps, temperature_c, pressure_hpa,
humidity_percentage,energy_output_kwh, COUNT(*) AS chck_duplicate
FROM wind__energy_forecast_2024_dup
GROUP BY date_time, location, wind_speed_10m_mps, wind_speed_100m_mps, temperature_c, pressure_hpa,
humidity_percentage, energy_output_kwh
HAVING count(*) > 1;


-- Removing the duplicate Values in by creating a new column 
CREATE TABLE wind_energy_no_dup AS
SELECT 
    date_time,
    location,
    wind_speed_10m_mps,
    wind_speed_100m_mps,
    temperature_c,
    pressure_hpa,
    humidity_percentage,
    energy_output_kwh
FROM wind__energy_forecast_2024_dup
GROUP BY 
    date_time,
    location,
    wind_speed_10m_mps,
    wind_speed_100m_mps,
    temperature_c,
    pressure_hpa,
    humidity_percentage,
    energy_output_kwh;
 
-- Adding column as s_no for Primary key 
ALTER TABLE wind_energy_no_dup
ADD COLUMN s_no INT AUTO_INCREMENT PRIMARY KEY;

-- old dataset vs cleaned dataset count
SELECT COUNT(*) 
FROM wind__energy_forecast_2024_dup;
SELECT COUNT(*) 
FROM wind_energy_no_dup;

-- Total prod of each country
SELECT Location, SUM(energy_output_kwh) AS total_prod
FROM wind_energy_no_dup
GROUP BY Location
ORDER BY total_prod DESC;


-- CHECKING and Replacing The null values in energy output to Average Value as per District and Country

SELECT COUNT(*)
FROM wind_energy_no_dup
WHERE energy_output_kwh IS NULL AND location = 'Kanniyakumari, Tamil Nadu';


UPDATE wind_energy_no_dup
SET energy_output_kwh = (
    SELECT avg_val
    FROM (
		SELECT AVG(energy_output_kwh) AS avg_val
        FROM wind_energy_no_dup
        WHERE location = 'Kanniyakumari, Tamil Nadu'
		AND energy_output_kwh IS NOT NULL) AS query1)
WHERE location = 'Kanniyakumari, Tamil Nadu'
  AND energy_output_kwh IS NULL;

SELECT COUNT(*)
FROM wind_energy_no_dup
WHERE energy_output_kwh IS NULL AND location = 'Jaisalmar, Rajasthan';

UPDATE wind_energy_no_dup
SET energy_output_kwh = (
    SELECT avg_val
    FROM (
		SELECT AVG(energy_output_kwh) AS avg_val
        FROM wind_energy_no_dup
        WHERE location = 'Jaisalmar, Rajasthan'
		AND energy_output_kwh IS NOT NULL) AS query1)
WHERE location = 'Jaisalmar, Rajasthan'
  AND energy_output_kwh IS NULL;
  
SELECT COUNT(*)
FROM wind_energy_no_dup
WHERE energy_output_kwh IS NULL AND location = 'Kutch,Gujarat';

UPDATE wind_energy_no_dup
SET energy_output_kwh = (
    SELECT avg_val
    FROM (
		SELECT AVG(energy_output_kwh) AS avg_val
        FROM wind_energy_no_dup
        WHERE location = 'Kutch,Gujarat'
		AND energy_output_kwh IS NOT NULL) AS query1)
WHERE location = 'Kutch,Gujarat'
  AND energy_output_kwh IS NULL;
  

SELECT COUNT(*)
FROM wind_energy_no_dup
WHERE energy_output_kwh IS NULL AND location = 'Davanagere,Karnataka';

UPDATE wind_energy_no_dup
SET energy_output_kwh = (
    SELECT avg_val
    FROM (
		SELECT AVG(energy_output_kwh) AS avg_val
        FROM wind_energy_no_dup
        WHERE location = 'Davanagere,Karnataka'
		AND energy_output_kwh IS NOT NULL) AS query1)
WHERE location = 'Davanagere,Karnataka'
  AND energy_output_kwh IS NULL;
  
SELECT COUNT(*)
FROM wind_energy_no_dup
WHERE wind_speed_10m_mps IS NULL OR temperature_c IS NULL;


-- CHECKING and Replacing The null values in wind_speed_10m to Average Value as per District and Country

UPDATE wind_energy_no_dup
SET wind_speed_10m_mps = (
    SELECT avg_val
    FROM 
	(
	SELECT AVG(wind_speed_10m_mps) AS avg_val
	FROM wind_energy_no_dup
	WHERE location = 'Davanagere,Karnataka' AND wind_speed_10m_mps IS NOT NULL)
	AS query1
	)
WHERE location = 'Davanagere,Karnataka' AND wind_speed_10m_mps IS NULL;

UPDATE wind_energy_no_dup
SET wind_speed_10m_mps = (
    SELECT avg_val
    FROM 
	(
	SELECT AVG(wind_speed_10m_mps) AS avg_val
	FROM wind_energy_no_dup
	WHERE location = 'Kutch,Gujarat' AND wind_speed_10m_mps IS NOT NULL)
	AS query1
	)
WHERE location = 'Kutch,Gujarat' AND wind_speed_10m_mps IS NULL;

UPDATE wind_energy_no_dup
SET wind_speed_10m_mps = (
    SELECT avg_val
    FROM 
	(
	SELECT AVG(wind_speed_10m_mps) AS avg_val
	FROM wind_energy_no_dup
	WHERE location = 'Jaisalmar, Rajasthan' AND wind_speed_10m_mps IS NOT NULL)
	AS query1
	)
WHERE location = 'Jaisalmar, Rajasthan' AND wind_speed_10m_mps IS NULL;

UPDATE wind_energy_no_dup
SET wind_speed_10m_mps = (
    SELECT avg_val
    FROM 
	(
	SELECT AVG(wind_speed_10m_mps) AS avg_val
	FROM wind_energy_no_dup
	WHERE location = 'Kanniyakumari, Tamil Nadu' AND wind_speed_10m_mps IS NOT NULL)
	AS query1
	)
WHERE location = 'Kanniyakumari, Tamil Nadu' AND wind_speed_10m_mps IS NULL;


-- CHECKING and Replacing The null values in temperature_c to Average Value as per District and Country

UPDATE wind_energy_no_dup
SET temperature_c = (
    SELECT avg_val
    FROM 
	(
	SELECT AVG(temperature_c) AS avg_val
	FROM wind_energy_no_dup
	WHERE location = 'Kanniyakumari, Tamil Nadu' AND temperature_c IS NOT NULL)
	AS query1
	)
WHERE location = 'Kanniyakumari, Tamil Nadu' AND temperature_c IS NULL;


UPDATE wind_energy_no_dup
SET temperature_c = (
    SELECT avg_val
    FROM 
	(
	SELECT AVG(temperature_c) AS avg_val
	FROM wind_energy_no_dup
	WHERE location = 'Jaisalmar, Rajasthan' AND temperature_c IS NOT NULL)
	AS query1
	)
WHERE location = 'Jaisalmar, Rajasthan' AND temperature_c IS NULL;


UPDATE wind_energy_no_dup
SET temperature_c = (
    SELECT avg_val
    FROM 
	(
	SELECT AVG(temperature_c) AS avg_val
	FROM wind_energy_no_dup
	WHERE location = 'Kutch,Gujarat' AND temperature_c IS NOT NULL)
	AS query1
	)
WHERE location = 'Kutch,Gujarat' AND temperature_c IS NULL;


UPDATE wind_energy_no_dup
SET temperature_c = (
    SELECT avg_val
    FROM 
	(
	SELECT AVG(temperature_c) AS avg_val
	FROM wind_energy_no_dup
	WHERE location = 'Davanagere,Karnataka' AND temperature_c IS NOT NULL)
	AS query1
	)
WHERE location = 'Davanagere,Karnataka' AND temperature_c IS NULL;

SELECT COUNT(*)
FROM wind_energy_no_dup
WHERE temperature_c IS NULL OR wind_speed_10m_mps IS NULL OR energy_output_kwh IS NULL;



-- DATA PREPROCESSING

-- ADDING column as Hour
ALTER TABLE wind_energy_no_dup
ADD Column hour TIME AFTER date_time;

UPDATE wind_energy_no_dup
SET hour = CAST(SUBSTRING(date_time,12,5)AS TIME);


-- ADDING column as date 
ALTER TABLE wind_energy_no_dup
ADD Column date_of_month INT AFTER date_time;

UPDATE wind_energy_no_dup
SET date_of_month = SUBSTRING(date_time,1,2);


-- ADDING column as fulldate
ALTER TABLE wind_energy_no_dup
ADD Column date1 DATE AFTER date_time;

UPDATE wind_energy_no_dup
SET date1 = STR_TO_DATE(SUBSTRING(date_time, 1, 10), "%d/%m/%Y");

-- ADDING column as MONTH
ALTER TABLE wind_energy_no_dup
ADD Column month_name VARCHAR(10) AFTER date_of_month;

UPDATE wind_energy_no_dup
SET month_name = MONTHNAME(date1);


-- SPLITTING STATE COLUMN
ALTER TABLE wind_energy_no_dup 
ADD COLUMN state VARCHAR(15) AFTER location;

UPDATE wind_energy_no_dup
SET state = TRIM(SUBSTRING_INDEX(location, ',', -1));

-- CREATING AVERAGE WIND SPEED 
ALTER TABLE wind_energy_no_dup 
ADD COLUMN avg_wind_speed_mps FLOAT AFTER wind_speed_100m_mps ;

UPDATE wind_energy_no_dup
SET avg_wind_speed_mps = (wind_speed_10m_mps + wind_speed_100m_mps) / 2;


-- CREATE HUMIDITY IN CATEGORY COLUMN
ALTER TABLE wind_energy_no_dup 
ADD COLUMN humidity_level TEXT AFTER humidity_percentage ;

UPDATE wind_energy_no_dup 
SET humidity_level = 
CASE
    WHEN humidity_percentage < 40 THEN 'Low'
    WHEN humidity_percentage BETWEEN 40 AND 70 THEN 'Medium'
    ELSE 'High'
END;


-- CREATE A TABLE WITH CLEANED DATASET
CREATE TABLE wind_energy_cleaned_dataset
LIKE wind_energy_no_dup;

INSERT wind_energy_cleaned_dataset
select *
From wind_energy_no_dup;

ALTER TABLE wind_energy_cleaned_dataset
CHANGE `hour` time_in_hrs TIME;