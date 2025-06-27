-- Query 1: Total Revenue
SELECT SUM(quantity * price) AS total_revenue FROM orders;

-- Query 2: Revenue per Customer
SELECT customer_id, SUM(quantity * price) AS revenue
FROM orders
GROUP BY customer_id;

-- Query 3: Average Revenue Per User (ARPU)
SELECT AVG(revenue) AS arpu
FROM (
  SELECT customer_id, SUM(quantity * price) AS revenue
  FROM orders
  GROUP BY customer_id
);

-- Query 4: Subquery with HAVING
SELECT * FROM orders
WHERE customer_id IN (
  SELECT customer_id
  FROM orders
  GROUP BY customer_id
  HAVING SUM(quantity * price) > 30000
);

-- Query 5: INNER JOIN Example
CREATE TABLE customers (
  customer_id INTEGER,
  name TEXT
);

INSERT INTO customers VALUES
(101, 'Asha'),
(102, 'Balu'),
(103, 'Chitra');

SELECT o.order_id, c.name, o.product, o.price
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id;

-- Query 6: Create View
CREATE VIEW customer_revenue AS
SELECT customer_id, SUM(quantity * price) AS total_revenue
FROM orders
GROUP BY customer_id;

-- Check the View
SELECT * FROM customer_revenue;
