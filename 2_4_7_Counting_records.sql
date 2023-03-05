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


---------------------------------
--Query-7


---------------------------------
--Query-8


---------------------------------
--Query-9


---------------------------------
--Query-10


---------------------------------
--Query-11


---------------------------------
--Query-12


---------------------------------
--Query-13


---------------------------------
--Query-14


---------------------------------
--Query-15


---------------------------------
--Query-16


---------------------------------
