---Strata Scratch Questions--- 

--ID 10367
--My solution-- 
SELECT 
     ROUND(SUM(listen_duration)) AS total_listen_duration,
     COUNT(DISTINCT(song_id)) AS unique_song_count,
     user_id
FROM listening_habits
GROUP BY user_id;
-- Actual Solution 
SELECT 
    user_id, 
    ROUND(SUM(COALESCE(listen_duration, 0)) / 60.0) AS total_listen_duration, 
    COUNT(DISTINCT song_id) AS unique_song_count
FROM listening_habits
GROUP BY user_id;


--ID 10363--
--ID 10362--

--ID 10361--

--ID 10184--
SELECT
    noc, 
    MIN(year) AS first_time_year
FROM olympics_athletes_events 
GROUP BY noc
ORDER BY noc, first_time_year;


--ID 10183--
SELECT 
    c.id, 
    c.first_name, 
    SUM(o.total_order_cost) AS sum 
FROM 
    customers c 
JOIN orders o ON c.id = o.cust_id 
GROUP BY c.first_name, 
         c.id
ORDER BY c.first_name ASC;


--ID 10170--
SELECT 
    gender, 
    COUNT(appointmentid) AS n_appointments 
FROM 
   medical_appointments 
GROUP BY gender
ORDER BY n_appointments DESC
LIMIT 1;


--10168--
SELECT 
     variety,
     COUNT(*)
FROM iris 
GROUP BY 
     variety
ORDER BY variety ASC;


--ID 9808---
SELECT 
      DISTINCT(business_type)
FROM google_adwords_earnings;

--ID 9787--
SELECT
      DISTINCT(user_id) 
FROM facebook_web_log 
WHERE action = 'scroll_down';

--ID 9769--
SELECT 
     DISTINCT(friend)
FROM facebook_reactions 
WHERE reaction = 'like';

--ID 9760--
SELECT 
     COUNT(DISTINCT(id_user)) AS total_people_searching 
FROM airbnb_searches;

--ID 9720--
SELECT 
    DISTINCT(business_name), 
    inspection_date, 
    inspection_score
FROM sf_restaurant_health_violations
WHERE inspection_score <50;

--ID 9719--
SELECT 
     DISTINCT(business_postal_code)
FROM 
    sf_restaurant_health_violations 
WHERE violation_description LIKE '%water%'
    
--ID 9718--
SELECT 
    DISTINCT(business_name)
FROM 
    sf_restaurant_health_violations 
WHERE business_phone_number IS NOT NULL;

--ID 9717--
SELECT 
     DISTINCT(business_name)
FROM 
    sf_restaurant_health_violations 
WHERE risk_category = 'Low Risk';

--ID 9697--
SELECT 
     DISTINCT owner_name, 
     pe_description
FROM 
    los_angeles_restaurant_health_inspections
WHERE 
    owner_name ILIKE '%BAKERY%' 
    AND pe_description ILIKE '%LOW RISK%'
     
--ID 9702-- WRONG 
SELECT 
     DISTINCT(facility_zip),
     no_families, 
     COUNT(serial_number) AS no_inspections
FROM 
    los_angeles_restaurant_health_inspections 
GROUP BY facility_zip
ORDER BY no_inspections DESC;

--ID 9691--
SELECT 
     DISTINCT(facility_name)
FROM 
    los_angeles_restaurant_health_inspections 
WHERE 
    facility_zip IN ('90049','90034', '90045');

--ID 9674-- WRONG 
select 
     orgin, 
     dest, 
     distance
from us_flights
RANK() OVER (0RDER BY distance desc)

--ID 9673---
select 
     distinct origin
from us_flights

--ID 9672--
select 
    count(distinct origin) AS us_flights
from us_flights;


--Id 9667--
select 
   count(distinct user_id) AS n_wanted_speakers
from
    playbook_users
group by 
    language;

--ID 9649--WRONG 
select 
     count(distinct account_id)
from product_logins
WHERE year = '2016'
    
--ID 9648--
select 
   count(distinct name) AS nfl_combine
* from nfl_combine
WHERE pickround = '1' AND year => '2013';

--ID 9641--
select 
     count(distinct id_user) AS count
from airbnb_searches;

--ID 9631--
select 
     distinct neighbourhood 
from
    airbnb_search_details
where amenities ILIKE '%Parking%' AND cleaning_fee = 'FALSE';

--ID 9626--
select 
     distinct(neighbourhood)
from airbnb_search_details;
    
--ID 9618--
select 
     distinct(neighbourhood)
from 
     airbnb_search_details
where city = 'LA'

---ID  2159---
select 
    distinct(signup_id)
from transactions
WHERE EXTRACT(MONTH FROM transaction_start_date) IN (4,5);

--ID 2159-- CORRECT BUT SOL SEEMS DIFF
SELECT 
    DISTINCT worker_id
FROM 
    worker_logins 
WHERE EXTRACT(YEAR FROM login_timestamp) = 2021 

--ID 2080--
select 
     m.date
     count(distinct m.user_id) As n_users
from
     mobile_logs m 
     join web_logs w ON m.user_id = w.user_id and m.date = w.date
group by  m.date

--Id 2056--
select 
     platform,
     count(distinct user_id) AS n_users
from
    user_sessions
group by platform

-ID 
select 
     account_id, 
     count(distinct user_id) 
from 
     sf_events
where extract(month from date) = 1 
and extract(year from date) = 2021
group by account_id;

--ID 2051--
select 
     account_id, 
     count(distinct user_id) 
from 
     sf_events
where extract(month from date) = 1 
and extract(year from date) = 2021
group by account_id;

--ID 2043-- WRONG 
SELECT 
    e.first_name, 
    e.last_name, 
    e.hire_date, 
    e.termination_date 
FROM 
    uber_employees e 
LEFT JOIN uber_annual_review r ON e.id = r.emp_id 
ORDER BY hire_date DESC
LIMIT 5

--ID 2053-- WRONG 
select 
     account_id
from sf_events 
where extract(month from date) = 12
and extract(year from date) = 2020 / select account_id, 
                                           from sf_events
                                           where extract(month from date) = 1
                                           and extract(year from date) = 2021;

--ID 2009--
select 
     count(distinct(user_id))
from 
     twitch_sessions 
where session_type = 'streamer' AND session_type = 'viewer';

--ID 2018--
select
     distinct(user_id)
from
     rc_users 
where 
    status = 'free' AND user_id NOT IN ( select user_id
                                         from rc_calls
                                         extract(year from date) = '2020' AND 
                                         extract(month from date = '4')

--ID 2013--
SELECT 
    COUNT(DISTINCT customer_id),
    AVG(amount) AS avg
FROM postmates_orders 


--ID 9674--
select 
     origin, 
     dest, 
     distance
from 
    (select 
     origin, 
     dest, 
     distance,
     RANK() OVER (ORDER BY distance desc) AS dist_rank
    from us_flights) AS temp_query
where dist_rank <= 5

--ID 10356--
SELECT 
      first_name, 
      last_name
FROM employee_list
WHERE last_name = 'Johnson' AND profession = 'Doctor'

--ID 10277--
select * 
from los_angeles_restaurant_health_inspections
where program_status = 'INACTIVE';

--ID 10167--
select 
    year, 
    SUM(south + west + midwest + northeast) AS n_units
from housing_units_completed_us
group by year
order by year ASC;

--ID 10164--
select 
     business_type, 
     SUM(adwords_earnings) AS earnings
from google_adwords_earnings
group by business_type;

--ID 10160--
select 
     guest_id,
     RANK() OVER (ORDER BY age DESC)
from 
     airbnb_guests;

--ID 10153---
select 
     count(business_id) AS count 
from yelp_business
where categories LIKE '%Pizza%';

--10149--
SELECT 
     g.gender, 
     AVG(r.review_score) AS avg_score
FROM
     airbnb_guests g 
INNER JOIN airbnb_reviews r ON g.guest_id = r.from_user 
WHERE r.from_type = 'guest'
GROUP BY g.gender 
ORDER BY avg_score DESC 
LIMIT 1 


--10072--WRONG
select
     from_type,
     ROUND(avg(review_score)) AS winner
from airbnb_reviews
group by from_type


--ID 10058--
select 
     stars,
     count(review_id) AS n_reviews
from 
    yelp_reviews
where business_name ILIKE '%Lo-Lo_s Chicken & Waffles%'
group by stars
order by stars asc

--ID 10057--
select
     count(review_id) AS n_5star_reviews
from 
     yelp_reviews 
where 
     stars = '5' AND business_name ILIKE '%Lo-Lo_s Chicken & Waffles'


--ID 10055--
select *
from yelp_reviews
where stars LIKE '?'

--ID 10054--
select 
    stars, 
    count(*) AS n_entries
from 
     yelp_reviews
group by stars
order by stars asc;

--ID 10052--
select 
     state, 
     avg(stars) AS average_stars
from yelp_business
group by state;

--ID 10051--
select
     count(is_open) AS business_open 
from 
     yelp_business
where is_open = '1'

-- 10050--
select 
     name, 
     review_count
from 
    yelp_business
where stars = '1'

--ID 9906--
select 
     department,
     count(id) AS number_of_employees
from employee
group by department 
order by number_of_employees DESC

--ID 10020--
select 
     price
from winemag_p1
where country IN ('Spain', 'Italy', 'France')

--ID 10021--
select
    distinct(winery)
from winemag_p1
where points >= '95'

--ID 10022--
select 
     distinct(variety)
from
     winemag_p1
where
     price BETWEEN '5' AND '20'

--ID 10024--
select 
     distinct(variety)
from winemag_p2
where taster_name = 'Roger Voss' AND region_1 IS NOT NULL

--ID 10027---
select 
     count(distinct winery)
from winemag_p1
where country = 'US' AND price >= '200';

--ID 9903--
select 
     first_name, 
     bonus
from
     employee
where bonus < '150'

--ID 9866--
select 
     CONCAT(first_name, ' ', last_name) AS employee_name, 
     salary
from worker
order by salary desc
limit 2

--ID 9864 -- RIGHT Answer but did not get it in the right order
select * from worker
ORDER BY worker_id DESC
LIMIT 5;

--ID 9667--
select 
     count(cancelled) AS n_flights
from us_flights
where unique_carrier = 'AA' AND cancelled <> '0'

--ID 9676--
select 
     origin, 
     avg(distance)
from us_flights
group by origin

--ID 10009--
select 
     request_status,
     avg(monetary_cost)
from uber_ride_requests
group by request_status;

-- 100007---
select 
     year, 
     sum(money_spent),
     sum(customers_acquired)
from uber_advertising
group by year;

--ID 100002--
select 
     distinct(advertising_channel)
from uber_advertising
where money_spent >= '100000' AND year = '2019'

--ID 10001--
WITH cust AS(
SELECT 
     year,
     advertising_channel,
     (SUM(money_spent) / SUM(customers_acquired)) AS cost_per_customer
FROM 
    uber_advertising
GROUP BY 
     advertising_channel, year
)

SELECT * 
FROM 
     cust
WHERE advertising_channel LIKE '%bus%'

--ID 100000---
select 
      year
from
     uber_advertising
where 
     customers_acquired > '2000' AND advertising_channel = 'celebrities'

--ID 2049--
select 
      service_name,
      status_of_order, 
      SUM(number_of_orders)
from uber_orders
group by service_name, status_of_order;


--ID 9602--
select *
from hotel_reviews
where 
      hotel_address LIKE '%Netherlands%' AND
      negative_review ILIKE '%dirty%'


--ID 9867--
select 
     DISTINCT(salary)
from worker
order by salary ASC
limit 3

--ID 9687--
SELECT *
FROM oscar_nominees 
WHERE winner = 'TRUE' AND year BETWEEN '2001' AND '2009'


--ID 9999--
SELECT 
     trackname, 
     position
FROM 
     spotify_worldwide_daily_song_ranking 
WHERE position IN (8,9,10)
ORDER BY position ASC

--ID 99997--
select 
     sum(streams) AS n_streams
from spotify_worldwide_daily_song_ranking
where position <= 100

--ID 9996---
select 
     avg(streams)
from spotify_worldwide_daily_song_ranking;

--ID 9994--
select 
     trackname,
     streams
from spotify_worldwide_daily_song_ranking
where streams < '2000'
order by streams desc

--ID 9990--
select 
     trackname,
     artist, 
     streams
from spotify_worldwide_daily_song_ranking
where streams > '3000000'
order by streams desc


--ID 9758---
select 
     publisher,
     sum(total) as total_sales
from global_weekly_charts_2013_2014
group by publisher
order by total_sales desc


---ID 9757---
select  
     genre, 
     sum(total) as total_sales
from 
     global_weekly_charts_2013_2014
group by genre
order by total_sales desc

--ID 9869--
select 
     sum(salary), 
     department
from 
     worker
group by department


--ID 9868--
select 
     distinct(salary)
from 
     worker 
order by salary desc 
limit 5

--ID 9920--
select 
      first_name
from employee
where department = 'Sales' AND target > 150
order by first_name DESC

--ID 2116--
SELECT 
      COUNT(o.order_id) AS n_shipped
FROM shopify_orders o 
INNER JOIN shopify_carriers c ON o.carrier_id = c.id
WHERE name = 'Speedy Express'


--ID  2109-- WRONG 
SELECT 
      s.prod_sku_id, 
      p.market_name
FROM  fct_customer_sales s 
INNER JOIN dim_product p ON s.prod_sku_id = p.prod_sku_id

--ID 2063--
WITH dates AS ( 
     SELECT * 
     FROM sf_exchange_rate 
     WHERE date BETWEEN '2020-01-01' AND '2020-06-01'
)
SELECT 
     DISTINCT(source_currency)
FROM dates;

--ID 2017-- ***
SELECT 
      COUNT(DISTINCT c.user_id)
FROM rc_calls c
INNER JOIN rc_users u ON c.user_id = u.user_id
WHERE u.status = 'paid' AND date BETWEEN '2020-04-01' AND '2020-04-30' AND c.call_id <>0


--ID 2126-- WRONG 
SELECT 
     TO_CHAR(started_at, 'YYYY_MM') AS to_char,
     COUNT(plan_id)
FROM noom_signups
GROUP BY to_char
ORDER BY to_char;

--ID 2002--
SELECT 
     user_id
FROM 
     loans 
WHERE type = 'Refinance' AND type = 'InSchool'

--ID 10006--
SELECT 
     hour, 
     AVG(travel_distance) AS average_distance_traveled
FROM lyft_rides
GROUP BY hour
ORDER BY hour ASC

--ID 100005-- SO simple made it so complex 
WITH cost AS(
      SELECT 
         hour, 
         MAX(gasoline_cost) AS gas_cost
      FROM lyft_rides
      GROUP BY hour
)
SELECT 
     hour
FROM 
     cost
ORDER BY gas_cost DESC
LIMIT 1;

--ID 100004--
SELECT *
FROM lyft_rides 
WHERE weather = 'rainy'  AND 
      hour BETWEEN ----
      
--ID 9788-
SELECT 
     day, 
     COUNT(user1 + user2) AS n_interactions 
FROM facebook_user_interactions 
WHERE day <>1
GROUP BY day

--ID 9780--
SELECT 
     COUNT(date_approved) AS n_accepted_requests 
FROM 
     facebook_friendship_requests 
WHERE date_approved = '2019-01-02'

--ID 9774--
SELECT 
     feature_id,
     MAX(step_reached) AS max_step_reached
FROM 
     facebook_product_features_realizations 
GROUP BY feature_id

--ID 9771-- again made it complicated
WITH number AS (
     SELECT
     action,
     COUNT(*) AS number_of_count
FROM 
     facebook_web_log 
GROUP BY action
)

SELECT 
     action
FROM number
WHERE number_of_count > '1'

--ID 9770--
SELECT 
     post_id, 
     COUNT(*) AS n_views 
FROM 
     facebook_post_views 
GROUP BY post_id
ORDER BY post_id ASC

--ID 9768--
SELECT 
      * 
FROM
    facebook_posts 
WHERE 
     post_keywords LIKE '%nba%'

--ID 9767--
SELECT 
     message_id, 
     text
FROM 
     facebook_messages_sent 
WHERE message_id = 2 OR message_id = 3

--ID 9766--
 SELECT 
     complaint_id 
FROM 
     facebook_complaints 
WHERE type = 1 AND 
      processed = 'TRUE'    
      
--ID 2129--
SELECT 
     AVG(no_of_likes)
FROM fb_posts

--ID 2069--
SELECT 
     p.promotion_id
FROM online_promotions p
LEFT JOIN online_orders o ON p.promotion_id = o.promotion_id

--ID 9937--
SELECT 
     DISTINCT(name) 
FROM 
     olympics_athletes_events 
WHERE 
     age >= 40 AND medal = 'Bronze' OR medal = 'Silver'


--Id 10122--
SELECT 
     COUNT(*) AS n_searches
FROM 
     airbnb_search_details 
WHERE 
     neighbourhood = 'Westlake' AND amenities LIKE '%TV%'

--ID 9640--
SELECT 
      id_user,
      AVG(n_searches)
FROM airbnb_searches 
GROUP BY id_user

--ID 9627--
SELECT 
    DISTINCT (neighbourhood),
    COUNT(beds) AS bed
FROM airbnb_search_details
GROUP BY neighbourhood
WHERE bed => 3


--ID 9625--
SELECT 
     city, 
     MIN(price) AS min_price
FROM 
     airbnb_search_details 
GROUP BY 
     city

--ID 9621--
SELECT 
      * 
FROM 
     airbnb_search_details 
WHERE city = 'SF' AND review_scores_rating IS NOT NULL AND cancellation_policy = 'flexible'
ORDER BY review_scores_rating DESC

--ID 9620--
SELECT 
      * 
FROM 
     airbnb_search_details 
WHERE host_response_rate IS NULL

--ID 9619--
SELECT 
      * 
FROM 
     airbnb_search_details 
WHERE 
     property_type = 'House' AND property_type = 'Villa' AND amenities ILIKE '%wireless internet%'


--ID 9616--
SELECT 
      * 
FROM 
     airbnb_search_details 
WHERE bedrooms = bathrooms


--ID 9615--
SELECT 
     *
FROM 
     airbnb_search_details 
WHERE 
     property_type = 'Apartment' AND accommodates = 1


--ID 9707--
SELECT 
     AVG(score) AS avg_scores 
FROM 
     los_angeles_restaurant_health_inspections 
WHERE
     score BETWEEN '91' AND '100'

--ID 9704--
SELECT 
      activity_date,
      COUNT(*) AS n_inspections
FROM 
     los_angeles_restaurant_health_inspections 
GROUP BY activity_date
ORDER BY activity_date ASC

--ID 9703-- wrong 
SELECT 
      MAX(grade) AS grade
FROM 
    los_angeles_restaurant_health_inspections
WHERE program_name ILIKE '%Bakery%'

--ID 9693--
SELECT 
     grade, 
     AVG(score) AS avg 
FROM 
     los_angeles_restaurant_health_inspections
WHERE grade IN ('A', 'B', 'C')    
GROUP BY grade


--ID 9690---
SELECT 
     *
FROM 
     los_angeles_restaurant_health_inspections 
WHERE 
    service_description = 'ROUTINE INSPECTION' AND pe_description ILIKE '%HIGH%'

--ID 9689--
SELECT
     *
FROM 
     los_angeles_restaurant_health_inspections 
WHERE 
     owner_name = 'GLASSELL COFFEE SHOP LLC'

--ID 9974--
SELECT 
     employeename, 
     benefits 
FROM 
    sf_public_salaries 
WHERE employeename LIKE '%Patrick%'

--ID 9975--
SELECT 
     employeename, 
     totalpaybenefits
FROM 
    sf_public_salaries
WHERE 
    jobtitle LIKE '%METROPOLITAN TRANSIT AUTHORITY%'


--ID 9988--
SELECT 
    jobtitle 
FROM 
     sf_public_salaries 
ORDER BY overtimepay DESC
LIMIT 3 

--ID 9938--
SELECT
     DISTINCT(event)
FROM 
     olympics_athletes_events 
WHERE 
     season = 'Winter' AND height BETWEEN '180' AND '210'

--ID 9936--
SELECT 
     name, 
     age, 
     CONCAT(year, ' ', season)
FROM 
     olympics_athletes_events 
WHERE  age <= 18

--ID 9846--
SELECT 
      CONCAT(first_name, ' ', last_name) AS full_name, 
      salary
FROM 
       worker 
WHERE salary BETWEEN '50000' AND '100000'


--ID 9844--
SELECT 
      * 
FROM 
     worker 
WHERE joining_date BETWEEN '2014-02-01' AND '2014-02-28';

--ID 9843--
SELECT 
     * 
FROM 
     worker 
WHERE salary BETWEEN '100000' AND '500000'

--ID 9841-
SELECT 
     * 
FROM 
     worker 
WHERE first_name LIKE '%a'

--ID 9861-
SELECT 
     department, 
     COUNT(worker_id) AS num_of_workers
FROM  
     worker
GROUP BY 
     department

--ID 9807--
SELECT 
     * 
FROM 
     google_adwords_earnings 
WHERE n_employees > 10


--9834--
SELECT 
     CONCAT(first_name, ' ', last_name) AS full_name
FROM 
     worker

--ID 9836--
SELECT 
     * 
FROM 
     worker 
ORDER BY first_name ASC, last_name DESC

--9838--
SELECT 
     * 
FROM 
     worker
WHERE first_name NOT IN ('Vipul', 'Satish') AND LOWER(last_name) NOT LIKE '%c%'


--ID 2091--
SELECT 
     player_id, 
     MAX(login_date)
FROM  
     players_logins 
GROUP BY player_id 


--ID 9666--
WITH new AS (
SELECT 
     industry,
     AVG(sales) AS Avg
FROM 
     forbes_global_2010_2014
GROUP BY industry 
ORDER BY Avg ASC 
LIMIT 1 
)
SELECT industry
FROM new

--ID 9665--
SELECT 
      country,
      COUNT(company) AS n_companies
FROM 
     forbes_global_2010_2014
WHERE sector = 'Information Technology'
GROUP BY country
ORDER BY n_companies DESC

--ID 9664--
SELECT 
     sector, 
     MAX(marketvalue) AS max_marketvalue
FROM 
     forbes_global_2010_2014
GROUP BY sector
ORDER BY max_marketvalue DESC

--ID 9662--
SELECT 
     company 
FROM
     forbes_global_2010_2014 
WHERE sector = 'Financials' AND 
(continent = 'Asia' OR continent = 'Europe')

--ID 9660--
SELECT 
     teacher, 
     COUNT(student_id) AS n_students 
FROM 
     sat_scores 
GROUP BY teacher 

--ID 9613-- WRONG 
SELECT 
     date
FROM 
     aapl_historical_stock_price
WHERE ( SELECT MAX(open) 
        FROM aapl_historical_stock_price)


--ID 9598--
SELECT 
     * 
FROM 
     sat_scores 
WHERE 
     school NOT LIKE '%HS'

--ID 2163--
SELECT 
      * 
FROM 
     movie_catalogue 
ORDER BY duration DESC 

--ID 9798--
SELECT 
     AVG(profits) AS average_profit
FROM 
     forbes_global_2010_2014 
WHERE industry = 'Major Banks'

--ID 9749--
SELECT 
     address, 
     pd_district, 
     COUNT(incidnt_num) AS n_occurences 
FROM
    sf_crime_Incidents_2014_01
GROUP BY address, pd_district
ORDER BY n_occurences DESC

--ID 9721--
SELECT 
     business_name,
     inspection_score 
FROM 
     sf_restaurant_health_violations 
WHERE business_name ILIKE '%restaurant%'

--ID 9685-- WRONG 
SELECT 
     COUNT(DISTINCT company_id)
FROM 
     playbook_users 
WHERE language = 'chinese' AND user_id >= 2

--ID 9681--
SELECT 
    sector, 
    MAX(marketvalue) AS max_market_value 
FROM
    forbes_global_2010_2014 
GROUP BY sector

--ID 9679--
SELECT     
     company, 
     (profits/sales) AS profit_to_sales_ratio
FROM
     forbes_global_2010_2014 
WHERE 
     company = 'Royal Dutch Shell'

--ID 9669--
SELECT 
     language, 
     COUNT(user_id) AS n_speakers 
FROM 
     playbook_users 
GROUP BY language
ORDER BY n_speakers DESC


--ID 9930--
SELECT 
     home_library_definition, 
     SUM(total_renewals) AS total_library_renewals 
FROM 
    library_usage 
GROUP BY home_library_definition
ORDER BY total_library_renewals DESC

--ID 9931---
SELECT 
     COUNT( DISTINCT patron_type_code) AS n_patrons
FROM 
     library_usage 
WHERE total_renewals < 10 AND circulation_active_month = 'April' AND circulation_active_year = '2015'

--ID 9933--
SELECT 
     DISTINCT(name)
FROM 
     olympics_athletes_events 
WHERE medal IS NOT NULL AND team LIKE '%Denmar%'

--ID 2100--
SELECT 
     education,
     AVG(salary) AS avg_salary
FROM
     google_salaries 
GROUP BY education


--ID 2083--
SELECT 
      COUNT(claim_id) AS n_claims 
FROM 
      cvs_claims 
WHERE EXTRACT(MONTH from date_submitted) = '12' AND 
      EXTRACT(YEAR from date_submitted) = '2021' AND 
      date_accepted IS NULL AND date_rejected IS NULL
      
--ID 9805--
SELECT 
      filename,
      contents 
FROM 
     google_file_store 
WHERE 
     filename LIKE '%draft%' AND contents LIKE '%optimism%'

--ID 2125--
SELECT 
     SUM(order_total) AS revenue 
FROM 
      amazon_sales 
WHERE EXTRACT(year
                FROM order_date) = '2021'

-- ID 9934--
SELECT 
     DISTINCT(name)
FROM 
    olympics_athletes_events 
WHERE event LIKE '%Swimming%' AND city = 'London'


--ID 9800--
SELECT 
      SUM(marketvalue) AS total_marketvalue 
FROM
     forbes_global_2010_2014 
WHERE sector = 'Financials'

--ID 9801--
SELECT 
     COUNT(company) AS n_us_companies
FROM  
    forbes_global_2010_2014 
WHERE country = 'United States'
GROUP BY country

--ID 2160--
SELECT 
    SUM(o.cost_in_dollars) AS total_sales
FROM 
     online_orders o 
INNER JOIN online_customers c ON o.customer_id = c.id
WHERE c.state = 'Oregon' AND EXTRACT(MONTH FROM o.date) = '4'

--ID 2151--
SELECT 
     COUNT(id) AS hired_emp
FROM 
     employees
WHERE joining_date BETWEEN '2022-01-01' AND '2022-07-31'

--ID 9935--
SELECT 
     DISTINCT(event) 
FROM 
    olympics_athletes_events 
WHERE name = 'Christine Jacoba Aaftink'

--ID 9925--
SELECT 
    COUNT(patron_type_code) AS total_patrons
FROM
    library_usage 
WHERE year_patron_registered = '2016'


--ID 9884--
SELECT 
     p.player_name, 
     t.division
FROM 
     college_football_players p 
JOIN college_football_teams t ON p.school_name = t.school_name

--ID 2126--
SELECT 
     TO_CHAR(started_at, 'YYYY-MM') AS to_char,
     COUNT(signup_id) AS n_registrations 
FROM 
     noom_signups 
GROUP BY to_char


--ID 9833--
SELECT 
     REPLACE(first_name, 'a', 'A') AS replace_a
FROM 
     worker

--ID 9831-
SELECT 
    LTRIM(first_name) AS first_name_trim
FROM 
    worker_ws
    
--ID 9830--
SELECT 
     RTRIM(first_name) AS  first_name_trim
FROM 
     worker_ws

--ID 9929--
SELECT 
     POSITION('a'IN first_name ) AS position_of_letter_a
FROM 
    worker 
WHERE first_name = 'Amitah'

--ID 9828--
SELECT 
     SUBSTRING(first_name FROM 1 FOR 3)
FROM 
    worker

--ID 10137--
SELECT 
     * 
FROM 
     worker 
WHERE EXTRACT(MONTH from joining_date) = '6' AND 
      worker_id % 2 = 0 

--ID 10136--
SELECT 
    * 
FROM 
    worker
WHERE EXTRACT(MONTH from joining_date) = '2' AND 
      worker_id % 2 <>0

--ID 9840--
SELECT 
     *
FROM 
     worker 
WHERE LOWER(first_name) LIKE '%a%'

--ID 9842--
SELECT 
     * 
FROM 
     worker 
WHERE first_name LIKE '%h' AND LENGTH(first_name) = 6

--ID 9863--
SELECT 
     * 
FROM 
    worker 
WHERE worker_id = (SELECT MIN(worker_id) FROM worker)

--ID 9862--
SELECT 
     * 
FROM
     worker 
WHERE worker_id = (SELECT MAX(worker_id) FROM worker)

--ID 2107--
WITH new AS (
      SELECT
     cust_id,
     COUNT(*) AS n_occurences
FROM 
    dim_customer 
GROUP BY cust_id
)

SELECT 
     * 
FROM 
     new 
WHERE n_occurences > 1

--ID 9907--
SELECT 
     first_name 
FROM 
    employee 
WHERE manager_id <> 1

--ID 9656--
SELECT 
     AVG(heightinchestotal) AS avg_height_inches
FROM 
     nfl_combine
WHERE position = 'QB'

--ID 9682--
SELECT 
    industry, 
    AVG(profits) AS avg_profit,
    MIN(sales) AS min_sales
FROM
     forbes_global_2010_2014
GROUP BY industry
HAVING AVG(profits) > 0
ORDER BY min_sales ASC


--ID 9969---
SELECT  
     qb, 
     SUM(int) AS interceptions 
FROM
    qbstats_2015_2016 
WHERE year = '2016'
GROUP BY qb
ORDER BY interceptions DESC

---ID 9962--
SELECT 
     qb,
     rate
FROM 
     qbstats_2015_2016
ORDER BY rate DESC
LIMIT 10

--ID 2004--
SELECT 
     user_id, 
     COUNT(number_of_comments) AS number_of_comments
FROM
    fb_comments_count 
WHERE datetime BETWEEN '2020-01-10' AND '2020-02-09'
GROUP BY user_id 

--ID 10132--
SELECT 
     day_of_week, 
     COUNT(incidnt_num) AS n_occurences 
FROM 
     sf_crime_incidents_2014_01
GROUP BY day_of_week

--ID 9923--
SELECT 
     (COUNT(home_library_code)) AS count
FROM library_usage 
WHERE 
     total_checkouts >= 100 AND 
     circulation_active_month = 'February' AND 
     circulation_active_year = '2015'
GROUP BY circulation_active_month


--ID 10162--
SELECT 
     acquired_quarter, 
     COUNT(id) AS cnt_acq
FROM 
     crunchbase_acquisitions 
GROUP BY acquired_quarter
ORDER BY cnt_acq DESC

--ID 9943--
SELECT 
     MIN(age) AS lowest_age, 
     AVG(age) AS mean_age,
     MAX(age) AS highest_age
FROM 
     olympics_athletes_events

--ID 9932--
SELECT 
      DISTINCT(name)
FROM
    olympics_athletes_events 
WHERE year < '1939' AND sex = 'F'

--ID 2062--
WITH dates AS (
      SELECT *
      FROM fb_searches
      WHERE date BETWEEN '2021-04-01' AND '2021-06-30'
)
SELECT 
     COUNT(*) AS result
FROM dates

kdcnfnf
Select 
