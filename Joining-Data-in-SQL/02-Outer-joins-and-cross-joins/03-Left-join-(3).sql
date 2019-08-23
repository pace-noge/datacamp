/*

Left join (3)
You'll now revisit the use of the AVG() function introduced in our Intro to SQL for Data Science course. You will use it in combination with left join to determine the average gross domestic product (GDP) per capita by region in 2010.

INSTRUCTION
-----------

1/3

Begin with a left join with the countries table on the left and the economies table on the right.
Focus only on records with 2010 as the year.

2/3

Modify your code to calculate the average GDP per capita AS avg_gdp for each region in 2010.
Select the region and avg_gdp fields.

3/3

Arrange this data on average GDP per capita for each region in 2010 from highest to lowest average GDP per capita.

*/

-- 1/3

-- 5. Select name, region, and gdp_percapita
SELECT c.name, c.region, e.gdp_percapita
-- 1. From countries (alias as c)
FROM countries AS c
  -- 2. Left join with economies (alias as e)
  LEFT JOIN economies AS e
    -- 3. Match on code fields
    ON c.code = e.code
-- 4. Focus on 2010
WHERE e.year = 2010;

-- 2/3

-- Select fields
SELECT c.region, AVG(gdp_percapita) AS avg_gdp
-- From countries (alias as c)
FROM countries AS c
  -- Left join with economies (alias as e)
  LEFT JOIN economies AS e
    -- Match on code fields
    ON c.code = e.code
-- Focus on 2010
WHERE e.year = 2010
-- Group by region
GROUP BY c.region;

-- 3/3
-- Select fields
SELECT region, AVG(gdp_percapita) AS avg_gdp
-- From countries (alias as c)
FROM countries AS c
  -- Left join with economies (alias as e)
LEFT JOIN economies AS e
    -- Match on code fields
ON c.code = e.code
-- Focus on 2010
WHERE e.year = 2010
-- Group by region
GROUP BY region
-- Order by descending avg_gdp
ORDER BY avg_gdp DESC;
