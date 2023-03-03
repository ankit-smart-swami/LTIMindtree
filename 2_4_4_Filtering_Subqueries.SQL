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


---------------------------------------
--QUERY10


---------------------------------------
--QUERY11


---------------------------------------
--QUERY12


---------------------------------------
--QUERY13


---------------------------------------
--QUERY14


---------------------------------------
--QUERY15


---------------------------------------
--QUERY16


---------------------------------------
--QUERY17


---------------------------------------
--QUERY18


---------------------------------------
--QUERY19


---------------------------------------
--QUERY20


---------------------------------------
