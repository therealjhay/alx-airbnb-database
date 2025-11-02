-- Initial Query: Retrieve all bookings with user, property, and payment details
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
ORDER BY Booking.start_date DESC;

-- Analyze this original query with:
-- EXPLAIN ANALYZE
-- [Paste the query above, then study the cost, rows, node type, and sequential/index scan usage]

-- Refactored/Optimized Query:

-- Ensure indexes exist for Booking.user_id, Booking.property_id, Payment.booking_id:
-- CREATE INDEX IF NOT EXISTS idx_booking_user_id ON Booking(user_id);
-- CREATE INDEX IF NOT EXISTS idx_booking_property_id ON Booking(property_id);
-- CREATE INDEX IF NOT EXISTS idx_payment_booking_id ON Payment(booking_id);

-- If only summary information or specific columns are needed, reduce the SELECT fields.

-- Optimized Query Example (same as above, but can further limit columns/filter if needed).
SELECT 
    Booking.booking_id,
    Booking.start_date,
    Booking.end_date,
    Booking.status,
    "User".first_name,
    "User".last_name,
    Property.name AS property_name,
    Payment.amount,
    Payment.payment_method
FROM Booking
JOIN "User" ON Booking.user_id = "User".user_id
JOIN Property ON Booking.property_id = Property.property_id
LEFT JOIN Payment ON Payment.booking_id = Booking.booking_id
ORDER BY Booking.start_date DESC;
