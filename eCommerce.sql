-- USERS TABLE --------------------------------------------------------

CREATE TABLE users (
user_id SERIAL PRIMARY KEY, 
name TEXT, 
email TEXT
);

INSERT INTO users (name, email)
VALUES
('M', 'm@email.com'), ('J', 'j@email.com'), ('A', 'a@email.com');

-- PRODUCTS TABLE --------------------------------------------------------

CREATE TABLE products (
product_id SERIAL PRIMARY KEY, 
name TEXT, 
price INT
);

INSERT INTO products (name, price)
VALUES
('Shirt', '30'), ('Jeans', '69'), ('Shoes', '65');

-- ORDER TABLE --------------------------------------------------------

CREATE TABLE orders (
  order_id  SERIAL PRIMARY KEY, 
  user_id INT REFERENCES users(user_id), 
  product_id INT REFERENCES products(product_id)
); 

INSERT INTO orders (user_id, product_id)
VALUES 
(1, 2), -- m wants jeans 
(1, 3), -- m wants shoes 
(2, 1), -- j wants shirt
(3, 1), -- a wants shirt
(3, 2); -- a wants jeans 


------
-- Run queries against your data.
    -- Get all products for the first order.
    SELECT * FROM orders
    WHERE order_id IN (
        SELECT product_id 
        FROM products
        WHERE order_id = 1
    ); 


    -- Get all orders.
    SELECT * FROM orders;


    -- Get the total cost of an order ( sum the price of all products on an order ).
    SELECT SUM(p.price)
    FROM products p
    JOIN users u ON p.product_id = u.user_id; 


    -- Add a foreign key reference from orders to users.
    -- Update the orders table to link a user to each order.

