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

61. 













