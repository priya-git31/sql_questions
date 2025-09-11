-- ----ROW_NUMBER----

-- How would you assign a unique sequential integer to MenuItems based on Price in descending order?
-- For each order in the OrderDetails table, how would you assign a row number based on the OrderID in ascending order?
-- Can you rank the MenuItems by their DateAdded, giving the newest items the lowest row numbers?

SELECT 
     itemname, 
	 price, 
ROW_NUMBER() OVER (ORDER BY price DESC) AS row_number 
FROM MenuItems;

SELECT 
     orderid,
	 itemid, 
ROW_NUMBER() OVER (ORDER BY orderid ASC) AS row_id 
FROM OrderDetails; 

SELECT 
     itemname, 
	 price, 
	 dateadded,
ROW_NUMBER() OVER (ORDER BY dateadded DESC) AS lowest_number_rank
FROM MenuItems;


-- ---RANK---

-- How would you rank MenuItems based on Price, with the same rank assigned to items with the same price and gaps in ranking for tied ranks?
-- For the OrderDetails, can you rank each order based on the quantity ordered, handling ties in quantities appropriately?
-- How would you rank MenuItems based on the length of their ItemName?

SELECT  
      itemname, 
	  price,
RANK() OVER (ORDER BY price DESC) AS price_rank 
FROM MenuItems;

SELECT 
      orderid, 
	  quantity, 
RANK() OVER (ORDER BY quantity DESC) AS order_rank 
FROM OrderDetails; 


SELECT 
     itemname, 
	 price, 
RANK() OVER (ORDER BY LENGTH(itemname) DESC) AS name_rank 
FROM MenuItems; 
	 price,



-- ---DESNE_RANK---

-- How would you rank MenuItems based on Price, where items with the same price get the same rank without any gaps?
-- Using the OrderDetails table, how would you assign dense ranks based on order quantities?
-- Can you densely rank MenuItems based on the number of characters in their ItemName?

SELECT 
    menuitems, 
	price, 
DENSE_RANK() OVER (ORDER BY price DESC)
FROM MenuItems; 




-- --CUME-DIST----

-- In the MenuItems table, how would you determine the cumulative distribution of item prices, showing the proportion of prices less than or equal to each item's price?
-- Using OrderDetails, how would you compute the cumulative distribution of ordered quantities for each order?
-- For MenuItems, how would you calculate the CUME_DIST of items based on their introduction date

- ---PERCENT_RANK---

-- How would you compute the percent rank of MenuItems based on their price?
-- For each order in the OrderDetails table, how would you compute the percent rank of order quantities?
-- Can you calculate the percent rank of MenuItems based on their introduction date, with earlier dates having lower percent ranks?

-- ---NTILE----

-- If you wanted to divide the MenuItems into 4 roughly equal groups based on price, how would you assign each item to a bucket (from 1 to 4)?
-- How would you distribute all orders in OrderDetails into 3 groups based on the quantity ordered?
-- For MenuItems, can you divide items into 5 groups based on their introduction date?