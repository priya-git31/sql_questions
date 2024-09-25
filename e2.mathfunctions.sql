-- Absolute Value:
-- What's the absolute difference in price between the 'Chicken Burrito' and the 'Veggie Bowl'?
SELECT ABS(7.5 - 7.8);

-- Power:
-- If you were to raise the price of the 'Steak Tacos' to the power of 2, what value would you get?
SELECT POWER (8, 2);

-- Square Root:
-- What's the square root of the calories for the 'Chips & Guacamole'?
SELECT SQRT(770) 
FROM ChipotleMenu; 

-- Ceiling:
-- What's the ceiling value of the price for 'Barbacoa Salad'?
SELECT CEILING(9);

-- Floor:
-- What's the floor value of the calories of 'Carnitas Quesadilla'?
SELECT FLOOR(750);

-- Round:
-- Round the price of the 'Sofritas Burrito Bowl' to the nearest whole number.
SELECT ROUND(7.9);


-- Round to Decimals:
-- Round the price of 'Chicken Burrito' to 2 decimal places.
SELECT ROUND(7.5,2);

-- Modulo:
-- If you divide the calories of 'Chicken Burrito' by the calories of 'Veggie Bowl', what's the remainder?
SELECT MOD (7.5,7.8);

-- Random:
-- Generate a random number between 0 and 1 and multiply it by the price of 'Chicken Burrito'. What's the resulting value?
SELECT SIGN(7.5);

-- Trig Functions:
-- What's the sine value of the price of 'Chicken Burrito' when treated as an angle in radians?
SELECT SIGN(7.5);


---------
-- Average Price: What is the average price of all items on the menu?
SELECT AVG(Price)
FROM ChipotleMenu;

-- Highest Calorie Count: Which item has the highest calorie count?
SELECT MAX(Calories)
FROM ChipotleMenu;

-- Minimum Protein Content: Which item has the least amount of protein?
SELECT MIN(ProteinGrams)
FROM ChipotleMenu;

-- Total Calories of Burritos: What's the total calorie count for all types of burritos on the menu?
SELECT SUM(Calories)
FROM ChipotleMenu 
WHERE Category = 'Burrito';

-- Price Variation: What is the difference between the highest and lowest priced item on the menu
SELECT MAX(Price) - MIN(Price)
FROM ChipotleMenu;

------
-- Average Fat for Bowls: What's the average fat content for all bowl items?
SELECT AVG(fatgrams)
FROM ChipotleMenu;

-- Most Expensive Category: Which category has the highest average price?
SELECT MAX(price),Category
FROM ChipotleMenu 
GROUP BY Category;

-- Items Above Average Calories: How many items have a calorie count above the average calorie count of all items?
SELECT COUNT(*)
FROM ChipotleMenu 
GROUP BY Calories 
HAVING Calories > AVG

-- Standard Deviation of Prices: What is the standard deviation of the prices of all items? (This might require specific SQL functions like STDDEV depending on your SQL flavor)
SELECT STDEV(Price)
FROM ChipotleMenu;

-- Total Protein from Tacos: How much total protein is there in all taco items combined?
SELECT SUM(ProteinGrams)
FROM ChipotleMenu;


       