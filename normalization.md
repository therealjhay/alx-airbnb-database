Database Normalization (To Third Normal Form)
Introduction
This document explains how the AirBnB clone backend database schema meets First Normal Form (1NF), Second Normal Form (2NF), and Third Normal Form (3NF) standards. The schema is directly aligned with your project’s specification, ensuring the absence of redundancy and maintaining data integrity.

First Normal Form (1NF)
All entities in the schema have atomic columns. Each field holds a single value that describes only one property per record.

For example, the User entity uses first_name, email, role, etc., each with single values per row.

No repeating groups, arrays, or composite attributes exist in any entity.

Second Normal Form (2NF)
Non-primary key attributes in every table are fully dependent on the whole primary key.

Each entity uses one primary key (UUID, indexed for performance).

All data in Booking, for example, is dependent only on booking_id—not on user_id or property_id alone.

User and property details are never duplicated in child tables; instead, foreign keys link related records.

Third Normal Form (3NF)
No transitive dependencies are present. All non-key attributes are dependent strictly on their table’s primary key.

For instance, Payment attributes (amount, payment_date, payment_method, etc.) depend only on payment_id. Booking and user details are referenced by foreign keys, not stored in Payment.

The Review entity references users and properties through foreign keys rather than duplicating details.

ENUM fields (role, status, payment_method) preserve data quality and ensure controlled values.

Constraints such as email uniqueness, Review rating bounds (1–5), and the enforcement of foreign keys ensure continued normalization.

Entity Relationships
A User can own multiple Properties, create multiple Bookings, and exchange Messages.

Each Property can have multiple Bookings and Reviews.

Bookings link to one Property and one User.

Payments are tied to individual Bookings.

Reviews connect a User with a Property.

Messages are sent and received between Users.

Summary
The AirBnB backend schema is properly normalized:

There is no redundant data, and no partial or transitive dependencies.

Business entities are separated, connected only by relational keys (UUID FKs).

Controlled data entry and referential integrity are maintained through constraints and foreign key relationships.
