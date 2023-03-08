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
SELECT e.connection_name, 
s.from_unit, s.to_unit, s.rate
FROM electricity_connection_type e
INNER JOIN slab s 
ON e.id = s.connection_type_id
ORDER BY rate ASC;

-----------------------------
--Query-4
SELECT bu.owner_name, bu.address, 
m.meter_number, b.total_units
FROM building bu, meter m, bill b
WHERE bu.id = m.building_id
AND m.id = b.meter_id
AND (b.month) = 12
AND b.year = 2017
ORDER BY b.total_units DESC;

-----------------------------
--Query-5
SELECT ect.connection_name,  
COUNT(*) AS connection_count
FROM electricity_connection_type ect,
building_type bt, building b WHERE
ect.id = bt.connection_type_id AND
bt.id = b.building_type_id
GROUP BY ect.connection_name
ORDER BY connection_count DESC;

-----------------------------
--Query-6
SELECT r.id, r.route_name, tp.id, 
tp.travel_card_id, tp.entry_station_id, 
tp.entry_time, tp.exit_station_id, 
tp.exit_time, tp.amount  FROM 
route r, station_route sr, travel_payment tp
WHERE r.id = sr.route_id AND
sr.station_id = tp.entry_station_id
ORDER BY r.route_name;

-----------------------------
--Query-7
SELECT r.route_name FROM
((route r INNER JOIN station_route sr
ON r.id = sr.route_id)
 INNER JOIN station s on s.id = sr.station_id)
 WHERE s.name = 'Woodlands MRT station'
 ORDER BY r.route_name ASC;

-----------------------------
--Query-8
SELECT tc.person_name, tc.contact_number,
tc.balance, tp.entry_time, tp.exit_time
FROM (
  (travel_card tc INNER JOIN travel_payment tp
  ON tc.id = tp.travel_card_id) 
    INNER JOIN station s
    ON s.id = tp.entry_station_id)
WHERE s.name = 'Sengkang MRT station'
ORDER BY tc.person_name ASC;

-----------------------------
--Query-9
SELECT * FROM 
 travel_card tc
INNER JOIN travel_payment tp
ON tp.travel_card_id = tc.id
WHERE tp.amount > 25 AND
DATE(tp.exit_time) = '2017-12-21'
ORDER BY tc.person_name ASC;

-----------------------------
--Query-10
SELECT mt.position, mt.updated_time,
mt.forward, ts.scheduled_time, tat.actual_time
FROM metro_train mt, train_schedule ts,
train_arrival_time tat, route r
WHERE mt.id = tat.metro_train_id
AND ts.id = tat.train_schedule_id
AND r.id = mt.route_id
AND (r.route_name = 'North South line'
OR r.route_name = 'Circle line')
ORDER BY mt.position ASC;

-----------------------------
--Query-11
SELECT tc.person_name, tc.contact_number
FROM travel_payment tp, travel_card tc,
route r, station_route sr
WHERE sr.route_id = r.id
AND sr.station_id = tp.exit_station_id
AND tc.id = tp.travel_card_id
AND r.route_name = 'North East line'
AND tp.amount > 25
ORDER BY tc.person_name ASC;

-----------------------------
--Query-12
SELECT s.name, s.locality
FROM route r, station_route sr, 
station s, train_schedule ts
WHERE r.id = sr.route_id
AND s.id = sr.station_id
AND s.id = ts.station_id
AND DATE(ts.scheduled_time) = '2017-12-21'
AND r.route_name = 'Circle line'
ORDER BY s.name;

-----------------------------
--Query-13
SELECT person_name, contact_number, balance
FROM travel_card WHERE balance =(
  SELECT DISTINCT balance 
  FROM travel_card ORDER BY balance LIMIT 1,1)
ORDER BY person_name DESC;

-----------------------------
--Query-14
SELECT tc.person_name, tc.contact_number, 
tc.balance, tp.entry_time, tp.exit_time
FROM travel_card tc, travel_payment tp
WHERE tp.travel_card_id = tc.id 
AND tc.balance = (
  SELECT  DISTINCT balance 
  FROM travel_card ORDER BY balance 
  DESC LIMIT 1,1)
ORDER BY person_name;

-----------------------------
--Query-15
SELECT tc.person_name, tc.contact_number,
tc.balance FROM travel_card tc, travel_payment tp
WHERE tc.id = tp.travel_card_id
GROUP BY tc.id HAVING COUNT(tp.id)  = (
	 SELECT COUNT(id) 
	 FROM travel_payment 
	 GROUP BY travel_card_id
	 ORDER BY COUNT(id) DESC LIMIT 1)
ORDER BY tc.person_name  DESC;

-----------------------------
