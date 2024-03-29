\*

Subquery inside where
You'll now try to figure out which countries had high average life expectancies (at the country level) in 2015.

INSTRUCTION
-----------
1/2
Begin by calculating the average life expectancy across all countries for 2015.

2/2

Recall that you can use SQL to do calculations for you. Suppose we wanted only records that were above 1.15 * 100 in terms of life expectancy for 2015:

SELECT *
  FROM populations
WHERE life_expectancy > 1.15 * 100
  AND year = 2015;
Select all fields from populations with records corresponding to larger than 1.15 times the average you calculated in the first task for 2015. In other words, change the 100 in the example above with a subquery.

*/

-- 1/2

-- Select average life_expectancy
SELECT AVG(life_expectancy)
  -- From populations
  FROM populations
-- Where year is 2015
WHERE year = 2015

-- 2/2

-- Select fields
SELECT *
  -- From populations
  FROM populations
-- Where life_expectancy is greater than
WHERE life_expectancy >
  -- 1.15 * subquery
   1.15 * (SELECT AVG(life_expectancy)
   FROM populations
  WHERE year=2015) AND year = 2015;
