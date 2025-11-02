-- Initial Query: Retrieve all bookings with user, property, and payment details, filtered to recent, confirmed bookings over $200
SELECT 
    Booking.booking_id,
    Booking.start_date,
    Booking.end_date,
    Booking.status,
    "User".user_id,
    "User".first_name,
    "User".last_name,
    Property.property_id,
    Property.name AS property_name,
    Property.location,
    Payment.payment_id,
    Payment.amount,
    Payment.payment_method
FROM Booking
JOIN "User" ON Booking.user_id = "User".user_id
JOIN Property ON Booking.property_id = Property.property_id
LEFT JOIN Payment ON Payment.booking_id = Booking.booking_id
WHERE Booking.status = 'confirmed'
  AND Payment.amount > 200
ORDER BY Booking.start_date DESC;

-- Analyze with:
-- EXPLAIN ANALYZE ...
--
-- This query only returns confirmed bookings with payments above $200,
-- demonstrating WHERE and AND to further optimize filtering before joins.

-- Refactored/Optimized Query Example
-- (select only needed columns and use indexed fields for WHERE)
SELECT 
    Booking.booking_id,
    Booking.start_date,
    "User".first_name,
    Property.name AS property_name,
    Payment.amount
FROM Booking
JOIN "User" ON Booking.user_id = "User".user_id
JOIN Property ON Booking.property_id = Property.property_id
LEFT JOIN Payment ON Payment.booking_id = Booking.booking_id
WHERE Booking.status = 'confirmed'
  AND Payment.amount > 200
ORDER BY Booking.start_date DESC;
