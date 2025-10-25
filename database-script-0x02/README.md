## Sample Data

### Overview
The database includes sample seed data to help with testing and development. This data simulates real-world usage scenarios with multiple users, properties, bookings, payments, reviews, and messages.

### Seed Data File
- **File**: `seed.sql`
- **Description**: Contains SQL `INSERT` statements for populating all tables with realistic sample data.

### Sample Data Summary

#### Users (5 records)
- 2 Guests (John Doe, Bob Williams)
- 2 Hosts (Jane Smith, Alice Johnson)
- 1 Admin (Admin User)

#### Properties (4 records)
- Cozy Apartment in Downtown, New York ($120/night)
- Luxury Villa with Ocean View, Malibu ($450/night)
- Modern Loft in Tech District, San Francisco ($200/night)
- Charming Cottage in the Countryside, Austin ($95/night)

#### Bookings (4 records)
- 2 confirmed bookings
- 1 pending booking
- 1 canceled booking

#### Payments (3 records)
- Payments using credit card, PayPal, and Stripe

#### Reviews (4 records)
- Ratings ranging from 3 to 5 stars
- Detailed comments from guests

#### Messages (4 records)
- Sample conversations between users and hosts

---

## How to Load Sample Data

### Prerequisites
- Database already created and schema applied (see `schema.sql`)

### Steps

1. **Run Seed Script**

psql -d airbnb_clone -f seed.sql

2. **Verify Data**
SELECT * FROM "User";
SELECT * FROM Property;
SELECT * FROM Booking;
SELECT * FROM Payment;
SELECT * FROM Review;
SELECT * FROM Message;


3. **Check Record Counts**
SELECT 'Users' AS table_name, COUNT() FROM "User"
UNION ALL
SELECT 'Properties', COUNT() FROM Property
UNION ALL
SELECT 'Bookings', COUNT() FROM Booking
UNION ALL
SELECT 'Payments', COUNT() FROM Payment
UNION ALL
SELECT 'Reviews', COUNT() FROM Review
UNION ALL
SELECT 'Messages', COUNT() FROM Message;


---

## Notes on Sample Data
- All passwords are hashed using bcrypt (sample hashes provided).
- UUIDs are predefined for consistency in testing.
- Sample data reflects various booking statuses (pending, confirmed, canceled).
- Payment methods include all supported types (credit_card, paypal, stripe).
- Reviews demonstrate the rating constraint (1-5 stars).

---

## Resetting Sample Data
To clear all sample data and start fresh:

TRUNCATE TABLE Message, Review, Payment, Booking, Property, "User" CASCADE;


Then re-run `seed.sql` to reload the sample data.