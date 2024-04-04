SELECT * FROM machine.machinedowntime; 
-- Check The Data Type of Each Columns 
desc machinedowntime;
-- Date,Machine_ID,Assembly_Line_No,Downtime (Text columns) # Categorical Variable 
-- Hydraulic_Pressure,Coolant_Pressure,Air_System_Pressure,Coolant_Temperature,Hydraulic_Oil_Temperature
-- Spindle_Bearing_Temperature, Spindle_Vibration, Tool_Vibration, Torque,Cutting(double columns) # Numerical
-- Spindle_Speed, Voltage(int columns) # Numerical Variable

# Categorical Variable are- so here we calculate only MODE
-- Date
SELECT Date AS mode_value, COUNT(*) AS frequency
FROM machinedowntime
GROUP BY Date
ORDER BY frequency DESC
LIMIT 1;

-- Machine_ID 
SELECT 
    Machine_ID AS mode_value,
    COUNT(*) AS frequency
FROM 
    machinedowntime
GROUP BY 
    Machine_ID
ORDER BY 
    frequency DESC
LIMIT 1;

-- Assembly_Line_No
SELECT 
    Assembly_Line_No AS mode_value, 
    COUNT(*) AS frequency
FROM 
    machinedowntime
GROUP BY 
    Assembly_Line_No
ORDER BY 
    frequency DESC
LIMIT 1;

-- Numerical Variable are:- so here we calculate only MEAN, MODE, MEDIAN  
-- Hydraulic_Pressure 
-- Mean (Average)
SELECT AVG(Hydraulic_Pressure) AS mean_value
FROM machinedowntime;

-- Median
SELECT Hydraulic_Pressure AS median_value
FROM (
    SELECT Hydraulic_Pressure, ROW_NUMBER() OVER (ORDER BY Hydraulic_Pressure) AS rownum, COUNT(*) OVER () AS total_rows
    FROM machinedowntime
) AS subquery
WHERE rownum IN (CEIL(total_rows/2), FLOOR(total_rows/2) + 1)
ORDER BY rownum
LIMIT 1;

-- Mode (Most frequent value)
SELECT Hydraulic_Pressure AS mode_value, COUNT(*) AS frequency
FROM machinedowntime
GROUP BY Hydraulic_Pressure
ORDER BY frequency DESC
LIMIT 1;

-- Coolant_Pressure 
-- Calculate Mean (Average)
SELECT AVG(Coolant_Pressure) AS mean_value
FROM machinedowntime;

-- Calculate Median
SELECT Coolant_Pressure AS median_value
FROM (
    SELECT Coolant_Pressure, ROW_NUMBER() OVER (ORDER BY Coolant_Pressure) AS rownum, COUNT(*) OVER() AS total_rows
    FROM machinedowntime
) AS subquery
WHERE rownum IN (CEIL(total_rows/2), FLOOR(total_rows/2) + 1)
ORDER BY rownum
LIMIT 1;

-- Calculate Mode (Most frequent value)
SELECT Coolant_Pressure AS mode_value, COUNT(*) AS frequency
FROM machinedowntime
GROUP BY Coolant_Pressure
ORDER BY frequency DESC
LIMIT 1;

-- Air_System_Pressure 
# mean 
SELECT AVG(Air_System_Pressure) AS mean_value
FROM machinedowntime;
# median 
SELECT Air_System_Pressure AS median_value
FROM (
    SELECT Air_System_Pressure, ROW_NUMBER() OVER (ORDER BY Air_System_Pressure) AS rownum, COUNT(*) OVER () AS total_rows
    FROM machinedowntime
) AS subquery
WHERE rownum IN (CEIL(total_rows/2), FLOOR(total_rows/2) + 1); 
# mode 
SELECT Air_System_Pressure AS mode_value, COUNT(*) AS frequency
FROM machinedowntime
GROUP BY Air_System_Pressure
ORDER BY frequency DESC
LIMIT 1;

-- Coolant_Temperature 
# mean 
SELECT AVG(Coolant_Temperature) AS mean_value
FROM machinedowntime; 
# median 
SELECT Coolant_Temperature AS median_value
FROM (
    SELECT Coolant_Temperature, 
           ROW_NUMBER() OVER (ORDER BY Coolant_Temperature) AS rownum, 
           COUNT(*) OVER () AS total_rows
    FROM machinedowntime
) AS subquery
WHERE rownum IN (CEIL(total_rows/2), FLOOR(total_rows/2) + 1); 

# mode 
SELECT Coolant_Temperature AS mode_value, COUNT(*) AS frequency
FROM machinedowntime
GROUP BY Coolant_Temperature
ORDER BY frequency DESC
LIMIT 1;

-- Hydraulic_Oil_Temperature 
# mean 
SELECT AVG(Hydraulic_Oil_Temperature) AS mean_value
FROM machinedowntime; 

# median 
SELECT Hydraulic_Oil_Temperature AS median_value
FROM (
    SELECT Hydraulic_Oil_Temperature,
           ROW_NUMBER() OVER (ORDER BY Hydraulic_Oil_Temperature) AS rownum,
           COUNT(*) OVER () AS total_rows
    FROM machinedowntime
) AS subquery
WHERE rownum IN (CEIL(total_rows / 2), FLOOR(total_rows / 2) + 1)
ORDER BY rownum;
# mode 
SELECT Hydraulic_Oil_Temperature AS mode_value, COUNT(*) AS frequency
FROM machinedowntime
GROUP BY Hydraulic_Oil_Temperature
ORDER BY frequency DESC
LIMIT 1;

-- Spindle_Bearing_Temperature 
# mean
SELECT AVG(Spindle_Bearing_Temperature) AS mean_value
FROM machinedowntime;

# median 
SELECT Spindle_Bearing_Temperature AS median_value
FROM (
    SELECT Spindle_Bearing_Temperature, ROW_NUMBER() OVER (ORDER BY Spindle_Bearing_Temperature) AS rownum, COUNT(*) OVER () AS total_rows
    FROM machinedowntime
) AS subquery
WHERE rownum IN (CEIL(total_rows/2), FLOOR(total_rows/2) + 1)
ORDER BY rownum
LIMIT 1;

# mode 
SELECT Spindle_Bearing_Temperature AS mode_value, COUNT(*) AS frequency
FROM machinedowntime
GROUP BY Spindle_Bearing_Temperature
ORDER BY frequency DESC
LIMIT 1; 

-- Spindle_Vibration 
# mean 
SELECT AVG(Spindle_Vibration) AS mean_value
FROM machinedowntime;
#median 
SELECT 
    AVG(Spindle_Vibration) AS median_value
FROM (
    SELECT 
        Spindle_Vibration, 
        ROW_NUMBER() OVER (ORDER BY Spindle_Vibration) AS rownum, 
        COUNT(*) OVER () AS total_rows
    FROM machinedowntime
) AS subquery
WHERE rownum IN (CEIL(total_rows/2), FLOOR(total_rows/2) + 1);
#mode 
SELECT 
    Spindle_Vibration AS mode_value, 
    COUNT(*) AS frequency
FROM machinedowntime
GROUP BY Spindle_Vibration
ORDER BY frequency DESC
LIMIT 1; 

-- Tool_Vibration 
# mean 
SELECT AVG(Tool_Vibration) AS mean_value
FROM machinedowntime;
# median 
SELECT Tool_Vibration AS median_value
FROM (
    SELECT Tool_Vibration, ROW_NUMBER() OVER (ORDER BY Tool_Vibration) AS rownum, COUNT(*) OVER () AS total_rows
    FROM machinedowntime
) AS subquery
WHERE rownum IN (CEIL(total_rows/2), FLOOR(total_rows/2) + 1)
ORDER BY rownum
LIMIT 1;
#mode 
SELECT Tool_Vibration AS mode_value, COUNT(*) AS frequency
FROM machinedowntime
GROUP BY Tool_Vibration
ORDER BY frequency DESC
LIMIT 1; 

-- Torque 
-- Mean (Average)
SELECT AVG(Torque) AS mean_value
FROM machinedowntime;

-- Median
SELECT Torque AS median_value
FROM (
    SELECT Torque, ROW_NUMBER() OVER (ORDER BY Torque) AS rownum, COUNT(*) OVER () AS total_rows
    FROM machinedowntime
) AS subquery
WHERE rownum IN (CEIL(total_rows/2), FLOOR(total_rows/2) + 1);


-- Mode
SELECT Torque AS mode_value, COUNT(*) AS frequency
FROM machinedowntime
GROUP BY Torque
ORDER BY frequency DESC
LIMIT 1;

-- Cutting 
# mean 
SELECT AVG(Cutting) AS mean_value
FROM machinedowntime; 
# median 
SELECT Cutting AS median_value
FROM (
    SELECT Cutting, ROW_NUMBER() OVER (ORDER BY Cutting) AS rownum, COUNT(*) OVER () AS total_rows
    FROM machinedowntime
) AS subquery
WHERE rownum IN (CEIL(total_rows/2), FLOOR(total_rows/2) + 1)
ORDER BY rownum
LIMIT 1;
#mode 
SELECT Cutting AS mode_value, COUNT(*) AS frequency
FROM machinedowntime
GROUP BY Cutting
ORDER BY frequency DESC
LIMIT 1; 

-- Spindle_Speed 
# mean 
SELECT AVG(Spindle_Speed) AS mean_value
FROM machinedowntime;
# median 
SELECT Spindle_Speed AS median_value
FROM (
    SELECT Spindle_Speed, ROW_NUMBER() OVER (ORDER BY Spindle_Speed) AS rownum, COUNT(*) OVER () AS total_rows
    FROM machinedowntime
) AS subquery
WHERE rownum IN (CEIL(total_rows/2), FLOOR(total_rows/2) + 1)
ORDER BY rownum
LIMIT 1; 
# mode 
SELECT Spindle_Speed AS mode_value, COUNT(*) AS frequency
FROM machinedowntime
GROUP BY Spindle_Speed
ORDER BY frequency DESC
LIMIT 1;

-- Voltage 
-- Mean (Average)
SELECT AVG(Voltage) AS mean_value
FROM machinedowntime;

-- Median
SELECT Voltage AS median_value
FROM (
    SELECT Voltage, ROW_NUMBER() OVER (ORDER BY Voltage) AS rownum, COUNT(*) OVER () AS total_rows
    FROM machinedowntime
) AS subquery
WHERE rownum IN (CEIL(total_rows/2), FLOOR(total_rows/2) + 1);


-- Mode (Most frequent value)
SELECT Voltage AS mode_value, COUNT(*) AS frequency
FROM machinedowntime
GROUP BY Voltage
ORDER BY frequency DESC
LIMIT 1;


############### Measure of dispersion################################################## 
--  Hydraulic_Pressure 
-- range 
SELECT 
    MAX(Hydraulic_Pressure) - MIN(Hydraulic_Pressure) AS range_value
FROM machinedowntime;
-- Variance: 
SELECT 
    SUM(POWER(Hydraulic_Pressure - mean_value, 2)) / (COUNT(*) - 1) AS variance_value
FROM machinedowntime,
    (SELECT AVG(Hydraulic_Pressure) AS mean_value FROM machinedowntime) AS mean_subquery;

-- Standard Deviation (calculated from the variance): 
SELECT 
    SQRT(variance_value) AS std_deviation_value
FROM (
    SELECT 
        SUM(POWER(Hydraulic_Pressure - mean_value, 2)) / (COUNT(*) - 1) AS variance_value
    FROM machinedowntime,
        (SELECT AVG(Hydraulic_Pressure) AS mean_value FROM machinedowntime) AS mean_subquery
) AS variance_subquery;

-- Coolant_Pressure 
# range 
SELECT 
    MAX(Coolant_Pressure) - MIN(Coolant_Pressure) AS range_value
FROM machinedowntime; 
# varience 
SELECT 
    SUM(POWER(Coolant_Pressure - mean_value, 2)) / COUNT(*) AS variance_value
FROM (
    SELECT 
        AVG(Coolant_Pressure) AS mean_value
    FROM machinedowntime
) AS mean_subquery, machinedowntime; 
# Standard Deviation (calculated from the variance): 
SELECT 
    SQRT(variance_value) AS std_deviation_value
FROM (
    SELECT 
        SUM(POWER(Coolant_Pressure - mean_value, 2)) / (COUNT(*) - 1) AS variance_value
    FROM (
        SELECT 
            AVG(Coolant_Pressure) AS mean_value
        FROM machinedowntime
    ) AS mean_subquery, machinedowntime
) AS variance_subquery;

-- Air_System_Pressure
# range 
SELECT 
    MAX(Air_System_Pressure) - MIN(Air_System_Pressure) AS range_value
FROM machinedowntime; 
# Variance: 
SELECT 
    SUM(POWER(Air_System_Pressure - mean_value, 2)) / COUNT(*) AS variance_value
FROM machinedowntime,
    (SELECT AVG(Air_System_Pressure) AS mean_value FROM machinedowntime) AS mean_subquery;
# Standard Deviation (calculated from the variance): 
SELECT 
    SQRT(variance_value) AS std_deviation_value
FROM (
    SELECT 
        SUM(POWER(Air_System_Pressure - mean_value, 2)) / COUNT(*) AS variance_value
    FROM machinedowntime,
        (SELECT AVG(Air_System_Pressure) AS mean_value FROM machinedowntime) AS mean_subquery
) AS variance_subquery; 

-- Coolant_Temperature 
# range 
SELECT 
    MAX(Coolant_Temperature) - MIN(Coolant_Temperature) AS range_value
FROM machinedowntime; 
# varience 
SELECT 
    SUM(POWER(Coolant_Temperature - mean_value, 2)) / (COUNT(*) - 1) AS variance_value
FROM (
    SELECT 
        AVG(Coolant_Temperature) AS mean_value
    FROM machinedowntime
) AS mean_subquery, machinedowntime;
-- Standard Deviation (calculated from the variance): 
SELECT 
    SQRT(variance_value) AS std_deviation_value
FROM (
    SELECT 
        AVG(POWER(Coolant_Temperature - mean_value, 2)) AS variance_value
    FROM (
        SELECT 
            AVG(Coolant_Temperature) AS mean_value
        FROM machinedowntime
    ) AS mean_subquery, machinedowntime
) AS variance_subquery;

-- Hydraulic_Oil_Temperature 
# range 
SELECT 
    MAX(Hydraulic_Oil_Temperature) - MIN(Hydraulic_Oil_Temperature) AS range_value
FROM machinedowntime;
# varience 
SELECT 
    SUM(POWER(Hydraulic_Oil_Temperature - mean_value, 2)) / (COUNT(*) - 1) AS variance_value
FROM (
    SELECT 
        AVG(Hydraulic_Oil_Temperature) AS mean_value
    FROM machinedowntime
) AS mean_subquery, machinedowntime;
# Standard Deviation (calculated from the variance): 
SELECT 
    SQRT(variance_value) AS std_deviation_value
FROM (
    SELECT 
        SUM(POWER(Hydraulic_Oil_Temperature - mean_value, 2)) / (COUNT(*) - 1) AS variance_value
    FROM (
        SELECT 
            AVG(Hydraulic_Oil_Temperature) AS mean_value
        FROM machinedowntime
    ) AS mean_subquery, machinedowntime
) AS variance_subquery;

-- Spindle_Bearing_Temperature 
# range 
SELECT 
    MAX(Spindle_Bearing_Temperature) - MIN(Spindle_Bearing_Temperature) AS range_value
FROM machinedowntime; 
# varience 
SELECT 
    SUM(POWER(Spindle_Bearing_Temperature - mean_value, 2)) / (COUNT(*) - 1) AS variance_value
FROM (
    SELECT 
        AVG(Spindle_Bearing_Temperature) AS mean_value
    FROM machinedowntime
) AS mean_subquery, machinedowntime;
# standard deviation 
SELECT 
    SQRT(variance_value) AS std_deviation_value
FROM (
    SELECT 
        SUM(POWER(Spindle_Bearing_Temperature - mean_value, 2)) / (COUNT(*) - 1) AS variance_value
    FROM (
        SELECT 
            AVG(Spindle_Bearing_Temperature) AS mean_value
        FROM machinedowntime
    ) AS mean_subquery, machinedowntime
) AS variance_subquery;
-- Spindle_Bearing_Temperature 
# range 
SELECT 
    MAX(Spindle_Bearing_Temperature) - MIN(Spindle_Bearing_Temperature) AS range_value
FROM machinedowntime; 
# varience 
SELECT 
    SUM(POWER(Spindle_Bearing_Temperature - mean_value, 2)) / (COUNT(*) - 1) AS variance_value
FROM (
    SELECT 
        AVG(Spindle_Bearing_Temperature) AS mean_value
    FROM machinedowntime
) AS mean_subquery, machinedowntime; 
# Standard Deviation (calculated from the variance): 
SELECT 
    SQRT(variance_value) AS std_deviation_value
FROM (
    SELECT 
        AVG(POWER(Spindle_Bearing_Temperature - mean_value, 2)) AS variance_value
    FROM (
        SELECT 
            AVG(Spindle_Bearing_Temperature) AS mean_value
        FROM machinedowntime
    ) AS mean_subquery, machinedowntime
) AS variance_subquery;
-- Spindle_Vibration 
# range 
SELECT 
    MAX(Spindle_Vibration) - MIN(Spindle_Vibration) AS range_value
FROM machinedowntime; 
# varience 
SELECT 
    SUM(POWER(Spindle_Vibration - mean_value, 2)) / (COUNT(*) - 1) AS variance_value
FROM (
    SELECT 
        AVG(Spindle_Vibration) AS mean_value
    FROM machinedowntime
) AS mean_subquery, machinedowntime;
# Standard Deviation (calculated from the variance) 
SELECT 
    SQRT(variance_value) AS std_deviation_value
FROM (
    SELECT 
        AVG(POWER(Spindle_Vibration - mean_value, 2)) AS variance_value
    FROM (
        SELECT 
            AVG(Spindle_Vibration) AS mean_value
        FROM machinedowntime
    ) AS mean_subquery, machinedowntime
) AS variance_subquery; 

-- Spindle_Vibration 
# range 
SELECT 
    MAX(Spindle_Vibration) - MIN(Spindle_Vibration) AS range_value
FROM machinedowntime;
# varience 
SELECT 
    SUM(POWER(Spindle_Vibration - mean_value, 2)) / (COUNT(*) - 1) AS variance_value
FROM (
    SELECT 
        AVG(Spindle_Vibration) AS mean_value
    FROM machinedowntime
) AS mean_subquery, machinedowntime; 
# Standard Deviation (calculated from the variance): 
SELECT 
    SQRT(variance_value) AS std_deviation_value
FROM (
    SELECT 
        SUM(POWER(Spindle_Vibration - mean_value, 2)) / (COUNT(*) - 1) AS variance_value
    FROM (
        SELECT 
            AVG(Spindle_Vibration) AS mean_value
        FROM machinedowntime
    ) AS mean_subquery, machinedowntime
) AS variance_subquery;

-- Tool_Vibration 
# range 
SELECT 
    MAX(Tool_Vibration) - MIN(Tool_Vibration) AS range_value
FROM machinedowntime; 
# Variance: 
SELECT 
    SUM(POWER(Tool_Vibration - mean_value, 2)) / (COUNT(Tool_Vibration) - 1) AS variance_value
FROM (
    SELECT 
        AVG(Tool_Vibration) AS mean_value
    FROM machinedowntime
) AS mean_subquery
CROSS JOIN machinedowntime; 

-- Torque 
# range 
SELECT 
    MAX(Torque) - MIN(Torque) AS range_value
FROM machinedowntime;
# varience 
SELECT 
    SUM(POWER(Torque - mean_value, 2)) / (COUNT(*) - 1) AS variance_value
FROM (
    SELECT 
        AVG(Torque) AS mean_value
    FROM machinedowntime
) AS mean_subquery, machinedowntime; 
-- Cutting 
# range 
SELECT 
    MAX(Cutting) - MIN(Cutting) AS range_value
FROM machinedowntime;

-- Spindle_Speed 
# range 
SELECT 
    MAX(Spindle_Speed) - MIN(Spindle_Speed) AS range_value
FROM machinedowntime;
# varience 
SELECT 
    SUM(POWER(Spindle_Speed - mean_value, 2)) / COUNT(*) AS variance_value
FROM (
    SELECT 
        AVG(Spindle_Speed) AS mean_value
    FROM machinedowntime
) AS mean_subquery, machinedowntime;
# standard deviation 
SELECT 
    SQRT(variance_value) AS std_deviation_value
FROM (
    SELECT 
        SUM(POWER(Spindle_Speed - mean_value, 2)) / COUNT(*) AS variance_value
    FROM (
        SELECT 
            AVG(Spindle_Speed) AS mean_value
        FROM machinedowntime
    ) AS mean_subquery, machinedowntime
) AS variance_subquery;

-- Voltage 
# range 
SELECT 
    MAX(Voltage) - MIN(Voltage) AS range_value
FROM machinedowntime; 
# varience 
SELECT 
    SUM(POWER(Voltage - mean_value, 2)) / (COUNT(*) - 1) AS variance_value
FROM (
    SELECT 
        AVG(Voltage) AS mean_value
    FROM machinedowntime
) AS mean_subquery, machinedowntime; 

desc machinedowntime





















































































