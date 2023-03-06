--Query-1
SELECT * FROM
bill b INNER JOIN meter m
ON m.id = b.meter_id
ORDER BY b.payable_amount;

-----------------------------
--Query-2
SELECT m.meter_number, b.owner_name,
b.address, b.contact_number
FROM meter m INNER JOIN building b
ON b.id = m.building_id
ORDER BY b.owner_name ASC, m.meter_number ASC;

-----------------------------
--Query-3


-----------------------------
--Query-4


-----------------------------
--Query-5


-----------------------------
--Query-6


-----------------------------
--Query-7


-----------------------------
--Query-8


-----------------------------
--Query-9


-----------------------------
--Query-10


-----------------------------
--Query-11


-----------------------------
--Query-12


-----------------------------
--Query-13


-----------------------------
--Query-14


-----------------------------
--Query-15


-----------------------------
