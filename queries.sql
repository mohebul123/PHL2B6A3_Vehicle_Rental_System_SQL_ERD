-- 1
SELECT 
b.booking_id,
u.name AS customer_name,
v.name AS vehicle_name,
b.start_date,
b.end_date,
b.status
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id
INNER JOIN vehicles v ON b.vehicle_id = v.vehicle_id;

-- 2
SELECT 
v.vehicle_id,
v.name,
v.type,
v.model,
v.registration_number,
v.rental_price,
v.status
FROM vehicles v
WHERE NOT EXISTS (
  SELECT 1 FROM bookings b WHERE b.vehicle_id = v.vehicle_id
);
-- 3
SELECT
vehicle_id,
name,
type,
model,
registration_number,
rental_price,
status
FROM vehicles
WHERE type = 'car' AND status = 'available';
-- 4
SELECT
v.name AS vehicle_name,
COUNT(*) AS total_bookings
FROM bookings b
INNER JOIN vehicles v ON b.vehicle_id = v.vehicle_id
GROUP BY v.name
HAVING COUNT(*) > 2;

