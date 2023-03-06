--QUERY1
SELECT * FROM building
WHERE building_type_id IN(
  		SELECT id FROM building_type
  		WHERE name = 'Library')
ORDER BY owner_name ASC;

---------------------------------------
--QUERY2
SELECT contact_number
FROM building WHERE
building_type_id IN(
  		SELECT id FROM building_type
  		WHERE name = 'Police Station')
ORDER BY contact_number ASC;

---------------------------------------
--QUERY3
SELECT name FROM building_type
WHERE id = (
    SELECT building_type_id FROM
    building WHERE id =(
        SELECT building_id FROM meter
        WHERE meter_number ='SG824012'));

---------------------------------------
--QUERY4
SELECT meter_number FROM
meter WHERE building_id IN(
    SELECT id FROM building
    WHERE building_type_id = (
          SELECT id FROM building_type
          WHERE name = 'College'))
ORDER BY meter_number ASC;

---------------------------------------
--QUERY5
SELECT total_units, payable_amount
FROM bill WHERE meter_id IN(
    SELECT id FROM meter
    WHERE meter_number = 'SG934826');

---------------------------------------
--QUERY6
SELECT COUNT(DISTINCT meter_id)
AS building_count FROM bill
WHERE fine_amount IS NOT NULL;

---------------------------------------
--QUERY7
SELECT AVG(payable_amount)
AS payable_amount FROM bill
WHERE meter_id IN(
    SELECT  id FROM meter
    WHERE building_id IN(
        SELECT  id FROM building 
        WHERE building_type_id IN(
            SELECT id FROM building_type
            WHERE connection_type_id IN(
                SELECT connection_type_id FROM slab
                WHERE rate < 24))));

---------------------------------------
--QUERY8
SELECT B.payment_date 
FROM meter M, bill B
WHERE M.meter_number = 'SG288942'
AND M.id = B.meter_id;

---------------------------------------
--QUERY9
SELECT m.meter_number
FROM meter m, electricity_reading er
WHERE m.id = er.meter_id AND
er.day = '2018-05-07'
ORDER BY m.meter_number ASC;

---------------------------------------
--QUERY10
SELECT bu.owner_name
FROM building bu, meter m, bill b
WHERE b.total_units IN
		(SELECT MAX(total_units) FROM bill)
AND b.meter_id = m.id 
AND m.building_id = bu.id
ORDER BY bu.owner_name ASC;

---------------------------------------
--QUERY11
SELECT m.meter_number
FROM  meter m, bill b
WHERE b.total_units IN
		(SELECT MIN(total_units) FROM bill)
AND b.meter_id = m.id 
ORDER BY m.meter_number ASC;

---------------------------------------
--QUERY12
SELECT m.meter_number
FROM  meter m, electricity_reading er
WHERE er.h20 =
		(SELECT MAX(h20) FROM electricity_reading)
AND er.meter_id = m.id;

---------------------------------------
--QUERY13
SELECT m.meter_number
FROM  meter m, electricity_reading er
WHERE er.h21 =
		(SELECT MIN(h21) FROM electricity_reading)
AND er.meter_id = m.id
ORDER BY m.meter_number ASC;

---------------------------------------
--QUERY14
SELECT m.meter_number
FROM meter m, bill b
WHERE b.fine_amount IN
	(SELECT MAX(fine_amount) FROM bill)
AND m.id = b.meter_id;

---------------------------------------
--QUERY15
SELECT owner_name, contact_number
FROM building
WHERE id IN(
	SELECT m.building_id
	FROM meter m, bill b
	WHERE b.month = 10 
	AND b.meter_id = m.id)
ORDER BY owner_name ASC;

---------------------------------------
--QUERY16
SELECT COUNT(*) AS payment_count
FROM meter m, bill
WHERE m.id = bill.meter_id
AND bill.is_payed = 1
AND m.building_id IN(
  SELECT b.id FROM 
  building b, building_type bt
  WHERE bt.id = b.building_type_id
  AND bt.connection_type_id IN(
    SELECT id FROM electricity_connection_type
    WHERE connection_name = 'Commercial'));

---------------------------------------
--QUERY17
SELECT b.address FROM
building_type bt, building b
WHERE bt.id = b.building_type_id
AND bt.connection_type_id IN(
  SELECT id FROM electricity_connection_type
  WHERE connection_name = 'Home')
 ORDER BY b.address ASC;

---------------------------------------
--QUERY18
SELECT bu.owner_name FROM
electricity_reading er, meter m, building bu
WHERE m.id = er.meter_id
AND bu.id = m.building_id
AND er.total_units IN(
  SELECT MIN(total_units)
  FROM electricity_reading);

---------------------------------------
--QUERY19
SELECT SUM(er.h20) total_amount, 
AVG(er.h20) AS average_amount
FROM meter m, electricity_reading er
WHERE m.id = er.meter_id
AND m.building_id IN(
  SELECT b.id FROM  
  building_type bt, building b
  WHERE bt.id = b.building_type_id
  AND bt.connection_type_id = 
    (SELECT id FROM 
    electricity_connection_type
    WHERE connection_name = 'Commercial'));

---------------------------------------
--QUERY20
SELECT s.rate FROM
building_type bt, slab s
WHERE bt.connection_type_id = s.connection_type_id
AND bt.id IN(
  SELECT b.building_type_id
  FROM building b, meter m
  WHERE m.building_id = b.id
  AND m.meter_number = 'SG567423');

---------------------------------------
