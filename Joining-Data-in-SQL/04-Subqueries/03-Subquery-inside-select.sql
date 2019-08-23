/*

Subquery inside select
In this exercise, you'll see how some queries can be written using either a join or a subquery.

You have seen previously how to use GROUP BY with aggregate functions and an inner join to get summarized information from multiple tables.

The code given in query.sql selects the top nine countries in terms of number of cities appearing in the cities table. Recall that this corresponds to the most populous cities in the world. Your task will be to convert the commented out code to get the same result as the code shown.

INSTRUCTION
-----------



*/
-- 1/2

/*
SELECT countries.name AS country, COUNT(*) AS cities_num
  FROM cities
    INNER JOIN countries
    ON countries.code = cities.country_code
GROUP BY country
ORDER BY cities_num DESC, country
LIMIT 9;

*/


SELECT name AS country,
  (SELECT count(*)
   FROM cities
   WHERE countries.code = cities.country_code) AS cities_num
FROM countries
ORDER BY cities_num DESC, country
LIMIT 9;

-- SELECT countries.name AS country, COUNT(*) AS cities_num
--   FROM cities
--     INNER JOIN countries
--     ON countries.code = cities.country_code
-- GROUP BY country
-- ORDER BY cities_num DESC, country
-- LIMIT 9;


SELECT countries.name AS country,
  (SELECT COUNT(*)
   FROM cities
   WHERE countries.code = cities.country_code) AS cities_num
FROM countries
ORDER BY cities_num DESC, country
LIMIT 9;
