--Query 1

INSERT INTO building_type VALUES
(1,"Ankit",1),
(2,"Aditya",2),
(3,"Amit",1),
(4,"Anuj",3),
(5,"Arpit",2);

--******************************************

--Query 2 

UPDATE building_type 
SET name = 'Mall' 
WHERE name = 'Shopping Mall';

--******************************************

--Query 3

DELETE FROM building_type
WHERE connection_type_id = 1;

--******************************************
