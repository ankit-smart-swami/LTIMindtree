--QUERY 1
SELECT * FROM electricity_connection_type
ORDER BY connection_name;
-----------------------------------------------
--QUERY 2
SELECT * FROM building_type 
ORDER BY name ASC;
-----------------------------------------------
--QUERY 3
SELECT * FROM building
ORDER BY owner_name ASC;
-----------------------------------------------
--QUERY 4
SELECT * FROM electricity_reading
ORDER BY total_units DESC;
-----------------------------------------------
--QUERY 5
SELECT meter_number FROM meter;
-----------------------------------------------
--QUERY 6
SELECT owner_name, contact_number 
FROM building
ORDER BY owner_name ASC;
-----------------------------------------------
--QUERY 7
SELECT * FROM slab
ORDER BY from_unit ASC;
-----------------------------------------------
--QUERY 8
SELECT * FROM building
WHERE building_type_id = 2
ORDER BY owner_name ASC;
-----------------------------------------------
--QUERY 9
SELECT owner_name, 
LENGTH(owner_name) AS name_length
FROM building
ORDER BY owner_name ASC;
-----------------------------------------------
--QUERY 10
SELECT owner_name,
CONCAT(contact_number,"-", email_address )
AS contact_details
FROM building
ORDER BY owner_name DESC;
-----------------------------------------------
--QUERY 11
SELECT substr(meter_number,1,3)
AS meter_code
FROM meter
ORDER BY meter_code DESC;
-----------------------------------------------
--QUERY 12
SELECT left(owner_name,3) 
AS name_code, contact_number
FROM building
ORDER BY owner_name ASC;
-----------------------------------------------
--QUERY 13
SELECT name
FROM building_type
WHERE name LIKE '%l'
ORDER BY name;
-----------------------------------------------
--QUERY 14
SELECT * FROM building
WHERE owner_name LIKE '%di%'
ORDER BY owner_name ASC;
-----------------------------------------------
--QUERY 15
SELECT due_date, payable_amount
FROM bill
WHERE payment_date  < '2017-09-10' 
OR payment_date > '2017-10-10' ;
-----------------------------------------------




