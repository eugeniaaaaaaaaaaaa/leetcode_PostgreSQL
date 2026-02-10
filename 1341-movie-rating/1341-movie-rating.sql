-- Write your PostgreSQL query statement below
WITH greatest_ranker AS 
    (SELECT u.name AS name
    FROM MovieRating r
    LEFT JOIN Users u
    ON r.user_id = u.user_id
    GROUP BY name
    ORDER BY COUNT(*) DESC, name
    LIMIT 1),

    highest_rating_movie AS
    (SELECT m.title AS title
    FROM MovieRating r
    LEFT JOIN Movies m
    ON r.movie_id = m.movie_id
    WHERE created_at BETWEEN '2020-02-01'::DATE AND '2020-02-29'::DATE
    GROUP BY title
    ORDER BY AVG(r.rating) DESC, title
    LIMIT 1)

SELECT name AS results
FROM greatest_ranker
UNION ALL 
SELECT title AS results
FROM highest_rating_movie;