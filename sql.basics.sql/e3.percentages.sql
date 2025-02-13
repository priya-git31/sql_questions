--PERCENTAGES--

-- In a table named Numbers with a column Value, how would you identify all even numbers -- using the modulus operator?
SELECT value 
FROM Numbers 
WHERE Value % 2 = 0; 

-- Similarly, from the same Numbers table, how would you find all odd numbers?
SELECT Value 
FROM Numbers 
WHERE Value %2 <>0; 

-- Imagine you have a table Orders with a column OrderID. If you wanted to process every 10th order for a special review, how would you select orders where the OrderID modulus 10 equals 0?

SELECT OrderId 
FROM Orders
WHERE OrderID % 10 = 0; 


-- -- In a table Payments with columns Amount and InstallmentSize,
how would you determine if the Amount can be divided evenly (without any remainder) by the InstallmentSize using the modulus operator?
 SELECT Amount, InstallmentSize 
 FROM Payments 
 WHERE Amount % InstallmemtSize = 0;