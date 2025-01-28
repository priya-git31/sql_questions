#Write a SQL query to find top 5 most ordered dishes from a given 
#restaurant 
#1 

SELECT 
      Dishname, 
      SUM(Quantity) AS TotalOrders 
FROM 
     Orders 
WHERE OrderId = 'R101'
ORDER BY TotalOrders DESC
LIMIT 5; 

#3
SELECT 
      SUM(Amount) As TotalRevenue 
FROM 
    Orders 
WHERE OrderDate BETWEEN ' ' AND ' '

#2
SELECT * 
FROM 
    Orders 
WHERE UserID = 'U123'
AND OrderDate BETWEEN '' AND ' '

SELECT 
     RestaurantId, 
     AVG(Rating) AS AverageRating
FROM 
    Ratings 
GROUP BY 
    RestaurantId 
ORDER BY AverageRating DESC
LIMIT 10; 

#4. 
   SELECT 
         RestaurantId, 
         AVG(Rating) AS AvgerageRating 
    FROM 
        Orders
    GROUP BY AverageRating 
    ORDER BY AverageRating 
    LIMIT 10; 


#5 
SELECT 
      UserId 
FROM 
    Orders 
GROUP BY UserId 
HAVING COUNT(DISTINCT RestaurantId) > 3 

#6
SELECT 
    RestaurantId, 
    AVG(Amount) AS AverageOrderValue
FROM 
    Orders
GROUP BY 
    RestaurantId
HAVING AVG(Amount) > SELECT AVG(Amount) FROM Orders

#7
SELECT 
     Cuisine, 
     SUM(Revenue) AS TotalRevenue 
FROM 
    Orders 
GROUP BY Cuisine
ORDER BY TotalRevenue DESC; 

#8 
    SELECT 
         RestaurantId, 
         City, 
         SUM(Amount) AS TotalRevenue, 
         RANK() OVER (PARTITION BY City ORDER BY SUM(Amount) DESC) AS RANK
    FROM 
        Orders
    GROUP BY 
         RestaurantId, City
    
#9 


#10 
WITH CTE AS (
    SELECT 
      RestaurantId, 
      City, 
      Dishname, 
      SUM(Quantity) AS TotalQUantity
      RANK() OVER (PARTITION BY RestaurantID, City ORDER BY SUM(Quantity) DESC) AS RANK
FROM 
    Orders 
WHERE City = 'NewYork'
GROUP BY RestaurantId, City, DishName     
)
SELECT  
      RestaurantId, 
      City, 
      TotalQuantity 
FROM 
    CTE 
WHERE Rank <= 3; 

#14 
SELECT 
     RestaurantId, 
     AVG(DeliveryTime) AS AverageDeliveryTime
FROM 
    Orders 
GROUP BY RestaurantId 
ORDER BY AverageDeliveryTime DESC
LIMIT 5; 



