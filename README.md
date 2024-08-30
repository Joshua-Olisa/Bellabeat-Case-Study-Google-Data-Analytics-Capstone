# Google Data Analytics Capstone: Bellabeat Fitness Data Analysis 
##### Author: Joshua Olisa

##### [Tableau Dashboard](https://public.tableau.com/app/profile/emily.liang7497/viz/BellabeatFitnessDataAnalysisDashboard/GiantDashboard)

##### [Tableau Story Presentation to Skateholders](https://public.tableau.com/app/profile/emily.liang7497/viz/BellabeatFitnessDataAnalysis-GoogleDataAnalyticsCapstone/Story1)

## Background Infromation
Bellabeat is a high-tech company that manufactures health-focused smart products. Collecting data on activity, sleep, stress, and reproductive health has allowed Bellabeat to empower women with knowledge about their own health and habits.

## Business Task
Sršen, the company’s cofounder, would like an analysis of Bellabeat’s available consumer data to identify opportunities for growth. She has asked the marketing analytics team to analyze smart device usage data in order to gain insight into how people are already using their smart devices. Then, using this information, she would like recommendations for how these trends can inform Bellabeat marketing strategy.
 
#

_The case study follows the six step data analysis process:_

### [Ask](#1-ask)
### [Prepare](#2-prepare)
### [Process](#3-process)
### [Analyze](#4-analyze)
### [Share](#5-share)
### [Act](#6-act)



## 1. Ask
**BUSINESS TASK: Analyze Fitbit data to gain insight and help guide marketing strategy for Bellabeat to grow as a global player.**

Primary stakeholders: Urška Sršen and Sando Mur, executive team members.

Secondary stakeholders: Bellabeat marketing analytics team.

## 2. Prepare 
Data Source: 30 participants FitBit Fitness Tracker Data from Mobius: https://www.kaggle.com/arashnic/fitbit

The dataset has 18 CSV. The data also follow a ROCCC approach:

- Reliability: The data is from 30 FitBit users who consented to the submission of personal tracker data and generated by from a distributed survey via Amazon Mechanical Turk. 
- Original: The data is from 30 FitBit users who consented to the submission of personal tracker data via Amazon  Mechanical Turk.
- Comprehensive: Data minute-level output for physical activity, heart rate, and sleep monitoring. While the data tracks many factors in the user activity and sleep, but the sample size is small and most data is recorded during certain days of the week. 
- Current: Data is from March 2016 to May 2016'
- Cited: Unknown.

Several datasets will not be used for the analysis because of the following reasons:

- They are subsets of larger, more complete data frames.
- They are in a minute-level output.
- They are too small of a sample size to provide credible insights

### Dataset Limitations:
The dataset has a few limitations:

- No Metadata Provided: Information such as location, lifestyle, weather etc. would provide a deeper context to the data obtained.
- Only 30 user data is available. Which is too small of a sample size to make obtain any concrete insights. A larger sample size is preferred for the analysis.
- The dataset contains data across a two month period in 2016 only. For a deeper and more accurate analysis of trends, we would need data from the current year, preferably collected for an entire year to look at if trends vary during different times of year.
- The dataset does not contain any key demographic infromationabout the users eg; Age, Location, Gender.
- Most data is recorded from Tuesday to Thursday, which may not be comprehensive enough to form an accurate analysis. 

## 3. Process
[Back to Top](#author-Joshua-Olisa)

Examine the data for the daily_activity table

Opened the CSV file in Excel; I checked the file for duplicates and blank or missings records. Some record in the ActivityDate Column where inputed as texts, Before any analysis was conducted I formatted the Column to a date format

The dataset was imported in MySQL for analysis in 4. Analyze!
 
## 4. Analyze
[Back to Top](#author-Joshua-Olisa)

-  [Active Minutes](#active-minutes)
-  [Total Steps](#total-steps)
-  [Minutes of Activty Per Day](#minutes-of-activty-per-day)


### Active Minutes:
[Back to Analyze](#4-analyze)

Percentage of active minutes in the four categories: very active, fairly active, lightly active and sedentary. From the pie chart, we can see that most users spent 81.47% of their daily activity in sedentary minutes and only 1.69% in very active minutes. 

```
SELECT 
    ActivityDate
    SUM(VeryActiveMinutes) AS total_very_active_minutes,
    SUM(FairlyActiveMinutes) AS total_fairly_active_minutes,
    SUM(LightlyActiveMinutes) AS total_lightly_active_minutes,
    SUM(SedentaryMinutes) AS total_sedentary_minutes,
    avg(TotalSteps) As 'Avg.Steps',
    avg(VeryActiveMinutes + FairlyActiveMinutes + LightlyActiveMinutes + SedentaryMinutes) as 'Avg.Active Minutes',
    count(Id) as Active_Users
FROM 
   fitbit_data.dailyactivity
GROUP BY 
    ActivityDate
HAVING
     count(Id) >=17
ORDER BY 
````

<img width="621" alt="Screenshot 2024-08-30 145502" src="https://github.com/user-attachments/assets/06e37fad-059c-4123-a212-490095351924">


The American Heart Association and World Health Organization recommend at least 150 minutes of moderate-intensity activity or 75 minutes of vigorous activity, or a combination of both, each week. That means it needs an daily goal of 21.4 minutes of FairlyActiveMinutes or 10.7 minutes of VeryActiveMinutes.

In our dataset on averge 12 users met fairly active minutes or very active minutes daily.
```
Select ActivityDate, Count(Id)
FROM fitbit_data.dailyactivity
WHERE FairlyActiveMinutes >= 21.4 OR VeryActiveMinutes >= 10.7
GROUP BY ActivityDate;
```

### Total Steps:
[Back to Analyze](#4-analyze)

How active the users are weekly in total steps. Tuesday and Saturdays the users take the most steps. 
```
SELECT 
    ActivityDate
    avg(TotalSteps) As 'Avg.Steps',
    count(Id) as 'Active Users'
FROM 
   fitbit_data.dailyactivity
GROUP BY 
    ActivityDate
HAVING
     Active Users >=17
ORDER BY 
```
![Sheet 2](https://github.com/user-attachments/assets/9f8c7d1c-ee3b-4ae7-9614-cefe9fc7b6a0)


### Minutes of Activty Per Day:
[Back to Analyze](#4-analyze)

How Active are user during the day
The more active that you're, the more steps you take, and the more calories you will burn. This is an obvious fact, but we can still look into the data to find any interesting. Here we see that some users who are sedentary, take minimal steps, but still able to burn over 1500 to 2500 calories compare to users who are more active, take more steps, but still burn similar calories.

```
SELECT 
    ActivityDate,
    AVG(VeryActiveMinutes) AS 'Very Active Minutes',
    AVG(FairlyActiveMinutes) AS 'Fairly Active Minutes',
    AVG(LightlyActiveMinutes) AS 'Lightly Active Minutes',
    AVG(SedentaryMinutes) AS 'Sedentary Minutes'
FROM 
   fitbit_data_1.dailyactivity
GROUP BY 
    ActivityDate
HAVING count(Id) >=17
ORDER BY 
    ActivityDate;
```
![Sheet 3](https://github.com/user-attachments/assets/373041b0-cb4e-401b-b352-0765da60a192)


## 5. Share 
[Back to Top](#author-Joshua-Olisa)

### 🎨 [Bellabeat Data Analysis Dashboard](https://public.tableau.com/app/profile/joshua.olisa.emodoh/viz/BellaBeats_17250435748210/Dashboard1)

![Dashboard 1](https://github.com/user-attachments/assets/81b8343d-ca65-4c11-95ea-b8a844c75a16)

### 🎨 [Bellabeat Data Presentation in Tableau](https://public.tableau.com/app/profile/emily.liang7497/viz/BellabeatFitnessDataAnalysis-GoogleDataAnalyticsCapstone/Story1)

![present](https://user-images.githubusercontent.com/62857660/136821333-3e30a827-81d9-43c5-bd7f-98a1680901d9.PNG)



## 6. Act
[Back to Top](#author-Joshua-Olisa)

Conclusion based on our analysis:
- Sedentary make up a significant portion, 81% of users daily active minutes. Users spend on avg 12 hours a day in sedentary minutes, 4 hours lightly active, and only half-hour in fairly+very active! 
- We see the most change on Saturday: users take more steps, burn more calories, and spend less time sedentary. Sunday is the most "lazy" day for users. 
- 54% of the users who recorded their sleep data spent 55 minutes awake in bed before falling asleep.
- Users takes the most steps from 5 PM to 7 PM
Users who are sedentary take minimal steps and burn 1500 to 2500 calories compared to users who are more active, take more steps, but still burn similar calories.



Marketing recommendations to expand globally:

##### 🔢  Obtain more data for an accurate analysis, encouraging users to use a wifi-connected scale instead of manual weight entries. 

##### 🚲  Educational healthy style campaign encourages users to have short active exercises during the week, longer during the weekends, especially on Sunday where we see the lowest steps and most sedentary minutes.

##### 🎁  Educational healthy style campaign can pair with a point-award incentive system. Users completing the whole week's exercise will receive Bellabeat points on products/memberships.

##### 🏃‍♂️ The product, such as Leaf wellness tracker, can beat or vibrate after a prolonged period of sedentary minutes, signaling the user it's time to get active! Similarly, it can also remind the user it's time to sleep after sensing a prolonged awake time in bed.










