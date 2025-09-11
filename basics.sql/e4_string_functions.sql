-- --STRING FUNCTIONS--

-- <!-- Imagine you have a table Users with a column FullName.
 How would you extract the first name of each user assuming names are stored as 'First Last' and are separated by a space?

--From the same Users table, how would you determine the length of each user's full name?
SELECT LENGTH(FullName)
FROM Users;

-- In a table Books with a column Title, how would you find all books whose titles start with the word 'The'?
SELECT Title 
FROM Books 
WHERE Title LIKE 'The%'; 

-- Suppose you have a table Products with a column Description. How would you change all occurrences of the word 'old' to 'new' in the Description column?
SELECT REPLACE('Description','old', 'new') AS NewDescription 
FROM Products; 

-- Using the Users table again, if you wanted to combine (concatenate) the FullName column with a column UserID (a numerical column) to form a new column 'ID_Name', how would you do that? For instance, a user with UserID 5 and FullName 'John Doe' should result in '5_John Doe'.
SELECT FullName, 
CONCAT(UserId, '_', FullName)
FROM Users; 

-- In the ChipotleMenu table, how would you retrieve all items where the ItemName is in uppercase?
SELECT ItemName 
FROM ChipotleMenu 
WHERE ItemName = UPPER(ItemName);

-- Imagine a table Emails with a column EmailAddress. How would you find all email addresses that belong to the domain 'example.com'? -->
SELECT EmailAddress
FROM Emails 
WHERE domain LIKE '%example.com%'





