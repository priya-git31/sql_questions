
-- ---AND-----
-- Which items have a price greater than $7.00 AND less than 8.00?
-- Can you list the ItemNames that belong to the 'Bowl' category AND have calories less than 600?
-- Which items from the 'Burrito' category have a price less than $8.00 AND calories more than 600?
-- Which 'Sides' items cost less than $4.00 AND have more than 700 calories?

SELECT * 
FROM ChipotleMenu
WHERE Price BETWEEN 7.00 AND 8.00;

SELECT ItemName
FROM ChipotleMenu 
WHERE Category = 'Bowl' AND Calories < 600;

SELECT ItemName 
FROM ChipotleMenu 
WHERE Category = 'Burrito' AND Price < 8.00 AND Calories > 600;

SELECT ItemName
FROM ChipotleMenu 
WHERE Category = 'Sides' AND Price < 4.00 AND Calories > 700;


-- ---OR-----
-- Which items are either from the 'Tacos' category OR priced above $9.00?
-- Can you retrieve ItemNames that have either less than 550 calories OR more than 750 calories?
-- Which items belong to either the 'Salad' category OR the 'Quesadilla' category?
-- List the items that are either 'Chicken Burrito' OR have a price of $7.80.

SELECT ItemName 
FROM ChipotleMenu 
WHERE Category = 'Tacos' OR Price > 9.00; 

SELECT ItemName
FROM ChipotleMenu
WHERE Calories < 550 OR Calories > 750;

SELECT ItemName
FROM ChipotleMenu 
WHERE Category IN  ('Salad','Quesadilla');

SELECT ItemName 
FROM ChipotleMenu 
WHERE ItemName = 'Chicken Burrito' OR price = 7.80;

-- --NOT---
-- Which items are NOT in the 'Bowl' category?
-- List the ItemNames that do NOT have a price of $8.00.
-- Can you retrieve items that are NOT 'Chips & Guacamole'?
-- Which items do NOT have calories between 600 and 700?

SELECT ItemName 
FROM ChipotleMenu 
WHERE NOT Category = 'Bowl';

SELECT ItemName 
FROM ChipotleMenu 
WHERE NOT price = 8.00;

SELECT ItemName 
FROM ChipotleMenu 
WHERE NOT ItemName = 'Chips & Guacamole';

SELECT ItemName
FROM ChipotleMenu 
WHERE NOT Calories BETWEEN 600 AND 700;

-- --COMPARISON---
-- Which items have a price equal to $7.50?
-- List the items that have calories greater than 650.
-- Can you find items with a price less than or equal to $7.80?
-- Which items from the menu have calories less than 500?

SELECT ItemName 
FROM ChipotleMenu 
WHERE Price = 7.5;

SELECT ItemName 
FROM ChipotleMenu 
WHERE Calories > 650;

SELECT ItemName 
FROM ChipotleMenu 
WHERE Price <= 7.8;

SELECT ItemName 
FROM ChipotleMenu 
WHERE Calories < 500;

-- --IN------
-- Which items belong to either the 'Burrito', 'Salad', or 'Sides' category?
-- List the items that have prices IN $7.50, $8.00, and $9.00.
-- Which ItemNames are either 'Chicken Burrito', 'Steak Tacos', or 'Veggie Bowl'?
-- Can you retrieve items that have calories either 645, 570, or 520?

SELECT ItemName 
FROM ChipotleMenu 
WHERE Category IN ('Burrito', 'Salad', 'Sides');


SELECT ItemName 
FROM ChipotleMenu 
WHERE Price IN ('7.5', '8.00', '9.00');

SELECT ItemName
FROM ChipotleMenu 
WHERE ItemName IN ('ChickenBurrito', 'Steak Tacos', 'Veggie Bowl');

-- ---BETWEEN----
-- Which items have a price BETWEEN $7.00 and $8.00?
-- List the items with calories BETWEEN 500 and 600.
-- Can you find items with ItemID BETWEEN 2 and 5?
-- Which items have a price BETWEEN $3.00 and $9.00?

SELECT ItemName 
FROM ChipotleMenu 
WHERE Price BETWEEN 7.00 AND 8.00; 

SELECT ItemName 
FROM ChipotleMenu 
WHERE Calories BETWEEN 500 AND 600;

SELECT ItemName 
FROM ChipotleMenu 
WHERE ItemId BETWEEN 2 AND 5; 

SELECT ItemName 
FROM ChipotleMenu 
WHERE Price BETWEEN 3.00 AND 9.00; 

-- --LIKE --WILDCARD-
-- Which items on the menu have names that start with 'Chicken'?
-- Can you list the items that end with 'Bowl'?
-- Find items that have the word 'Tacos' anywhere in their name.
-- Which items have a name pattern where there's any character followed by the word 'Burr'?

SELECT ItemName 
FROM ChipotleMenu 
WHERE ItemName LIKE 'Chicken%';

SELECT ItemName
FROM ChipotleMenu 
WHERE ItemName LIKE '%Bowl%';

SELECT ItemName 
FROM ChipotleMenu 
WHERE ItemName LIKE '%Tacos%';

SELECT ItemName 
FROM ChipotleMenu 
WHERE ItemName LIKE 'Burr%';


-- ---EXISTS---
-- (For EXISTS, we typically need sub-queries or another table for context.
-- I'll frame a hypothetical question based on the given table.)

-- Are there items on the menu where the price is greater than the average price of all items?
-- Does a 'Salad' category item exist with calories above 500?
-- Is there a 'Bowl' item that costs more than the 'Chicken Burrito'?
-- Do any items exist with a name containing the word 'Veggie'? 

SELECT ItemName
FROM ChipotleMenu WHERE EXISTS  (SELECT * FROM ChipotleMenu WHERE Price > (SELECT AVG(Price) FROM ChipotleMenu));

SELECT * 
FROM ChipotleMenu 
WHERE EXISTS (SELECT * FROM ChipotleMenu WHERE Category = 'Salad' AND Calories > 500);

-- Is there a 'Bowl' item that costs more than the 'Chicken Burrito'?
SELECT * 
FROM ChipotleMenu 
WHERE Category = 'Bowl' AND Price > ( SELECT MAX(Price) FROM ChipotleMenu WHERE ItemName = 'Chicken Burrito');


SELECT ItemName 
FROM ChipotleMenu 
WHERE EXISTS (SELECT * FROM ChipotleMenu WHERE ItemName LIKE '%Veggie%');

