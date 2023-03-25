---Title: Revising a Select Query 1
--- Problem: Query all columns for all American cities in the CITY table with
--- populations larger than 100000. The CountryCode for America is USA.
--- Solution:
SELECT
*
FROM
CITY
WHERE
POPULATION > 100000
AND COUNTRYCODE = 'USA'

--- Title: Revising a Select Query 2
--- Problem:Query the NAME field for all American cities in the CITY table with
--- populations larger than 120000. The CountryCode for America is USA
--- Solution:
SELECT NAME
FROM CITY
WHERE COUNTRYCODE = 'USA' AND POPULATION > 120000;

--- Title: Select all
--- Problem: Query all columns (attributes) for every row in the CITY table.
--- Solution:
SELECT *
FROM CITY;

--- Title: Select by ID
--- Problem: Query all columns for a city in CITY with the ID 1661.
--- Solution:
SELECT *
FROM CITY
WHERE ID = 1661;

--- Title: Japanese Cities attributes
--- Problem:Query all attributes of every Japanese city in the CITY table. The
--- COUNTRYCODE for Japan is JPN.
--- Solution:
SELECT *
FROM CITY
WHERE COUNTRYCODE = 'JPN';

--- Title:
--- Problem: Query the names of all the Japanese cities in the CITY table. The
--- COUNTRYCODE for Japan is JPN.
--- Solution:
SELECT NAME
FROM CITY
WHERE COUNTRYCODE = 'JPN';

--- Title: Weather Observation Station 1
--- Problem: Query a list of CITY and STATE from the STATION table.
--- Solution:
SELECT CITY, STATE
FROM STATION;

--- Title: Weather Observation Station 3
--- Problem: Query a list of CITY names from STATION for cities that have an
--- even ID number. Print the results in any order, but exclude duplicates from
--- the answer.
--- Solution:
SELECT DISTINCT CITY
FROM STATION
WHERE MOD(ID,2) = 0;

--- Title: Weather Observation Station 4
--- Problem: Find the difference between the total number of CITY entries in the
--- table and the number of distinct CITY entries in the table.
--- Solution:
SELECT (COUNT(CITY) - COUNT(DISTINCT CITY)) AS Difference_number_cities
FROM STATION;

--- Title: Weather Observation Station 5
--- Problem: Query the two cities in STATION with the shortest and longest CITY
--- names, as well as their respective lengths (i.e.: number of characters in
--- the name). If there is more than one smallest or largest city, choose the
--- one that comes first when ordered alphabetically.
--- Solution:
(SELECT * FROM (
    SELECT CITY, (LENGTH(CITY))
    FROM STATION
    WHERE LENGTH(CITY)=(SELECT MIN(LENGTH(CITY)) FROM STATION)
    ORDER BY CITY)
WHERE ROWNUM = 1)
UNION
(SELECT * FROM (
    SELECT CITY, (LENGTH(CITY))
    FROM STATION
    WHERE LENGTH(CITY)=(SELECT MAX(LENGTH(CITY)) FROM STATION)
    ORDER BY CITY)
WHERE ROWNUM = 1);

--- Title: Weather Observation Station 6
--- Problem: Query the list of CITY names starting with vowels
--- (i.e., a, e, i, o, or u) from STATION. Your result cannot contain
--- duplicates.
--- Solution:
SELECT
DISTINCT CITY
FROM STATION
WHERE
    CITY LIKE 'a%'
OR  CITY LIKE 'e%'
OR  CITY LIKE 'i%'
OR  CITY LIKE 'o%'
OR  CITY LIKE 'u%';

--- Title: Weather Observation Station 7
--- Problem: Query the list of CITY names ending with vowels (a, e, i, o, u)
--- from STATION. Your result cannot contain duplicates.
--- Solution:
SELECT
DISTINCT CITY
FROM STATION
WHERE
    CITY LIKE '%a'
OR  CITY LIKE '%e'
OR  CITY LIKE '%i'
OR  CITY LIKE '%o'
OR  CITY LIKE '%u';

--- Title: Weather Observation Station 8
--- Problem: Query the list of CITY names from STATION which have vowels
--- (i.e., a, e, i, o, and u) as both their first and last characters.
--- Your result cannot contain duplicates.
--- Solution:
SELECT
DISTINCT CITY
FROM STATION
WHERE
    (CITY LIKE 'a%'
OR  CITY LIKE 'e%'
OR  CITY LIKE 'i%'
OR  CITY LIKE 'o%'
OR  CITY LIKE 'u%')
AND
    (CITY LIKE '%a'
    OR CITY LIKE '%e'
    OR CITY LIKE '%i'
    OR CITY LIKE '%o'
    OR CITY LIKE '%u');

--- Title: Weather Observation Station 9
--- Problem: Query the list of CITY names from STATION that do not start with
--- vowels. Your result cannot contain duplicates.
--- Solution:
SELECT
DISTINCT CITY
FROM STATION
WHERE
    CITY NOT LIKE 'A%'
AND CITY NOT LIKE 'E%'
AND CITY NOT LIKE 'I%'
AND CITY NOT LIKE 'O%'
AND CITY NOT LIKE 'U%';

--- Title: Weather Observation Station 10
--- Problem: Query the list of CITY names from STATION that do not end with
--- vowels. Your result cannot contain duplicates.
--- Solution:
SELECT
DISTINCT CITY
FROM STATION
WHERE
    CITY NOT LIKE '%a'
AND CITY NOT LIKE '%e'
AND CITY NOT LIKE '%i'
AND CITY NOT LIKE '%o'
AND CITY NOT LIKE '%u';

--- Title: Weather Observation Station 11
--- Problem: Query the list of CITY names from STATION that either do not start
--- with vowels or do not end with vowels. Your result cannot contain
--- duplicates.
--- Solution:
SELECT
DISTINCT CITY
FROM STATION
WHERE
    (CITY NOT LIKE 'a%'
    AND CITY NOT LIKE 'e%'
    AND CITY NOT LIKE 'i%'
    AND CITY NOT LIKE 'o%'
    AND CITY NOT LIKE 'u%')
OR
    (CITY NOT LIKE '%a'
    AND CITY NOT LIKE '%e'
    AND CITY NOT LIKE '%i'
    AND CITY NOT LIKE '%o'
    AND CITY NOT LIKE '%u');

--- Title: Weather Observation Station 12
--- Problem: Query the list of CITY names from STATION that do not start with
--- vowels and do not end with vowels. Your result cannot contain duplicates.
--- Solution:
Select Distinct City
From Station
Where Right(City,1) NOT IN ('a','e','i','o','u')
AND Left(City,1) NOT IN ('a','e','i','o','u');

--- Title: Higher than 75 marks
--- Problem: Query the Name of any student in STUDENTS who scored higher 75 than
--- Marks. Order your output by the last three characters of each name. If two
--- or more students both have names ending in the same last three characters
--- (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
--- Solution:
SELECT
Name
FROM STUDENTS
WHERE
  Marks > 75
ORDER BY RIGHT(Name,3), ID ASC;

--- Title: Employee names
--- Problem: Write a query that prints a list of employee names
--- (i.e.: the name attribute) from the Employee table in alphabetical order.
--- Solution:
SELECT
name
FROM Employee
ORDER BY name ASC;

--- Title: Employee salaries
--- Problem: Write a query that prints a list of employee names
--- (i.e.: the name attribute) for employees in Employee having a salary
--- greater than $2000 per month who have been employees for less than
--- 10 months. Sort your result by ascending employee_id.
--- Solution:
SELECT
name
FROM Employee
WHERE
    salary > 2000
AND months < 10
ORDER BY employee_id ASC;

--- Title: Type of Triangles
--- Problem: Write a query identifying the type of each record in the TRIANGLES
--- table using its three side lengths. Output one of the following statements
--- for each record in the table:
--- Equilateral: It's a triangle with sides of equal length.
--- Isosceles: It's a triangle with sides of equal length.
--- Scalene: It's a triangle with sides of differing lengths.
--- Not A Triangle: The given values of A, B, and C don't form a triangle.
--- Solution:
SELECT CASE
            WHEN A + B > C AND B + C > A AND A + C > B THEN
                CASE
                    WHEN A = B AND B = C THEN 'Equilateral'
                    WHEN A = B OR B = C OR A = C THEN 'Isosceles'
                    ELSE 'Scalene'
                END
            ELSE 'Not A Triangle'
        END
FROM TRIANGLES;

--- Title: The PADS
--- Problem: Generate the following two result sets:
--- 1. Query an alphabetically ordered list of all names in OCCUPATIONS,
--- immediately followed by the first letter of each profession as a
--- parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A),
---  ADoctorName(D), AProfessorName(P), and ASingerName(S).

--- 2. Query the number of ocurrences of each occupation in OCCUPATIONS. Sort
--- the occurrences in ascending order, and output them in the following format:
--- There are a total of [occupation_count] [occupation]s.
--- where [occupation_count] is the number of occurrences of an occupation in
--- OCCUPATIONS and [occupation] is the lowercase occupation name. If more than
---  one Occupation has the same [occupation_count], they should be ordered
--- alphabetically.
--- Solution:
SELECT
CONCAT(Name,CONCAT('(',LEFT(Occupation,1),')'))
FROM OCCUPATIONS
ORDER BY Name;

SELECT
CONCAT('There are a total of ',COUNT(*),' ', LOWER(Occupation),'s.')
FROM OCCUPATIONS
GROUP BY Occupation
ORDER BY COUNT(*) ASC;

--- Title: Revising Aggregations - The count function
--- Problem: Query a count of the number of cities in CITY having a Population
--- larger than 100000 .
--- Solution:
SELECT
COUNT(NAME)
FROM CITY
WHERE
POPULATION > 100000;

--- Title: Revising Aggregations - The Sum function
--- Problem: Query the total population of all cities in CITY where District is
--- California.
--- Solution:
SELECT
SUM(POPULATION) AS Total_population
FROM CITY
WHERE
DISTRICT = 'California';

--- Title: Revising Aggregations - Averages
--- Problem: Query the average population of all cities in CITY where District
--- is California.
--- Solution:
SELECT
AVG(POPULATION) AS average_population
FROM CITY
WHERE
    DISTRICT = 'California';

--- Title: Average POPULATION
--- Problem: Query the average population for all cities in CITY, rounded down
--- to the nearest integer.
--- Solution:
SELECT
ROUND(AVG(POPULATION),0) AS average_population
FROM CITY

--- Title: Japan POPULATION
--- Problem: Query the sum of the populations for all Japanese cities in CITY.
--- The COUNTRYCODE for Japan is JPN.
--- Solution:
SELECT
SUM(POPULATION) AS japan_pop
FROM CITY
WHERE
    COUNTRYCODE = 'JPN';

--- Title: Population Density Difference
--- Problem: Query the difference between the maximum and minimum populations in
--- CITY.
--- Solution:
SELECT
MAX(POPULATION)-MIN(POPULATION)
FROM CITY

--- Title: The Blunder
--- Problem: Samantha was tasked with calculating the average monthly salaries
--- for all employees in the EMPLOYEES table, but did not realize her keyboard's
--- 0 key was broken until after completing the calculation. She wants your help
--- finding the difference between her miscalculation (using salaries with any
--- zeros removed), and the actual average salary.
--- Write a query calculating the amount of error (i.e.: actual - miscalculated
--- average monthly salaries), and round it up to the next integer.
--- Solution:
SELECT
ROUND((SELECT
 AVG(Salary)
 FROM EMPLOYEES)
-
(SELECT
 ROUND(AVG(REPLACE(Salary,'0','')),0)
 FROM EMPLOYEES),0)
FROM EMPLOYEES
LIMIT 1

--- Title: Top Earners
--- Problem: We define an employee's total earnings to be their monthly
--- (salary * months) worked, and the maximum total earnings to be the maximum
--- total earnings for any employee in the Employee table. Write a query to find
--- the maximum total earnings for all employees as well as the total number of
--- employees who have maximum total earnings. Then print these values as 2
--- space-separated integers.
--- Solution:
SELECT
MAX(months*salary),
COUNT(*)
FROM Employee
GROUP BY months*salary
ORDER BY months*salary DESC
LIMIT 1;

--- Title: Weather Observation Station 2
--- Problem: Query the following two values from the STATION table:
--- 1. The sum of all values in LAT_N rounded to a scale of
--- 2 decimal places.
--- 2. The sum of all values in LONG_W rounded to a scale of
--- 2 decimal places.
--- Solution:
SELECT
ROUND(SUM(LAT_N),2),
ROUND(SUM(LONG_W),2)
FROM STATION;

--- Title: Weather Observation Station 13
--- Problem: Query the sum of Northern Latitudes (LAT_N) from STATION having
--- values greater than 38.7880 and less than 137.2345. Truncate your answer
--- to 4 decimal places.
--- Solution:
SELECT
ROUND(SUM(LAT_N),4)
FROM STATION
WHERE
LAT_N BETWEEN 38.7880 AND 137.2345

--- Title: Weather Observation Station 15
--- Problem: Query the Western Longitude (LONG_W) for the largest Northern
--- Latitude (LAT_N) in STATION that is less than 137.2345 . Round your answer
--- to 4 decimal places.
--- Solution:
SELECT
ROUND(LONG_W,4)
FROM STATION
WHERE
 LAT_N < 137.2345
ORDER BY LAT_N DESC
LIMIT 1;

--- Title: Weather Observation Station 16
--- Problem: Query the smallest Northern Latitude (LAT_N) from STATION that is
--- greater than 38.7780. Round your answer to 4 decimal places.
--- Solution:
SELECT
ROUND(LAT_N,4)
FROM STATION
WHERE
LAT_N > 38.7780
ORDER BY LAT_N ASC
LIMIT 1;

--- Title: Weather Observation Station 17
--- Problem: Query the Western Longitude (LONG_W)where the smallest Northern
--- Latitude (LAT_N) in STATION is greater than 38.7780. Round your answer to 4
--- decimal places.
--- Solution:
SELECT
ROUND(LONG_W,4)
FROM STATION
WHERE
LAT_N > 38.7780
ORDER BY LAT_N ASC
LIMIT 1;

--- Title: Weather Observation Station 18
--- Problem:Consider P1(a,b) and P2(c,d) to be two points on a 2D plane.
--- a happens to equal the minimum value in Northern Latitude
--- (LAT_N in STATION).
--- b happens to equal the minimum value in Western Longitude
--- (LONG_W in STATION).
--- c happens to equal the maximum value in Northern Latitude
--- (LAT_N in STATION).
--- d happens to equal the maximum value in Western Longitude
--- (LONG_W in STATION).
--- Query the Manhattan Distance between points
--- P1 and P2 and round it to a scale of 4 decimal places.
--- Solution:
SELECT
ROUND(ABS(MIN(LAT_N)-MAX(LAT_N))+ABS(MIN(LONG_W)-MAX(LONG_W)),4)
FROM STATION;

--- Title: Weather Observation Station 19
--- Problem: Consider P1(a,c) and P2(b,d) to be two points on a 2D plane where
--- (a,b) are the respective minimum and maximum values of Northern Latitude
--- (LAT_N) and (c,d) are the respective minimum and maximum values of Western
--- Longitude (LONG_W) in STATION. Query the Euclidean Distance between points
--- P1 and P2 and format your answer to display 4 decimal digits.
--- Solution:
SELECT
ROUND(SQRT(POWER((MAX(LAT_N)-MIN(LAT_N)),2)+
POWER((MAX(LONG_W)-MIN(LONG_W)),2)),4)
FROM STATION;

--- Title: Weather Observation Station 20
--- Problem: A median is defined as a number separating the higher half of a
--- data set from the lower half. Query the median of the Northern Latitudes
--- (LAT_N) from STATION and round your answer to 4 decimal places.
--- Solution:
SELECT TOP 1
CAST(ROUND(PERCENTILE_CONT(.5) WITHIN GROUP(ORDER BY LAT_N) OVER(),4)
AS DECIMAL(7,4))
FROM STATION;
