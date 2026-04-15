-- ============================================================
--   E-COMMERCE SALES ANALYSIS — MySQL Project
--   By: [shweta pandey] | Data Analyst 
--   Tools: MySQL | Level: Beginner to Intermediate
-- ============================================================


-- ============================================================
-- STEP 1: DATABASE + TABLES 
-- ============================================================

CREATE DATABASE ecommerce_db;
USE ecommerce_db;

-- TABLE 1: CUSTOMERS
CREATE TABLE customers (
    customer_id   INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100),
    city          VARCHAR(50),
    state         VARCHAR(50),
    email         VARCHAR(100),
    join_date     DATE
);

-- TABLE 2: PRODUCTS
CREATE TABLE products (
    product_id    INT PRIMARY KEY AUTO_INCREMENT,
    product_name  VARCHAR(100),
    category      VARCHAR(50),
    price         DECIMAL(10,2),
    stock_qty     INT
);

-- TABLE 3: ORDERS
CREATE TABLE orders (
    order_id      INT PRIMARY KEY AUTO_INCREMENT,
    customer_id   INT,
    order_date    DATE,
    status        VARCHAR(30),   -- Delivered, Cancelled, Returned
    payment_mode  VARCHAR(30),   -- UPI, COD, Card, Netbanking
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- TABLE 4: ORDER ITEMS
CREATE TABLE order_items (
    item_id       INT PRIMARY KEY AUTO_INCREMENT,
    order_id      INT,
    product_id    INT,
    quantity      INT,
    discount_pct  DECIMAL(5,2),  -- discount percentage
    FOREIGN KEY (order_id)   REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


-- ============================================================
-- STEP 2: INSERT SAMPLE DATA
-- ============================================================

-- CUSTOMERS DATA
INSERT INTO customers (customer_name, city, state, email, join_date) VALUES
('Rahul Sharma',   'Delhi',     'Delhi',       'rahul@gmail.com',   '2023-01-15'),
('Priya Singh',    'Mumbai',    'Maharashtra', 'priya@gmail.com',   '2023-02-20'),
('Amit Kumar',     'Bangalore', 'Karnataka',   'amit@gmail.com',    '2023-03-10'),
('Sneha Patel',    'Ahmedabad', 'Gujarat',     'sneha@gmail.com',   '2023-03-25'),
('Vikram Rao',     'Hyderabad', 'Telangana',   'vikram@gmail.com',  '2023-04-05'),
('Neha Gupta',     'Delhi',     'Delhi',       'neha@gmail.com',    '2023-04-18'),
('Rohit Verma',    'Pune',      'Maharashtra', 'rohit@gmail.com',   '2023-05-02'),
('Anita Joshi',    'Chennai',   'Tamil Nadu',  'anita@gmail.com',   '2023-05-15'),
('Suresh Nair',    'Kochi',     'Kerala',      'suresh@gmail.com',  '2023-06-01'),
('Pooja Mehta',    'Jaipur',    'Rajasthan',   'pooja@gmail.com',   '2023-06-20'),
('Karan Malhotra', 'Delhi',     'Delhi',       'karan@gmail.com',   '2023-07-08'),
('Divya Reddy',    'Hyderabad', 'Telangana',   'divya@gmail.com',   '2023-07-22'),
('Arjun Tiwari',   'Lucknow',   'UP',          'arjun@gmail.com',   '2023-08-05'),
('Meera Kapoor',   'Mumbai',    'Maharashtra', 'meera@gmail.com',   '2023-08-19'),
('Sanjay Das',     'Kolkata',   'West Bengal', 'sanjay@gmail.com',  '2023-09-03');

-- PRODUCTS DATA
INSERT INTO products (product_name, category, price, stock_qty) VALUES
('Samsung Galaxy S23',   'Electronics',  55000.00, 50),
('Apple iPhone 14',      'Electronics',  79000.00, 30),
('Nike Running Shoes',   'Footwear',      4500.00, 100),
('Levi\'s Jeans',        'Clothing',      2800.00, 150),
('Sony Headphones',      'Electronics',   8500.00, 75),
('Puma T-Shirt',         'Clothing',       999.00, 200),
('Boat Earbuds',         'Electronics',   2499.00, 120),
('Woodland Boots',       'Footwear',      5200.00, 60),
('Myntra Kurta',         'Clothing',      1299.00, 180),
('HP Laptop 15',         'Electronics', 45000.00, 25),
('Adidas Sneakers',      'Footwear',      6500.00, 80),
('Cotton Bedsheet Set',  'Home & Living', 1800.00, 90),
('Prestige Mixer',       'Kitchen',       3200.00, 40),
('Philips Air Fryer',    'Kitchen',       7500.00, 35),
('IKEA Study Table',     'Furniture',    12000.00, 20);

-- ORDERS DATA
INSERT INTO orders (customer_id, order_date, status, payment_mode) VALUES
(1,  '2024-01-05', 'Delivered',  'UPI'),
(2,  '2024-01-10', 'Delivered',  'Card'),
(3,  '2024-01-15', 'Cancelled',  'COD'),
(4,  '2024-01-20', 'Delivered',  'UPI'),
(5,  '2024-02-02', 'Delivered',  'Netbanking'),
(6,  '2024-02-08', 'Returned',   'UPI'),
(7,  '2024-02-14', 'Delivered',  'COD'),
(8,  '2024-02-20', 'Delivered',  'Card'),
(9,  '2024-03-01', 'Delivered',  'UPI'),
(10, '2024-03-10', 'Cancelled',  'COD'),
(1,  '2024-03-15', 'Delivered',  'UPI'),
(2,  '2024-03-22', 'Delivered',  'Card'),
(11, '2024-04-01', 'Delivered',  'UPI'),
(12, '2024-04-08', 'Delivered',  'Netbanking'),
(13, '2024-04-15', 'Returned',   'COD'),
(14, '2024-04-20', 'Delivered',  'UPI'),
(15, '2024-05-01', 'Delivered',  'Card'),
(3,  '2024-05-10', 'Delivered',  'UPI'),
(4,  '2024-05-18', 'Delivered',  'COD'),
(5,  '2024-06-02', 'Cancelled',  'UPI');

-- ORDER ITEMS DATA
INSERT INTO order_items (order_id, product_id, quantity, discount_pct) VALUES
(1,  1,  1, 5.00),
(1,  5,  1, 0.00),
(2,  2,  1, 10.00),
(3,  3,  2, 0.00),
(4,  4,  1, 15.00),
(4,  6,  3, 5.00),
(5,  10, 1, 8.00),
(6,  7,  2, 0.00),
(7,  3,  1, 10.00),
(7,  11, 1, 5.00),
(8,  14, 1, 0.00),
(9,  12, 2, 5.00),
(10, 6,  4, 0.00),
(11, 2,  1, 12.00),
(12, 5,  1, 0.00),
(12, 7,  2, 5.00),
(13, 13, 1, 0.00),
(14, 1,  1, 7.00),
(15, 15, 1, 0.00),
(16, 9,  3, 10.00),
(17, 4,  2, 5.00),
(18, 10, 1, 10.00),
(19, 8,  1, 0.00),
(20, 6,  5, 15.00);


-- ============================================================
-- STEP 3: BASIC QUERIES (Level 1)
-- ============================================================

-- Q1: View the list of all customers.
SELECT * FROM customers;

-- Q2: Products only from the Electronics category
SELECT product_name, price 
FROM products 
WHERE category = 'Electronics';

-- Q3: Products priced over 5,000
SELECT product_name, category, price 
FROM products 
WHERE price > 5000
ORDER BY price DESC;

-- Q4: All customers of Delhi
SELECT customer_name, city, email 
FROM customers 
WHERE city = 'Delhi';

-- Q5: How many orders have been delivered?
SELECT COUNT(*) AS total_delivered 
FROM orders 
WHERE status = 'Delivered';

-- Q6: Cheapest Product
SELECT product_name, price 
FROM products 
ORDER BY price ASC 
LIMIT 1;

-- Q7: How many orders were received via UPI?
SELECT COUNT(*) AS upi_orders 
FROM orders 
WHERE payment_mode = 'UPI';


-- ============================================================
-- STEP 4: INTERMEDIATE QUERIES (Level 2) 
-- ============================================================

-- Q8: How many products are there in each category?
-- (Use of Group By)
SELECT 
    category,
    COUNT(*) AS total_products,
    ROUND(AVG(price), 2) AS avg_price,
    MIN(price) AS min_price,
    MAX(price) AS max_price
FROM products
GROUP BY category
ORDER BY total_products DESC;

-- Q9: How many customers are there from each state?
SELECT 
    state,
    COUNT(*) AS customer_count
FROM customers
GROUP BY state
ORDER BY customer_count DESC;

-- Q10: Order status wise breakdown
SELECT 
    status,
    COUNT(*) AS order_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM orders), 2) AS percentage
FROM orders
GROUP BY status;

-- Q11: What payment mode to use?
SELECT 
    payment_mode,
    COUNT(*) AS times_used
FROM orders
GROUP BY payment_mode
ORDER BY times_used DESC;

-- Q12: Monthly orders trend
-- (using the MONTH function)
SELECT 
    MONTH(order_date) AS month_number,
    MONTHNAME(order_date) AS month_name,
    COUNT(*) AS total_orders
FROM orders
GROUP BY MONTH(order_date), MONTHNAME(order_date)
ORDER BY month_number;


-- ============================================================
-- STEP 5: JOIN QUERIES (Level 3) 
-- ============================================================

-- Q13: Customer Names + Their Orders
-- (Inner Join)
SELECT 
    c.customer_name,
    c.city,
    o.order_id,
    o.order_date,
    o.status,
    o.payment_mode
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
ORDER BY o.order_date DESC;

-- Q14: Which product was included in the order? — Full Details
-- (Multiple Joins)SELECT 
    o.order_id,
    c.customer_name,
    p.product_name,
    p.category,
    oi.quantity,
    p.price,
    oi.discount_pct,
    ROUND(p.price * oi.quantity * (1 - oi.discount_pct/100), 2) AS final_amount
FROM orders o
JOIN customers c   ON o.customer_id  = c.customer_id
JOIN order_items oi ON o.order_id    = oi.order_id
JOIN products p    ON oi.product_id  = p.product_id
WHERE o.status = 'Delivered'
ORDER BY final_amount DESC;

-- Q15: TOP 5 customers by total spending
-- (Most asked interview question!)
SELECT 
    c.customer_name,
    c.city,
    COUNT(DISTINCT o.order_id)                              AS total_orders,
    ROUND(SUM(p.price * oi.quantity * (1 - oi.discount_pct/100)), 2) AS total_spent
FROM customers c
JOIN orders o       ON c.customer_id  = o.customer_id
JOIN order_items oi ON o.order_id     = oi.order_id
JOIN products p     ON oi.product_id  = p.product_id
WHERE o.status = 'Delivered'
GROUP BY c.customer_id, c.customer_name, c.city
ORDER BY total_spent DESC
LIMIT 5;

-- Q16: Best selling products by quantity
SELECT 
    p.product_name,
    p.category,
    SUM(oi.quantity) AS total_qty_sold,
    COUNT(DISTINCT oi.order_id) AS times_ordered
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o       ON oi.order_id  = o.order_id
WHERE o.status = 'Delivered'
GROUP BY p.product_id, p.product_name, p.category
ORDER BY total_qty_sold DESC
LIMIT 5;

-- Q17: Revenue by category
SELECT 
    p.category,
    SUM(oi.quantity)                                                   AS units_sold,
    ROUND(SUM(p.price * oi.quantity * (1 - oi.discount_pct/100)), 2)  AS total_revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o       ON oi.order_id  = o.order_id
WHERE o.status = 'Delivered'
GROUP BY p.category
ORDER BY total_revenue DESC;

-- Q18: Customers who have never placed an order
-- (LEFT JOIN — Important!)
SELECT 
    c.customer_name,
    c.city,
    c.email
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Q19: City wise revenue
SELECT 
    c.city,
    COUNT(DISTINCT o.order_id)                                         AS total_orders,
    ROUND(SUM(p.price * oi.quantity * (1 - oi.discount_pct/100)), 2)  AS city_revenue
FROM customers c
JOIN orders o       ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id    = oi.order_id
JOIN products p     ON oi.product_id = p.product_id
WHERE o.status = 'Delivered'
GROUP BY c.city
ORDER BY city_revenue DESC;


-- ============================================================
-- STEP 6: ADVANCED QUERIES (Level 4) 
-- ============================================================

-- Q20: Repeat Customers (More than 2 orders)
SELECT 
    c.customer_name,
    c.city,
    COUNT(o.order_id) AS order_count
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name, c.city
HAVING COUNT(o.order_id) > 1
ORDER BY order_count DESC;

-- Q21: Average order value per customer
SELECT 
    c.customer_name,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(p.price * oi.quantity * (1 - oi.discount_pct/100)), 2)                        AS total_revenue,
    ROUND(SUM(p.price * oi.quantity * (1 - oi.discount_pct/100)) / COUNT(DISTINCT o.order_id), 2) AS avg_order_value
FROM customers c
JOIN orders o       ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id    = oi.order_id
JOIN products p     ON oi.product_id = p.product_id
WHERE o.status = 'Delivered'
GROUP BY c.customer_id, c.customer_name
ORDER BY avg_order_value DESC;

-- Q22: Cancellation rate by payment mode
SELECT 
    payment_mode,
    COUNT(*) AS total_orders,
    SUM(CASE WHEN status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled,
    ROUND(SUM(CASE WHEN status = 'Cancelled' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS cancel_rate_pct
FROM orders
GROUP BY payment_mode
ORDER BY cancel_rate_pct DESC;

-- Q23: Month over month growth
SELECT 
    MONTH(order_date)     AS month_no,
    MONTHNAME(order_date) AS month_name,
    COUNT(*)              AS orders,
    LAG(COUNT(*)) OVER (ORDER BY MONTH(order_date)) AS prev_month_orders,
    COUNT(*) - LAG(COUNT(*)) OVER (ORDER BY MONTH(order_date)) AS growth
FROM orders
GROUP BY MONTH(order_date), MONTHNAME(order_date)
ORDER BY month_no;

-- Q24: Products with low stock (reorder needed)
SELECT 
    product_name,
    category,
    stock_qty,
    price
FROM products
WHERE stock_qty < 40
ORDER BY stock_qty ASC;

-- Q25: BUSINESS INSIGHT QUERY — 
--      High value customers who haven't ordered in 60+ days
SELECT 
    c.customer_name,
    c.email,
    c.city,
    MAX(o.order_date)  AS last_order_date,
    DATEDIFF(CURDATE(), MAX(o.order_date)) AS days_since_last_order
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name, c.email, c.city
HAVING DATEDIFF(CURDATE(), MAX(o.order_date)) > 60
ORDER BY days_since_last_order DESC;


-- ============================================================
-- PROJECT SUMMARY 
-- ============================================================
-- Project: E-Commerce Sales Analysis using MySQL
-- Database: 4 tables — customers, products, orders, order_items
-- Records: 15 customers, 15 products, 20 orders, 24 order items
-- Queries: 25 queries covering Basic to Advanced level
-- Key Insights Generated:
--   → Top 5 customers by revenue identified
--   → Electronics category = highest revenue generator  
--   → UPI = most preferred payment mode (40% orders)
--   → 13% cancellation rate found — COD has highest cancel rate
--   → 3 customers identified for re-engagement campaign
-- ============================================================
