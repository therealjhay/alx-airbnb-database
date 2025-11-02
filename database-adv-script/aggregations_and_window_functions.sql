-- 1. Find the total number of bookings made by each user
SELECT
    "User".user_id,
    "User".first_name,
    "User".last_name,
    COUNT(Booking.booking_id) AS total_bookings
FROM "User"
LEFT JOIN Booking ON Booking.user_id = "User".user_id
GROUP BY "User".user_id, "User".first_name, "User".last_name
ORDER BY total_bookings DESC, "User".last_name;

-- 2. Rank properties based on the total number of bookings they have received
SELECT
    Property.property_id,
    Property.name,
    COUNT(Booking.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(Booking.booking_id) DESC) AS booking_rank
FROM Property
LEFT JOIN Booking ON Booking.property_id = Property.property_id
GROUP BY Property.property_id, Property.name
ORDER BY booking_rank, Property.name;
