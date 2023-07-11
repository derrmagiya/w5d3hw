SELECT c.first_name, c.last_name
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id
WHERE co.country = 'United States'
  AND ci.city = 'Texas';
  
  
SELECT CONCAT(c.first_name, ' ', c.last_name) AS customer_name, p.amount
FROM payment p
JOIN customer c ON p.customer_id = c.customer_id
WHERE p.amount > 6.99;


SELECT CONCAT(first_name, ' ', last_name) AS customer_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    WHERE amount > 175
);


SELECT c.first_name, c.last_name
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id
WHERE co.country = 'Nepal';


SELECT s.staff_id, CONCAT(s.first_name, ' ', s.last_name) AS staff_name, COUNT(*) AS transaction_count
FROM staff s
JOIN payment p ON s.staff_id = p.staff_id
GROUP BY s.staff_id, staff_name
ORDER BY transaction_count DESC
LIMIT 1;


SELECT rating, COUNT(*) AS movie_count
FROM film
GROUP BY rating;


SELECT CONCAT(c.first_name, ' ', c.last_name) AS customer_name, p.amount
FROM customer c
JOIN (
    SELECT customer_id, amount
    FROM payment
    WHERE amount > 6.99
    GROUP BY customer_id
    HAVING COUNT(*) = 1
) p ON c.customer_id = p.customer_id;


SELECT COUNT(*) AS free_rental_count
FROM rental
WHERE rental_rate = 0;
