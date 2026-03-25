--1) Top 10 longest rides by distance with driver name, rider name, pickup/dropoff cities
-- and payment method

 SELECT DISTINCT TOP 10
d.name as driver_name,
r.name as rider_name,
rd.pickup_city,
rd.dropoff_city,
round (rd.distance_km, 0) as distance_km,
p.method
from dbo.rides as rd
join dbo.drivers_raw as d 
    on rd.driver_id = d.driver_id
join dbo.riders_raw as r 
     on rd.rider_id = r.rider_id
join dbo.payments_raw as p 
     on rd.ride_id = p.ride_id
     where p.amount > 0
order by distance_km DESC;

-- 2) How many riders who signedup in 2021 took rides in 2024
select count(distinct
r.rider_id) as riders_retained_2024
from dbo.riders_raw as r 
join dbo.rides as rd
   on r.rider_id = rd.rider_id
join dbo.payments_raw as p
   on rd.ride_id = p.ride_id
where year (r.signup_date) = 2021
and year (p.paid_date) = 2024
and p.amount >0;

--3) Compare quarterly revenue between 2021,2022,2023, and 2024. which quarter had the biggest YoY growth
WITH quarterly_revenue AS (
SELECT
YEAR(paid_date) AS year,
 DATEPART(QUARTER, paid_date) AS quarter,
 SUM(amount) AS Total_revenue
 FROM dbo.payments_raw
 WHERE amount >0 
 GROUP BY 
 YEAR(paid_date),
 DATEPART(QUARTER,paid_date)
 ),

 yoy_calc AS (
 SELECT
 year, quarter, Total_revenue,
 LAG(Total_revenue, 1) OVER (
 PARTITION BY quarter ORDER BY year) as prev_year_revenue
 FROM quarterly_revenue

)
SELECT 
year,
quarter, 
Total_revenue,
prev_year_revenue,
CASE 
  WHEN prev_year_revenue IS NULL THEN NULL
  ELSE ROUND(((Total_revenue - prev_year_revenue)/ prev_year_revenue) *100,2)
  END AS yoy_growth_present
  FROM yoy_calc
  ORDER BY year, quarter;


 --4) For each driver, calculate their average monthly rides since signup, who are the top 5  -- drivers with the highest consistency(most active ride per month)
 WITH driver_rides AS (
 SELECT
 r.driver_id,
 COUNT(r.ride_id) AS total_rides
 FROM rides r
 GROUP BY r.driver_id

),

driver_tenure AS (
SELECT 
d.driver_id,
d.name,
d.signup_date,
DATEDIFF(MONTH, d.signup_date, GETDATE()) AS months_active
FROM drivers_raw d
)
SELECT TOP 5
dt.name AS driver_name,
dr.total_rides,
dt.months_active,
ROUND(
CAST(dr.total_rides AS FLOAT) / NULLIF(dt.months_active, 0),
2
) AS avg_monthly_rides
FROM driver_rides dr
JOIN driver_tenure dt
ON dr.driver_id = dt.driver_id
ORDER BY avg_monthly_rides DESC;
