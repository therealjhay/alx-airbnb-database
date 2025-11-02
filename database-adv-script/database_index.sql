-- Create index on User.email for frequent WHERE and JOIN lookups
CREATE INDEX idx_user_email ON "User"(email);

-- Create index on Booking.user_id for JOIN and WHERE queries
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- Create index on Booking.property_id for JOIN, WHERE, and ORDER BY queries
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- Create index on Property.location for frequent search queries with WHERE clauses
CREATE INDEX idx_property_location ON Property(location);

-- Create index on Property.name for ORDER BY and WHERE filters
CREATE INDEX idx_property_name ON Property(name);

-- Example: Measure performance using EXPLAIN before and after creating indexes

-- Before index:
-- EXPLAIN ANALYZE SELECT * FROM "User" WHERE email = 'example@mail.com';

-- After index:
-- EXPLAIN ANALYZE SELECT * FROM "User" WHERE email = 'example@mail.com';

-- Similarly test on Booking and Property columns using EXPLAIN and ANALYZE
