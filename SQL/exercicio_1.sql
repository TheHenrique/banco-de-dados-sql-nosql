-- Banco usado: sakila (MySQL)

-- 1) Lista de filmes e suas categorias
SELECT f.title AS filme, c.name AS categoria
FROM film f
JOIN film_category fc ON fc.film_id = f.film_id
JOIN category c ON c.category_id = fc.category_id
ORDER BY f.title;

-- 2) Todos os atores com o número de filmes de cada um
SELECT a.actor_id, a.first_name, a.last_name, COUNT(fa.film_id) AS total_filmes
FROM actor a
LEFT JOIN film_actor fa ON fa.actor_id = a.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY total_filmes DESC;

-- 3) Atores que atuaram em filmes com mais de 2 horas
SELECT a.actor_id, a.first_name, a.last_name, COUNT(f.film_id) AS total_filmes
FROM actor a
JOIN film_actor fa ON fa.actor_id = a.actor_id
JOIN film f ON f.film_id = fa.film_id
WHERE f.length > 120
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY total_filmes DESC;
