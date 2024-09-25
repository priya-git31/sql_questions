-- a1a - SELECT

-- How would you retrieve all the customer IDs from the Customers table?
-- Can you fetch the first_name and last_name for all customers who are 25 years old or younger?
-- How would you display the first_name and country for customers whose last name is 'Doe'?
-- What query would you use to get the first_name and age for all customers whose first name contains the letter 'o'?
-- How do you select customers where the country is either 'USA' or 'UK'? 

SELECT customer_id 
FROM Customers; 

SELECT first_name, last_name
FROM Customers 
WHERE age <= 25; 

SELECT first_name, country 
FROM Customers
WHERE last_name = 'Doe'; 

SELECT first_name, age 
FROM Customers 
WHERE first_name LIKE '%o%';

SELECT *
FROM customers
WHERE country = 'USA' OR country = 'UK'; 

--  a1b - * 
-- How would you fetch all columns and all rows from the Customers table?
-- If you wanted to view the entire record for customers who are 22 years old, how would you write the query?
-- How can you see all details for customers that have 'John' as their first name?
-- Write a query that shows every column for customers who are older than 25.
-- How would you retrieve the full details of the youngest customer in the Customers table?

SELECT * 
FROM customers; 

SELECT * 
FROM customers
WHERE age = 22; 

SELECT * 
FROM Customers 
WHERE first_name = 'John';

SELECT * 
FROM Customers 
WHERE age > 25;

SELECT *
FROM Customers
WHERE age = (SELECT MIN(age) 
FROM Customers); 

--a1c--COUNT 

-- What query would give you the total number of customers in the Customers table?
-- How would you determine the number of customers who are older than 25?
-- How can you count the number of customers from the 'USA'?
-- Can you find out how many customers have 'Doe' as their last name?
-- What would the query be to count the number of customers whose first name starts with 'R'?

SELECT COUNT(*)
FROM Customers;

SELECT COUNT (*)
FROM Customers 
WHERE age >25;

SELECT COUNT (*)
FROM Customers 
WHERE country = 'USA'

SELECT COUNT (*)
FROM Customers 
WHERE last_name = 'Doe'

SELECT COUNT(*)
FROM Customers 
WHERE first_name LIKE 'R%'; 

---a1d--DISTINCT 
-- How would you retrieve a list of unique countries from the Customers table?
-- Can you get a list of unique last names from the table?
-- How do you find out the distinct age values for the customers?
-- If you wanted to see the different first names used in the table, how would you fetch them?
-- What query would you write to see all the unique combinations of first_name and country?     


SELECT DISTINCT country
FROM Customers;

SELECT DISTINCT last_name
FROM Customers;

SELECT DISTINCT age
FROM Customers;

SELECT DISTINCT first_name
FROM Customers;

SELECT DISTINCT first_name, country
FROM Customers;

--a2a -- AND 
-- How would you fetch customers that are between 25 and 30 years old?
-- Can you retrieve all customers with a first name of 'John' who are from the 'USA'?
-- Write a query to get the first_name and last_name of customers who are older than 25 and from the 'UK'.
-- How do you select customers where the last_name contains the letter "o" and the age is less than 30?
-- Can you find customers where the first_name is 'David' and the country is 'UK'?

SELECT * 
FROM Customers 
WHERE age BETWEEN 25 AND 30;

SELECT * 
FROM Customers 
WHERE first_name = 'John' AND country = 'USA';

SELECT first_name, last_name
FROM Customers 
WHERE age > 25 AND country = 'UK';

SELECT last_name 
FROM Customers 
WHERE last_name LIKE '%o%' AND age < 30; 

SELECT * 
FROM Customers 
WHERE first_name = 'David' AND country = 'UK';

--a2b--OR
-- How would you retrieve customers that are either younger than 23 or older than 30?
-- Write a query to fetch customers that have a last name of either 'Doe' or 'Luna'.
-- Can you get the first_name and country of customers who are either 22 years old or 31 years old?
-- How do you select customers where the first_name contains the letter "e" or the age is more than 28?
-- Write a query to retrieve all customers where the country is either 'UAE' or 'UK', or the age is less than 25.

SELECT * 
FROM Customers 
WHERE age < 23 OR age > 30;

SELECT * 
FROM Customers 
WHERE last_name = 'Doe' OR last_name = 'Luna';

SELECT first_name, country
FROM Customers
WHERE age = 22 OR age = 31;

SELECT first_name 
FROM Customers 
WHERE first_name LIKE '%e%' AND age > 28; 

SELECT * 
FROM Customers
WHERE country = 'UAE' OR country = 'UK' OR age < 25;

--a3a-- AGGREGATES
-- Compute min, max, avg, count, sum of age column.

SELECT MIN(age)
FROM Customers;

SELECT MAX(age)
FROM Customers;

SELECT AVG(age)
FROM Customers;

SELECT COUNT(age)
FROM Customers;

SELECT SUM(age)
FROM Customers;

--a4a-- WHERE AND ORDER BY 

-- How would you retrieve the first_name and age for all customers older than 25, ordered by age in descending order?
-- Can you list the last_name and country for customers who are not from the 'USA', ordered by the last_name in ascending order?
-- Write a query to fetch the first_name and last_name for customers whose first name contains the letter "o", and order the results alphabetically by last_name.
-- How do you select the first_name, last_name, and age for customers where the country is either 'UK' or 'UAE', ordered by age in descending order?
-- Can you retrieve all details about customers aged between 22 and 28, sorted first by country in ascending order and then by last_name in descending order?

SELECT first_name, age 
FROM Customers
WHERE age > 25
ORDER BY age DESC;

SELECT last_name, country
FROM Customers 
WHERE country <> 'USA' 
ORDER BY last_name ASC;

SELECT first_name, last_name 
FROM Customers 
WHERE first_name LIKE '%o%' 
ORDER BY last_name ASC; 


SELECT first_name, last_name, age 
FROM Customers
WHERE country = 'UK' OR country = 'UAE'
ORDER BY age DESC;

SELECT *
FROM Customers
WHERE age BETWEEN 22 AND 28
ORDER BY country ASC, last_name DESC

--a5a-- GROUP BY
-- How would you count the number of customers for each country?
-- How would you list the countries and the count of customers for each country?
-- Can you determine the average age of customers, grouped by their country?
-- How would you retrieve the countries with their oldest customer age, grouping by the country?

SELECT country,count(*)
FROM Customers
GROUP BY country

SELECT country, COUNT(customer_id)
FROM Customers 
GROUP BY country;

SELECT country, AVG(age) 
FROM Customers 
GROUP BY country

SELECT country, MAX(age) 
FROM Customers 
GROUP BY country


--a5b--GROUP BY + HAVING 
-- How would you find countries that have more than 1 customer, grouping by the country?
-- Can you list the age values that appear more than once in the customer records, grouping by the age?
-- Retrieve the countries where the minimum customer age is above 25, grouping by the country.

SELECT country, COUNT(customer_id)
FROM Customers 
GROUP BY country
HAVING COUNT(customer_id) > 1

SELECT age, COUNT(*)
FROM Customers 
GROUP BY age
HAVING COUNT(*) > 1 

SELECT country, MIN(age) 
FROM Customers 
GROUP BY country
HAVING MIN(age) > 25

--a5c-- WHERE + GROUP BY + HAVING 
-- How would you identify countries with 2 or more customers, but only considering customers who are 25 or older? Group the results by country.
-- For customers whose last name contains the letter 'o', can you determine the average age for each country, but only include countries where the average age is below 30? Group the results by country.
-- Considering only customers whose first name starts with 'J', how would you list the countries with their youngest customer age, but only include countries where the youngest age is 25 or more? Group the results by country.

SELECT country, customer_id, COUNT(*)
FROM Customers 
where age >= 25 
GROUP BY country
HAVING COUNT(*) >= 2

SELECT country, AVG(age)
FROM Customers 
WHERE last_name LIKE '%o%'
GROUP BY country 
HAVING AVG(age) < 30 

SELECT first_name, country, MIN(age)
FROM Customers 
WHERE first_name LIKE 'J%'
GROUP BY country
HAVING MIN(age) <= 25;


--B1--- CASE WHEN THEN ELSE-- 
-- For each customer, can you display their full name and classify their age group as 'Young' for ages below 25, 'Adult' for ages between 25 and 30, and 'Senior' for ages above 30?
-- How would you categorize each customer's country as 'North America' if it's 'USA', 'Europe' if it's 'UK', and 'Other' for other countries? Show the customer's full name and their region.
-- Based on the customers' ages, can you label each customer as 'Gen Z' if they're 22 or younger, 'Millennial' if they're between 23 and 30, and 'Gen X' for those older than 30? Display the customer's first name and their generation label.
-- Can you categorize each customer based on their last name? If it's 'Doe', label it 'Common', if it's 'Luna' or 'Robinson', label it 'Uncommon', and for all other last names, label them 'Unique'. Show the customer's full name and their last name category.
-- How would you classify customers based on their first name length? If the length is 4 or less, label it 'Short', if it's 5 or 6, label it 'Medium', and if it's more than 6, label it 'Long'. Display the customer's first name and its length category.

SELECT 
    first_name, 
    last_name, 
    CASE 
        WHEN age < 25 THEN 'Young'
        WHEN age BETWEEN 25 AND 30 THEN 'Adult'
        ELSE 'Senior' 
    END AS age_group
FROM 
    Customers;

 SELECT
    first_name,
    last_name,
    CASE  
        WHEN country = 'USA' THEN 'North America'
        WHEN country = 'UK' THEN 'Europe'
        ELSE 'Other'
    END AS region 
FROM 
    Customers;

SELECT 
   first_name, 
   CASE 
    WHEN age <= 22 THEN 'Gen Z'
    WHEN age BETWEEN 23 AND 30 THEN 'Millenial'
    ELSE 'Older'
   END AS generation_label 
FROM 
   Customers;

SELECT  
    first_name, 
    last_name,
CASE 
    WHEN last_name = 'Doe' THEN 'Common'
    WHEN last_name = 'Luna' OR 'Robbinson' THEN ' Uncommon'
    ELSE 'Unique'
    END AS 'label'
FROM 
    Customers;


SELECT 
     first_name, 
CASE 
    WHEN LEN(first_name) >= 4 THEN 'Short'
    WHEN LEN(first_name) = 5 OR LEN(first_name) = 6 THEN 'Medium'
    ELSE 'Long'
    END AS lenth_category
FROM 
    Customers; 