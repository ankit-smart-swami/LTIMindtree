--Query-1
SELECT 
    m.meter_number,
    bu.owner_name,
    bu.address,
    bu.contact_number,
    bt.name,
    ect.connection_name
FROM
    (((meter m
    INNER JOIN building bu ON m.building_id = bu.id)
    INNER JOIN building_type bt ON bu.building_type_id = bt.id)
    INNER JOIN electricity_connection_type ect ON bt.connection_type_id = ect.id)
ORDER BY bu.owner_name ASC , m.meter_number ASC;

--------------------------------------------
--Query-2
SELECT 
    b.owner_name, b.address, COUNT(*) AS connection_count
FROM
    building b
        INNER JOIN
    meter m ON b.id = m.building_id
GROUP BY m.building_id
ORDER BY b.owner_name ASC;

--------------------------------------------
--Query-3
SELECT
    bu.owner_name, bu.address, m.meter_number, b.payable_amount
FROM
    ((building bu
    INNER JOIN meter m ON bu.id = m.building_id)
    INNER JOIN bill b ON m.id = b.meter_id)
WHERE
        b.month = '12' AND b.year = '2017'
        AND b.fine_amount IS NULL
        ORDER BY bu.owner_name ASC;

--------------------------------------------
--Query-4
SELECT 
    bu.owner_name, bu.address, m.meter_number, b.payable_amount
FROM
    ((building bu
    INNER JOIN meter m ON bu.id = m.building_id)
    INNER JOIN bill b ON m.id = b.meter_id)
WHERE
    b.fine_amount = (SELECT 
            MAX(fine_amount)
        FROM
            bill)
ORDER BY bu.owner_name ASC;

--------------------------------------------
--Query-5
SELECT 
    bu.owner_name, SUM(b.payable_amount) AS TotalBillAmount
FROM
    ((building bu
    INNER JOIN meter m ON bu.id = m.building_id)
    INNER JOIN bill b ON m.id = b.meter_id)
WHERE
    b.year = 2017
GROUP BY bu.owner_name
HAVING TotalBillAmount = (SELECT 
        SUM(b.payable_amount) AS S
    FROM
        ((building bu
        INNER JOIN meter m ON bu.id = m.building_id)
        INNER JOIN bill b ON m.id = b.meter_id)
    WHERE
        b.year = 2017
    GROUP BY bu.owner_name
    ORDER BY S DESC
    LIMIT 1)
ORDER BY bu.owner_name ASC;

--------------------------------------------
--Query-6
SELECT 
    bu.owner_name,
    bt.name,
    m.meter_number,
    IF(b.payment_date,
        b.payment_date,
        'Not Paid Yet') AS Payment_Status
FROM
    (((building_type bt
    INNER JOIN building bu ON bt.id = bu.building_type_id)
    INNER JOIN meter m ON bu.id = m.building_id)
    INNER JOIN bill b ON m.id = b.meter_id)
WHERE
    b.month = 12 AND b.year = 2017
ORDER BY bu.owner_name;

--------------------------------------------
--Query-7
SELECT 
    bt.name, COUNT(bt.name) AS number_of_buildings
FROM
    building_type bt
        INNER JOIN
    building b ON bt.id = b.building_type_id
GROUP BY bt.name
HAVING number_of_buildings = (SELECT 
        COUNT(bt.name) C
    FROM
        building_type bt
            INNER JOIN
        building b ON bt.id = b.building_type_id
    GROUP BY bt.name
    ORDER BY C DESC
    LIMIT 1)
ORDER BY bt.name;

--------------------------------------------
--Query-8
SELECT 
    m.meter_number, bu.owner_name, bu.address
FROM
    ((building bu
    INNER JOIN meter m ON bu.id = m.building_id)
    INNER JOIN bill b ON m.id = b.meter_id)
WHERE
    b.fine_amount IS NOT NULL
GROUP BY m.building_id
HAVING COUNT(b.id) = (SELECT 
        COUNT(*) F
    FROM
        meter m
            INNER JOIN
        bill b ON m.id = b.meter_id
    WHERE
        b.fine_amount IS NOT NULL
    GROUP BY m.building_id
    ORDER BY F DESC
    LIMIT 1)
ORDER BY bu.owner_name ASC;

--------------------------------------------
--Query-9
SELECT 
    m.meter_number, bu.owner_name, bu.address
FROM
    ((building bu
    INNER JOIN meter m ON bu.id = m.building_id)
    INNER JOIN bill b ON m.id = b.meter_id)
WHERE
    b.fine_amount = (SELECT 
            SUM(b.fine_amount) AS S
        FROM
            meter m
                INNER JOIN
            bill b ON m.id = b.meter_id
        WHERE
            b.fine_amount IS NOT NULL
        GROUP BY m.building_id
        ORDER BY S
        LIMIT 1 , 1);

--------------------------------------------
--Query-10


--------------------------------------------
