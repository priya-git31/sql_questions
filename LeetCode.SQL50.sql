
-- ##SELECT 
-- 1. Write a solution to find the ids of products that are both low fat and recyclable.
SELECT 
      product_id
FROM 
    Products
WHERE
     low_fats = 'Y' AND recyclable = 'Y'

--3  Write a solution to find the name, population, and area of the big countries.
SELECT 
     name, 
     population, 
     area
FROM 
     World
WHERE 
     area >= 3000000 OR population >= 25000000

---4 
SELECT 
     v.author_id AS id 
FROM
    Views v JOIN Views s ON v.author_id = v.viewer_id 
GROUP BY 
     v.author_id 
HAVING COUNT(v.author_id) >= 1
ORDER BY 1

--5  Write a solution to find the IDs of the invalid tweets. The tweet is invalid if the number of characters used in the content of the tweet is strictly greater than 15.
SELECT 
     tweet_id 
FROM 
     Tweets
WHERE LENGTH(content) > 15