Database ERD Specification
Entities and Attributes
User
user_id: UUID, PRIMARY KEY, INDEXED

first_name: VARCHAR, NOT NULL

last_name: VARCHAR, NOT NULL

email: VARCHAR, UNIQUE, NOT NULL

password_hash: VARCHAR, NOT NULL

phone_number: VARCHAR, NULL

role: ENUM ('guest', 'host', 'admin'), NOT NULL

created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

Property
property_id: UUID, PRIMARY KEY, INDEXED

host_id: UUID, FOREIGN KEY REFERENCES User(user_id)

name: VARCHAR, NOT NULL

description: TEXT, NOT NULL

location: VARCHAR, NOT NULL

pricepernight: DECIMAL, NOT NULL

created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

updated_at: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

Booking
booking_id: UUID, PRIMARY KEY, INDEXED

property_id: UUID, FOREIGN KEY REFERENCES Property(property_id)

user_id: UUID, FOREIGN KEY REFERENCES User(user_id)

start_date: DATE, NOT NULL

end_date: DATE, NOT NULL

total_price: DECIMAL, NOT NULL

status: ENUM ('pending', 'confirmed', 'canceled'), NOT NULL

created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

Payment
payment_id: UUID, PRIMARY KEY, INDEXED

booking_id: UUID, FOREIGN KEY REFERENCES Booking(booking_id)

amount: DECIMAL, NOT NULL

payment_date: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

payment_method: ENUM ('credit_card', 'paypal', 'stripe'), NOT NULL

Review
review_id: UUID, PRIMARY KEY, INDEXED

property_id: UUID, FOREIGN KEY REFERENCES Property(property_id)

user_id: UUID, FOREIGN KEY REFERENCES User(user_id)

rating: INTEGER, CHECK (rating >= 1 AND rating <= 5), NOT NULL

comment: TEXT, NOT NULL

created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

Message
message_id: UUID, PRIMARY KEY, INDEXED

sender_id: UUID, FOREIGN KEY REFERENCES User(user_id)

recipient_id: UUID, FOREIGN KEY REFERENCES User(user_id)

message_body: TEXT, NOT NULL

sent_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

Relationships & Constraints
User → Property: One-to-Many (A user/host can have multiple properties)

User → Booking: One-to-Many (A user can make multiple bookings)

Property → Booking: One-to-Many (A property can have multiple bookings)

Booking → Payment: One-to-One (Each booking can have only one payment)

Property → Review: One-to-Many (A property can have multiple reviews)

User → Review: One-to-Many (A user can write multiple reviews)

User → Message (sent): One-to-Many (A user can send multiple messages)

User → Message (received): One-to-Many (A user can receive multiple messages)

Constraints and Indexing
Primary keys: All UUIDs and indexed automatically.

Unique constraint: User.email must be unique.

Enumerated types: role, status, payment_method fields restricted to allowed values.

Review.rating: Must be between 1 and 5.

Foreign key relationships enforced as detailed above.

Additional indexes: email (User), property_id (Property, Booking), booking_id (Booking, Payment).