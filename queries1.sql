----------------------
-- Queries 1 Homework
--
-- William Cain
-- 9/13/13
----------------------

-- Question 1 --
SELECT * FROM customers;

-- Question 2 --
SELECT name, city FROM agents WHERE name = 'Smith';

-- Question 3 --
SELECT pid, name, quantity FROM products WHERE priceUSD > 1.25;

-- Question 4 --
SELECT ordno, aid FROM orders;

-- Question 5 --
SELECT name, city FROM customers WHERE city != 'Dallas';

-- Question 6 --
SELECT name FROM agents WHERE city = 'New York' 
                           OR city = 'Newark';

-- Question 7 --
SELECT * FROM products WHERE city != 'New York'
                         AND city != 'Newark' 
                         AND priceUSD <= 1;

-- Question 8 --
SELECT * FROM orders WHERE mon = 'jan'
                        OR mon = 'mar';

-- Question 9 --
SELECT * FROM orders WHERE mon = 'feb' 
                       AND dollars < 100;

-- Question 10 --
SELECT * FROM orders WHERE cid = 'c005';
