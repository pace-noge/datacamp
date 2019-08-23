/*

Semi-join
You are now going to use the concept of a semi-join to identify languages spoken in the Middle East.

INSTRUCTION
-----------

1/3

Flash back to our Intro to SQL for Data Science course and begin by selecting all country codes in the Middle East as a single field result using SELECT, FROM, and WHERE.

2/3

Comment out the answer to the previous tab by surrounding it in /* and */. You'll come back to it!
Below the commented code, select only unique languages by name appearing in the languages table.
Order the resulting single field table by name in ascending order.

*/

-- 1/3
-- Select code
SELECT code
  -- From countries
  FROM countries
-- Where region is Middle East
Where region = 'Middle East';

-- 2/3
/*
SELECT code
  FROM countries
WHERE region = 'Middle East';
*/

-- Select field
SELECT DISTINCT(name)
  -- From languages
  FROM languages
-- Order by name
ORDER BY name;

-- 3/3

-- Select distinct fields
select DISTINCT(name)
  -- From languages
  FROM languages
-- Where in statement
WHERE code IN
  -- Subquery
  (SELECT code
   FROM countries
   WHERE region = 'Middle East')
-- Order by name
ORDER by name;
