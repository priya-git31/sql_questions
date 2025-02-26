/* --------------------
   Case Study Questions
   --------------------*/

-- 1. What is the total amount each customer spent at the restaurant?
-- 2. How many days has each customer visited the restaurant?
-- 3. What was the first item from the menu purchased by each customer?
-- 5. Which item was the most popular for each customer?
-- 6. Which item was purchased first by the customer after they became a member?
-- 7. Which item was purchased just before the customer became a member?
-- 8. What is the total items and amount spent for each member before they became a member?
-- 9.  If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
-- 10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?

-- 1. What is the total amount each customer spent at the restaurant?
SELECT 
     s.customer_id, 
    SUM(m.price) AS total_amount
FROM
Menu m JOIN Sales s ON m.product_id = s.product_id
GROUP BY 
        s.customer_id
ORDER BY
         s.customer_id

--Result:
+──────────────+──────────────+
| customer_id  | total_spent  |
+──────────────+──────────────+
| A            | 76           |
| B            | 74           |
| C            | 36           |
+──────────────+──────────────+


-- 2. How many days has each customer visited the restaurant?
SELECT 
    customer_id, 
    COUNT(DISTINCT order_date) AS total_days
FROM 
     Sales 
GROUP BY customer_id 
ORDER BY COUNT(DISTINCT order_date) DESC

--Result:
+──────────────+───────────────+
| customer_id  | visited_days  |
+──────────────+───────────────+
| A            | 4             |
| B            | 6             |
| C            | 2             |
+──────────────+───────────────+

-- 3. What was the first item from the menu purchased by each customer?


-- 4. What is the most purchased item on the menu and how many times was it purchased by all customers?
SELECT 
    m.product_id,
    m.product_name,
    COUNT(*) AS product_count 
FROM
     Menu m JOIN Sales s ON m.product_id = s.product_id 
GROUP BY
    s.product_id
ORDER BY
    COUNT(*) DESC 
LIMIT 1

-Result:
+─────────────+───────────────+──────────────+
| product_id  | product_name  | order_count  |
+─────────────+───────────────+──────────────+
| 3           | ramen         | 8            |
+─────────────+───────────────+──────────────+