--- Code Challenge 1 Baby Names

---Find the number of girls who were named Lillian for the full span of time
--- of the database.

SELECT year, number
FROM babies
WHERE name = 'Lillian';

--- Code Challenge 2
---Find 20 distinct names that start with ‘S’.
---Select only the name column.

SELECT DISTINCT(name)
FROM babies
WHERE name like 'S%'
LIMIT 20;

--- Code Challenge 3
---What are the top 10 names in 1880?
---Select the name, gender, and number columns.

SELECT name, gender, number
FROM babies
WHERE year = 1880
Order By number DESC
LIMIT 10;

--- Code Challenge 4
---Suppose your friend Jaime wants to go out to Japanese, but you’re on a
---budget.
---Return all the restaurants that are Japanese and $$.
---Select all the columns.

SELECT *
FROM nomnom
WHERE cuisine = 'Japanese' AND price = '$$';

--- Code Challenge 5
--- Your roommate Bevers can’t remember the exact name of a restaurant he went
--- to but he knows it contains the word ‘noodle’ in it.
--- Can you find it for him using a query?
--- Select all the columns.

SELECT *
FROM nomnom
WHERE name like '%noodle%';

--- Code Challenge 6
---Some of the restaurants have not been inspected yet or are currently
--- appealing their health grade score.
---Find the restaurants that have empty health values.
---Select all the columns.

SELECT *
 FROM nomnom
 WHERE health IS NULL;

--- Code Challenge 7
--- Order the table by title (from A-Z).
--- Select only the title and publisher columns.

SELECT title, publisher
 FROM news
 ORDER BY title;

 --- Code Challenge 8
 --- Which article names have the word 'bitcoin' in it?
 ---Select all the columns.

 SELECT *
 FROM news
 WHERE title like '%bitcoin%';

--- Code Challenge 9
---The category column contains the article category:

---'b' stands for Business
---'t' stands for Technology

---What are the 20 business articles published most recently?
---Select all the columns.

SELECT *
FROM news
WHERE category = 'b'
ORDER BY timestamp DESC
LIMIT 20;

--- Code Challenge 10

---Use COUNT() and a LIKE operator to determine the number of users that have
--- an email ending in ‘.com’.

SELECT COUNT(*)
FROM users
WHERE email LIKE '%.com';

--- Code Challenge 11
---What are the most popular first names on Codeflix?
---Use COUNT(), GROUP BY, and ORDER BY to create a list of first names and
--- occurrences within the users table.
---Order the data so that the most popular names are displayed first.

SELECT first_name, COUNT(first_name) AS Count
FROM users
Group BY first_name
Order By COUNT(first_name) DESC;

--- Code Challenge 12
---The UX Research team wants to see a distribution of watch durations.
--- They want the result to contain:

--- duration, which is the watch event duration, rounded to the closest minute
--- count, the number of watch events falling into this “bucket”
---Use COUNT(), GROUP BY, and ORDER BY to create this result and order this data
--- by increasing duration.

SELECT ROUND(watch_duration_in_minutes,0) AS duration,
COUNT(watch_duration_in_minutes) AS Count
FROM watch_history
Group By duration
ORDER BY duration;

--- Code Challenge 13
---Find all the users that have successfully made a payment to Codeflix and
--- find their total amount paid.
---Sort them by their total payments (from high to low).

SELECT user_id, SUM(amount) AS Total
FROM payments
WHERE status = 'paid'
Group By user_id
Order By Total DESC;

--- Code Challenge 14
---Generate a table of user ids and total watch duration for users who watched
---more than 400 minutes of content.

SELECT user_id, SUM(watch_duration_in_minutes) AS Total
FROM watch_history
Group By user_id
HAVING Total > 400;

--- Code Challenge 15
---To the nearest minute, how many minutes of content were streamed on
--- Codeflix?

SELECT ROUND(SUM(watch_duration_in_minutes),0) AS Total
FROM watch_history;

--- Code Challenge 16
---Which days in this period did Codeflix collect the most money?
---Your result should have two columns, pay_date and total amount, sorted by
--- the latter descending.

SELECT pay_date, SUM(amount) AS Total
FROM payments
WHERE status = 'paid'
Group By pay_date
Order By Total DESC;

--- Code Challenge 17
---When users successfully pay Codeflix (status = 'paid'), what is the average
--- payment amount?

SELECT AVG(amount) AS Average_amount
FROM payments
WHERE status = 'paid';

--- Code Challenge 18
---Of all the events in the watch_history table, what is the duration of the
--- longest individual watch event? What is the duration of the shortest?

SELECT MAX(watch_duration_in_minutes), MIN(watch_duration_in_minutes)
FROM watch_history;

--- Code Challenge 19
---Join plans and premium_users and select:

--user_id from premium_users
--description from plans

--(Be sure to select the columns in this order)

SELECT premium_users.user_id, plans.description
FROM plans
Join premium_users
ON plans.id = premium_users.membership_plan_id;

--- Code Challenge 20
---Join plays to songs and select:
---user_id from plays
---play_date from plays
---title from songs
---(Be sure to select the columns in this order)

SELECT plays.user_id, plays.play_date, songs.title
FROM plays
JOIN songs
ON plays.song_id = songs.id;

--- Code Challenge 21
--- Which users aren’t premium users?
---Use a LEFT JOIN to combine users and premium_users and select id from users.

SELECT users.id
FROM users
LEFT JOIN premium_users
ON users.id = premium_users.user_id
WHERE premium_users.user_id IS NULL;

--- Code Challenge 22
---We’ve used a WITH statement to create two temporary tables:

--january contains all song plays from January 2017
--february contains all song plays from February 2017

---Use a left join to combine january and february on user_id and select
--- user_id from january.
---Add the following WHERE statement to find which users played songs in
--- January, but not February

WITH january AS (
  SELECT *
  FROM plays
  WHERE strftime("%m", play_date) = '01'
),
february AS (
  SELECT *
  FROM plays
  WHERE strftime("%m", play_date) = '02'

)
SELECT january.user_id
FROM january
LEFT JOIN february
ON january.user_id = february.user_id
WHERE february.user_id IS NULL;

--- Code Challenge 23
---For each month in months, we want to know if each user in premium_users was
--- active or canceled. Cross join months and premium_users and select:

--user_id from premium_users
--purchase_date from premium_users
--cancel_date from premium_users
--months from months

--(Be sure to select the columns in this order)

SELECT premium_users.user_id, premium_users.purchase_date,
 premium_users.cancel_date, months.months
FROM months
CROSS JOIN premium_users;

--- Code Challenge 24
---Songify has added some new songs to their catalog.

---Combine songs and bonus_songs using UNION and select all columns from
--- the result.
---Since the songs table is so big, just look at a sample by LIMITing the
--- results to 10 rows.

SELECT *
FROM songs
UNION
SELECT *
FROM bonus_songs
LIMIT 10;

--- Code Challenge 25
---give us the number of times that each song was played
---Use a WITH statement to alias this code as play_count.
---Join play_count with songs and select (in this order):

---songs table’s title column
---songs table’s artist column
---play_count‘s times_played column

WITH play_count AS(SELECT song_id,
   COUNT(*) AS 'times_played'
FROM plays
GROUP BY song_id )

SELECT songs.title, songs.artist, play_count.times_played
FROM play_count
JOIN songs
ON play_count.song_id = songs.id;
