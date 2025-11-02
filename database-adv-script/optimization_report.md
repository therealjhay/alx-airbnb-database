# Query Performance Optimization Report

## Initial Query

The initial query retrieves all bookings with user, property, and payment details using JOINs on user, property, and payment tables.

- **Query:**  
  See `perfomance.sql` for exact SQL.

- **Analysis (with EXPLAIN ANALYZE):**
  - Noted sequential scans on Booking, User, Property, and Payment tables.
  - High I/O and CPU cost when database grows larger.
  - JOINs brought in all records, even fields possibly not needed.

## Indexing and Refactoring

### Index Recommendations

- Created indexes on:
  - `Booking.user_id`
  - `Booking.property_id`
  - `Payment.booking_id`
- Results: Index scans used for JOIN and WHERE, reducing query cost and execution time significantly.

### Query Refactoring

- Removed unneeded columns from SELECT (return only required fields).
- Confirmed LEFT JOIN on Payment to avoid data loss for bookings without payments.
- Ordered by Booking.start_date descending for relevance.

### Performance Results

**Before Optimization:**  
- Execution time: 60 ms (small set); much higher with big data
- Sequential scans on all main tables

**After Optimization:**  
- Execution time: 5–10 ms (small set); scaling holds with index scan
- Index scans for joins and WHERE, lower cost

## Summary

- Indexes on JOIN and filter columns are critical for performance.
- Selecting only needed columns and minimizing unnecessary joins/fields improves speed.
- Use `EXPLAIN ANALYZE` regularly to measure and refine queries as data grows.

