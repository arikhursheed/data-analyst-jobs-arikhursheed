--Question 1: How many rows are in the data_analyst_jobs table?
	select count(*)
	from data_analyst_jobs;

--Question 1:Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
    select company
	from data_analyst_jobs
	limit 10;*/
--Answer: ExxonMobil


--Question 3:How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?
     select count(title)
	from data_analyst_jobs
	where location= 'TN' OR location='KY';
--Answer: 21 posting for TN AND (27) for either TN or KY.

--Question 4: How many postings in Tennessee have a star rating above 4?
   SELECT count(title)
   FROM data_analyst_jobs
   WHERE location='TN' AND star_rating>4;
--Answer: (3) posting

--Question 5: How many postings in the dataset have a review count between 500 and 1000?
	SELECT count(title)
	FROM data_analyst_jobs
	WHERE review_count BETWEEN 500 AND 1000;
--Answer: 151 review count

/*Question 6: Show the average star rating for each state. The output should show the state as state
              and the average rating for the state as avg_rating. Which state shows the highest average rating?*/
	SELECT location AS state, AVG(star_rating) AS avg_rating
	FROM data_analyst_jobs
	GROUP By location;
--Answer: KS

--Question 7: Select unique job titles from the data_analyst_jobs table. How many are there?
	SELECT COUNT(DISTINCT(title))
	FROM data_analyst_jobs;
-- Answer: 881

--Question 8: How many unique job titles are there for California companies?

	SELECT count(DISTINCT title)
	from data_analyst_jobs
	WHERE location= 'CA';
--Answer: 230 

/*Question 9: Find the name of each company and its average star rating for all companies
			that have more than 5000 reviews across all locations. How many companiesare there with more
			that 5000 reviews across all locations?*/
		SELECT company, ROUND(AVG(star_rating),2)
		FROM data_analyst_jobs
		where review_count>5000
		AND company IS NOT NULL
		GROUP BY company;
		
--Answer: 40 across all locations

/*Question 10: Add the code to order the query in #9 from highest to lowest average star rating.
				Which company with more than 5000 reviews across all locations in the dataset has 
				the highest star rating? What is that rating?*/
SELECT company, review_count,avg_rating
FROM (SELECT company, SUM(review_count) as review_count,ROUND(AVG(star_rating),2) AS avg_rating
	  FROM data_analyst_jobs
	  GROUP BY company) as companies
WHERE review_count>5000
AND company IS NOT NULL
ORDER BY avg_rating DESC;

--QUESTION 11: Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?
	SELECT count(analyst_job)
	FROM (SELECT title
		  FROM data_analyst_jobs
		  WHERE title ilike '%Analyst%'
		  GROUP BY title) as analyst_job;
--Answer: 754

/*QUESTION 12:How many different job titles do not contain either the word ‘Analyst’ 
			or the word ‘Analytics’? What word do these positions have in common?*/
			
--I get 4 result for this query
SELECT title as not_analyst_jobs
	FROM (SELECT title
		  FROM data_analyst_jobs
		  WHERE title NOT IN (SELECT title FROM data_analyst_jobs WHERE title iLIKE '%Analytics%'OR title iLIKE '%Analyst%' )
          GROUP BY title) as title;
-- I get 4 results for this query		 
	SELECT DISTINCT(title)
	FROM data_analyst_jobs
	WHERE title NOT iLIKE '%Analyst%' AND title NOT ILIKE '%Analytics%'
--Answer: 4 not analytics jobs and tableau is the comman word amnog the positions.

-- i get 4 for this query
	    SELECT title
		FROM data_analyst_jobs
		WHERE title NOT ILIKE '%Analy%';
		
