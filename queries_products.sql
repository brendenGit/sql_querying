-- Query for Q1 - insert chair into products --
INSERT INTO products (name, price, can_be_returned) VALUES ('chair', 44.00, false);

-- Query for Q2 - insert stool into products
INSERT INTO products (name, price, can_be_returned) VALUES ('stool', 25.99, true);

-- Query for Q3 - insert table into products--
INSERT INTO products (name, price, can_be_returned) VALUES ('table', 124.00, false);

-- Query for Q4 - display all rows and columns in products table --
SELECT * FROM products;

-- Query for Q5 - display all names of products -- 
SELECT name FROM products;

-- Query for Q6 - display names and prices of products -- 
SELECT name, price FROM products;

-- Query for Q7 - add a new product -- 
INSERT INTO products (name, price, can_be_returned) VALUES ('desk', 59.99, true);

-- Query for Q8 - display only products that can be returned -- 
SELECT * FROM products WHERE can_be_returned = true;

-- Query for Q9 - display only products that cost less than 44.00 -- 
SELECT * FROM products WHERE price < 44.00; 

-- Query for Q10 - display only products that cost between 22.50 and 99.99 -- 
SELECT * FROM products WHERE price BETWEEN 22.50 AND 99.99;

-- Query for Q11 - sale: update prices $20 less --
UPDATE products SET price = price - 20; 

-- Query for Q12 - remove all products under $25 --
DELETE FROM products WHERE price < 25;

-- Query for Q13 - sale is over update prices $20 more --
UPDATE products SET price = price + 20; 

-- Query for Q14 - update all products to be returnable --
UPDATE products SET can_be_returned = true;