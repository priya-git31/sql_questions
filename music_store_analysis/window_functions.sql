-- Q1. Show each invoice’s total and the global average invoice total.

select 
i.invoice_id, 
i.total, 
avg(i.total) over () as global_avg
from
invoice i;

-- Q2. Show each track’s length and the global average track length.

select 
t.track_id, 
t.milliseconds, 
round(avg(t.milliseconds) over (), 2) as global_avg_length 
from track t;

-- 2. PARTITION BY → Average/aggregates per group
-- Q1. Show each invoice with the average invoice total per customer.

select 
i.invoice_id, 
i.customer_id, 
round(avg(i.total) over (partition by i.customer_id),2) as avg_total 
from 
invoice i


-- Q2. Show each track with the average track length per genre.

select 
t.name, 
g.name, 
t.milliseconds, 
round(avg(t.milliseconds) over (partition by g.name),2) as avg_length_genre
from 
track t 
join genre g on t.genre_id = t.genre_id;


-- 3. ROW_NUMBER() → Unique numbering
-- Q1. Number invoices for each customer by date.


select 
i.customer_id, 
i.invoice_date, 
row_number() over (partition by i.customer_id order by i.invoice_date) as invoice_number 
from invoice i;

-- Number tracks in each album by track name.


SELECT 
  a.title AS album,
  t.name AS track,
  ROW_NUMBER() OVER(PARTITION BY a.album_id ORDER BY t.name) AS track_order
FROM album a
JOIN track t ON a.album_id = t.album_id;



-- 4. RANK() vs DENSE_RANK()
-- Q1. Rank customers by total spending (ties show difference).

SELECT 
  c.customer_id,
  c.first_name,
  c.last_name,
  SUM(il.unit_price * il.quantity) AS total_spent,
  RANK() OVER(ORDER BY SUM(il.unit_price * il.quantity) DESC) AS rank_spent,
  DENSE_RANK() OVER(ORDER BY SUM(il.unit_price * il.quantity) DESC) AS dense_rank_spent
FROM customer c
JOIN invoice i ON c.customer_id = i.customer_id
JOIN invoice_line il ON i.invoice_id = il.invoice_id
GROUP BY c.customer_id;

-- Q2. Rank tracks by length within each album.

select 
t.name, 
a.title, 
rank() over (partition by a.album_id order by t.milliseconds desc) as rnk_track 
from 
track t 
join album a on t.album_id = a.album_id;

-- 5. SUM() Running Totals
-- Q1. Running total of sales per customer.

select 
i.customer_id, 
i.total, 
sum(i.total) over (partition by i.customer_id order by i.total desc) as rank_new 
from 
invoice i;

-- Q2. Running total of revenue by invoice date (global).

select 
i.invoice_date, 
i.total,
sum(i.total) over (order by i.invoice_date) as running_total_global 
from invoice i;

-- 6. LAG() / LEAD()
-- Q1. For each customer, show their invoice total and the previous invoice total.

select 
i.customer_id, 
i.total, 
i.invoice_id,
lag(i.total,1) over (partition by i.customer_id order by i.invoice_date) as prev_invoice_lag 
from invoice i;

-- Q2. For each track, show its length and the next track length in the same album.


select 
t.track_id, 
t.name, 
t.milliseconds, 
lead(t.milliseconds) over (partition by  a.album_id order by t.track_id) as lead_l
from 
track t 
join album a on a.album_id = t.album_id;