-- -----FIRST_VALUE-------

-- How would you retrieve the name of the first item introduced (based on DateAdded) for each item in the MenuItems table when sorted by DateAdded?
-- For each order in the OrderDetails table, what would be the ItemID of the first order placed when the orders are sorted by OrderID?
-- Can you show each ItemName from MenuItems alongside the first item's price in the table when items are ordered by Price ascending?



- ---LAST_VALUE-----

-- How would you display the name of the most recently introduced item for each item in the MenuItems table when sorted by DateAdded?
-- In the OrderDetails table, for every order, what would be the ItemID of the most recent order when sorted by OrderID?
-- Can you list each ItemName from MenuItems alongside the price of the last item in the table when items are ordered by Price ascending?
-- ---LAG----

-- For each item in MenuItems, can you show its ItemName, Price, and the price of the item introduced just before it?
-- Using the OrderDetails table, how would you display each OrderID and the ItemID of the previous order?
-- Can you list the ItemName and DateAdded for each item in MenuItems, along with the DateAdded of the item added right before it?
-- ---LEAD----

-- For each item in MenuItems, how would you display its ItemName, Price, and the price of the item introduced just after it?
-- Using the OrderDetails table, can you show each OrderID and the ItemID of the subsequent order?
-- How would you list the ItemName and DateAdded for each item in MenuItems, along with the DateAdded of the item added right after it?
-- ---Nth_VALUE----

-- In the MenuItems table, for each item, can you show the ItemName and the name of the third item introduced when sorted by DateAdded?
-- Using the OrderDetails table, how would you display each OrderID and the ItemID of the fifth order placed?
-- Can you display each ItemName from MenuItems alongside the price of the fourth most expensive item in the table?