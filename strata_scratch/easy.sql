-- 1. 
-- Find the number of entries per star.
-- Output each number of stars along with the corresponding number of entries.
-- Order records by stars in ascending order.

select 
stars,
count(distinct user_id) as number_of_enteries 
from 
yelp_reviews 
group by stars
order by  number_of_enteries asc;


-- 2. 
-- ID 10055
-- Find records with the value '?' in the stars column.

select 
* 
from yelp_reviews 
where stars = '?'


-- 3. 
-- ID 10057
-- Find the number of 5-star reviews earned by Lo-Lo's Chicken & Waffles.


select 
count(distinct review_id) as n_reviews 
from 
yelp_reviews 
where business_name like "%Lo-Lo's Chicken%%" and stars = 5



-- 4. 
-- ID 10058

-- Find the number of reviews received by Lo-Lo's Chicken & Waffles for each star.
-- Output the number of stars along with the corresponding number of reviews.
-- Sort records by stars in ascending order.

select 
stars,
count(*) as n_reviews
from 
yelp_reviews 
where business_name like 'Lo-Los Chicken & Waffles'
group by stars 
order by n_reviews asc


-- 5. 
-- Luckily the user IDs of employees completing the surveys were stored.
-- Based on the above, find the average popularity of the Hack per office location.
-- Output the location along with the average popularity.


select 
e.location, 
avg(s.popularity) as avg_popularity 
from 
facebook_employees e 
join facebook_hack_survey s on e.id = s.employee_id
group by e.location


-- 6. 
-- ID 10072
-- Find whether hosts or guests give higher review scores based on their average review scores. 
-- Output the higher of the average review score rounded to the 2nd decimal spot (e.g., 5.11).

select 
from_type, 
round(avg(review_score),2) as avg_review_score 
from 
airbnb_reviews
group by from_type 
order by avg_review_score desc 
limit 1;


-- 7. 
-- ID 10122
-- Find the total number of searches for houses in Westlake neighborhood with a TV among the amenities.

select
count(*) as total_searches 
from 
airbnb_search_details
where neighbourhood = 'Westlake'
and amenities like '%TV%';


-- 8. 
-- ID 10127
-- What is the total sales revenue of Samantha and Lisa?

select 
sum(sales_revenue)
from 
sales_performance
where salesperson in ('Lisa', 'Samantha')


-- 9. 
-- ID 10132

-- Find the number of crime occurrences for each day of the week.
-- Output the day alongside the corresponding crime count.

select 
day_of_week, 
count(*) as n_occurences 
from
sf_crime_incidents_2014_01
group by day_of_week 
order by n_occurences desc;


10. 

-- ID 10136
-- Find employees who started in February and have odd-numbered employee IDs.


select * 
from 
worker
where month(joining_date) = 2
and (worker_id % 2 ) != 0

11. 
ID 10137
Find employees who started in June and have even-numbered employee IDs.

select * 
from worker
where month(joining_date) = 6 
and worker_id % 2 = 0;

-- 12. 
-- ID 10149
-- Write a query to find which gender gives a higher average review score when writing reviews as guests. Use the from_type column to identify guest reviews. Output the gender and their average review score.

select 
g.gender,
avg(r.review_score) as avg_score
from airbnb_guests g 
join airbnb_reviews r on g.guest_id = r.from_user 
where r.from_type = 'guest'
group by g.gender 
order by avg_score desc 
limit 1;

-- 13.
-- ID 10153
-- Find the number of Yelp businesses that sell pizza.


select 
count(*) as tota_businesses 
from 
yelp_business 
where name like '%pizza%'or categories like '%pizza%'


-- 14. 
-- ID 10160

-- Rank guests based on their ages.
-- Output the guest id along with the corresponding rank.
-- Order records by the age in descending order.

select 
guest_id,
rank() over (order by age desc) as rank_1
from airbnb_guests

-- 15. 
-- ID 10164
-- Find the total AdWords earnings for each business type. Output the business types along with the total earnings.

select 
business_type, 
sum(adwords_earnings) as earnings 
from google_adwords_earnings
group by business_type


-- 16. 
-- ID 10166
-- Find how many reviews exist for each review score given to 'Hotel Arena'. 
-- Output the hotel name ('Hotel Arena'), each review score, and the number of reviews for that score. 
-- Ensure the results only include 'Hotel Arena.'

select 
hotel_name, 
reviewer_score, 
count(*) as count 
from 
hotel_reviews 
where hotel_name = 'Hotel Arena'
group by 1,2
order by count desc;


-- 17. 
-- ID 10168
-- Find the total number of records that belong to each variety in the dataset. 
-- Output the variety along with the corresponding number of records. Order records by the variety in ascending order.

select 
variety, 
count(*) as n_total_varieties
from 
iris
group by variety 
order by n_total_varieties desc


-- 18. 
-- ID 10170
-- Find the gender that has made the most number of doctor appointments.
-- Output the gender along with the corresponding number of appointments.

select 
gender, 
count(appointmentid) as n_appointments
from 
medical_appointments
group by gender 
order by n_appointments desc 
limit 1;


-- 19. 
-- ID 10184

-- Order all countries by the year they first participated in the Olympics.
-- Output the National Olympics Committee (NOC) name along with the desired year.
-- Sort records in ascending order by year, and alphabetically by NOC.

select noc, 
min(year) as first_time_year 
from 
olympics_athletes_events
group by noc
order by year,noc


-- 20. 
-- ID 10356

-- Find doctors with the last name of 'Johnson' in the employee list. 
-- The output should contain both their first and last names.

select 
first_name, 
last_name
from 
employee_list 
where last_name like '%Johnson%'
and profession = 'Doctor'