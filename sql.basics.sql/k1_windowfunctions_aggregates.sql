--AGGREGATE FUNCTIONS--

-- SUM(): For each coffee shop, what is its daily visitor count compared to the running total of visitors across all shops when ordered by rating?
SELECT 
    s.shop_id,
    s.shop_name,
    r.rating,
    s.daily_visitors,
    SUM(s.daily_visitors) OVER (ORDER BY r.rating DESC) AS running_total
FROM 
    seattle_coffee_shops s
JOIN 
    coffee_shop_ratings r ON s.shop_id = r.shop_id
ORDER BY 
    r.rating DESC, s.shop_id;

-- AVG(): Display each coffee shop's rating along with the average rating of all shops up to and including that shop when ordered by daily visitors.
SELECT 
    s.shop_name, 
	s.shop_id,
	s.date, 
	s.daily_visitors,
	r.rating, 
	AVG(r.rating) OVER (ORDER BY s.daily_visitors DESC) AS avg_ratings
FROM 
    seattle_coffee_shops s 
JOIN coffee_shop_ratings r ON s.shop_id = r.shop_id 
ORDER BY s.daily_visitors DESC, s.shop_id; 


-- COUNT(): List each coffee shop with a count of how many shops (including itself) have the same or lower rating.
-- SELECT 
    s.shop_id,
    s.shop_name,
    r.rating,
    COUNT(*) OVER (ORDER BY r.rating ASC) AS shops_with_same_or_lower_rating
FROM 
    seattle_coffee_shops s
JOIN 
    coffee_shops_ratings r ON s.shop_id = r.shop_id
ORDER BY 
    r.rating DESC, s.shop_id;

-- MIN(): Show each coffee shop's daily visitors alongside the lowest visitor count among all shops with the same or higher rating.
SELECT 
   s.shop_name, 
   s.shop_id, 
   s.date, 
   s.daily_visitors, 
   r.rating,
   MIN(s.daily_visitors) OVER (ORDER BY r.rating DESC) AS shops_with_same_or_higher_rating
FROM 
   seattle_coffee_shops s
JOIN coffee_shop_ratings r ON s.shop_id = r.shop_id
ORDER BY  r.rating DESC, s.shop_id;


-- MAX(): For each coffee shop, display its rating and the highest rating given to any shop with the same or fewer daily visitors.

SELECT 
   s.shop_name, 
   s.shop_id, 
   s.date, 
   s.daily_visitors, 
   r.rating,
   MAX(r.rating) OVER (ORDER BY s.daily_visitors DESC) AS shops_with_same_or_fewer_visitors
FROM 
   seattle_coffee_shops s
JOIN coffee_shop_ratings r ON s.shop_id = r.shop_id
ORDER BY s.daily_visitors DESC, s.shop_id;


---VALUE FUNCTIONS---
-- FIRST_VALUE(): What is the name of the coffee shop that appears first when ordered by daily visitors?
SELECT 
     shop_name, 
     daily_visitors, 
FIRST_VALUE(shop_name) OVER (ORDER BY daily_visitors DESC) AS most_visited 
FROM seattle_coffee_shops
LIMIT 1;


-- LAST_VALUE(): What is the rating of the coffee shop that appears last when ordered by daily visitors?
SELECT 
     s.shop_name, 
     s.daily_visitors, 
     s.date, 
     r.rating,
     LAST_VALUE(r.rating) OVER (
         ORDER BY s.daily_visitors DESC
         RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
     ) AS last_rating_shop 
FROM seattle_coffee_shops s 
JOIN coffee_shop_ratings r ON s.shop_id = r.shop_id;



-- LEAD(): For each coffee shop, what is the rating of the next shop when ordered by daily visitors?
SELECT shop_name, daily_visitors, LEAD(daily_visitors)
FROM seattle_coffee_shops
ORDER BY daily_visitors ASC; 

-- LAG(): For each coffee shop, what is the daily visitor count of the previous shop when ordered by rating?
SELECT shop_name, daily_visitors, LEAD(daily_visitors)  OVER (ORDER BY daily_visitors)
FROM seattle_coffee_shops;

-- NTH_VALUE(): What is the name of the 3rd most visited coffee shop?

---RANKING FUCTIONS---
-- ROW_NUMBER(): Assign a unique number to each coffee shop based on their daily visitors (highest to lowest).
-- RANK(): Rank the coffee shops based on their ratings, allowing for ties.
-- DENSE_RANK(): Rank the coffee shops based on their daily visitors, allowing for ties but without gaps in ranking.
-- NTILE(): Divide the coffee shops into 3 groups based on their ratings.
-- CUME_DIST(): Calculate the cumulative distribution of daily visitors for each coffee shop.
-- PERCENT_RANK(): What is the relative rank of each coffee shop based on its rating?
SELECT 
    s.shop_name, 
	s.daily_visitors,
	r.rating,
NTILE(3) OVER (ORDER BY r.rating DESC) AS rating_rank 
FROM seattle_coffee_shops s 
JOIN coffee_shop_ratings r ON s.shop_id = r.shop_id; 


SELECT 
    s.shop_name, 
	s.daily_visitors,
	r.rating,
CUME_DIST() OVER (ORDER BY s.daily_visitors DESC) AS cumm_dist
FROM seattle_coffee_shops s 
JOIN coffee_shop_ratings r ON s.shop_id = r.shop_id; 


SELECT 
    s.shop_name, 
	s.daily_visitors,
	r.rating,
PERCENT_RANK() OVER (ORDER BY r.rating DESC) AS relative_rank 
FROM seattle_coffee_shops s 
JOIN coffee_shop_ratings r ON s.shop_id = r.shop_id; 



/Users/haripriyagoud/Documents/github_repose/self_repos/sql_questions/a_solutions.sql