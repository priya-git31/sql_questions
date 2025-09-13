/*	Question Set 1 - Easy */

/* Q1: Who is the senior most employee based on job title? */

--Method 1---
select 
first_name, 
title
from 
employee
where reports_to IS NULL or reports_to = '';


--Method 2--select 
first_name, 
last_name, 
title 
from employee 
order by levels desc 
limit 1;

/* Q2: Which countries have the most Invoices? */
select country, 
count(*) as invoice_count 
from employee 
group by country 
order by 2 desc 

/* Q3: What are top 3 values of total invoice? */
select Total 
from Invoice
order by Total desc 
limit 3;


/* Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
Write a query that returns one city that has the highest sum of invoice totals. 
Return both the city name & sum of all invoice totals */

select billing_city, 
sum(Total) as total_sum 
from invoice 
group by billing_city
order by total_sum 
limit 1;

/* Q5: Who is the best customer? The customer who has spent the most money will be declared the best customer. 
Write a query that returns the person who has spent the most money.*/

SELECT customer.customer_id, first_name, last_name, SUM(total) AS total_spending
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
GROUP BY customer.customer_id
ORDER BY total_spending DESC
LIMIT 1;


/* Question Set 2 - Moderate */

/* Q1: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
Return your list ordered alphabetically by email starting with A. */



select 
first_name, 
last_name, 
email as email_address
genre.name as name 
from customer join invoice on customer.customer_id = invoice.customer_id 
join invoiceline on invoiceline.invoide_id = invoice.invoice_id 
join track on track.track_id = invoiceline.track_id 
join genre on genre.genre_id = track.genre_id 
where genre.name like '%rock%'
order by email_addess asc; 


/* Q2: Let's invite the artists who have written the most rock music in our dataset. 
Write a query that returns the Artist name and total track count of the top 10 rock bands. */

select 
artist.name, 
count(track.track_id) as total_tracks 
from track 
join album on album.album_id = track.album_id 
join artist on artist.artist_id = album.artist_id 
join genre on genre.genre_id = track.genre_id 
where genre.name ilike '%rock%'
group by artist.name 
order by total_tracks desc
limit 10;



/* Q3: Return all the track names that have a song length longer than the average song length. 
Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first. */

select 
name, 
milliseconds 
from track 
where milliseconds > (Select avg(milliseconds) as avg_track_length from track)
order by milliseconds desc ;


-- Q4. Top Customers by Spending
-- Find the top 5 customers who spent the most (total invoice amount). 
-- Show their first_name, last_name, country, and total spent.

select 
customer.first_name, 
customer.last_name, 
customer.country,
sum(invoice.total) as total_spent 
from 
Invoice 
join customer on invoice.customer_id = customer.customer_id 
group by customer.first_name, customer.last_name, customer.country
order by total_spent desc 
limit 5; 

-- Top Artists by Sales
-- Find the top 10 artists whose tracks generated the most sales revenue. Show artist name and total_sales.
select 
artist.name, 
sum(invoice_line.unit_price * invoice_line.quantity) as total_sales 
from 
artist 
join album on artist.artist_id = album.artist_id 
join track on album.album_id = track.album_id
join invoice_line on track.track_id = invoice_line.track_id 
join invoice on invoice_line.invoice_id = invoice.invoice_id 
group by artist.name
order by total_sales DESC
limit 10;


-- - Average Track Length by Genre
-- Find the average track length (in seconds) per genre, sorted from longest to shortest. 
-- Show genre and avg_length_seconds.

SELECT
  g.name AS genre,
  ROUND(AVG(t.milliseconds) / 1000.0, 2) AS avg_length_seconds
FROM track t
JOIN genre g ON g.genre_id = t.genre_id
GROUP BY g.genre_id, g.name
ORDER BY avg_length_seconds DESC;

-- Employee–Customer Relationship
-- Each customer is assigned to a support rep (an employee). 
-- Find each employee’s full name and how many customers they support.

select 
concat(employee.first_name || ' ' ||employee.last_name) as full_name,
count(*) as total_customers 
from 
employee 
join customer on employee.employee_id = customer.support_rep_id
group by full_name 
order by total_customers desc, full_name;