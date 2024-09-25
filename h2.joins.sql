
-- ---SELF JOIN-----
-- Suppose each item in MenuItems had a CalorieCount column. How would you find pairs of menu items that have the same calorie count?
SELECT * 
FROM menuitems AS menutable
JOIN menuitems AS caloriestable ON menutable.itemid = caloriestable.itemid; 


SELECT 
    m1.ItemName AS Item1,
    m2.ItemName AS Item2,
    m1.CalorieCount
FROM 
    MenuItems AS m1
JOIN 
    MenuItems AS m2 ON m1.CalorieCount = m2.CalorieCount
WHERE 
    m1.ItemID < m2.ItemID;

-- -- Again, with a hypothetical CalorieCount column, how would you list items that have a calorie count higher than the 'Original Recipe Chicken'?

SELECT *
FROM menuitems AS m1 
JOIN menuitems AS m2 ON m1.caloriecount = m2.caloriecount 
WHERE m2.caloriecount > ( SELECT caloriecount FROM menuitems WHERE itemname = 'Original Recipe Chicken'); 


-- -- Imagine MenuItems has a RelatedItemID column that relates items to each other (e.g., suggesting pairings). How would you list each item alongside its related item?

SELECT menutable.itemname AS item_name, relatedtable.itemname AS related_item_name
FROM menuitems AS menutable 
JOIN menuitems AS relatedtable ON menutable.relateditemid = relatedtable.relateditemid;

-- If MenuItems had a DateIntroduced column, how would you identify items introduced on the same date?
SELECT m1.itemname AS item1, m2.itemname AS item2, m1.dateintroduced
FROM menuitems AS m1 
JOIN menuitems AS m2 ON m1.dateintroduced = m2.dateintroduced;


-- How would you use a self join on OrderDetails to find orders that have ordered the same ItemID?
SELECT o1.orderid, o1.itemid, o2.itemid
FROM orderdetails AS o1 
JOIN orderdetails AS o2 ON o1.itemid = o2.itemid; 


-- ==========================================================

-- ---NATURAL JOIN----
-- (A natural join returns rows where there is a column name match in both tables and their values are equal. Not all databases support the NATURAL JOIN keyword, but the concept is important.)

-- Suppose each item in MenuItems had a CalorieCount column. How would you find pairs of menu items that have the same calorie count?
-- Again, with a hypothetical CalorieCount column, how would you list items that have a calorie count higher than the 'Original Recipe Chicken'?
-- Imagine MenuItems has a RelatedItemID column that relates items to each other (e.g., suggesting pairings). How would you list each item alongside its related item?
-- If MenuItems had a DateIntroduced column, how would you identify items introduced on the same date?
-- How would you use a self join on OrderDetails to find orders that have ordered the same ItemID?
-- ==========================================================

-- ----CARTESIAN JOIN----

-- How would you generate a list of all possible combinations of ItemName and OrderID using a cartesian join between MenuItems and OrderDetails?
-- Using a cross join, how many total combinations are possible between the records in MenuItems and OrderDetails?
-- If you wanted to simulate a new promotional menu where every item is paired with every other item as a combo, how would you list all possible combos using MenuItems?
-- How would you use a cross join to preview a new menu where each ItemName is offered at multiple hypothetical price points: $1.99, $2.99, and $3.99?
-- Assuming OrderDetails had a Size column (like 'Small', 'Medium', 'Large'), how would you use a cross join to show every menu item in every possible size?
