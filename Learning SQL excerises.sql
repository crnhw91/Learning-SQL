---1. Project Create a Table
---Create a table named friends with three columns:

    --id that stores INTEGER
    --name that stores TEXT
    --birthday that stores DATE
    CREATE TABLE friends(
      id INTEGER,
      name TEXT,
      birthday DATE
    );

--Beneath your current code, add Ororo Munroe to friends.
--Her birthday is May 30th, 1940.
INSERT INTO friends(id, name, birthday)
VALUES(1, 'Ororo Munroe', '1940-05-30')

---Add two of your friends to the table.
INSERT INTO friends (id, name, birthday)
VALUES (2, 'Peter Parker', '1993-03-12');

INSERT INTO friends (id, name, birthday)
VALUES (3, 'Marky Mark', '1992-04-09');

---Ororo Munroe just realized that she can control the weather and decided to
---change her name. Her new name is “Storm”.

---Update her record in friends.

UPDATE friends
SET name = 'Storm'
WHERE id = 1;

---Add a new column named email.

ALTER TABLE friends
ADD COLUMN email TEXT;

---Update the email address for everyone in your table.

---Storm’s email is storm@codecademy.com.

UPDATE friends
SET email = 'storm@codecademy.com'
WHERE id = 1;

UPDATE friends
SET email = 'PParker@gmail.com'
Where id = 2;

UPDATE friends
SET email = 'MarkyMark@gmail.com'
WHERE id = 3;

---Wait, Storm is fictional…
----Remove her from friends.

DELETE
FROM friends
WHERE id = 1;
--- End Project 1

--- 2. New York Restaurants Project
---What are the distinct neighborhoods?

SELECT DISTINCT neighborhood
FROM nomnom;

---What are the distinct cuisine types?

SELECT DISTINCT cuisine
FROM nomnom;

--- Suppose we would like some Chinese takeout
--- What are our options?

SELECT *
FROM nomnom
WHERE cuisine = 'Chinese';

---Return all the restaurants with reviews of 4 and above.

SELECT *
FROM nomnom
WHERE review >= 4;

---Suppose Abbi and llana want to have a fancy dinner date.
---Return all the restaurants that are Italian and $$$.

SELECT *
FROM nomnom
WHERE cuisine = 'Italian' and price = '$$$';

---Your coworker Trey can’t remember the exact name of a restaurant he went to
--- but he knows it contains the word ‘meatball’ in it.
---Can you find it for him using a query?

SELECT *
FROM nomnom
WHERE name like '%meatball%';

---Let’s order delivery to the house!
---Find all the close by spots in Midtown, Downtown or Chinatown.

SELECT *
FROM nomnom
WHERE neighborhood = 'Midtown' OR neighborhood = 'Downtown' OR
neighborhood = 'Chinatown';

---Find all the health grade pending restaurants (empty values).

SELECT *
FROM nomnom
WHERE health IS NULL;

---Create a Top 10 Restaurants Ranking based on reviews.

SELECT *
FROM nomnom
Order BY review DESC
LIMIT 10;

---Use a CASE statement to change the rating system to:

  --  review > 4.5 is Extraordinary
  --  review > 4 is Excellent
  --  review > 3 is Good
  --  review > 2 is Fair
  --  Everything else is Poor

-- Don’t forget to rename the new column!

SELECT name,
  CASE
    WHEN review > 4.5 THEN 'Extraordinary'
    WHEN review > 4 THEN 'Excellent'
    WHEN review > 3 THEN 'Good'
    WHEN review > 2 THEN 'Fair'
    ELSE 'Poor'
    END AS 'New_Review'
FROM nomnom;

--- End Of Project New York Restaurants

--- 3. Trends in Startups Project
---Howdy! It’s your first day as a TechCrunch reporter. Your first task is to
--- write an article on the rising trends in the startup world.
---To get you started with your research, your boss emailed you a
---project.sqlite file that contains a table called startups. It is a portfolio
--- of some of the biggest names in the industry.
---Write queries with aggregate functions to retrieve some interesting insights
--- about these companies.

---Calculate the total number of companies in the table.
SELECT COUNT(name)
FROM startups;

---We want to know the total value of all companies in this table.

SELECT SUM(valuation)
FROM startups;

---What is the highest amount raised by a startup?

SELECT MAX(raised)
FROM startups;

---Edit the query so that it returns the maximum amount of money raised, during ‘Seed’ stage.

SELECT MAX(raised)
FROM startups
WHERE stage = 'Seed';

---In what year was the oldest company on the list founded?

SELECT MIN(founded)
FROM startups;

---Return the average valuation.

SELECT AVG(valuation)
FROM startups;

---Return the average valuation, in each category.

SELECT category, AVG(valuation)
FROM startups
Group By category;

---Return the average valuation, in each category.
---Round the averages to two decimal places.

SELECT category, ROUND(AVG(valuation),2)
FROM startups
Group By category;

---Return the average valuation, in each category.
---Round the averages to two decimal places.
---Lastly, order the list from highest averages to lowest.

SELECT category, ROUND(AVG(valuation),2) AS Average_valuation
FROM startups
Group By category
Order by Average_valuation DESC;

---First, return the name of each category with the total number of companies
---that belong to it.

SELECT COUNT(*), category
FROM startups
Group by category;

---Next, filter the result to only include categories that have more than three
--- companies in them.

SELECT COUNT(*) AS Total_comp, category
FROM startups
Group by category
HAVING Total_comp > 3;

---What is the average size of a startup in each location?

SELECT location, AVG(employees)
FROM startups
Group By location;

---What is the average size of a startup in each location, with average sizes
--- above 500?

SELECT location, AVG(employees)
FROM startups
Group By location
HAVING AVG(employees) > 500;

--- END OF PROJECT

---4. Analyze Hacker News Trends PROJECT

---Hacker News is a popular website run by Y Combinator. It’s widely known by
--- people in the tech industry as a community site for sharing news, showing
--- off projects, asking questions, among other things.
---In this project, you will be working with a table named hacker_news that
--- contains stories from Hacker News since its launch in 2007. It has the
--- following columns:

  --  title: the title of the story
  --  user: the user who submitted the story
  --  score: the score of the story
  --  timestamp: the time of the story
  --  url: the link of the story

---This data was kindly made publicly available under the MIT license.

---Let’s find the most popular Hacker News stories:
---What are the top five stories with the highest scores?

Select title, score
FROM hacker_news
ORDER BY score DESC
LIMIT 5;

---Recent studies have found that online forums tend to be dominated by a small
--- percentage of their users
---Is this true of Hacker News?
---Is a small percentage of Hacker News submitters taking the majority of the
--- points?
--- First, find the total score of all the stories.

Select SUM(score)
FROM hacker_news;

---Next, we need to pinpoint the users who have accumulated a lot of points
--- across their stories.
---Find the individual users who have gotten combined scores of more than 200,
--- and their combined scores.

Select SUM(score), user
FROM hacker_news
Group By user
HAVING SUM(score) > 200
ORDER BY SUM(score) DESC;

---Oh no! While we are looking at the power users, some users are rickrolling
--- — tricking readers into clicking on a link to a funny video and claiming
--- that it links to information about coding.
---The url of the video is:
--- https://www.youtube.com/watch?v=dQw4w9WgXcQ
---How many times has each offending user posted this link?

SELECT user, COUNT(*)
FROM hacker_news
WHERE url LIKE '%watch?v=dQw4w9WgXcQ%'
Group By user
Order By COUNT(*) DESC;

---Hacker News stories are essentially links that take users to other websites.
---Which of these sites feed Hacker News the most:
---GitHub, Medium, or New York Times?
---First, we want to categorize each story based on their source.

SELECT CASE
  WHEN url LIKE '%github.com%' THEN 'Github'
  WHEN url LIKE '%medium.com%' THEN 'Medium'
  WHEN url LIKE '%nytimes.com%' THEN 'New York'
  ELSE 'other'
  END AS 'Source'
FROM hacker_news;

---Add a column for the number of stories from each URL using COUNT().

SELECT CASE
  WHEN url LIKE '%github.com%' THEN 'Github'
  WHEN url LIKE '%medium.com%' THEN 'Medium'
  WHEN url LIKE '%nytimes.com%' THEN 'New York'
  ELSE 'other'
  END AS 'Source', COUNT(*)
FROM hacker_news
Group By Source;

--- END OF PROJECT

--- Start project: RPA Fraud Detection

---Reputable Product Agency (RPA) has started receiving complaints from their
--- credit card processor about fraudulent transactions. Help your finance
---department identify potentially risky transactions before they finish
---processing.

-- 1
-- What are the column names?
SELECT *
FROM transaction_data
LIMIT 10;

-- 2
-- Find the full_names and emails
-- of the transactions listing 20252 as the zip code.

SELECT full_name, email, zip
FROM transaction_data
WHERE zip = 20252;

-- 3
-- Use a query to find the names
-- and emails associated with these transactions.

SELECT full_name, email
FROM transaction_data
WHERE full_name = 'Art Vandelay' OR full_name like '% der %';

-- 4
-- Find the ip_addresses and emails listed with these transactions.
SELECT ip_address, email
FROM transaction_data
WHERE ip_address like '10.%';

-- 5
-- Find the emails in transaction_data with
-- ‘temp_email.com’ as a domain.
SELECT email
FROM transaction_data
WHERE email like '%temp_email.com';

-- 6
-- The finance department is looking for a specific transaction.
-- They know that the transaction occurred from an ip address starting
-- with ‘120.’ and their full name starts with ‘John’.

-- Can you find the transaction?
SELECT *
FROM transaction_data
WHERE ip_address like '120.%' AND full_name like 'John%';

--- END PROJECT

--- Start Project RPA Customer Segmentation
---The marketing department of Reputable Product Agency (RPA) is looking to
--- segment the company users by a number of different criteria.
---In this context, a segment is a subset of users that meet different
--- conditions. Segments are used to send marketing campaigns to users who meet
--- specific criteria or to measure the performance of specific marketing
--- campaigns.
---Use SQL queries to generate user lists for the marketing department. The
--- users dataset is imported into the workspace.

-- 1
-- What are the column names?

SELECT *
FROM users
LIMIT 20;

-- 2
-- Find the email addresses and birthdays of users whose
-- birthday is between 1980-01-01 and 1989-12-31.

SELECT email, birthday
FROM users
WHERE birthday BETWEEN '1980-01-01' AND '1989-12-31';

-- 3
-- Find the emails and creation date of users
-- whose created_at date matches this condition.

SELECT email, created_at
FROM users
WHERE created_at < '2017-05-01';

-- 4
-- Find the emails of the users who received the ‘bears’ test.

SELECT email
FROM users
WHERE test = 'bears';
-- 5
-- Find all the emails of all users who
-- received a campaign on website BBB.

SELECT email
FROM users
WHERE campaign like 'BBB%';

-- 6
-- Find all the emails of all users who received ad copy 2 in
-- their campaign.
SELECT email
FROM users
WHERE campaign like '%-2';

-- 7
-- Find the emails for all users who received both a campaign and a test.
-- These users will have non-empty entries in the
-- campaign and test columns.
SELECT email
FROM users
WHERE campain IS NOT NULL AND test IS NOT NULL;

--- END PROJECT

--- Start Project: Davie's Burgers Subway Ad

-- 1
-- What are the column names?
SELECT *
FROM orders
LIMIT 10;

-- 2
-- How recent is this data?
SELECT DISTINCT(order_date)
FROM orders
ORDER By order_date DESC;

-- 3
-- Instead of selecting all the columns using *,
-- write a query that selects only the special_instructions column.

-- Limit the result to 20 rows.
SELECT special_instructions
FROM orders
LIMIT 20;

-- 4
-- Can you edit the query so that we are only
-- returning the special instructions that are not empty?

SELECT special_instructions
FROM orders
WHERE special_instructions IS NOT NULL;
-- 5
-- Let’s go even further and sort the instructions
-- in alphabetical order (A-Z).

SELECT special_instructions
FROM orders
WHERE special_instructions IS NOT NULL
Order BY special_instructions;
-- 6
-- Let’s search for special instructions that have the word ‘sauce’.

-- Are there any funny or interesting ones?

SELECT special_instructions
FROM orders
WHERE special_instructions like '%sauce%';

-- 7
-- Let’s search for special instructions that have the word ‘door’.
-- Any funny or interesting ones?
SELECT special_instructions
FROM orders
WHERE special_instructions like '%door%';

-- 8
-- Let’s search for special instructions that have the word ‘box’.
-- Any funny or interesting ones?
SELECT special_instructions
FROM orders
WHERE special_instructions like '%box%';


-- 9
-- Instead of just returning the special instructions, also return their order ids.

-- For more readability:
-- Rename id as ‘#’
-- Rename special_instructions as ‘Notes’

SELECT id AS '#', special_instructions AS 'Notes'
FROM orders
WHERE special_instructions LIKE '%box%';

--- END of PROJECT

--- Start Project: The Metropolitan Museum of art

---How many pieces are in the American Decorative Art collection?

SELECT COUNT(*)
FROM met;

---Count the number of pieces where the category includes ‘celery’.

SELECT COUNT(*)
FROM met
WHERE category LIKE '%celery%';

---Find the title and medium of the oldest piece(s) in the collection.

SELECT MIN(date)
FROM met;

---Then I did this query

SELECT date, title, medium
FROM met
WHERE date LIKE '%1600%';

---Find the top 10 countries with the most pieces in the collection

SELECT country, COUNT(*) AS Total
FROM met
WHERE country IS NOT NULL
Group By country
ORDER BY Total DESC
LIMIT 10;

---Find the categories HAVING more than 100 pieces.

SELECT category, COUNT(*) AS Total
FROM met
Group By category
HAVING Total > 100;

---Count the number of pieces where the medium contains ‘gold’ or ‘silver’.
--- And sort in descending order.

SELECT medium, COUNT(*) AS Total
FROM met
WHERE medium LIKE '%gold%' OR medium LIKE '%silver%'
Group By medium
ORDER BY Total DESC;

--- END of project

--- Start project Cryptocurrency Exchange
---Fiddy Cent is a digital currency exchange headquartered in Neo Tokyo.
--- They broker exchanges of Bitcoin, Bitcoin Cash, Ethereum, and Litecoin with
--- fiat currencies in around 50 countries.
---Help them analyze their January ledger data using SQL aggregate functions!
--- You are given the transactions table, which contains both money-in and
---- money-out transactions.

---What is the total money_in in the table?

SELECT SUM(money_in) AS Total
FROM transactions;

---What is the total money_out in the table?

ELECT SUM(money_out) AS Total
FROM transactions;

---It was reported that Bitcoin dominates Fiddy Cent’s exchange.
----Let’s see if it is true within these dates by answering two questions:

--How many money_in transactions are in this table?
--How many money_in transactions are in this table where ‘BIT’ is the currency?

SELECT COUNT(money_in)
FROM transactions;

SELECT COUNT(money_in)
FROM transactions
WHERE currency = 'BIT';

---What was the largest transaction in this whole table?
--Was it money_in or money_out?

SELECT MAX(money_in) AS Max_money_in, MAX(money_out) AS Max_money_out
FROM transactions;
--It was money_out

---What is the average money_in in the table for the currency Ethereum (‘ETH’)?

SELECT AVG(money_in) AS average_money_in
FROM transactions
WHERE currency = 'ETH';

---Let’s build a ledger for the different dates.
---Select date, average money_in, and average money_out from the table.
---And group everything by date.

SELECT date, AVG(money_in), AVG(money_out)
FROM transactions
Group By date;

----To make the previous query easier to read, round the averages
--- to 2 decimal places.
---Give the column aliases using AS for readability.

SELECT date, ROUND(AVG(money_in),2) AS 'Average Money In',
 ROUND(AVG(money_out),2) AS 'Average Money Out'
FROM transactions
Group By date;

---END Project
