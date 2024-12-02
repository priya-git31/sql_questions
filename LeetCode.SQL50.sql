
-- ##SELECT 
-- 1. Write a solution to find the ids of products that are both low fat and recyclable.
SELECT 
      product_id
FROM 
    Products
WHERE
     low_fats = 'Y' AND recyclable = 'Y'

-- 2 Find the names of the customer that are not referred by the customer with id = 2.
-- Return the result table in any order.

SELECT 
      name 
FROM 
     Customer
WHERE 
     referee_id != 2 OR  referee_id IS NULL



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



--#AGGREGATE FUNCTIONS

-- 1 Write a solution to report the movies with an odd-numbered ID and a description that is not "boring".
-- Return the result table ordered by rating in descending order.

SELECT 
     id, 
     movie, 
     description, 
     rating 
FROM
    Cinema
WHERE description != 'boring' AND id % 2 = 1
ORDER BY rating DESC


-- 3 Write an SQL query that reports the average experience years of all the employees for each project, rounded to 2 digits.
SELECT 
      p.project_id, 
      ROUND(AVG(e.experience_years), 2) AS average_years
FROM 
    Project p JOIN Employee e ON p.employee_id = e.employee_id 
GROUP BY 1 
ORDER BY 1


SELECT
     DISTINCT(num) AS num
FROM 
     MyNumbers
GROUP BY 1
HAVING COUNT(*) = 1
ORDER BY 1 DESC
LIMIT 1


---##BASIC JOINS
-- Write a solution to show the unique ID of each user, If a user does not have a unique ID replace just show null.
-- Return the result table in any order.


SELECT 
     u.unique_id, 
     e.name
FROM
     Employees e LEFT JOIN EmployeeUNI u ON e.id = u.id


--2  Write a solution to report the product_name, year, and price for each sale_id in the Sales table.
-- Return the resulting table in any order.

SELECT 
      p.product_name, 
      s.year, 
      s.price 
FROM 
     Sales s LEFT JOIN Product p ON s.product_id = p.product_id


--6 Write a solution to report the name and bonus amount of each employee with a bonus less than 1000.
-- Return the result table in any order.
SELECT 
     e.name, 
     b.bonus 
FROM
    Employee e LEFT JOIN Bonus b ON e.empId = b.empID
WHERE b.bonus < 1000 OR b.bonus IS NULL


--## SORTING 

SELECT 
      class
FROM
     Courses 
GROUP BY class 
HAVING COUNT(DISTINCT student) >= 5