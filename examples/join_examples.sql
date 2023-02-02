-- Find customers who like to watch drama movies

SELECT DISTINCT
cust.customer_id, cust.first_name, cust.last_name
FROM customer cust
INNER JOIN rental ren ON cust.customer_id = ren.customer_id
INNER JOIN inventory inv ON ren.inventory_id = inv.inventory_id
INNER JOIN film fl ON inv.film_id = fl.film_id
INNER JOIN film_category fc ON fl.film_id = fc.film_id
INNER JOIN category cat ON fc.category_id = cat.category_id
WHERE cat.name = 'Drama'
ORDER BY cust.customer_id, cust.first_name, cust.last_name;


-- Find all the customer's payments which are over their average payment
SELECT pt.payment_id, cust.first_name, cust.last_name, pt.amount
FROM payment pt
INNER JOIN customer cust ON pt.customer_id = cust.customer_id
WHERE pt.amount > (SELECT AVG(pt1.amount)
                   FROM payment pt1
                   WHERE pt1.customer_id = pt.customer_id)
ORDER BY cust.customer_id;



SELECT cust.first_name,
       cust.last_name,
       COUNT(pt.payment_id) AS CountOfPayment
FROM payment pt
INNER JOIN customer cust ON pt.customer_id = cust.customer_id
WHERE pt.amount > (SELECT AVG(pt1.amount)
                   FROM payment pt1
                   WHERE pt1.customer_id = pt.customer_id)
GROUP BY cust.first_name, cust.last_name
ORDER BY CountOfPayment DESC;



SELECT cust.first_name, cust.last_name, AVG(pt.amount) AS AveragePayment
FROM payment pt
INNER JOIN customer cust ON pt.customer_id = cust.customer_id
GROUP BY cust.first_name, cust.last_name;


SELECT cat.name, COUNT(cat.name) AS CountOfCategory
FROM film fm
INNER JOIN film_category fc on fm.film_id = fc.film_id
INNER JOIN category cat ON fc.category_id = cat.category_id
GROUP BY cat.name;