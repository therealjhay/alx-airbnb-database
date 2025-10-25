# Database Schema - AirBnB Clone

## Overview
This directory contains the SQL schema definition for the AirBnB clone backend project. The schema is designed to be normalized to the third normal form (3NF) and includes all necessary tables, constraints, relationships, and indexes for optimal performance.

---

## Database Structure

### Tables
1. **User** - Stores user account information including authentication and role.
2. **Property** - Contains property listings created by hosts.
3. **Booking** - Records all bookings made by users for properties.
4. **Payment** - Stores payment transaction details related to bookings.
5. **Review** - Manages user reviews and ratings for properties.
6. **Message** - Facilitates communication between users.

---

## Schema File

- **File**: `schema.sql`
- **Description**: Contains all `CREATE TABLE` statements, constraints, foreign keys, and indexes.

---

## Key Features

### Data Types
- **UUID**: Used for all primary keys to ensure global uniqueness.
- **VARCHAR**: For text fields with defined maximum lengths.
- **TEXT**: For longer content like descriptions, comments, and messages.
- **DECIMAL**: For monetary values (prices, payments).
- **DATE/TIMESTAMP**: For date and time tracking.
- **ENUM**: For controlled values (`role`, `status`, `payment_method`).

### Constraints
- **Primary Keys**: All tables have UUID primary keys.
- **Foreign Keys**: Establish relationships between entities with `ON DELETE CASCADE` for referential integrity.
- **Unique Constraints**: Ensure `email` is unique in the User table.
- **Check Constraints**: Validate rating values (1-5) in the Review table.
- **NOT NULL**: Enforce required fields across all tables.

### Indexes
Indexes are created on frequently queried columns to optimize performance:
- `User.email`
- `Property.host_id`
- `Booking.property_id`, `Booking.user_id`
- `Payment.booking_id`
- `Review.property_id`, `Review.user_id`
- `Message.sender_id`, `Message.recipient_id`

---

## How to Use

### Prerequisites
- PostgreSQL 12+ installed
- Database client (psql, pgAdmin, DBeaver, etc.)

### Steps to Create Database

1. **Create Database**

createdb airbnb_clone


2. **Run Schema Script**
psql -d airbnb_clone -f schema.sql


3. **Verify Tables**
\dt


4. **Check Constraints and Indexes**
\d User
\d Property
\d Booking



---

## Entity Relationships

- **User → Property**: One-to-Many (A user can host multiple properties)
- **User → Booking**: One-to-Many (A user can make multiple bookings)
- **Property → Booking**: One-to-Many (A property can have multiple bookings)
- **Booking → Payment**: One-to-One (Each booking has one payment)
- **Property → Review**: One-to-Many (A property can have multiple reviews)
- **User → Review**: One-to-Many (A user can write multiple reviews)
- **User → Message**: One-to-Many (Both sender and recipient)

---

## Notes
- This schema uses PostgreSQL-specific syntax (e.g., ENUM types, `gen_random_uuid()`).
- For MySQL, adjust ENUM creation and use `UUID()` or `CHAR(36)` for UUIDs.
- Ensure proper indexing strategy based on query patterns as the application scales.

---

## Next Steps
- Populate database with sample data (see `seed.sql` if available).
- Set up Django models or ORM mappings.
- Implement API endpoints to interact with this schema.


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