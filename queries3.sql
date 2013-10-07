----------------------
-- Queries 3 Homework
--
-- William Cain
-- 10/5/13
----------------------

-- Question 1 --
SELECT city
FROM agents a
WHERE aid in
	(SELECT aid
	FROM order
	WHERE cid = 'c002');

-- Question 2 --
SELECT city
FROM agents a, orders o
WHERE a.aid = o.aid
AND cid = 'c002';

-- Question 3 --
SELECT o.pid
FROM orders o
WHERE o.aid IN
	(SELECT o.aid
	FROM orders o
	WHERE cid in 
		(SELECT cid
		FROM customers
		WHERE city = 'Kyoto'));

-- Question 4 --
SELECT o2.pid
FROM orders o1, orders o2, customers c
WHERE o1.aid = o2.aid
AND o2.cid = c.cid
AND c.city = 'Kyoto';

-- Question 5 --
SELECT name
FROM customers c
WHERE cid NOT IN
	(SELECT cid
	FROM orders);

-- Question 6 --
SELECT c.name
FROM customers c LEFT OUTER JOIN orders o
on c.cid = o.cid 
WHERE o.cid IS NULL;

-- Question 7 --
SELECT distinct c.name, a.name
FROM customers c, agents a, orders o
WHERE c.cid = o.cid
AND o.aid = a.aid
AND c.city = a.city;

-- Question 8 --
SELECT c.name, a.name
FROM customers c, agents a
WHERE c.city = a.city;

-- Question 9 --
SELECT c.name, c.city
FROM customers c
WHERE c.city in
	(SELECT city
	FROM products
	GROUP BY city
	ORDER BY COUNT(city) asc
	limit 1);

-- Question 10 --
SELECT name, city
FROM customers c
WHERE city in
	(SELECT city
	FROM products
	GROUP BY city
	ORDER BY COUNT(city) desc
	limit 1);

-- Question 11 --
SELECT name, city
FROM customers c
WHERE city in
	(SELECT city
	FROM products
	GROUP BY city
	HAVING COUNT(city) in
		(SELECT COUNT(city)
		FROM products
		GROUP BY city
		ORDER BY COUNT(city) desc
		LIMIT 1));

-- Question 12 --
SELECT p1.name
FROM products p1, products p2
GROUP BY p1.name, p1.priceUSD
HAVING p1.priceUSD > avg(p2.priceUSD);

-- Question 13 --
SELECT c.name, o.pid, o.dollars
FROM customers c, orders o
WHERE c.cid = o.cid
ORDER BY dollars desc;

-- Question 14 --
SELECT c.name, COALESCE(SUM(o.dollars),0) AS total
FROM customers c LEFT OUTER JOIN orders o on c.cid = o.cid
GROUP BY c.cid
ORDER BY total desc;

-- Question 15 --
SELECT c.name, p.name, a.name
FROM customers c, agents a, orders o, products p
WHERE c.cid = o.cid
AND o.aid = a.aid
AND o.pid = p.pid
AND a.city = 'New York';

-- Question 16 --
SELECT o.ordno, dollars, (o.qty * p.priceUSD * ((100 - c.discount) * .01)) AS real_dollars
FROM customers c, products p, orders o
WHERE o.cid = c.cid
AND o.pid = p.pid
AND (o.qty * p.priceUSD * ((100 - c.discount) * .01))  <> o.dollars;

-- Question 17 --
UPDATE orders c
SET dollars = 470
WHERE ordno = 1011;