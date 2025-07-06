USE ecommerce;

-- 1. INNER JOIN: Get orders with customer details
SELECT o.order_id, o.order_date, c.name, c.email
FROM OrderTable o
INNER JOIN Customer c ON o.customer_id = c.customer_id;

-- 2. LEFT JOIN: Show all customers and their orders (if any)
SELECT c.customer_id, c.name, o.order_id, o.status
FROM Customer c
LEFT JOIN OrderTable o ON c.customer_id = o.customer_id;

-- 3. RIGHT JOIN (only works in MySQL, not in SQLite): Show all orders with their customers
SELECT o.order_id, o.status, c.name
FROM Customer c
RIGHT JOIN OrderTable o ON c.customer_id = o.customer_id;

-- 4. FULL JOIN (simulate using UNION of LEFT and RIGHT JOIN in MySQL)
SELECT c.customer_id, c.name, o.order_id, o.status
FROM Customer c
LEFT JOIN OrderTable o ON c.customer_id = o.customer_id
UNION
SELECT c.customer_id, c.name, o.order_id, o.status
FROM Customer c
RIGHT JOIN OrderTable o ON c.customer_id = o.customer_id;

-- 5. Join 3 tables: Orders, Order_Item, Product
SELECT o.order_id, p.product_name, oi.quantity
FROM OrderTable o
JOIN Order_Item oi ON o.order_id = oi.order_id
JOIN Product p ON oi.product_id = p.product_id;

-- 6. LEFT JOIN: Products and their categories (show products even if category is NULL)
SELECT p.product_id, p.product_name, c.category_name
FROM Product p
LEFT JOIN Category c ON p.category_id = c.category_id;

-- 7. INNER JOIN with WHERE: Paid orders
SELECT o.order_id, c.name, p.amount
FROM OrderTable o
JOIN Customer c ON o.customer_id = c.customer_id
JOIN Payment p ON o.order_id = p.order_id
WHERE o.status = 'Shipped';
