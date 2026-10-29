-- Número de registros encontrados por cada consulta do exercício 1

-- 1) Filmes com suas categorias
SELECT COUNT(*) AS total_registros
FROM film f
JOIN film_category fc ON fc.film_id = f.film_id
JOIN category c ON c.category_id = fc.category_id;

-- 2) Atores com o número de filmes
SELECT COUNT(*) AS total_registros
FROM (
    SELECT a.actor_id
    FROM actor a
    LEFT JOIN film_actor fa ON fa.actor_id = a.actor_id
    GROUP BY a.actor_id
) AS atores;

-- 3) Atores que atuaram em filmes com mais de 120 minutos
SELECT COUNT(*) AS total_registros
FROM (
    SELECT a.actor_id
    FROM actor a
    JOIN film_actor fa ON fa.actor_id = a.actor_id
    JOIN film f ON f.film_id = fa.film_id
    WHERE f.length > 120
    GROUP BY a.actor_id
) AS atores_filmes_longos;
