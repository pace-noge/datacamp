/*

Subquery inside from
The last type of subquery you will work with is one inside of FROM.

You will use this to determine the number of languages spoken for each country, identified by the country's local name! (Note this may be different than the name field and is stored in the local_name field.)

INSTRUCTION
-----------

1/2

Begin by determining for each country code how many languages are listed in the languages table using SELECT, FROM, and GROUP BY.
Alias the aggregated field as lang_num.

2/2

Include the previous query (aliased as subquery) as a subquery in the FROM clause of a new query.
Select the local name of the country from countries.
Also, select lang_num from subquery.
Make sure to use WHERE appropriately to match code in countries and in subquery.
Sort by lang_num in descending order.

*/

-- 1/2

-- Select fields (with aliases)
SELECT code, COUNT(name) as lang_num
  -- From languages
  FROM languages
-- Group by code
GROUP BY code;

-- 2/2

-- Select fields
SELECT local_name, lang_num
  -- From countries
  FROM countries,
  	-- Subquery (alias as subquery)
  	(SELECT code, COUNT(name) as lang_num
  	 FROM languages
  	 GROUP BY code) AS subquery
  -- Where codes match
  WHERE countries.code = subquery.code
-- Order by descending number of languages
ORDER BY lang_num DESC;
