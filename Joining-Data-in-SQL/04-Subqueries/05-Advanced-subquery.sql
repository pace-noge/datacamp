/*


Advanced subquery
You can also nest multiple subqueries to answer even more specific questions.

In this exercise, for each of the six continents listed in 2015, you'll identify which country had the maximum inflation rate (and how high it was) using multiple subqueries. The table result of your query in Task 3 should look something like the following, where anything between < > will be filled in with appropriate values:

+------------+---------------+-------------------+
| name       | continent     | inflation_rate    |
|------------+---------------+-------------------|
| <country1> | North America | <max_inflation1>  |
| <country2> | Africa        | <max_inflation2>  |
| <country3> | Oceania       | <max_inflation3>  |
| <country4> | Europe        | <max_inflation4>  |
| <country5> | South America | <max_inflation5>  |
| <country6> | Asia          | <max_inflation6>  |
+------------+---------------+-------------------+
Again, there are multiple ways to get to this solution using only joins, but the focus here is on showing you an introduction into advanced subqueries.

INSTRUCTION

1/3

Create an inner join with countries on the left and economies on the right with USING. Do not alias your tables or columns.
Retrieve the country name, continent, and inflation rate for 2015.

2/3

Determine the maximum inflation rate for each continent in 2015 using the previous query as a subquery called subquery in the FROM clause.
Select the maximum inflation rate AS max_inf grouped by continent.
This will result in the six maximum inflation rates in 2015 for the six continents as one field table. (Don't include continent in the outer SELECT statement.)

3/3

Append the second part's query to the first part's query using WHERE, AND, and IN to obtain the name of the country, its continent, and the maximum inflation rate for each continent in 2015. Revisit the sample output in the assignment text at the beginning of the exercise to see how this matches up.
For the sake of practice, change all joining conditions to use ON instead of USING.
This code works since each of the six maximum inflation rate values occur only once in the 2015 data. Think about whether this particular code involving subqueries would work in cases where there are ties for the maximum inflation rate values.

*/

-- 1/3

-- Select fields
SELECT c.name, c.continent, e.inflation_rate
  -- From countries
  FROM countries as c
  	-- Join to economies
  	JOIN economies as e 
    -- Match on code
    USING (code)
-- Where year is 2015
WHERE e.year = 2015;

-- 2/3

-- Select fields
SELECT max(inflation_rate) as max_inf
  -- Subquery using FROM (alias as subquery)
  FROM (
      SELECT name, continent, inflation_rate
      FROM countries
      INNER JOIN economies
      USING (code)
      Where year = 2015) AS subquery
-- Group by continent
GROUP BY continent;

-- 3/3

-- Select fields
SELECT name, continent, inflation_rate
  -- From countries
  FROM countries
	-- Join to economies
	JOIN economies
	-- Match on code
	ON countries.code = economies.code
  -- Where year is 2015
  WHERE economies.year = 2015
    -- And inflation rate in subquery (alias as subquery)
    AND inflation_rate IN (
        SELECT max(inflation_rate) as max_inf
        FROM (
             SELECT name, continent, inflation_rate
             FROM countries
             JOIN economies
             ON countries.code = economies.code
             WHERE economies.year = 2015) AS subquery
        GROUP BY continent);
