--QUERY1
SELECT * FROM building
WHERE owner_name = 'Nicholas';

---------------------------------------
--QUERY2
SELECT * FROM bill
WHERE total_units > 10000
ORDER BY total_units DESC;

---------------------------------------
--QUERY3
SELECT * FROM bill
WHERE due_date = '2017-10-01'
ORDER BY payable_amount DESC;

---------------------------------------
--QUERY4
SELECT * FROM bill
WHERE YEAR(payment_date)='2018'
ORDER BY payable_amount DESC;

---------------------------------------
--QUERY5
SELECT owner_name, address, contact_number
FROM building
WHERE email_address IS NULL
ORDER BY owner_name ASC;

---------------------------------------
--QUERY6
SELECT * FROM building
WHERE owner_name LIKE 'M%'
ORDER BY owner_name ASC;

---------------------------------------
--QUERY7
SELECT * FROM building
WHERE building_type_id = 2
ORDER BY owner_name ASC;

---------------------------------------
--QUERY8
SELECT * FROM electricity_reading
WHERE total_units 
BETWEEN 500 AND 1000
ORDER BY total_units;

---------------------------------------
--QUERY9
SELECT * FROM bill
WHERE is_payed = 0
ORDER BY due_date ASC;

---------------------------------------
--QUERY10
SELECT meter_id, total_units
FROM electricity_reading
WHERE h13 < h14
ORDER BY total_units DESC;

---------------------------------------
--QUERY11
SELECT * FROM meter
WHERE meter_number LIKE 'S%6';

---------------------------------------
--QUERY12
SELECT name
FROM building_type
WHERE NAME LIKE '%L'
ORDER BY name ASC;

---------------------------------------
--QUERY13
SELECT  * FROM building
WHERE owner_name LIKE '%di%'
ORDER BY owner_name ASC;

---------------------------------------
--QUERY14
SELECT * FROM bill
WHERE DAY(payment_date) = '02'
ORDER BY total_units DESC;

---------------------------------------
--QUERY15
SELECT due_date, payable_amount
FROM bill WHERE payment_date
NOT BETWEEN '2017-09-10' 
AND '2017-10-10';

---------------------------------------
--QUERY16
SELECT due_date, payment_date,
DATEDIFF(due_date,payment_date) 
date_difference, payable_amount
FROM bill WHERE 
payment_date <= due_date;

---------------------------------------
