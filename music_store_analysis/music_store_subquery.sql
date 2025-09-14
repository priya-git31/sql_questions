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