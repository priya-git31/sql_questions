-- Subquery Questions:

-- Find the coffee shops that have more daily visitors than the average.
SELECT s.shop_name, s.daily_visitors 
FROM seattle_coffee_shops s 
JOIN coffee_shop_ratings c ON c.shop_id = s.shop_id 
WHERE s.daily_visitors > (SELECT AVG(daily_visitors) FROM seattle_coffee_shops);

-- List the coffee shops with ratings higher than the average rating.
SELECT s.shop_name, c.rating
FROM seattle_coffee_shops s
JOIN coffee_shop_ratings c ON s.shop_id = c.shop_id 
WHERE c.rating > (SELECT AVG(rating) FROM coffee_shop_ratings);

-- Find the coffee shop with the highest number of daily visitors and its rating.




-- List coffee shops that have more daily visitors than the shop with the lowest rating.
SELECT s.shop_name, s.daily_visitors
FROM seattle_coffee_shops s 
JOIN coffee_shop_ratings c ON s.shop_id = c.shop_id 
WHERE s.daily_visitors > (SELECT MIN(rating) FROM coffee_shop_ratings); 


-- CTE (Common Table Expression) Questions:
-- Calculate the average daily visitors for shops with above-average ratings.
-- Rank coffee shops by daily visitors and show their ratings.
-- Compare each shop's daily visitors to the overall average, and show their ratings.
-- Find the shop with the highest rating for each unique visitor count, displaying the shop name, visitor count, and rating.

