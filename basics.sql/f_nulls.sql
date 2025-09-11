-- NULL FUNCTION ---

-- How many items in the ChipotleMenu table have a NULL value in the Category column?
SELECT *
FROM ChipotleMenu 
WHERE Category IS NULL; 

-- Retrieve all item names that have a NULL value for Price.
SELECT ItemName 
FROM ChipotleMenu 
WHERE Price IS NULL; 

-- Which items were added to the menu (DateAdded) but don't have ProteinGrams specified (NULL)?
SELECT *
FROM ChipotleMenu 
WHERE ProteinGrams IS NULL; 


-- Find out the average Calories of items where FatGrams is not NULL.
SELECT AVG(Calories) AS AvgCal
FROM ChipotleMenu 
WHERE FatGrams IS NOT NULL; 

-- How many items have neither ProteinGrams nor FatGrams specified?
SELECT * 
FROM ChipotleMenu 
WHERE ProteinGrams IS NULL AND FatGrams IS NULL; 

-- Which items have a Price specified but have NULL values in both the Calories and DateAdded columns?
SELECT * 
FROM ChipotleMenu 
WHERE Price IS NOT NULL AND Calories IS NULL AND DateAdded IS NULL; 

-- List all the categories that have at least one item with a NULL DateAdded.
SELECT * 
FROM ChipotleMenu 
WHERE DateAdded IS NULL; 

-- Find the total count of items that have any of the nutritional facts (Calories, ProteinGrams, or FatGrams) as NULL.

SELECT COUNT(Calories,ProteinGrams,FatGrams)
FROM ChipotleMenu;

SELECT COUNT(*)
FROM ChipotleMenu 
WHERE ProteinGrams IS NOT NULL AND Calories IS NOT NULL AND FatGrams IS NOT NULL; 

-- Which Category has the most number of items with NULL FatGrams?
SELECT Category, COUNT(*)
FROM ChipotleMenu 
WHERE FatGrams IS NULL 
GROUP BY Category; 

-- -- Retrieve the names of items that have a specified Price but have either ProteinGrams or FatGrams (or both) as NULL.

SELECT ItemName 
FROM ChipotleMenu 
WHERE Price IS NOT NULL AND ProteinGrams IS NULL OR FatGrams IS NULL; 