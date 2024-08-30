# Analyze Active Minutes
SELECT 
	ActivityDate,
    SUM(VeryActiveMinutes) AS total_very_active_minutes,
    SUM(FairlyActiveMinutes) AS total_fairly_active_minutes,
    SUM(LightlyActiveMinutes) AS total_lightly_active_minutes,
    SUM(SedentaryMinutes) AS total_sedentary_minutes,
    avg(TotalSteps) As 'Avg.Steps',
    avg(VeryActiveMinutes + FairlyActiveMinutes + LightlyActiveMinutes + SedentaryMinutes) as 'Avg.Active Minutes',
    count(Id) as Active_Users
FROM 
   fitbit_data_1.dailyactivity
GROUP BY 
    ActivityDate
HAVING count(Id) >=17
ORDER BY 
    ActivityDate;
 
 
Select ActivityDate, Count(Id)
FROM fitbit_data_1.dailyactivity
WHERE FairlyActiveMinutes >= 21.4 OR VeryActiveMinutes >= 10.7
GROUP BY ActivityDate;

 SELECT 
    ActivityDate,
    AVG(VeryActiveMinutes) AS avg_very_active_minutes,
    AVG(FairlyActiveMinutes) AS avg_fairly_active_minutes,
    AVG(LightlyActiveMinutes) AS avg_lightly_active_minutes,
    AVG(SedentaryMinutes) AS avg_sedentary_minutes,
    COUNT(Id) as Active_Users
FROM 
    fitbit_data_1.dailyactivity
GROUP BY 
    ActivityDate
HAVING count(Id) >= 17
ORDER BY 
    ActivityDate;


