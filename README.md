📌 Overview


This project analyzes ride-sharing data to uncover insights into rider behavior, driver performance, and revenue trends. Using SQL, the analysis focuses on real-world business questions such as customer retention, revenue growth, and driver consistency.



The goal is to transform raw operational data into actionable insights that support data-driven decision-making.

🗂️ Dataset Description


The dataset consists of four main tables:

rides – Trip-level data including pickup time, dropoff time, distance, driver ID, and rider ID

drivers_raw – Driver information including name and signup date

riders_raw – Rider information including signup date

payments_raw – Payment transactions for each ride

🛠️ Tools & Techniques
SQL Server (T-SQL)

Joins (INNER JOIN, LEFT JOIN)

Aggregations (SUM, COUNT, AVG)

Common Table Expressions (CTEs)

Window Functions (LAG)

Date Functions (YEAR, MONTH, DATEDIFF)

🔍 Key Business Questions & Analysis


1. 🚗 Longest Rides


Identified the top 10 longest rides based on distance, including driver, rider, route, and payment method.



Business Value:

Helps understand long-distance demand, pricing opportunities, and potential intercity ride patterns.

2. 👥 Rider Retention


Analyzed how many riders who signed up in 2021 remained active in 2024.



Approach:

Used COUNT(DISTINCT rider_id) to accurately measure unique retained users.



Business Value:

Provides insight into customer loyalty and long-term platform engagement.

3. 📈 Revenue Trends & Growth


Calculated quarterly revenue from 2021 to 2024 and measured Year-over-Year (YoY) growth using window functions.



Key Technique:

Used LAG() to compare revenue across the same quarters in different years.



Business Value:

Identifies growth patterns, seasonality, and high-performing periods.

4. 🚕 Driver Consistency (Core Analysis)


Measured driver performance based on average monthly rides since signup, ensuring consistency over time.



Methodology:

Calculated total rides per driver

Computed active duration using:

Business Value:

Identifies the most reliable and consistently active drivers

Useful for incentive programs and performance tracking

📊 Key Insights
Long-distance rides highlight potential high-value routes and demand patterns

Rider retention analysis reveals long-term engagement trends

Revenue shows quarterly variation, indicating possible seasonality

Driver consistency analysis distinguishes reliable drivers from occasional high performers

# 🚖 Ride Data Analysis (SQL)

## 📌 Overview

This project analyzes ride-sharing data to evaluate driver performance and consistency over time. The focus is on identifying the most active drivers based on their average monthly ride activity since signup.

## 🎯 Objectives

* Calculate average monthly rides per driver
* Identify the top 5 most consistent drivers
* Analyze driver activity trends over time

## 🛠 Tools

* SQL

## 📊 Key Analysis

* Extracted ride activity using pickup and drop-off timestamps
* Calculated monthly ride counts per driver
* Computed average monthly rides since each driver’s signup date
* Ranked drivers based on consistency and activity level

## 📈 Key Insights

* Top drivers maintain consistently high ride volumes across months
* Driver activity varies significantly, with a small group driving the majority of rides
* Average monthly rides provide a more accurate performance metric than total rides

💡 Recommendations

* Reward highly consistent drivers to improve retention
* Monitor low-activity drivers for engagement opportunities
* Use monthly averages for fair performance evaluation.



