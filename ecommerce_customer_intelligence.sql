/* ============================================================
   E-COMMERCE CUSTOMER INTELLIGENCE & SALES ANALYTICS
   Database: MySQL
   Author: Amaresh Mohapatra
   ============================================================ */


/* ============================================================
   1. CREATE DATABASE
   ============================================================ */

DROP DATABASE IF EXISTS ecommerce_analytics;

CREATE DATABASE ecommerce_analytics;

USE ecommerce_analytics;


/* ============================================================
   2. CREATE TABLES
   ============================================================ */


/* ---------- Categories ---------- */

CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL UNIQUE
);


/* ---------- Customers ---------- */

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    gender VARCHAR(20),
    date_of_birth DATE,
    registration_date DATE NOT NULL,
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(50) DEFAULT 'India'
);


/* ---------- Products ---------- */

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(150) NOT NULL,
    category_id INT NOT NULL,
    brand VARCHAR(100),
    cost_price DECIMAL(10,2) NOT NULL,
    
    selling_price DECIMAL(10,2) NOT NULL,
    stock_quantity INT DEFAULT 0,

    FOREIGN KEY (category_id)
        REFERENCES categories(category_id)
);


/* ---------- Payments ---------- */

CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    payment_method VARCHAR(50) NOT NULL,
    payment_status VARCHAR(30) NOT NULL,
    payment_date DATE NOT NULL
);


/* ---------- Orders ---------- */

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_status VARCHAR(30) NOT NULL,
    payment_id INT,
    shipping_city VARCHAR(100),
    shipping_state VARCHAR(100),

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    FOREIGN KEY (payment_id)
        REFERENCES payments(payment_id)
);


/* ---------- Order Items ---------- */

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    discount DECIMAL(5,2) DEFAULT 0,

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);


/* ---------- Customer Addresses ---------- */

CREATE TABLE customer_addresses (
    address_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    city VARCHAR(100),
    state VARCHAR(100),
    pincode VARCHAR(10),
    address_type VARCHAR(30),

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);


/* ============================================================
   3. INSERT CATEGORIES
   ============================================================ */

INSERT INTO categories (category_name)
VALUES
('Electronics'),
('Clothing'),
('Home Appliances'),
('Books'),
('Sports'),
('Beauty'),
('Grocery');


/* ============================================================
   4. INSERT CUSTOMERS
   ============================================================ */

INSERT INTO customers
(customer_name, email, gender, date_of_birth, registration_date, city, state)
VALUES

('Aarav Sharma','aarav@gmail.com','Male','1998-04-12','2022-01-15','Mumbai','Maharashtra'),

('Priya Singh','priya@gmail.com','Female','1997-08-21','2022-02-10','Delhi','Delhi'),

('Rahul Kumar','rahul@gmail.com','Male','1999-02-17','2022-03-05','Bengaluru','Karnataka'),

('Sneha Patel','sneha@gmail.com','Female','1996-11-30','2022-03-18','Ahmedabad','Gujarat'),

('Rohan Das','rohan@gmail.com','Male','1998-06-25','2022-04-02','Bhubaneswar','Odisha'),

('Ananya Roy','ananya@gmail.com','Female','2000-01-14','2022-04-20','Kolkata','West Bengal'),

('Vikash Gupta','vikash@gmail.com','Male','1995-09-09','2022-05-11','Pune','Maharashtra'),

('Neha Verma','neha@gmail.com','Female','1997-12-01','2022-05-25','Jaipur','Rajasthan'),

('Amit Mishra','amit@gmail.com','Male','1994-03-15','2022-06-10','Lucknow','Uttar Pradesh'),

('Pooja Nair','pooja@gmail.com','Female','1999-07-18','2022-06-21','Kochi','Kerala'),

('Karan Mehta','karan@gmail.com','Male','1996-05-09','2022-07-12','Surat','Gujarat'),

('Isha Kapoor','isha@gmail.com','Female','1998-10-28','2022-08-01','Chandigarh','Chandigarh'),

('Arjun Reddy','arjun@gmail.com','Male','1997-01-11','2022-08-15','Hyderabad','Telangana'),

('Meera Joshi','meera@gmail.com','Female','1995-04-22','2022-09-03','Nagpur','Maharashtra'),

('Sahil Khan','sahil@gmail.com','Male','1999-06-05','2022-09-18','Bhopal','Madhya Pradesh'),

('Kavya Rao','kavya@gmail.com','Female','2000-09-14','2022-10-01','Chennai','Tamil Nadu'),

('Manish Yadav','manish@gmail.com','Male','1996-12-22','2022-10-15','Patna','Bihar'),

('Riya Das','riya@gmail.com','Female','1998-03-19','2022-11-04','Cuttack','Odisha'),

('Aditya Bose','aditya@gmail.com','Male','1995-08-07','2022-11-20','Kolkata','West Bengal'),

('Nisha Jain','nisha@gmail.com','Female','1997-02-28','2022-12-01','Indore','Madhya Pradesh');


/* ============================================================
   5. INSERT PRODUCTS
   ============================================================ */

INSERT INTO products
(product_name, category_id, brand, cost_price, selling_price, stock_quantity)
VALUES

('Laptop Pro 15',1,'TechBrand',55000,70000,25),

('Smartphone X',1,'MobileTech',18000,25000,50),

('Wireless Headphones',1,'SoundMax',2500,3999,100),

('Smart Watch',1,'FitTech',3000,4999,75),

('Men T-Shirt',2,'UrbanWear',500,999,200),

('Women Dress',2,'FashionHub',1200,2499,150),

('Running Shoes',5,'SportX',1800,3499,100),

('Cricket Bat',5,'SportX',2500,4999,60),

('Blender',3,'HomePro',1800,2999,70),

('Air Fryer',3,'KitchenPro',3500,5999,45),

('Python Programming',4,'TechBooks',500,899,120),

('Machine Learning Book',4,'TechBooks',700,1299,100),

('Face Cream',6,'BeautyCare',300,699,200),

('Shampoo',6,'BeautyCare',250,599,180),

('Organic Rice 5kg',7,'NatureFoods',400,650,250);


/* ============================================================
   6. INSERT PAYMENTS
   ============================================================ */

INSERT INTO payments
(payment_method, payment_status, payment_date)
VALUES

('UPI','Completed','2024-01-05'),
('Credit Card','Completed','2024-01-10'),
('Debit Card','Completed','2024-01-15'),
('UPI','Completed','2024-02-05'),
('Cash on Delivery','Completed','2024-02-10'),
('UPI','Completed','2024-02-15'),
('Credit Card','Completed','2024-03-05'),
('UPI','Completed','2024-03-12'),
('Debit Card','Completed','2024-03-18'),
('UPI','Completed','2024-04-05'),
('Credit Card','Completed','2024-04-12'),
('UPI','Completed','2024-04-20'),
('Debit Card','Completed','2024-05-02'),
('UPI','Completed','2024-05-10'),
('Credit Card','Completed','2024-05-18'),
('UPI','Completed','2024-06-03'),
('UPI','Completed','2024-06-15'),
('Debit Card','Completed','2024-07-05'),
('Credit Card','Completed','2024-07-18'),
('UPI','Completed','2024-08-01'),
('UPI','Completed','2024-08-12'),
('Credit Card','Completed','2024-08-20'),
('UPI','Completed','2024-09-05'),
('Debit Card','Completed','2024-09-15'),
('UPI','Completed','2024-10-01'),
('Credit Card','Completed','2024-10-10'),
('UPI','Completed','2024-10-20'),
('Debit Card','Completed','2024-11-05'),
('UPI','Completed','2024-11-15'),
('Credit Card','Completed','2024-12-01');


/* ============================================================
   7. INSERT ORDERS
   ============================================================ */

INSERT INTO orders
(customer_id, order_date, order_status, payment_id, shipping_city, shipping_state)
VALUES

(1,'2024-01-05','Completed',1,'Mumbai','Maharashtra'),
(2,'2024-01-10','Completed',2,'Delhi','Delhi'),
(3,'2024-01-15','Completed',3,'Bengaluru','Karnataka'),

(4,'2024-02-05','Completed',4,'Ahmedabad','Gujarat'),
(5,'2024-02-10','Completed',5,'Bhubaneswar','Odisha'),
(6,'2024-02-15','Completed',6,'Kolkata','West Bengal'),

(7,'2024-03-05','Completed',7,'Pune','Maharashtra'),
(8,'2024-03-12','Completed',8,'Jaipur','Rajasthan'),
(9,'2024-03-18','Completed',9,'Lucknow','Uttar Pradesh'),

(10,'2024-04-05','Completed',10,'Kochi','Kerala'),
(11,'2024-04-12','Completed',11,'Surat','Gujarat'),
(12,'2024-04-20','Completed',12,'Chandigarh','Chandigarh'),

(13,'2024-05-02','Completed',13,'Hyderabad','Telangana'),
(14,'2024-05-10','Completed',14,'Nagpur','Maharashtra'),
(15,'2024-05-18','Completed',15,'Bhopal','Madhya Pradesh'),

(16,'2024-06-03','Completed',16,'Chennai','Tamil Nadu'),
(17,'2024-06-15','Completed',17,'Patna','Bihar'),

(18,'2024-07-05','Completed',18,'Cuttack','Odisha'),
(19,'2024-07-18','Completed',19,'Kolkata','West Bengal'),

(20,'2024-08-01','Completed',20,'Indore','Madhya Pradesh'),

(1,'2024-08-12','Completed',21,'Mumbai','Maharashtra'),
(2,'2024-08-20','Completed',22,'Delhi','Delhi'),

(3,'2024-09-05','Completed',23,'Bengaluru','Karnataka'),
(4,'2024-09-15','Completed',24,'Ahmedabad','Gujarat'),

(5,'2024-10-01','Completed',25,'Bhubaneswar','Odisha'),
(6,'2024-10-10','Completed',26,'Kolkata','West Bengal'),
(7,'2024-10-20','Completed',27,'Pune','Maharashtra'),

(8,'2024-11-05','Completed',28,'Jaipur','Rajasthan'),
(9,'2024-11-15','Completed',29,'Lucknow','Uttar Pradesh'),

(10,'2024-12-01','Completed',30,'Kochi','Kerala');


/* ============================================================
   8. INSERT ORDER ITEMS
   ============================================================ */

INSERT INTO order_items
(order_id, product_id, quantity, unit_price, discount)
VALUES

(1,1,1,70000,0.05),
(1,3,2,3999,0.10),

(2,2,1,25000,0.05),
(2,5,2,999,0.10),

(3,4,1,4999,0.05),
(3,7,1,3499,0.10),

(4,10,1,5999,0.05),
(4,13,2,699,0.10),

(5,8,1,4999,0.05),
(5,15,2,650,0.05),

(6,6,1,2499,0.10),
(6,11,2,899,0.05),

(7,1,1,70000,0.08),
(7,12,1,1299,0.05),

(8,7,2,3499,0.10),
(8,14,2,599,0.05),

(9,2,1,25000,0.05),
(9,3,1,3999,0.10),

(10,9,1,2999,0.05),
(10,13,2,699,0.10),

(11,5,3,999,0.10),
(11,6,1,2499,0.05),

(12,4,1,4999,0.05),
(12,3,1,3999,0.10),

(13,1,1,70000,0.05),
(13,2,1,25000,0.05),

(14,10,1,5999,0.05),
(14,9,1,2999,0.05),

(15,8,1,4999,0.10),
(15,7,1,3499,0.05),

(16,11,3,899,0.05),
(16,12,1,1299,0.05),

(17,15,5,650,0.05),
(17,14,2,599,0.05),

(18,6,1,2499,0.10),
(18,5,2,999,0.05),

(19,2,1,25000,0.05),
(19,4,1,4999,0.10),

(20,13,3,699,0.05),
(20,14,2,599,0.05),

(21,1,1,70000,0.05),
(21,3,1,3999,0.10),

(22,2,2,25000,0.05),
(22,5,2,999,0.10),

(23,4,1,4999,0.05),
(23,7,1,3499,0.05),

(24,10,1,5999,0.05),
(24,13,2,699,0.05),

(25,8,1,4999,0.05),
(25,15,3,650,0.05),

(26,6,2,2499,0.10),
(26,11,1,899,0.05),

(27,1,1,70000,0.10),
(27,12,2,1299,0.05),

(28,7,1,3499,0.05),
(28,14,2,599,0.05),

(29,2,1,25000,0.05),
(29,3,2,3999,0.10),

(30,9,1,2999,0.05),
(30,13,2,699,0.05);


/* ============================================================
   9. INSERT CUSTOMER ADDRESSES
   ============================================================ */

INSERT INTO customer_addresses
(customer_id, city, state, pincode, address_type)
VALUES

(1,'Mumbai','Maharashtra','400001','Home'),
(2,'Delhi','Delhi','110001','Home'),
(3,'Bengaluru','Karnataka','560001','Home'),
(4,'Ahmedabad','Gujarat','380001','Home'),
(5,'Bhubaneswar','Odisha','751001','Home'),
(6,'Kolkata','West Bengal','700001','Home'),
(7,'Pune','Maharashtra','411001','Home'),
(8,'Jaipur','Rajasthan','302001','Home'),
(9,'Lucknow','Uttar Pradesh','226001','Home'),
(10,'Kochi','Kerala','682001','Home'),
(11,'Surat','Gujarat','395001','Home'),
(12,'Chandigarh','Chandigarh','160001','Home'),
(13,'Hyderabad','Telangana','500001','Home'),
(14,'Nagpur','Maharashtra','440001','Home'),
(15,'Bhopal','Madhya Pradesh','462001','Home'),
(16,'Chennai','Tamil Nadu','600001','Home'),
(17,'Patna','Bihar','800001','Home'),
(18,'Cuttack','Odisha','753001','Home'),
(19,'Kolkata','West Bengal','700002','Home'),
(20,'Indore','Madhya Pradesh','452001','Home');


/* ============================================================
   10. BASIC DATA CHECK
   ============================================================ */

SELECT * FROM customers;

SELECT * FROM products;

SELECT * FROM orders;

SELECT * FROM order_items;


/* ============================================================
   11. TOTAL CUSTOMERS
   ============================================================ */

SELECT COUNT(*) AS total_customers
FROM customers;


/* ============================================================
   12. TOTAL ORDERS
   ============================================================ */

SELECT COUNT(*) AS total_orders
FROM orders;


/* ============================================================
   13. TOTAL REVENUE
   ============================================================ */

SELECT
    ROUND(
        SUM(quantity * unit_price * (1 - discount)),
        2
    ) AS total_revenue
FROM order_items oi
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Completed';


/* ============================================================
   14. TOTAL PROFIT
   ============================================================ */

SELECT
    ROUND(
        SUM(
            quantity *
            (
                unit_price * (1 - discount)
                - p.cost_price
            )
        ),
        2
    ) AS total_profit
FROM order_items oi
JOIN orders o
    ON oi.order_id = o.order_id
JOIN products p
    ON oi.product_id = p.product_id
WHERE o.order_status = 'Completed';


/* ============================================================
   15. PROFIT MARGIN
   ============================================================ */

SELECT
    ROUND(
        (
            SUM(
                quantity *
                (
                    unit_price * (1 - discount)
                    - p.cost_price
                )
            )
            /
            SUM(
                quantity *
                unit_price *
                (1 - discount)
            )
        ) * 100,
        2
    ) AS profit_margin_percentage
FROM order_items oi
JOIN orders o
    ON oi.order_id = o.order_id
JOIN products p
    ON oi.product_id = p.product_id
WHERE o.order_status = 'Completed';


/* ============================================================
   16. AVERAGE ORDER VALUE
   ============================================================ */

SELECT
    ROUND(
        SUM(oi.quantity * oi.unit_price * (1 - oi.discount))
        / COUNT(DISTINCT o.order_id),
        2
    ) AS average_order_value
FROM order_items oi
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Completed';


/* ============================================================
   17. MONTHLY REVENUE
   ============================================================ */

SELECT
    DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    ROUND(
        SUM(
            oi.quantity *
            oi.unit_price *
            (1 - oi.discount)
        ),
        2
    ) AS revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Completed'
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY month;


/* ============================================================
   18. CATEGORY REVENUE
   ============================================================ */

SELECT
    c.category_name,
    ROUND(
        SUM(
            oi.quantity *
            oi.unit_price *
            (1 - oi.discount)
        ),
        2
    ) AS revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
JOIN categories c
    ON p.category_id = c.category_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Completed'
GROUP BY c.category_name
ORDER BY revenue DESC;


/* ============================================================
   19. PRODUCT PERFORMANCE
   ============================================================ */

SELECT
    p.product_name,
    SUM(oi.quantity) AS units_sold,
    ROUND(
        SUM(
            oi.quantity *
            oi.unit_price *
            (1 - oi.discount)
        ),
        2
    ) AS revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Completed'
GROUP BY p.product_id, p.product_name
ORDER BY revenue DESC;


/* ============================================================
   20. TOP 10 CUSTOMERS
   ============================================================ */

SELECT
    c.customer_id,
    c.customer_name,
    ROUND(
        SUM(
            oi.quantity *
            oi.unit_price *
            (1 - oi.discount)
        ),
        2
    ) AS total_spending
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Completed'
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spending DESC
LIMIT 10;


/* ============================================================
   21. CUSTOMER ORDER FREQUENCY
   ============================================================ */

SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_orders DESC;


/* ============================================================
   22. REPEAT CUSTOMERS
   ============================================================ */

SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS order_count
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) > 1
ORDER BY order_count DESC;


/* ============================================================
   23. ONE-TIME CUSTOMERS
   ============================================================ */

SELECT
    c.customer_id,
    c.customer_name
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) = 1;


/* ============================================================
   24. TOP 3 PRODUCTS PER CATEGORY
   WINDOW FUNCTION
   ============================================================ */

WITH product_sales AS (

    SELECT
        p.product_id,
        p.product_name,
        c.category_name,

        SUM(
            oi.quantity *
            oi.unit_price *
            (1 - oi.discount)
        ) AS revenue

    FROM order_items oi

    JOIN products p
        ON oi.product_id = p.product_id

    JOIN categories c
        ON p.category_id = c.category_id

    JOIN orders o
        ON oi.order_id = o.order_id

    WHERE o.order_status = 'Completed'

    GROUP BY
        p.product_id,
        p.product_name,
        c.category_name
),

ranked_products AS (

    SELECT
        *,
        DENSE_RANK() OVER (
            PARTITION BY category_name
            ORDER BY revenue DESC
        ) AS category_rank

    FROM product_sales
)

SELECT *
FROM ranked_products
WHERE category_rank <= 3
ORDER BY category_name, category_rank;


/* ============================================================
   25. CUSTOMER RANKING
   ============================================================ */

WITH customer_revenue AS (

    SELECT
        c.customer_id,
        c.customer_name,

        SUM(
            oi.quantity *
            oi.unit_price *
            (1 - oi.discount)
        ) AS revenue

    FROM customers c

    JOIN orders o
        ON c.customer_id = o.customer_id

    JOIN order_items oi
        ON o.order_id = oi.order_id

    WHERE o.order_status = 'Completed'

    GROUP BY
        c.customer_id,
        c.customer_name
)

SELECT
    *,
    DENSE_RANK() OVER (
        ORDER BY revenue DESC
    ) AS customer_rank
FROM customer_revenue
ORDER BY customer_rank;


/* ============================================================
   26. MONTH-OVER-MONTH REVENUE
   ============================================================ */

WITH monthly_sales AS (

    SELECT
        DATE_FORMAT(o.order_date, '%Y-%m') AS month,

        SUM(
            oi.quantity *
            oi.unit_price *
            (1 - oi.discount)
        ) AS revenue

    FROM orders o

    JOIN order_items oi
        ON o.order_id = oi.order_id

    WHERE o.order_status = 'Completed'

    GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
),

previous_month AS (

    SELECT
        month,
        revenue,

        LAG(revenue) OVER (
            ORDER BY month
        ) AS previous_revenue

    FROM monthly_sales
)

SELECT
    month,
    ROUND(revenue,2) AS revenue,
    ROUND(previous_revenue,2) AS previous_revenue,

    ROUND(
        (
            (revenue - previous_revenue)
            /
            NULLIF(previous_revenue,0)
        ) * 100,
        2
    ) AS growth_percentage

FROM previous_month
ORDER BY month;


/* ============================================================
   27. RUNNING REVENUE
   ============================================================ */

WITH monthly_sales AS (

    SELECT
        DATE_FORMAT(o.order_date, '%Y-%m') AS month,

        SUM(
            oi.quantity *
            oi.unit_price *
            (1 - oi.discount)
        ) AS revenue

    FROM orders o

    JOIN order_items oi
        ON o.order_id = oi.order_id

    WHERE o.order_status = 'Completed'

    GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
)

SELECT
    month,
    ROUND(revenue,2) AS monthly_revenue,

    ROUND(
        SUM(revenue) OVER (
            ORDER BY month
        ),
        2
    ) AS running_revenue

FROM monthly_sales;


/* ============================================================
   28. THREE-MONTH MOVING AVERAGE
   ============================================================ */

WITH monthly_sales AS (

    SELECT
        DATE_FORMAT(o.order_date, '%Y-%m') AS month,

        SUM(
            oi.quantity *
            oi.unit_price *
            (1 - oi.discount)
        ) AS revenue

    FROM orders o

    JOIN order_items oi
        ON o.order_id = oi.order_id

    WHERE o.order_status = 'Completed'

    GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
)

SELECT
    month,
    ROUND(revenue,2) AS revenue,

    ROUND(
        AVG(revenue) OVER (
            ORDER BY month
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ),
        2
    ) AS moving_average_3_month

FROM monthly_sales;


/* ============================================================
   29. CUSTOMER LIFETIME VALUE
   ============================================================ */

SELECT
    c.customer_id,
    c.customer_name,

    COUNT(DISTINCT o.order_id) AS total_orders,

    ROUND(
        SUM(
            oi.quantity *
            oi.unit_price *
            (1 - oi.discount)
        ),
        2
    ) AS lifetime_value

FROM customers c

JOIN orders o
    ON c.customer_id = o.customer_id

JOIN order_items oi
    ON o.order_id = oi.order_id

WHERE o.order_status = 'Completed'

GROUP BY
    c.customer_id,
    c.customer_name

ORDER BY lifetime_value DESC;


/* ============================================================
   30. CUSTOMER SEGMENTATION
   ============================================================ */

WITH customer_metrics AS (

    SELECT
        c.customer_id,
        c.customer_name,

        COUNT(DISTINCT o.order_id) AS total_orders,

        SUM(
            oi.quantity *
            oi.unit_price *
            (1 - oi.discount)
        ) AS total_spending

    FROM customers c

    LEFT JOIN orders o
        ON c.customer_id = o.customer_id

    LEFT JOIN order_items oi
        ON o.order_id = oi.order_id

    GROUP BY
        c.customer_id,
        c.customer_name
)

SELECT
    customer_id,
    customer_name,
    total_orders,
    ROUND(total_spending,2) AS total_spending,

    CASE

        WHEN total_spending >= 70000
            THEN 'VIP'

        WHEN total_spending >= 30000
            THEN 'High Value'

        WHEN total_spending >= 10000
            THEN 'Medium Value'

        WHEN total_spending > 0
            THEN 'Low Value'

        ELSE 'Inactive'

    END AS customer_segment

FROM customer_metrics

ORDER BY total_spending DESC;


/* ============================================================
   31. HIGH-VALUE CUSTOMERS ABOVE AVERAGE
   ============================================================ */

WITH customer_spending AS (

    SELECT
        c.customer_id,
        c.customer_name,

        SUM(
            oi.quantity *
            oi.unit_price *
            (1 - oi.discount)
        ) AS spending

    FROM customers c

    JOIN orders o
        ON c.customer_id = o.customer_id

    JOIN order_items oi
        ON o.order_id = oi.order_id

    GROUP BY
        c.customer_id,
        c.customer_name
)

SELECT *
FROM customer_spending
WHERE spending >
(
    SELECT AVG(spending)
    FROM customer_spending
)
ORDER BY spending DESC;


/* ============================================================
   32. PRODUCTS NEVER PURCHASED
   ============================================================ */

SELECT
    p.product_id,
    p.product_name

FROM products p

LEFT JOIN order_items oi
    ON p.product_id = oi.product_id

WHERE oi.product_id IS NULL;


/* ============================================================
   33. PAYMENT METHOD ANALYSIS
   ============================================================ */

SELECT
    p.payment_method,
    COUNT(o.order_id) AS total_orders

FROM payments p

JOIN orders o
    ON p.payment_id = o.payment_id

GROUP BY p.payment_method

ORDER BY total_orders DESC;


/* ============================================================
   34. CITY-WISE REVENUE
   ============================================================ */

SELECT
    o.shipping_city,

    ROUND(
        SUM(
            oi.quantity *
            oi.unit_price *
            (1 - oi.discount)
        ),
        2
    ) AS revenue

FROM orders o

JOIN order_items oi
    ON o.order_id = oi.order_id

WHERE o.order_status = 'Completed'

GROUP BY o.shipping_city

ORDER BY revenue DESC;


/* ============================================================
   35. STATE-WISE PROFIT
   ============================================================ */

SELECT
    o.shipping_state,

    ROUND(
        SUM(
            oi.quantity *
            (
                oi.unit_price *
                (1 - oi.discount)
                -
                p.cost_price
            )
        ),
        2
    ) AS profit

FROM orders o

JOIN order_items oi
    ON o.order_id = oi.order_id

JOIN products p
    ON oi.product_id = p.product_id

WHERE o.order_status = 'Completed'

GROUP BY o.shipping_state

ORDER BY profit DESC;


/* ============================================================
   36. PRODUCT PROFITABILITY
   ============================================================ */

SELECT
    p.product_name,

    ROUND(
        SUM(
            oi.quantity *
            oi.unit_price *
            (1 - oi.discount)
        ),
        2
    ) AS revenue,

    ROUND(
        SUM(
            oi.quantity *
            (
                oi.unit_price *
                (1 - oi.discount)
                -
                p.cost_price
            )
        ),
        2
    ) AS profit

FROM products p

JOIN order_items oi
    ON p.product_id = oi.product_id

JOIN orders o
    ON oi.order_id = o.order_id

WHERE o.order_status = 'Completed'

GROUP BY p.product_id, p.product_name

ORDER BY profit DESC;


/* ============================================================
   37. HIGH REVENUE BUT LOW PROFIT PRODUCTS
   ============================================================ */

WITH product_profit AS (

    SELECT
        p.product_id,
        p.product_name,

        SUM(
            oi.quantity *
            oi.unit_price *
            (1 - oi.discount)
        ) AS revenue,

        SUM(
            oi.quantity *
            (
                oi.unit_price *
                (1 - oi.discount)
                -
                p.cost_price
            )
        ) AS profit

    FROM products p

    JOIN order_items oi
        ON p.product_id = oi.product_id

    JOIN orders o
        ON oi.order_id = o.order_id

    WHERE o.order_status = 'Completed'

    GROUP BY
        p.product_id,
        p.product_name
)

SELECT *
FROM product_profit
WHERE revenue >
(
    SELECT AVG(revenue)
    FROM product_profit
)

AND profit <
(
    SELECT AVG(profit)
    FROM product_profit
)

ORDER BY revenue DESC;


/* ============================================================
   38. CUSTOMER FIRST AND LAST ORDER
   ============================================================ */

SELECT
    c.customer_id,
    c.customer_name,

    MIN(o.order_date) AS first_order_date,

    MAX(o.order_date) AS latest_order_date,

    COUNT(o.order_id) AS total_orders

FROM customers c

LEFT JOIN orders o
    ON c.customer_id = o.customer_id

GROUP BY
    c.customer_id,
    c.customer_name

ORDER BY latest_order_date;


/* ============================================================
   39. CUSTOMER ORDER VALUE COMPARISON
   ============================================================ */

WITH order_values AS (

    SELECT
        o.order_id,
        o.customer_id,
        o.order_date,

        SUM(
            oi.quantity *
            oi.unit_price *
            (1 - oi.discount)
        ) AS order_value

    FROM orders o

    JOIN order_items oi
        ON o.order_id = oi.order_id

    WHERE o.order_status = 'Completed'

    GROUP BY
        o.order_id,
        o.customer_id,
        o.order_date
),

order_comparison AS (

    SELECT
        *,
        LAG(order_value) OVER (
            PARTITION BY customer_id
            ORDER BY order_date
        ) AS previous_order_value

    FROM order_values
)

SELECT
    customer_id,
    order_id,
    order_date,
    ROUND(order_value,2) AS current_order_value,
    ROUND(previous_order_value,2) AS previous_order_value,

    ROUND(
        order_value - previous_order_value,
        2
    ) AS difference

FROM order_comparison

WHERE previous_order_value IS NOT NULL

ORDER BY difference DESC;


/* ============================================================
   40. CUSTOMER CATEGORY DIVERSITY
   ============================================================ */

SELECT
    c.customer_id,
    c.customer_name,

    COUNT(
        DISTINCT p.category_id
    ) AS categories_purchased

FROM customers c

JOIN orders o
    ON c.customer_id = o.customer_id

JOIN order_items oi
    ON o.order_id = oi.order_id

JOIN products p
    ON oi.product_id = p.product_id

WHERE o.order_status = 'Completed'

GROUP BY
    c.customer_id,
    c.customer_name

ORDER BY categories_purchased DESC;


/* ============================================================
   41. LOW STOCK PRODUCTS
   ============================================================ */

SELECT
    product_id,
    product_name,
    stock_quantity

FROM products

WHERE stock_quantity < 50

ORDER BY stock_quantity;


/* ============================================================
   42. CANCELLATION RATE
   ============================================================ */

SELECT

    COUNT(
        CASE
            WHEN order_status = 'Cancelled'
            THEN 1
        END
    ) AS cancelled_orders,

    COUNT(*) AS total_orders,

    ROUND(
        COUNT(
            CASE
                WHEN order_status = 'Cancelled'
                THEN 1
            END
        ) / COUNT(*) * 100,
        2
    ) AS cancellation_rate

FROM orders;


/* ============================================================
   43. RFM-STYLE CUSTOMER ANALYSIS
   ============================================================ */

WITH customer_rfm AS (

    SELECT

        c.customer_id,
        c.customer_name,

        DATEDIFF(
            '2025-01-01',
            MAX(o.order_date)
        ) AS recency_days,

        COUNT(
            DISTINCT o.order_id
        ) AS frequency,

        SUM(
            oi.quantity *
            oi.unit_price *
            (1 - oi.discount)
        ) AS monetary

    FROM customers c

    JOIN orders o
        ON c.customer_id = o.customer_id

    JOIN order_items oi
        ON o.order_id = oi.order_id

    WHERE o.order_status = 'Completed'

    GROUP BY
        c.customer_id,
        c.customer_name
)

SELECT

    customer_id,
    customer_name,
    recency_days,
    frequency,
    ROUND(monetary,2) AS monetary,

    CASE
        WHEN recency_days <= 60
             AND frequency >= 3
             AND monetary >= 30000
            THEN 'Champions'

        WHEN recency_days <= 120
             AND frequency >= 2
            THEN 'Loyal Customers'

        WHEN recency_days > 180
            THEN 'At Risk'

        ELSE 'Regular Customers'

    END AS customer_segment

FROM customer_rfm

ORDER BY monetary DESC;


/* ============================================================
   44. FINAL BUSINESS KPI REPORT
   ============================================================ */

SELECT

    COUNT(DISTINCT o.customer_id)
        AS total_customers,

    COUNT(DISTINCT o.order_id)
        AS total_orders,

    ROUND(
        SUM(
            oi.quantity *
            oi.unit_price *
            (1 - oi.discount)
        ),
        2
    ) AS total_revenue,

    ROUND(
        SUM(
            oi.quantity *
            (
                oi.unit_price *
                (1 - oi.discount)
                -
                p.cost_price
            )
        ),
        2
    ) AS total_profit,

    ROUND(
        SUM(
            oi.quantity *
            oi.unit_price *
            (1 - oi.discount)
        )
        /
        COUNT(DISTINCT o.order_id),
        2
    ) AS average_order_value

FROM orders o

JOIN order_items oi
    ON o.order_id = oi.order_id

JOIN products p
    ON oi.product_id = p.product_id

WHERE o.order_status = 'Completed';


/* ============================================================
   END OF PROJECT
   ============================================================ */