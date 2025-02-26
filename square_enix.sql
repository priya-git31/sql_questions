
-- Create the Game table without AUTO_INCREMENT
CREATE TABLE game (
    id INTEGER PRIMARY KEY,  -- No AUTO_INCREMENT, IDs will be assigned manually
    title TEXT NOT NULL,
    release_year INTEGER,
    genre TEXT,
    platform TEXT
);

-- Create the Sales table 
CREATE TABLE sales (
    id INTEGER PRIMARY KEY,
    game_id INTEGER,
    region TEXT,
    copies_sold INTEGER,
    FOREIGN KEY (game_id) REFERENCES game(id) ON DELETE CASCADE
);

-- Insert sample data into the Game table with manually assigned IDs
INSERT INTO game (id, title, release_year, genre, platform) VALUES 
(1, 'Final Fantasy VII', 1997, 'RPG', 'PlayStation'),
(2, 'Final Fantasy XIV', 2010, 'MMORPG', 'PC'),
(3, 'Kingdom Hearts', 2002, 'Action RPG', 'PlayStation 2'),
(4, 'Dragon Quest XI', 2017, 'RPG', 'PlayStation 4'),
(5, 'Tomb Raider', 2013, 'Action-Adventure', 'PC'),
(6, 'Deus Ex: Human Revolution', 2011, 'Action RPG', 'PC');

-- Insert sample data into the Sales table with correct game_id references
INSERT INTO sales (id, game_id, region, copies_sold) VALUES 
(1, 1, 'North America', 5000000),
(2, 1, 'Europe', 4000000),
(3, 2, 'North America', 3000000),
(4, 2, 'Japan', 2500000),
(5, 3, 'North America', 2000000),
(6, 3, 'Europe', 1800000),
(7, 4, 'Japan', 3500000),
(8, 4, 'North America', 1500000),
(9, 5, 'North America', 3000000),
(10, 5, 'Europe', 2700000),
(11, 6, 'North America', 2000000),
(12, 6, 'Europe', 1900000);

-- Verify the inserted data
SELECT * FROM game;
SELECT * FROM sales;

---Questions--- 

-- # Retrieve all games in the dataset sql
SELECT * 
FROM game; 

-- /Get the list of games released after the year 2000.
SELECT * 
FROM game 
WHERE release_year > 2000

-- Find all RPG games
SELECT * 
FROM game 
WHERE genre = 'RPG'

-- List all games available on PlayStation platforms
SELECT * 
FROM game 
WHERE PLATFORM LIKE '%PlayStation%'


-- What is the total number of copies sold in each region?
SELECT 
      s.region, 
      SUM(s.copies_sold) AS total_sold 
FROM
      sales s
GROUP BY region 
ORDER BY total_sold DESC

-- What is the average number of copies sold per game?
SELECT
      g.title, 
      AVG(s.copies_sold) AS avg_copies_sold 
FROM
     game g JOIN sales s ON g.id = s.game_id 
GROUP BY g.title

-- What is the total sales per genre?
SELECT 
     g.genre, 
     SUM(copies_sold) AS total_sales 
FROM 
    game g Join sales s ON g.id = s.game_id 
GROUP BY g.genre 
ORDER BY total_sales DESC

-- What is the highest number of copies sold in each region?

SELECT 
      s.region, 
      MAX(copies_sold) AS max_sold 
FROM 
     sales s 
GROUP BY s.region 
ORDER BY max_sold


--INTERMEDIATE--
-- Find the total copies sold for each game.
SELECT 
      g.title, 
      SUM(copies_sold) AS total_sales
FROM 
    game g JOIN sales s ON g.id = s.game_id 
GROUP BY g.id 
ORDER BY total_sales DESC; 

-- Find the game that sold the most copies in North America
SELECT
      g.title,
      MAX(copies_sold) AS max_copy 
FROM 
    game g JOIN sales s ON g.id = s.game_id 
WHERE region = 'North America'

-- Count the number of games in each genre
SELECT
     genre, 
     COUNT(DISTINCT title) AS number_of_games
FROM 
    game 
GROUP BY genre 
ORDER BY number_of_games DESC

-- Find the total sales for each region.
SELECT 
      s.region, 
      SUM(s.id) AS total_sales
FROM
     game g JOIN sales s ON g.id = s.game_id 
GROUP BY region
ORDER BY total_sales DESC

---ADVANCED---
-- Find the top-selling game of each genre
WITH CTE AS (
  SELECT 
       g.title, 
       g.genre,
       SUM(s.copies_sold) AS total_sales,
       RANK() OVER (PARTITION BY g.genre ORDER BY SUM(s.copies_sold) DESC) AS rank
  FROM 
      game g JOIN sales s ON g.id = s.game_id 
  GROUP BY g.title, g.genre
  )
SELECT title, 
       genre, 
       total_sales
FROM CTE 
WHERE rank = 1
ORDER BY total_sales DESC


───────────+───────+