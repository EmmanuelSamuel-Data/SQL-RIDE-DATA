**📌 Overview**


This project analyzes ride-sharing data to uncover insights into rider behavior, driver performance, and revenue trends. Using SQL, the analysis focuses on real-world business questions such as customer retention, revenue growth, and driver consistency.


**🗂️ Dataset Description**


* The dataset consists of four main tables:

1. rides – Trip-level data including pickup time, dropoff time, distance, driver ID, and rider ID
2. drivers_raw – Driver information including name and signup date
3. riders_raw – Rider information including signup date
4. payments_raw – Payment transactions for each ride

**🛠️ Tools & Techniques**

* SQL Server (T-SQL)
* Joins (INNER JOIN, LEFT JOIN)
* Aggregations (SUM, COUNT, AVG)
* Common Table Expressions (CTEs)
* Window Functions (LAG)
* Date Functions (YEAR, MONTH, DATEDIFF)



**🔍 Key Business Questions & Analysis**


1. 🚗 Longest Rides


Identified the top 10 longest rides based on distance, including driver, rider, route, and payment method.



Business Value:

Helps understand long-distance demand, pricing opportunities, and potential intercity ride patterns.

**2. 👥 Rider Retention**


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

* Calculated total rides per driver
* Computed active duration using:

* Business Value: Identifies the most reliable and consistently active drivers
 Useful for incentive programs and performance tracking

**📊 Key Insights**

* Long-distance rides highlight potential high-value routes and demand patterns
* Rider retention analysis reveals long-term engagement trends
* Revenue shows quarterly variation, indicating possible seasonality
* Driver consistency analysis distinguishes reliable drivers from occasional high performers

**💡 Recommendations**

* Reward highly consistent drivers to improve retention
* Monitor low-activity drivers for engagement opportunities
* Use monthly averages for fair performance evaluation.



