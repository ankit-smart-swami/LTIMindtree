--Query-1
SELECT company_name, 
COUNT(id) AS alumni_count
FROM experience 
WHERE current = 1
GROUP BY company_name;

---------------------------------------------
--Query-2
SELECT YEAR(date), 
COUNT(id) number_of_events
FROM event
GROUP BY YEAR(date)
ORDER BY YEAR(date);

---------------------------------------------
--Query-3
SELECT MONTHNAME(date), 
Count(*) number_of_events
FROM event WHERE YEAR(date) = '2013'
GROUP BY MONTHNAME(date)
ORDER BY MONTH(date);

---------------------------------------------
