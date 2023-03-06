--Query-1
SELECT COUNT(id)
role_count FROM role;

---------------------------------
--Query-2
SELECT COUNT(*) 
AS skill_count FROM skill;

---------------------------------
--Query-3
SELECT COUNT(*) AS 
user_count FROM user
WHERE profile_id IS NULL;

---------------------------------
--Query-4
SELECT COUNT(*) 
AS alumni_2008_count
FROM profile
WHERE batch = '2008';

---------------------------------
--Query-5
SELECT COUNT(*) 
AS alumni_male_2008_count
FROM profile
WHERE batch = '2008'
AND gender = 'male';

---------------------------------
--Query-6
SELECT  COUNT(*)  AS PM_Count
FROM profile 
WHERE designation = 'Project Manager';

---------------------------------
--Query-7
SELECT  MIN(batch) AS Senior_PM_Batch
FROM profile
WHERE designation = 'Project Manager';

---------------------------------
--Query-8
SELECT  MAX(batch) AS Junior_PM_Batch
FROM profile
WHERE designation = 'Project Manager';

---------------------------------
--Query-9
SELECT COUNT(*) AS project_count
FROM project
WHERE number_of_members > 10;

---------------------------------
--Query-10
SELECT COUNT(*) AS number_of_queries
FROM query  
WHERE TIME(date) BETWEEN
'01:00:00' AND '05:00:00';

---------------------------------
--Query-11
SELECT COUNT(*) AS number_of_posts
FROM post WHERE date < '2013-12-01';

---------------------------------
--Query-12
SELECT COUNT(*) AS number_of_posts
FROM post WHERE date > '2013-12-01';

---------------------------------
--Query-13
SELECT COUNT(*) AS 
count_of_buildings_with_email
FROM building
WHERE email_address IS NOT NULL;

---------------------------------
--Query-14
SELECT COUNT(meter_id) AS
count_of_bills_with_fine
FROM bill
Where fine_amount IS NOT NULL;

---------------------------------
--Query-15
SELECT COUNT(id) AS
count_of_bills_with_payment
FROM bill
Where payment_date IS NOT NULL;

---------------------------------
--Query-16
SELECT COUNT(id) AS
count_total_units_500
FROM electricity_reading
Where total_units > 500;

---------------------------------
