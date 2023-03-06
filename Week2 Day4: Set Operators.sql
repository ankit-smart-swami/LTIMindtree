--QUERY-1
SELECT * FROM building
WHERE owner_name = 'Muzzammil'
UNION
SELECT * FROM building
WHERE owner_name = 'Nicholas'
ORDER BY owner_name ASC, email_address ASC;

---------------------------------
--QUERY-2
SELECT COUNT(*) AS no_of_bills
FROM bill WHERE 
MONTHNAME(payment_date) = 'October'
UNION
SELECT COUNT(*) AS no_of_bills
FROM bill WHERE 
MONTHNAME(payment_date) = 'December'
ORDER BY no_of_bills DESC;

---------------------------------
