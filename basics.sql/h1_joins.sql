
----INNER JOIN -----

-- Which menu items have been ordered at least once?
SELECT *
FROM menuitems
INNER JOIN orderdetails ON menuitems.itemid = orderdetails.itemid; 

-- How would you get a list of OrderIDs along with their corresponding ItemNames?
SELECT itemname, orderid
FROM menuitems 
INNER JOIN orderdetails ON menuitems.itemid = orderdetails.itemid; 

-- Can you retrieve the ItemName of the product that corresponds to OrderID 103?
SELECT itemname 
FROM menuitems 
INNER JOIN orderdetails ON orderdetails.itemid = menuitems.itemid 
WHERE orderid = 103; 

-- How would you determine the number of times each menu item has been ordered, but only for items that have been ordered at least once?
SELECT itemname, COUNT(*) AS order_count
FROM menuitems 
INNER JOIN orderdetails ON orderdetails.itemid = menuitems.itemid
GROUP BY itemname;

-- Which ItemNames correspond to OrderIDs 101 and 102?
SELECT itemname 
FROM menuitems 
INNER JOIN orderdetails ON orderdetails.itemid = menuitems.itemid 
WHERE orderid IN (101,102);



---LEFT JOIN------
-- Can you list all menu items, including those that haven't been ordered, alongside their OrderID (if they were ordered)?
SELECT itemname, orderid 
FROM menuitems 
LEFT JOIN orderdetails ON orderdetails.itemid = menuitems.itemid;

-- How would you determine which menu items have never been ordered?
SELECT itemname, orderid 
FROM menuitems 
LEFT JOIN orderdetails ON orderdetails.itemid = menuitems.itemid
WHERE orderid IS  NULL;

-- Can you provide a list of all ItemNames along with the OrderID, displaying NULL for items that have no corresponding order?
SELECT itemname, orderid 
FROM menuitems 
LEFT JOIN orderdetails ON orderdetails.itemid = menuitems.itemid
WHERE orderid IS  NULL;

-- How many times has each menu item been ordered, including items with zero orders?
SELECT itemname, COUNT(orderdetails.orderid) AS order_count 
FROM menuitems 
INNER JOIN orderdetails ON orderdetails.itemid = menuitems.itemid
GROUP BY itemname;


-- Which orders, if any, correspond to 'Popcorn Nuggets'?
SELECT itemname, orderid 
FROM menuitems 
LEFT JOIN orderdetails ON orderdetails.itemid = menuitems.itemid 
WHERE itemname = 'Popcorn Nuggets';



---RIGHT JOIN-----
-- Using a RIGHT JOIN, can you list all orders, including those without a matching menu item (though this shouldn't happen in our data)?
SELECT *
FROM orderdetails 
RIGHT JOIN menuitems ON menuitems.itemid = orderdetails.itemid; 

-- How would you determine if there are any OrderIDs that don't correspond to a valid ItemID?



-- List all OrderIDs along with their ItemName, and show NULL for OrderIDs with no corresponding ItemName.
SELECT orderid, itemname 
FROM orderdetails
RIGHT JOIN menuitems ON menuitems.itemid = orderdetails.itemid


-- How many times has each menu item been ordered, including items with zero orders, using a RIGHT JOIN?
SELECT orderid, COUNT(itemname) AS order_count
FROM orderdetails 
RIGHT JOIN menuitems ON menuitems.itemid = orderdetails.orderid 
GROUP BY itemname; 


-- If there were order entries with invalid ItemIDs, how would you list those orders?

---OUTER JOIN----
-- Can you provide a list of all ItemNames and OrderIDs, including items that haven't been ordered and orders without items?
SELECT m.itemname, o.orderid
FROM menuitems m 
FULL OUTER JOIN orderdetails o ON m.itemid = o.itemid;

-- How would you determine all ItemNames that have never been ordered and all OrderIDs that don't have a corresponding ItemName?
SELECT m.itemname, o.orderid
FROM menuitems m 
FULL OUTER JOIN orderdetails o ON m.itemid = o.itemid;

-- Which menu items and orders don't have a match in the other table?

-- Using a FULL OUTER JOIN, how would you list the total orders for each menu item, including those with zero orders?

-- Are there any menu items without orders or orders without valid menu items in the tables?
