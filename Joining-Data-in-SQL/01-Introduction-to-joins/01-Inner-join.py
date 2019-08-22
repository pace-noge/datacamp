"""
Inner join
PostgreSQL was mentioned in the slides but you'll find that these joins and the material here applies to different forms of SQL as well.

Throughout this course, you'll be working with the countries database containing information about the most populous world cities as well as country-level economic data, population data, and geographic data. This countries database also contains information on languages spoken in each country.

You can see the different tables in this database by clicking on the tabs on the bottom right below query.sql. Click through them to get a sense for the types of data that each table contains before you continue with the course! Take note of the fields that appear to be shared across the tables.

Recall from the video the basic syntax for an INNER JOIN, here including all columns in both tables:

SELECT *
FROM left_table
INNER JOIN right_table
ON left_table.id = right_table.id;
You'll start off with a SELECT statement and then build up to an inner join with the cities and countries tables. Let's get to it!

INSTRUCTION
-----------

Select all column from cities

"""
-- Select all columns from cities
SELECT * FROM cities;


# 2. 

SELECT * 
FROM cities
  -- 1. Inner join to countries
  INNER JOIN countries
    -- 2. Match on the country codes
    ON cities.country_code = country.code;
    
# 3. Select name fields (with alias) and region 


SELECT cities.name AS city, countries.name AS country, countries.region
FROM cities
  INNER JOIN countries
    ON cities.country_code = countries.code;
