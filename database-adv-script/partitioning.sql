-- 1. Detach existing Booking table as a parent for partitioning (PostgreSQL syntax)
ALTER TABLE Booking RENAME TO Booking_old;

-- 2. Create new partitioned Booking table by RANGE on start_date
CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- 3. Create partitions by year (extend as needed)
CREATE TABLE Booking_2023 PARTITION OF Booking FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');
CREATE TABLE Booking_2024 PARTITION OF Booking FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');
CREATE TABLE Booking_2025 PARTITION OF Booking FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- 4. (Optional) Insert data from old Booking table to new, then drop old
INSERT INTO Booking SELECT * FROM Booking_old;
DROP TABLE Booking_old;

-- 5. Query Example: Fetch bookings in a date range (uses partition pruning)
EXPLAIN ANALYZE
SELECT * FROM Booking
WHERE start_date BETWEEN '2024-04-01' AND '2024-04-30';
