-- Query for Q1 - Find the app with an ID of 1880 --
SELECT * FROM analytics WHERE id = 1880;

-- Query for Q2 - Find the ID and app name for all apps that were last updated on August 01, 2018 --
SELECT id, app_name FROM analytics WHERE last_updated = DATE '2018-08-01';

-- Query for Q3 - count number of apps in categories --
SELECT count(id) AS num_apps, category FROM analytics GROUP BY category;

-- Query for Q4 - Find the top 5 most-reviewed apps and the number of reviews for each -- 
SELECT app_name, reviews FROM analytics ORDER BY reviews DESC LIMIT 5;

-- Query for Q5 - Find the app that has the most reviews with a rating greater than equal to 4.8 --
SELECT app_name, reviews, rating FROM analytics WHERE rating >= 4.8 ORDER BY reviews DESC LIMIT 1;

-- Query for Q6 - Find the average rating for each category ordered by the highest rated to lowest rated --
SELECT avg(rating) AS avg_rating, category FROM analytics GROUP BY category ORDER BY avg_rating DESC;

-- Query for Q7 - Find the name, price, and rating of the most expensive app with a rating that’s less than 3 --
SELECT app_name, price, rating FROM analytics WHERE rating < 3 ORDER BY price DESC LIMIT 1;

-- Query for Q8 - Find all apps with a min install not exceeding 50, that have a rating. Order your results by highest rated first -- 
SELECT app_name, min_installs, rating FROM analytics WHERE min_installs <= 50 AND rating IS NOT NULL ORDER BY rating DESC; \

-- Query for Q9 - Find the names of all apps that are rated less than 3 with at least 10000 reviews --
SELECT app_name, rating, reviews FROM analytics WHERE rating < 3 AND reviews >= 10000;

-- Query for Q10 - Find the top 10 most-reviewed apps that cost between 10 cents and a dollar --
SELECT app_name, reviews, price FROM analytics WHERE price BETWEEN .10 AND 1 ORDER BY reviews DESC LIMIT 10;

-- Query for Q11 - Find the most out of date app --
SELECT app_name, last_updated FROM analytics WHERE last_updated = (SELECT min(last_updated) FROM analytics);

-- Query for Q12 - Find the most expensive app --
SELECT app_name, price FROM analytics WHERE price = (SELECT max(price) FROM analytics);

-- Query for Q13 - Count all the reviews in the Google Play Store --
SELECT sum(reviews) FROM analytics;

-- Query for Q14 - Find all the categories that have more than 300 apps in them --
SELECT count(id) AS num_apps, category FROM analytics GROUP BY category HAVING count(id) >= 300;

-- Query for Q15 - Find the app that has the highest proportion of min_installs to reviews, among apps that have been installed at 
-- least 100,000 times. Display the name of the app along with the number of reviews, the min_installs, and the proportion -- 
SELECT app_name, reviews, min_installs, min_installs / reviews AS installs_reviews FROM analytics WHERE min_installs >= 100000 ORDER BY installs_reviews DESC;

-- Further Study --
-- FS1. Find the name and rating of the top rated apps in each category, among apps that have been installed at least 50,000 times --
SELECT app_name, rating, category FROM analytics WHERE (rating, category) in (
    SELECT MAX(rating), category FROM analytics
      WHERE min_installs >= 50000
      GROUP BY category
    )
  ORDER BY category;

-- FS2. Find all the apps that have a name similar to “facebook” --
SELECT * FROM analytics WHERE app_name ILIKE '%facebook%';

-- FS3. Find all the apps that have more than 1 genre --
SELECT * FROM analytics WHERE  array_length(genres, 1) = 2;

-- FS4. Find all the apps that have education as one of their genres --
SELECT * FROM analytics WHERE genres @> '{"Education"}';