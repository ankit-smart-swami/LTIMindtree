--QUERY 1
SELECT  MIN(batch) AS Senior_PM_Batch
FROM profile
WHERE designation = 'Project Manager';

----------------------------------
--QUERY 2
SELECT  MAX(batch) AS Junior_PM_Batch
FROM profile
WHERE designation = 'Project Manager';


----------------------------------
--QUERY 3
SELECT AVG(total_units) AS
average_units_of_electricity
FROM electricity_reading;

----------------------------------
--QUERY 4
SELECT AVG(payable_amount) AS
average_payable_amount
FROM bill 
WHERE payable_amount > 10000;

----------------------------------
--QUERY 5
SELECT SUM(payable_amount) AS
sum_payable_amount
FROM bill;

----------------------------------
--QUERY 6
SELECT SUM(payable_amount) AS
sum_payable_amount
FROM bill
WHERE due_date = '2017-10-01';

----------------------------------
--QUERY 7
SELECT MIN(total_units) AS
min_total_units
FROM electricity_reading;

----------------------------------
--QUERY 8
SELECT AVG(h8) AS
average_8th_hour_consumption
FROM electricity_reading;

----------------------------------
--QUERY 9
SELECT SUM(payable_amount + fine_amount)
AS sum_payable_and_fine_amount
FROM bill WHERE fine_amount IS NOT NULL;

----------------------------------
--QUERY 10
SELECT SUM(h12) AS
sum_12th_hour_consumption
FROM electricity_reading;

----------------------------------
--QUERY 11
SELECT SUM(payable_amount)
AS sum_payable_amount
FROM bill WHERE 
YEAR(payment_date) = '2018';

----------------------------------
