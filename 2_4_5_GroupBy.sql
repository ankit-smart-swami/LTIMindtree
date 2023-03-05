--Query-1
SELECT batch, COUNT(id) AS profile_count
FROM profile GROUP BY batch
ORDER BY batch ASC;

---------------------------------------------
--Query-2
SELECT batch, COUNT(id) 
AS male_alumni_count
FROM profile 
WHERE gender = 'male'
GROUP BY batch
ORDER BY batch ASC;

---------------------------------------------
--Query-3
SELECT batch, COUNT(id) 
AS female_alumni_count
FROM profile 
WHERE gender = 'female'
GROUP BY batch
ORDER BY batch ASC;

---------------------------------------------
--Query-4
SELECT designation, 
COUNT(id) AS designation_count
FROM profile GROUP BY designation
ORDER BY designation ASC;

---------------------------------------------
--Query-5
SELECT YEAR(date), 
COUNT(id) AS number_of_events
FROM event GROUP BY YEAR(date)
ORDER BY YEAR(date);

---------------------------------------------
--Query-6
SELECT month, 
min(total_units) AS minimum_units
FROM bill GROUP BY month;

---------------------------------------------
