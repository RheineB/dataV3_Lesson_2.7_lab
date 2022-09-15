-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT c.name,  COUNT(c.category_id)
FROM sakila.film_category f
JOIN sakila.category c
ON f.category_id = c.category_id
GROUP BY c.name
ORDER BY  c.category_id;

-- 2. Display the total amount rung up by each staff member in August of 2005.
SELECT s.first_name, s.last_name, s.staff_id,  sum(amount)
FROM sakila.staff s
JOIN sakila.payment p
ON s.staff_id = p.staff_id
GROUP BY s.staff_id
ORDER BY  s.staff_id;

-- 3. Which actor has appeared in the most films?
SELECT a.first_name, a.last_name,  COUNT(f.film_id)
FROM sakila.film_actor f
JOIN sakila.actor a
ON f.actor_id = a.actor_id
GROUP BY a.first_name, a.last_name
ORDER BY  COUNT(f.film_id) ASC;

-- 4. Most active customer (the customer that has rented the most number of films).
SELECT c.first_name, c.last_name,  COUNT(r.rental_id)
FROM sakila.customer c
JOIN sakila.rental r
ON c.customer_id = r.customer_id
GROUP BY c.first_name, c.last_name
ORDER BY  COUNT(r.rental_id) DESC;

-- 5. Display the first and last names, as well as the address, of each staff member.
SELECT s.first_name, s.last_name, a.address
FROM sakila.address a
JOIN sakila.staff s
ON a.address_id = s.address_id
GROUP BY s.first_name, s.last_name;

-- 6. List each film and the number of actors who are listed for that film.
SELECT f.title,  COUNT(fa.actor_id)
FROM sakila.film f
JOIN sakila.film_actor fa
ON f.film_id = fa.film_id
GROUP BY f.title
ORDER BY  COUNT(fa.actor_id) DESC;

-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT c.first_name, c.last_name, sum(p.amount)
FROM sakila.customer c
JOIN sakila.payment p USING (customer_id)
GROUP BY c.first_name, c.last_name
ORDER BY  c.last_name;

SELECT * FROM sakila.payment;