--Question 1: How many rows are in the data_analyst_jobs table?
/*select count(*)
from data_analyst_jobs;*/

--Question 1:Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
/* select company
	from data_analyst_jobs
	limit 10;*/
--Answer: ExxonMobile in row 10.

--Question 3:How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?
/*	select count(title)
	from data_analyst_jobs
	where location= 'TN' OR location='KY';*/
--Answer: 21 posting for TN AND (27) for either TN or KY.

--Question 4: How many postings in Tennessee have a star rating above 4?
/* SELECT count(title)
   FROM data_analyst_jobs
   WHERE location='TN' AND star_rating>4; */
--Answer: (3) posting

--Question 5: How many postings in the dataset have a review count between 500 and 1000?
	/*SELECT count(title)
	FROM data_analyst_jobs
	WHERE review_count BETWEEN 500 AND 1000;*/
--Answer: 151 review count

/*Question 6: Show the average star rating for each state. The output should show the state as state
              and the average rating for the state as avg_rating. Which state shows the highest average rating?*/
	/*SELECT location AS state, AVG(star_rating) AS avg_rating
	FROM data_analyst_jobs
	GROUP By location;*/
--Answer: KS

--Question 7: Select unique job titles from the data_analyst_jobs table. How many are there?
	/*SELECT COUNT(DISTINCT(title))
	FROM data_analyst_jobs;*/
-- Answer: 881

