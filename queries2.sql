----------------------
-- Queries 2 Homework
--
-- William Cain
-- 9/19/13
----------------------

-- Question 1 --
SELECT city
FROM agents a, orders o
WHERE a.aid = o.aid
AND cid = 'c002';

-- Question 2 --
SELECT o.pid
FROM orders o
WHERE o.aid IN
	(SELECT distinct o.aid
	FROM orders o, customers c
	WHERE o.cid = c.cid
	AND c.city = 'Kyoto');

-- Question 3 --
SELECT cid, name
FROM customers c
WHERE NOT EXISTS
	(SELECT *
	 FROM orders o
	 WHERE c.cid = o.cid
	 AND o.aid = 'a03')

SELECT cid
FROM customers
WHERE cid NOT IN
	(SELECT o.cid
	FROM orders o
	WHERE o.aid = 'a03')

-- Question 4 --
SELECT distinct c.cid, name
FROM customers c, orders o1
WHERE c.cid = o1.cid
AND o1.pid = 'p01'
AND EXISTS
	(SELECT o2.cid
	 FROM orders o2
	 WHERE o2.pid = 'p07'
	 AND o2.cid = o1.cid)

-- Question 5 --
SELECT o.pid
FROM orders o
WHERE o.cid IN 
	(SELECT o.cid
	FROM orders o
	WHERE o.aid = 'a03')

-- Question 6 --
SELECT distinct c.name, c.discount
FROM customers c, orders o, agents a
WHERE c.cid = o.cid
AND o.aid = a.aid
AND (a.city = 'Dallas'
OR a.city = 'Duluth')

-- Question 7 --
SELECT name
FROM customers
WHERE discount IN 
	(SELECT discount 
	FROM customers
	WHERE city = 'Dallas'
	OR city = 'Kyoto')
