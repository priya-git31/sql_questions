
-- 🔹 SELECT (Basic Retrieval)
-- Show the title and type of all shows in the dataset.
-- Retrieve title, country, and release_year for shows released in 2019.
-- Display title and listed_in (categories/genres) of all movies.
-- Show all columns for the first 10 rows in the dataset.
-- Get the title and duration of all TV Shows.

select 
title, type
from netflix;

select 
title, country, release_year
from netflix
where release_year = 2019;

select 
title, listed_in 
from netflix
where type = 'Movie';

select * 
from netflix 
limit 10;

select 
title, duration
from netflix
where type ='TV Show';


-- 🔹 WHERE (Filtering)
-- Get all titles released in India.
-- Show all movies directed by "Martin Scorsese".
-- List all shows where release_year is before 2010.
-- Find all TV Shows with the rating "TV-MA".
-- Get all titles that contain the word "Love" in the title.

select 
title 
from netflix 
where country =  'India';

select 
title 
from netflix 
where type ='Movie' and 
director ='Martin Scorsese';

select 
title 
from netflix 
where 
release_year < 2010;

select title 
from netflix 
where type = 'TV Show' and rating ='TV-MA';

select title 
from netflix 
where lower(title) like '%love%';

-- 🔹 ORDER BY (Sorting)
-- Show the first 10 titles ordered alphabetically by title.
-- List all movies ordered by release_year (newest to oldest).
-- Display all shows ordered by date_added (most recent first).
-- Get the top 5 longest-duration movies.
-- Show all titles ordered by country (A–Z).

select title 
from netflix 
order by title asc
limit 10;

select title, release_year
from netflix 
order by release_year DESC
limit 10;

select title
from netflix 
order by date_added ASC
limit 10;

select title,duration
from netflix 
order by duration ASC
limit 5;

select title
from netflix 
order by  title ASC;

-- 🔹 DISTINCT (Unique Values)
-- Show all distinct type of shows available (Movie/TV Show).
-- List all distinct ratings (like PG, R, TV-MA, etc.).
-- Show distinct countries where Netflix content is produced.
-- List distinct release_year values in the dataset.
-- Show all distinct listed_in (genres/categories).


select 
distinct type 
from netflix;

select 
distinct rating 
from netflix;

select 
distinct country
from netflix;

select 
distinct release_year
from netflix;

select 
distinct listed_in
from netflix;


-- 🔹 COUNT (Aggregation)
-- Count the total number of shows (movies + TV shows) in the dataset.
-- Find the number of movies released after 2015.
-- Count how many shows are listed under "Comedies".
-- Count the number of distinct directors in the dataset.
-- Find how many titles were added to Netflix in 2021.


select 
count (show_id)
from netflix;

select 
count (show_id)
from netflix
where type = 'Movie' 
and release_year > 2015;

select 
count (show_id)
from netflix
where listed_in like '%comedy%';

select 
count (distinct director)
from netflix;

select 
count (distinct title)
from netflix
where date_added = '%2021%';


--  BETWEEN

-- What it does:
-- Filters values within a given range (inclusive of both ends).
-- Example: release_year BETWEEN 2010 AND 2020

-- Practice Questions:
-- Get all shows released between 2015 and 2020.
-- Find movies with duration between 90 and 120 minutes.
-- Show titles added to Netflix between January 1, 2019 and December 31, 2020.
-- List TV Shows released between 2000 and 2005.
-- Count how many shows were released between 2018 and 2021.

select 
title, 
show_id 
from netflix 
where release_year between '2015' and '2020';

select 
title, 
show_id 
from netflix 
where duration between '90' and '120';

select 
title 
from netflix 
where date_added between '01-01-2019' and '12-31-2020';

select type
from netflix 
where type = 'TV Show' 
and release_year between '2000' and '2005';

select count(*) as released_shows
from netflix 
where type = 'TV Show' and release_year between '2018' and '2021';


--  2. AND
-- What it does:
-- Combines multiple conditions — all must be true.
-- Example: type = 'Movie' AND release_year = 2020

-- Practice Questions:
-- 6. Show movies released in India AND in 2020.
-- 7. Find all titles directed by “Martin Scorsese” AND rated R.
-- 8. Get TV Shows added in 2021 AND rating is TV-MA.
-- 9. Count movies released in the USA AND with duration > 100 minutes.
-- 10. Show all titles that contain “Love” AND released after 2015.

select title
from netflix 
where type ='Movie'
and country like '%India%' and release_year ='2020';

select title, release_year
from netflix 
where director = 'Martin Scorsese' 
and rating like '%R%';

select title 
from netflix 
where type = 'TV Show' and 
date_added like '%2021%'
and rating =  'TV-MA';


select count(*) as usa_movies 
from netflix 
where type ='Movie'
and duration > '100';

select title 
from netflix
where 
release_year > '2015' and listed_in like '%love%';


🔹 OR

-- What it does:
-- Combines multiple conditions — at least one must be true.
-- Example: country = 'India' OR country = 'USA'

-- Practice Questions:
-- 11. Show titles released in India OR USA.
-- 12. Find all shows released in 2019 OR 2020.
-- 13. List movies directed by “Christopher Nolan” OR “Steven Spielberg”.
-- 14. Count all shows where type is “Movie” OR rating is “TV-14”.
-- 15. Show all titles containing the word “Dark” OR “Light”.

select title
from netflix 
where country like '%India%' or country like '%USA%';

select title
from netflix 
where type = 'TV Show' and 
(release_year = '2020' or release_year = '2020');

select title 
from netflix 
where type ='Movie'
and (director = 'Christopher Nolan' or director = 'Steven Spielberg');

select count(*) as movie_14
from netflix 
where type ='Movie' or rating ='TV-14';

select title
from netflix 
where listed_in like '%dark%' or listed_in like '%light%';

-- * NOT

-- What it does:
-- Excludes values.
-- Example: NOT country = 'India'

-- Practice Questions:
-- 16. Show all shows NOT released in the USA.
-- 17. Find movies that are NOT rated PG.
-- 18. Get all titles where the type is NOT TV Show.
-- 19. List shows that are NOT listed in “Comedies”.
-- 20. Show all titles where director is NOT NULL.

select title
from netflix 
where type ='TV Show' and
not country ='USA';


select title
from netflix 
where type ='Movie' and not rating like '%PG%';

select title, type
from netflix 
where not type ='TV Show';

select title
from netflix 
where  listed_in not like '%comedies%';

select title 
from netflix 
where director is not null;



-- 🔹 . LIMIT

-- What it does:
-- Restricts the number of rows returned.
-- Example: LIMIT 10

-- Practice Questions:
-- 21. Show the first 10 titles in the table.
-- 22. Get the first 5 TV Shows released in India.
-- 23. Show 20 movies sorted by newest release year.
-- 24. Show 3 distinct countries.
-- 25. Display the first 15 rows of the dataset.

select title
from netflix 
limit 10;

select title
from netflix 
where type ='TV Show' and country like '%India%'
limit 5;

select title
from netflix 
where type ='Movie' 
order by release_year desc 
limit 20;

select  distinct(country)
from netflix 
limit 3;

select * 
from netflix 
limit 15;


-- 🔹 . OFFSET

-- What it does:
-- Skips a number of rows before showing results. Usually combined with LIMIT for pagination.
-- Example: LIMIT 10 OFFSET 20 → show rows 21–30.

-- Practice Questions:
-- 26. Show titles 11–20 in alphabetical order.
-- 27. Display movies released in 2020, skip the first 5.
-- 28. Get 5 shows from the dataset, but skip the first 10.
-- 29. List 3 directors after skipping the first 2 distinct directors.
-- 30. Show 2 rows after skipping the first 8 rows.


select title 
from netflix 
order by title asc 
limit 10 offset 10;

select title 
from netflix 
where type ='Movie' and release_year ='2020'  and
limit 100 offset 5;

select title
from netflix 
where type ='TV Show' 
limit 5 offset 10;

select distinct(director)
from netflix 
limit 3 offset 2;

select * from 
netflix 
limit 2 offset 3;

-- 🔹 . GROUP BY
-- What it does:
-- Groups rows with the same values into summary rows.
-- Example: GROUP BY country

-- Practice Questions:
-- 31. Count how many shows exist for each type.
-- 32. Find the number of shows released per release_year.
-- 33. Count how many titles were directed by each director.
-- 34. Show how many shows are produced in each country.
-- 35. Find how many titles are listed in each rating category.

SELECT count(*) as  type_counts, 
type
from netflix 
group by type;

select count(*) as shows_released, 
release_year
from netflix 
where type ='TV Show' 
group by release_year;

select count(*) as number_of_releases, 
director
from netflix 
group by director;


select count(*) as number_of_shows, 
country
from netflix 
where type ='TV Show' 
group by country

select count(*) as num_titles, 
rating 
from netflix 
group by rating;


-- 🔹 . HAVING

-- What it does:
-- Filters groups (like WHERE but applied after GROUP BY).
-- Example: GROUP BY country HAVING COUNT(*) > 10

-- Practice Questions:
-- 36. Show all countries having more than 50 titles.
-- 37. List directors with at least 5 shows.
-- 38. Find ratings that have more than 100 titles.
-- 39. Show release years that have over 200 shows.
-- 40. Show categories (listed_in) that appear more than 20 times.

select 
country
from netflix 
group by country 
having count(*) > 50;

select director
from netflix 
group by director
having count(*) >= 5;


select rating 
from 
netflix 
group by rating 
having count(*) > 100;

select release_year 
from netflix 
where type = 'TV Show' 
group by release_year 
having count(*) > 200


select listed_in 
from 
netflix 
group by listed_in 
having count(*) > 20;
