---SCLAR SUB QUERY----

-- Q. For each track, show track_id, name, and milliseconds. 
-- Also show the global average track length (in milliseconds) as a new column.

select 
t.track_id,
t.name, 
t.milliseconds,
(select avg(milliseconds) from track) as global_avg_track_length 
from track AS t 

-- Customers vs Global Average Spending
-- For each customer, show their first_name, last_name, and their total amount spent. 
-- Add a column with the average spending across all customers (scalar subquery).


select 
c.first_name, 
c.last_name, 
sum(il2.unit_price * il2.quantity) as total_amount_spent, 
(select 
round(avg(cust_total),2)
from (
select 
i.customer_id, 
sum(il2.unit_price * il2.quantity) as cust_total
from 
invoice i 
join invoice_line il2 on il2.invoice_id = i.invoice_id
group by i.customer_id ) as per_customer)
as average_spending_global
from 
customer c 
left join invoice i on i.customer_id = c.customer_id 
left join invoice_line il2 on il2.invoice_id = i.invoice_id
group by c.first_name, c.last_name, c.customer_id 
order by total_amount_spent desc;


-- Invoice Comparison
-- For each invoice, show invoice_id, invoice_date, total. Also show the maximum invoice total from the whole database.

select 
i.invoice_id, 
i.invoice_date, 
i.total, 
(select max(ip.total) 
from invoice ip) as max_invoice_total
from 
invoice i 
order by i.total desc;



-- Artist Revenue vs Global Average Revenue
-- For each artist, calculate their total sales revenue from all tracks. Next to it, show the average artist revenue across all artists.


SELECT
  ar.name,
  COALESCE(SUM(il.unit_price * il.quantity), 0) AS total_sales_rev,
  (
    SELECT ROUND(AVG(artist_rev), 2)
    FROM (
      SELECT
        a2.artist_id,
        SUM(il2.unit_price * il2.quantity) AS artist_rev
      FROM artist a2
      JOIN album al2       ON al2.artist_id = a2.artist_id
      JOIN track t2        ON t2.album_id   = al2.album_id
      JOIN invoice_line il2 ON il2.track_id  = t2.track_id
      GROUP BY a2.artist_id
    ) AS per_artist
  ) AS average_artist_revenue
FROM artist ar
LEFT JOIN album al    ON al.artist_id  = ar.artist_id
LEFT JOIN track t     ON t.album_id    = al.album_id
LEFT JOIN invoice_line il ON il.track_id = t.track_id
GROUP BY ar.artist_id, ar.name
ORDER BY total_sales_rev DESC;



-- Employees vs Avg Number of Customers
-- Each employee supports some customers (customer.support_rep_id). 
-- For each employee, show their name and the number of customers they support. 
-- Add a scalar subquery column showing the average number of customers per employee.

-Employees vs Avg Number of Customers
-- Each employee supports some customers (customer.support_rep_id). 
-- For each employee, show their name and the number of customers they support. 
-- Add a scalar subquery column showing the average number of customers per employee.


select 
e.first_name, 
e.last_name, 
count(c.customer_id) as total_customers_supported,
(select round(avg (total_customers),2) 
from 
(
select 
count(customer.customer_id) as total_customers 
from 
employee 
left join customer on employee.employee_id = customer.support_rep_id
group by employee.employee_id)) as avg_total_customers 
from 
employee e 
left join customer c on e.employee_id = c.support_rep_id
group by e.first_name, e.last_name;

-----IN/NOT IN SUB QUERIES---

-- Q1. Customers who bought Rock tracks
-- Find the customer IDs and names of customers who have purchased at least one track in the Rock genre.

select 
c.customer_id, 
c.first_name, 
c.last_name
from customer c 
where c.customer_id in (
select 
distinct cust.customer_id
from customer cust
join invoice i on cust.customer_id = i.customer_id 
join invoice_line il2 on i.invoice_id = il2.invoice_id 
join track tck on il2.track_id = tck.track_id 
join genre gen on tck.genre_id = gen.genre_id
where gen.name like '%rock%');

-- Q2. Tracks from AC/DC albums
-- List the track names that belong to albums created by AC/DC.
select t.name as track_names 
from 
track t
where t.album_id in 
(select 
alb.album_id
FROM  album alb 
JOIN artist art on alb.artist_id = art.artist_id
WHERE art.name like '%Ac/Dc%');

-- Q3. Employees who have no customers
-- Show the employee names of support reps who do not support any customers.

select 
e.employee_id,
e.first_name,
e.last_name 
from 
employee e 
where e.employee_id not in (
select 
distinct cust.support_rep_id 
from 
customer cust
where cust.support_rep_id is not null
);


- Q2. Tracks never purchased (NOT EXISTS)
-- 👉 List the track_id and track name of tracks that have never been purchased (no matching row in invoice_line).

select 
t.track_id, 
t.name, 
from track t 
where not exists (
select 1 
from 
invoice_line in
where in.track_id = t.track_id);


-- Q3. Employees with no customers (NOT EXISTS)
-- 👉 Show the first and last names of employees who do not support any customers.


select 
e.first_name,
e.last_name 
from employee e
where not exists (
SELECT 
c.support_rep_id
FROM 
customer c 
where c.support_rep_id = e.employee_id );


-- Q1. Top-Spending Customers vs Average
-- Find customers (first name, last name, total spent) whose total spending
--  is greater than the average total spending across all customers.


select 
cu.first_name, 
cu.last_name, 
sum(inl.quantity * inl.unit_price) as total_sum 
from 
customer cu 
join invoice inv on cu.customer_id = inv.customer_id 
join invoice_line inl on inv.invoice_id = inl.invoice_id 
group by cu.customer_id, cu.first_name, cu.last_name 
having total_sum > (select round(avg(total_amount),2)  as avg_amount_customer
from (
select 
c.customer_id,
sum(il.quantity * il.unit_price) as total_amount
from 
customer c 
join invoice i on c.customer_id = i.customer_id 
join invoice_line il on i.invoice_id = il.invoice_id 
group by c.customer_id));


-- Q4. Genres with Above-Average Revenue
-- Show genres (name, revenue) where total revenue is greater than the average genre revenue.


select 
gen.name, 
sum(invl.quantity * invl.unit_price) as total_revenue 
from 
invoice_line invl 
join track tk on invl.track_id = tk.track_id 
join genre gen on gen.genre_id = tk.genre_id 
group by gen.name, gen.genre_id 
having sum(invl.quantity * invl.unit_price)  >  (select round(avg(total_sum),2)
from
(select 
g.name, 
g.genre_id, 
sum(il.quantity * il.unit_price) as total_sum 
from 
invoice_line il
join track t on il.track_id = t.track_id 
join genre g on g.genre_id = t.genre_id
group by g.name, g.genre_id));

---CORELATED SUB QUERY----

-- Q1. Invoice above customer’s average
-- For each invoice, show invoice_id, customer_id, 
-- and total only if the total is greater than the average invoice total for that same customer

SELECT 
i.invoice_id, 
i.customer_id, 
i.total 
FROM
invoice i 
WHERE i.total > (
      SELECT AVG(i2.total)
      FROM invoice i2 
      WHERE i2.customer_id = i.customer_id
);


-- Q3. Customers with more invoices than average in their country
-- Show customer names and invoice counts for customers whose number of invoices is
--  greater than the average invoice count for customers in the same country.

SELECT 
c.first_name, 
count(in.invoice_id) as invoice_counts 
from 
customer c 
join invoice in on c.customer_id = in.customer_id 
group by c.first_name 
having count(in.invoice_id) > (
       SELECT 
       avg(count i.invoice_id) as avg_counts 
       from 
       invoice i 
       where i.billing_country = in.country
);