--DATE---
-- How would you retrieve the current date from the database?
-- Using the ChipotleMenu table, can you list the items added to the menu in the month of March? Hint: Use a function to extract the month from the DateAdded column.
-- For analysis purposes, you want to know the day of the week for each DateAdded in the ChipotleMenu table. Can you extract and display the day of the week for each item's DateAdded value?
-- Can you calculate and display the difference in days between the current date and the DateAdded for each item in the ChipotleMenu table?
-- Assuming a scenario where the ChipotleMenu table also has a DateDiscontinued column, how would you calculate the number of days each item was available on the menu (i.e., the difference between DateDiscontinued and DateAdded)?
-- You want to run a promotion on items added to the menu on the last day of any month. How would you identify such items from the ChipotleMenu table using date functions?
-- For a future marketing campaign, you want to see which items will have their 1-year anniversary from the DateAdded in the next 30 days. How would you retrieve such items from the ChipotleMenu table?

SELECT CURRENT_DATE();

SELECT ItemName, EXTRACT(MONTH FROM dateadded), dateadded
FROM ChipotleMenu
WHERE EXTRACT(MONTH FROM dateadded) = 3;

-- Can you calculate and display the difference in days between the current date 
--and the DateAdded for each item in the ChipotleMenu table?
SELECT 
    ItemName,
    DateAdded,
    CURRENT_DATE AS CurrentDate,
    CURRENT_DATE - DateAdded AS DaysSinceAdded
FROM 
    ChipotleMenu
ORDER BY 
    DaysSinceAdded DESC;
 

SELECT dateadded,EXTRACT(DOW FROM dateadded) AS dayofweek
FROM ChipotleMenu;

 SELECT DATEDIFF(datediscountinued - dateadded)
 FROM ChipotleMenu'


