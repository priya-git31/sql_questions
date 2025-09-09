1.
-- ID 2006
-- Return a distribution of users activity per day of the month. By distribution we mean the number of posts per day of the month.

SELECT 
     DAY(post_date) AS day, 
     COUNT(*) AS count 
FROM 
    facebook_posts 
GROUP BY 
    DAY(post_date)

2.
-- ID 2100
-- Given the education levels and salaries of a group of individuals, find what is the average salary for each level of education.
SELECT 
     education, 
     AVG(salary) AS avg_salary 
FROM 
    google_salaries 
GROUP BY 
    education

3.
-- ID 2109
-- Write a query to get a list of products that have not had any sales. 
-- Output the ID and market name of these products.
SELECT 
    p.prod_sku_id, 
    p.market_name 
FROM 
    dim_product p LEFT JOIN fct_customer_sales s ON p.prod_sku_id = s.prod_sku_id 
WHERE 
    s.order_id IS NULL


4. 
-- ID 2127
-- Calculate the sales revenue for the year 2021.
SELECT 
     SUM(order_total) AS revenue 
FROM 
    amazon_sales 
WHERE 
    YEAR(order_date) = 2021

 5. 
-- ID 2163
-- You have been asked to sort movies according to their duration in descending order.
-- Your output should contain all columns sorted by the movie duration in the given dataset.

SELECT 
     * 
FROM 
    movie_catalogue
ORDER BY duration DESC


6. 
-- ID 9602
-- Find hotels in the Netherlands that got complaints from guests about room dirtiness (word "dirty" in its negative review). Output all the columns in your results
SELECT 
     * 
FROM 
    hotel_reviews 
WHERE 
     negative_review LIKE '%dirty%'

7.
-- ID 9625
-- Find the price of the cheapest property for every city.
WITH CTE AS(
SELECT 
    city, 
    MIN(price) AS min_price,
    RANK() OVER (PARTITION BY city ORDER BY MIN(price) ASC) AS rnk
FROM 
    airbnb_search_details
GROUP BY 
    city
)
SELECT 
    city, 
    min_price
FROM
   CTE 
WHERE rnk = 1


8.
-- ID 9626
-- Find all neighbourhoods present in this dataset.
SELECT 
    DISTINCT(neighbourhood)
FROM
    airbnb_search_details


9.
ID 9627
-- Find the average number of beds in each neighborhood that has at least 3 beds in total.
-- Output results along with the neighborhood name and sort the results based on the number of average beds in descending order.

WITH CTE AS(
SELECT 
     neighbourhood, 
     SUM(beds) AS total_beds,
     AVG(beds) AS avg_beds
FROM 
     airbnb_search_details
WHERE 
    neighbourhood IS NOT NULL
GROUP BY 
    neighbourhood 
HAVING 
    SUM(beds) >= 3
)
SELECT 
     neighbourhood, 
     avg_beds AS n_beds_avg
FROM CTE
ORDER BY 2 DESC

-- 10. 
-- ID 9666
-- Find the industry with lowest average sales. Output that industry.

WITH CTE AS (
SELECT 
    industry, 
    AVG(sales) AS avg_sales 
FROM 
   forbes_global_2010_2014
GROUP BY industry 
ORDER BY AVG(sales) ASC 
LIMIT 1 
)
SELECT 
    industry 
FROM
   CTE


11. ID 9669
-- Count the number of speakers for each language.
-- Sort the result based on the number of speakers in descending order.

SELECT 
     language, 
     COUNT(*) AS n_speakers 
FROM 
    playbook_users
GROUP BY 1 
ORDER BY 2 DESC

-- 12. 
-- ID 9640
-- Find the average number of searches made by each user and present the result with their corresponding user id.
SELECT 
    id_user, 
    AVG(n_searches) AS avg_searches 
FROM 
   airbnb_searches
GROUP BY id_user
ORDER BY AVG(n_searches) DESC


13. 
-- ID 9641
-- How many unique users have performed a search?
SELECT 
    COUNT(DISTINCT id_user) 
FROM
   airbnb_searches

14. 
-- ID 9649
-- All required columns and the first 5 rows of the solution are shown
SELECT 
     COUNT(DISTINCT account_id) AS n_login
FROM
    product_logins
WHERE YEAR(login_date) = 2016

 15. 
-- ID 9656
-- What is the average height of quarterbacks?
SELECT 
     AVG(heightinchestotal) AS avg_height_inches 
FROM 
    nfl_combine 
WHERE position = 'QB'

16.
-- ID 9660
-- Count the number of students lectured by each teacher.
-- Output the result along with the name of the teacher.
SELECT 
     teacher, 
     COUNT(student_id) AS n_students 
FROM 
    sat_scores 
GROUP BY teacher 
ORDER BY n_students  DESC


17. 
-- ID 9677
-- Count the number of cancelled flights by American Airlines (AA).
SELECT 
     SUM(cancelled) AS n_flights 
FROM 
    us_flights
WHERE 
    unique_carrier = 'AA'

18. 
-- ID 9681
-- Find the highest market value for each sector.
-- Output the sector name along with the result.
SELECT 
     sector, 
     MAX(marketvalue) AS max_market_value
FROM
    forbes_global_2010_2014
GROUP BY sector 
ORDER BY max_market_value DESC

19.
-- ID 10168
-- Find the total number of records that belong to each variety in the dataset. Output the variety along with the corresponding number of records. Order records by the variety in ascending order.
SELECT 
     variety, 
     COUNT(*) AS n_total_varities 
FROM 
    iris 
GROUP BY variety 
ORDER BY COUNT(*) DESC

20. 
-- ID 10170
-- Find the gender that has made the most number of doctor appointments.
-- Output the gender along with the corresponding number of appointments.
SELECT 
     gender, 
     COUNT(appointmentid) AS n_appointments
FROM 
     medical_appointments
GROUP BY gender 
ORDER BY COUNT(appointmentid) DESC
LIMIT 1

21. 
-- ID 10183
-- Find the total cost of each customer's orders. Output customer's id, first name, and the total order cost. Order records by customer's first name alphabetically.
SELECT 
      c.id, 
      c.first_name, 
      SUM(o.total_order_cost)
FROM 
    customers c JOIN orders o ON c.id = o.cust_id 
GROUP BY c.id 
ORDER BY SUM(o.total_order_cost) DESC


22
-- ID 10184
-- Order all countries by the year they first participated in the Olympics.
-- Output the National Olympics Committee (NOC) name along with the desired year.
-- Sort records in ascending order by year, and alphabetically by NOC.
SELECT 
     noc, 
     MIN(year) AS first_time_year 
FROM 
    olympics_athletes_events
GROUP BY noc 
ORDER BY MIN(year) ASC

23
-- ID 10277
-- Find all inspections which are part of an inactive program.
SELECT * 
FROM 
     los_angeles_restaurant_health_inspections
WHERE program_status = 'INACTIVE'


 25. 
-- ID 10007
-- Find the average cost of each request status.
-- Request status can be either 'success' or 'fail'.
-- Output the request status along with the average cost.
SELECT
     request_status, 
     AVG(monetary_cost) AS average_cost 
FROM 
    uber_ride_requests
GROUP BY request_status 
ORDER BY 2 ASC

26. 
-- ID 10009
-- Find the total costs and total customers acquired in each year.
-- Output the year along with corresponding total money spent and total acquired customers.
SELECT 
    year, 
    SUM(money_spent) AS total_money_spent,
    SUM(customers_acquired) AS total_customers_acquired
FROM 
    uber_advertising
GROUP BY year 


27.
-- ID 10021
-- Find all top-rated wineries based on points.
-- Consider a top-rated winery has been awarded points more or equal than 95.
SELECT 
    DISTINCT winery 
FROM 
    winemag_p1
WHERE points >= 95


28. 
-- ID 10024
-- Find wine varieties tasted by 'Roger Voss' and with a value in the 'region_1' column of the dataset. 
-- Output unique variety names only.
SELECT 
     DISTINCT variety 
FROM 
    winemag_p2
WHERE taster_name = 'Roger Voss' AND region_1 IS NOT NULL 


29. 
-- ID 10050
-- Find the review count for one-star businesses from yelp.
-- Output the name along with the corresponding review count.
SELECT 
    name, 
    review_count 
FROM yelp_business 
WHERE stars = 1

30. 
-- ID 10051
-- Find the number of open businesses.
SELECT 
    COUNT(*) AS business_open 
FROM 
    yelp_business
WHERE is_open = TRUE

31. 
-- ID 10052
-- Find the average number of stars for each state.
-- Output the state name along with the corresponding average number of stars.
SELECT 
     state, 
     AVG(stars) AS average_stars 
FROM 
    yelp_business
GROUP BY state 
ORDER BY AVG(stars) DESC

32. 
-- ID 10167
-- Find the total number of housing units completed for each year. 
-- Output the year along with the total number of housings. Order the result by year in ascending order.
-- Note: Number of housing units in thousands.
SELECT 
     year, 
     SUM(south + west + midwest + northeast) AS n_units
FROM 
    housing_units_completed_us
GROUP BY year 
ORDER BY n_units DESC


33. 
-- ID 10356
-- Find doctors with the last name of 'Johnson' in the employee list. 
-- The output should contain both their first and last names.
SELECT 
     first_name, 
     last_name 
FROM 
    employee_list
WHERE last_name = 'Johnson' AND profession = 'Doctor'


34. 
-- ID 10362
-- You are provided with an already aggregated dataset from Amazon that contains detailed information about sales across different products and marketplaces. Your task is to list the top 3 sellers in each product category for January.
--  In case of ties, rank them the same and include all sellers tied for that position.
-- The output should contain seller_id ,total_sales ,product_category , market_place, and sales_date.
WITH CTE AS (
SELECT 
     product_category, 
     seller_id, 
     total_sales, 
     market_place, 
     sales_date, 
     DENSE_RANK() OVER (PARTITION BY product_category ORDER BY total_sales DESC) AS dense_rnk
FROM 
    sales_data
WHERE MONTH(sales_date) = 01
)
SELECT 
     product_category, 
     seller_id, 
     total_sales, 
     market_place, 
     sales_date
FROM 
    CTE 
WHERE dense_rnk <= 3

35. 
ID 9691
-- Find all facilities with the zip code 90049, 90034, or 90045.
SELECT 
     DISTINCT facility_name 
FROM 
    los_angeles_restaurant_health_inspections
WHERE facility_zip IN (90049, 90034,  90045)


36. 
ID 9749
-- Find the most dangerous places in SF based on the crime count per address and district combination.
-- Output the number of incidents alongside the corresponding address and the district.
-- Order records based on the number of occurrences in descending order.

SELECT 
     address, 
     pd_district,
     COUNT(id) AS n_occurences 
FROM 
    sf_crime_incidents_2014_01
GROUP BY address, pd_district
ORDER BY n_occurences DESC


37. 
ID 9757
-- Find the genres that yielded the highest sales.
-- Output the genre alongside its total sales.
-- Order results based on the total sales in descending order.
SELECT 
    genre, 
    SUM(total) AS total_sales 
FROM 
    global_weekly_charts_2013_2014
GROUP BY genre
ORDER BY total_sales DESC

38. 
-- ID 9758
-- Find the best publishers based on total sales made by each publisher.
-- Output publishers alongside their total sales.
-- Order records based on the sales in descending order.
SELECT 
     publisher, 
     SUM(total) AS total_sales 
FROM 
     global_weekly_charts_2013_2014
GROUP BY publisher 
ORDER BY total_sales DESC


39. 
-- ID 9760
-- Find the number of people that made a search on Airbnb.
SELECT 
    COUNT(DISTINCT id_user) AS total_people_searching 
FROM 
    airbnb_searches


40. 
-- ID 9765
-- List all interactions of user with id 4 on either day 0 or 2.
SELECT 
    * 
FROM 
    facebook_user_interactions
WHERE user1 = 4 AND day = 0 OR day = 2

41. 
-- ID 9798
-- Find the average profit for major banks.
SELECT 
    AVG(profits)
FROM 
    forbes_global_2010_2014
WHERE industry = 'Major Banks'

41. 
-- ID 9800
-- Find the total market value for the financial sector.
SELECT 
    SUM(marketvalue)
FROM 
     forbes_global_2010_2014
WHERE sector = 'Financials'


42. 
-- ID 9801
-- Find the number of USA companies that are on the list.
SELECT 
     COUNT(DISTINCT company) AS n_us_companies 
FROM 
    forbes_global_2010_2014
WHERE country = 'United States'


43. 
-- ID 9803
-- Find the total assets of the energy sector.
SELECT 
     SUM(assets) AS total_assets 
FROM
    forbes_global_2010_2014
WHERE sector = 'energy'


44. 
-- ID 9805
-- Find drafts which contains the word 'optimism'.
select 
     filename, 
     contents 
FROM
    google_file_store
WHERE filename LIKE '%draft%' AND contents LIKE '%optimism%'


45. 
-- ID 9869
-- You have been asked to calculate the total salary for each department. Provide the salary as well as the corresponding department.
SELECT 
     department, 
     SUM(salary) AS total_salary
FROM 
    worker
GROUP BY department 
ORDER BY total_salary DESC

46. 
ID 9664
-- Finding the highest market value for each sector. Which sector is it best to invest in?
-- Output the result along with the sector name. 
-- Order the result based on the highest market value in descending order.
SELECT 
     sector, 
     MAX(marketvalue) AS max_marketvalue 
FROM
    forbes_global_2010_2014
GROUP BY 
     sector 
ORDER BY max_marketvalue DESC

47. 
-- ID 9665
-- Count the number of companies in the Information Technology sector in each country.
-- Output the result along with the corresponding country name.
-- Order the result based on the number of companies in the descending order.
SELECT 
     country, 
     COUNT(DISTINCT company) AS n_companies 
FROM 
     forbes_global_2010_2014
WHERE sector = 'Information Technology'
GROUP BY country 
ORDER BY n_companies DESC

48. 
-- ID 9667
-- How many users speak English, German, French or Spanish?
-- Note: Users who speak more than one language are counted only once.
SELECT 
     COUNT( DISTINCT user_id) AS n_wanted_speakers 
FROM 
    playbook_users
WHERE language IN ('French', 'Spanish', 'English', 'German')

49. 
-- ID 9672
-- Find how many different origin airports exist?
SELECT 
     COUNT(DISTINCT origin) AS n_origin_airports 
FROM 
    us_flights


50. 
-- ID 9673
-- What are the unique airport codes for all origin airports in the dataset? (e.g., LAX, JFK, SFO)
SELECT 
     DISTINCT(origin)
FROM 
    us_flights

51.
-- ID 9774
-- Find the maximum step reached for every feature.
Output the feature id along with its maximum step.
SELECT 
     feature_id, 
     MAX(step_reached) AS max_step_reached 
FROM 
    facebook_product_features_realizations
GROUP BY feature_id 
ORDER BY max_step_reached

52. 
-- ID 9788
-- Find the total number of interactions on days 0 and 2.
-- Output the result alongside the day.
SELECT 
     day, 
     COUNT(*) AS n_interactions 
FROM 
    facebook_user_interactions
WHERE day = 0 OR day = 2
GROUP BY day

53. 
-- ID 9807
-- Find all companies with more than 10 employees. Output all columns.

SELECT 
     * 
FROM
    google_adwords_earnings
WHERE 
     n_employees > 10


54. 
-- ID 9808
-- Find business types present in the dataset.
SELECT 
     DISTINCT(business_type)
FROM
    google_adwords_earnings

55.
-- ID 9843
-- Find all workers whose salary lies between 100,000 and 500,000 inclusive.
SELECT * 
FROM worker
WHERE salary BETWEEN '100000' AND '500000'

56. 
-- ID 9844
-- Find all workers who joined on February 2014.
SELECT * 
FROM 
    worker 
WHERE MONTH(joining_date) = 02 AND YEAR(joining_date) = '2014'


57. 
-- ID 9906
-- Find the number of employees in each department.
-- Output the department name along with the corresponding number of employees.
-- Sort records based on the number of employees in descending order.
SELECT 
     department, 
     COUNT(DISTINCT id) AS n_employees 
FROM 
    employee
GROUP BY department

58.
-- ID 9911
-- Find departments with at more than or equal 5 employees.
-- SELECT 
     department 
FROM 
    employee 
GROUP BY department 
HAVING COUNT(DISTINCT id) >= 5


59.
-- ID 9920
-- Find employees in the Sales department who achieved a target greater than 150.
-- Output first names of employees.
-- Sort records by the first name in descending order.
SELECT 
     first_name 
FROM 
    employee
WHERE department = 'Sales' AND target > 150 
ORDER BY first_name DESC

60. 
-- ID 9923
-- Find the number of libraries that had 100 or more of total checkouts in February 2015. 
-- Be aware that there could be more than one row for certain library on monthly basis.
SELECT 
     COUNT(DISTINCT home_library_code) AS n_libray 
FROM 
     library_usage
WHERE 
     total_checkouts >= 100 AND circulation_active_year = 2015 AND circulation_active_month = 'February'

-- 61. ID 9674
-- Find the top 5 longest US flights by distance.
-- Output the result along with the corresponding origin, destination, and distance.
-- Sort the flights from longest to shortest.
SELECT 
     origin, 
     dest, 
     MAX(distance) AS longest_distance 
FROM 
    us_flights
GROUP BY origin, dest
ORDER BY longest_distance DESC
LIMIT 5 


62. 
-- ID 9676
-- Find the average distance an airplane travels from each origin airport.
-- Output the result along with the corresponding origin.
SELECT 
      origin, 
      AVG(distance) AS avg_distance
FROM
    us_flights 
GROUP BY origin 
ORDER BY avg_distance DESC

63. 
-- ID 9704
-- Find the number of inspections per day.
-- Output the result along with the date of the activity.
-- Order results based on the activity date in the ascending order.
SELECT 
      activity_date, 
      COUNT(*) AS n_inspections 
FROM 
    los_angeles_restaurant_health_inspections
GROUP BY activity_date 
ORDER BY n_inspections DESC

64. 
ID 9702
-- Count the number of unique facilities per municipality zip code along with the number of inspections.
-- Output the result along with the number of inspections per each municipality zip code. 
-- Sort the result based on the number of inspections in descending order.

SELECT 
     facility_zip, 
     COUNT(DISTINCT facility_id) AS no_facilities, 
     COUNT(*) AS no_inspections 
FROM
    los_angeles_restaurant_health_inspections
GROUP BY facility_zip 
ORDER BY no_inspections DESC

65 
-- ID 9719
-- Find all business postal codes of restaurants with issues related to the water (violation description contains substring "water").

SELECT 
    DISTINCT  business_postal_code
FROM
    sf_restaurant_health_violations
WHERE
     violation_description LIKE '%water%'


66. 
-- ID 9720
-- Find the business names that scored less than 50 in inspections.
-- Output the result along with the corresponding inspection date and the score.

SELECT 
     DISTINCT business_name, 
     inspection_date, 
     inspection_score 
FROM 
     sf_restaurant_health_violations
WHERE 
     inspection_score < 50 


67. 
-- ID 9861
-- Find the number of employees in each department.
-- Output the department name along with the corresponding number of employees.
SELECT 
     department, 
     COUNT(DISTINCT worker_id) AS no_employees 
FROM 
    worker 
GROUP BY department 
ORDER BY no_employees DESC


68. 
ID 9975
-- Find all employees with a job title that contains 'METROPOLITAN TRANSIT AUTHORITY' 
-- and output the employee's name along with the corresponding total pay with benefits.
SELECT 
     employeename, 
     totalpaybenefits
FROM 
    sf_public_salaries
WHERE jobtitle LIKE '%METROPOLITAN TRANSIT AUTHORITY%'


69. 
-- ID 10164
-- Find the total AdWords earnings for each business type. 
-- Output the business types along with the total earnings.

SELECT 
     business_type, 
     SUM(adwords_earnings) AS earnings 
FROM 
    google_adwords_earnings
GROUP BY business_type 
ORDER BY earnings DESC

70. 
-- ID 10132
-- Find the number of crime occurrences for each day of the week.
-- Output the day alongside the corresponding crime count.
SELECT 
     day_of_week, 
     COUNT(*) AS n_occurences 
FROM 
    sf_crime_incidents_2014_01
GROUP BY day_of_week 
ORDER BY n_occurences DESC


71. 
-- ID 10153
-- Find the number of Yelp businesses that sell pizza.
SELECT 
     COUNT(*)
FROM 
    yelp_business 
WHERE 
    categories LIKE '%pizza%'


72. 
-- ID 10160
-- Rank guests based on their ages.
-- Output the guest id along with the corresponding rank.
-- Order records by the age in descending order.

WITH CTE AS (
SELECT 
     guest_id, 
     RANK() OVER (ORDER BY age DESC) AS 'rank'
FROM 
    airbnb_guests
)
SELECT * 
FROM CTE


73. 
-- ID 10122
-- Find the total number of searches for houses in Westlake neighborhood with a TV among the amenities.
SELECT 
     COUNT(*) AS n_searches 
FROM 
    airbnb_search_details
WHERE neighbourhood = 'Westlake' AND amenities LIKE '%TV%'

74. 
-- ID 10022
-- Find all wine varieties which can be considered cheap based on the price.
-- A variety is considered cheap if the price of a bottle lies between 5 to 20 USD.
-- Output unique variety names only.

SELECT 
     DISTINCT variety 
FROM 
    winemag_p1
WHERE price BETWEEN 5 AND 20


75. 
ID 10022
-- Find all wine varieties which can be considered cheap based on the price.
-- A variety is considered cheap if the price of a bottle lies between 5 to 20 USD.
-- Output unique variety names only.
SELECT 
     COUNT(DISTINCT winery) AS n_wineries 
FROM 
    winemag_p1
WHERE 
     country = 'US' AND price >=  200

76
-- ID 10054
-- Find the number of entries per star.
-- Output each number of stars along with the corresponding number of entries.
-- Order records by stars in ascending order.
SELECT 
     stars, 
     COUNT(DISTINCT user_id) AS n_entries 
FROM 
    yelp_reviews
GROUP BY stars
ORDER BY n_entries DESC


77. 
-- ID 10055
-- Find records with the value '?' in the stars column.
SELECT *
FROM yelp_reviews
WHERE stars LIKE '%?%'

78. 
-- ID 9990
-- Find songs that have more than 3 million streams.
-- Output the track name, artist, and the corresponding streams.
-- Sort records based on streams in descending order.
SELECT 
    trackname, 
    artist,
    streams 
FROM 
    spotify_worldwide_daily_song_ranking
WHERE streams > 3000000
ORDER BY streams DESC


79. 
-- ID 9994
-- Find songs with less than 2000 streams.
-- Output the track name along with the corresponding streams.
-- Sort records by streams in descending order.
-- There is no need to group rows with same track name

SELECT 
     trackname,
     streams 
FROM 
    spotify_worldwide_daily_song_ranking
WHERE 
    streams < 2000
ORDER BY 
     streams DESC


80. 
-- ID 9728
-- You are given a dataset of health inspections that includes details about violations. 
-- Each row represents an inspection, and if an inspection resulted in a violation, the violation_id column will contain a value.
-- Count the total number of violations that occurred at 'Roxanne Cafe' for each year, based on the inspection date.
-- Output the year and the corresponding number of violations in ascending order of the year.

SELECT 
     YEAR(inspection_date) AS inspection_year, 
     COUNT(violation_id) AS n_violations 
FROM
    sf_restaurant_health_violations
WHERE 
     business_name = 'Roxanne Cafe'
GROUP BY YEAR(inspection_date)
ORDER BY n_violations DESC


81. 
-- ID 9770
-- Find the number of views each post has.
-- Output the post id along with the number of views.
-- Order records by post id in ascending order.

SELECT 
     post_id, 
     COUNT(*) AS n_views 
FROM 
    facebook_post_views
GROUP BY post_id
ORDER BY n_views DESC


82. 
-- ID 9771
-- Find all actions which occurred more than once in the weblog.

SELECT 
     action
FROM 
    facebook_web_log
GROUP BY action
HAVING COUNT(*) > 1

83. 
-- ID 9871
-- List all hotels with their total number of reviews. 
-- Show the results sorted by the number of reviews from highest to lowest and output the hotel name along with the reviews.

SELECT 
hotel_name, 
total_number_of_reviews
FROM 
hotel_reviews
GROUP BY hotel_name 
ORDER BY total_number_of_reviews DESC

84.
ID 9930
Find and rank libraries by their total renewals. 
Output the home library definition and its corresponding total number of renewals. 
Sort the results in descending order by total renewals.
WITH CTE AS(
SELECT 
     home_library_definition, 
     SUM(total_renewals) AS total_lib_renewals, 
     RANK() OVER (ORDER BY SUM(total_renewals) DESC) AS rnk 
FROM 
    library_usage
GROUP BY home_library_definition
)
SELECT 
total_lib_renewals, 
home_library_definition
FROM 
CTE


85. 
-- ID 9707
-- Find the mean of inspections scores between 91 and 100.
-- Assuming that the scores are normally distributed.
SELECT 
     AVG(score) AS avg_score 
FROM 
    los_angeles_restaurant_health_inspections
WHERE 
     score BETWEEN '91' AND '100'


86. 
ID 9717
-- Find all businesses which have low-risk safety violations.
SELECT 
DISTINCT business_name 
FROM 
sf_restaurant_health_violations
WHERE 
risk_category LIKE '%LOW%'

87. 
ID 9718
-- Find all businesses which have a phone number.
SELECT 
DISTINCT business_name 
FROM 
sf_restaurant_health_violations
WHERE business_phone_number IS NOT NULL


88. 
-- ID 9721
-- Find all inspections made on restaurants and output the business name and the inspection score. 
-- For this question business is considered as a restaurant if it contains string "restaurant" inside its name.
SELECT 
DISTINCT business_name, 
inspection_score 
FROM 
sf_restaurant_health_violations
WHERE business_name LIKE '%restaurant%'

89. 
ID 9943
-- Find the lowest, average, and the highest ages of athletes across all Olympics. 
-- HINT: If athlete participated in more than one discipline at one Olympic games, consider it as a separate athlete, 
-- no need to remove such edge cases.

SELECT 
MIN(age) AS lowest_age, 
AVG(age) AS mean_age, 
MAX(age) AS highest_age
FROM
olympics_athletes_events

90. 
ID 9974
Find benefits that people with the name 'Patrick' have.
Output the full employee name along with the corresponding benefits.
SELECT 
employeename, 
benefits 
FROM 
sf_public_salaries
WHERE employeename LIKE '%PATRICK%'


91.
-- ID 9766
-- Find the complaint id for the processed complaints of type 1.
SELECT 
DISTINCT complaint_id
FROM 
facebook_complaints
WHERE 
type = 1 AND processed = TRUE

-- 92. 
-- ID 9682
-- Find all industries with a positive average profit. For those industries extract their lowest sale.
-- Output the industry along with the corresponding lowest sale and average profit.
-- Sort the output based on the lowest sales in ascending order.

select 
industry, 
min(sales) AS min_sales, 
avg(profits) AS avg_profit 
from 
forbes_global_2010_2014
group by industry 
having avg(profits) > 0 

93. 
-- How many athletes were drafted into NFL from 2013 NFL Combine? 
-- The pickround column specifies if the athlete was drafted into the NFL.
-- A value of 0 means that the athlete was not drafted into the NFL.
select 
count(pickround) AS n_athletes
from 
nfl_combine
where year = 2013 AND pickround != 0


94. 
ID 9687
Find the details of oscar winners between 2001 and 2009.
select * 
from 
oscar_nominees
where year between 2001 and 2009 and winner = 1

95. 
-- ID 9697
-- Find the owner_name and the pe_description of facilities owned by 'BAKERY' where low-risk cases have been reported.
select 
DISTINCT owner_name, 
pe_description 
from 
los_angeles_restaurant_health_inspections
where 
owner_name like '%BAKERY%'

96. 
-- ID 9768
-- Find all posts with a keyword that contains 'nba' substring. For such rows output all columns.
select * 
from facebook_posts 
where post_keywords like '%nba%'

97. 
ID 2142
-- You've been asked by Amazon to find the shipment_id and weight of the third heaviest shipment.
-- Output the shipment_id, and total_weight for that shipment_id.
-- In the event of a tie, do not skip ranks.
with cte as (
select 
shipment_id, 
sum(weight) AS total_weight, 
dense_rank() over (order by sum(weight) desc) as rnk
from 
amazon_shipment
group by shipment_id
)
select
shipment_id, 
total_weight 
from 
cte 
where rnk = 3

98. 
-- ID 9693
-- Find the average score for grades A, B, and C.
-- Output the results along with the corresponding grade (ex: 'A', avg(score)).
select 
grade, 
avg(score) AS avg_score
from los_angeles_restaurant_health_inspections
group by grade 

99. 
ID 9867
-- You have been asked to find the three lowest distinct salaries. 
-- For example, if two people earn the same amount of money, they are counted as one.
select 
distinct salary 
from 
worker 
order by salary asc 
limit 3

100. 
-- ID 9903
-- Find employees whose bonus is less than $150.
-- Output the first name along with the corresponding bonus.
select 
first_name, 
bonus
from employee
where bonus < 150

101. 
Find how many people registered in libraries in the year 2016.
Output the total patrons. Keep in mind that each row represents different patron.
SELECT 
COUNT(*) AS titak_patrons
FROM 
library_usage
WHERE year_patron_registered= '2016'


102. 
-- ID 9933
-- Find all Danish athletes who won a medal.
-- Output unique names only.
select 
distinct(name)
from olympics_athletes_events
where medal is not null and team like '%Denmark%'

103. 
-- ID 9935
-- Find all events participated by Christine Jacoba Aaftink.
-- Output unique values only.

select 
distinct event
from olympics_athletes_events
where name = 'Christine Jacoba Aaftink'

104. 
-- ID 10000
-- Find the year that Uber acquired more than 2000 customers through advertising using celebrities.
select 
year 
from 
uber_advertising
where advertising_channel = 'celebrities' and customers_acquired > 2000

105. 
ID 10002
Find the advertising channel(s) where Uber spent more than 100k USD in 2019.
select 
advertising_channel 
from uber_advertising
where year = '2019' and money_spent > 100000

106. 
ID 9931
Find the number of patrons who renewed books at least once but less than 10 times in April 2015. Each row is an unique patron.
select 
count(*) AS n_patrons 
from library_usage
where total_renewals between 1 and 9 and circulation_active_month = 'April' and circulation_active_year = '2016'


107. 
-- ID 9932
-- Find unique names women who participated in an Olympics before World War 2. 
-- Let's consider the year 1939 as the start of WW2.
select 
distinct name 
from olympics_athletes_events
where 
year < '1939' and sex = 'F'

108. 
-- ID 9936
-- Find all minor that participated in Olympics games.
-- A player is considered as a minor if he or she is 18 or less years old.
-- Output the name and age of the player along with participated Olympic games (ex: 1992 Summer).

select 
name, 
age, 
games
from olympics_athletes_events
where age <= 18

109. 
-- ID 9937
-- Find all athletes who were older than 40 years when they won either Bronze or Silver medals.
select 
distinct name 
from olympics_athletes_events
where age > 40 and medal in ('Silver', 'Bronze')

110. 
ID 2013
How many customers placed an order and what is the average order amount?
select 
count(distinct customer_id), 
avg(amount)
from
postmates_orders

111. 
ID 9996
Find the average number of streams across all songs.
select 
avg(streams) as avg_stremas 
from spotify_worldwide_daily_song_ranking


112. 
-- ID 9884
-- Find the team division of each player.
-- Output the player name along with the corresponding team division.
select 
p.player_name, 
t.division
from college_football_players p JOIN college_football_teams t ON t.school_name = p.school_name

113. 
-- ID 9834
-- Combine the first and last names of workers with a space in-between in a column 'full_name'.
select 
CONCAT(first_name, ' ', last_name) AS full_name
from worker;

114. 
-- ID 9831
-- Print the first name after removing white spaces from the left side.
select 
LTRIM(first_name) AS first_name_trim
from worker_ws;

115. 
-- ID 9830
-- Print the first name after removing white spaces from the right side.
select 
RTRIM(first_name) AS first_name_trim
from worker_ws;

116. 
-- ID 9828
-- Print the first three characters of the first name.
select 
SUBSTRING(first_name, 1, 3)
from worker;

117. 
-- ID 2166
-- You've been asked to arrange a column of random IDs in ascending alphabetical order based on their second character.
select 
id
from random_id
order by substring(id,2,1), id; 

118. 
-- ID 9840
-- Find all workers whose first name contains the letter 'a'. Output all columns for such workers.
select * 
from worker
where first_name like '%a%'


119. 
-- ID 9842
-- Find all workers whose first name contains 6 letters and also ends with the letter 'h'.
-- Display all information about the workers in output.

select *
from worker
where first_name like '_____h'


120. 
-- ID 9841
-- Find all workers whose first name ends with the letter 'a'.
select * 
from worker
where first_name like '%a'


121. 
-- ID 9836
-- Sort workers in ascending order by the first name and then in descending order by department name.
select *
from worker
order by first_name asc, department desc

122. 
-- ID 10540
-- Calculate the average score for each project, but only include projects where more than one team member has provided a score.
-- Your output should include the project ID and the calculated average score for each qualifying project.

select 
project_id, 
avg(score)
from project_data
group by project_id 
having count(score) > 1

123. 
-- ID 9617
-- Find all searches for accommodations where the number of bedrooms is equal to the number of bathrooms.
select *
from airbnb_search_details
where bedrooms = bathrooms

124. 
-- ID 9615
-- Find the search details for apartments where the property type is Apartment and the accommodation is suitable for one person.

select *
from airbnb_search_details
where property_type = 'Apartment' AND accommodates = 1

125. 
-- ID 9690
-- Find all routine inspections where high-risks issues were found.

select *
from los_angeles_restaurant_health_inspections
where service_description = 'ROUTINE INSPECTION' and pe_description LIKE '%HIGH RISK%'

126. 
-- ID 9846
-- Find the full name of workers whose salaries range from 50,000 to 100,000 inclusive.
-- Output the worker's first name and last name in one column along with their salaries.
with cte as (
SELECT 
    CONCAT(first_name, ' ', last_name ) AS employee_name, 
    salary, 
    dense_rank() over (order by salary desc) as rnk
FROM 
    worker
)
select employee_name, 
salary
from cte
where rnk = 1


127. 
-- ID 9988
-- Get the job titles of the 3 employees who received the most overtime pay
-- Output the job title of selected records.

with cte as(
select 
jobtitle, 
overtimepay, 
dense_rank() over (order by overtimepay desc) as rnk 
from 
sf_public_salaries
)
select 
jobtitle 
from 
cte
where rnk <= 3

128. 
-- ID 2083
-- Count how many claims submitted in December 2021 are still pending.
-- A claim is pending when it has neither an acceptance nor rejection date.

select 
count(*) as n_cliams 
from 
cvs_claims
where YEAR(date_submitted) = '2021' AND MONTH(date_submitted) = '12' AND 
date_accepted IS NULL and date_rejected IS NULL



































