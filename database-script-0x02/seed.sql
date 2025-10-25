-- AirBnB Clone Database - Sample Data
-- Description: Seed data for testing and development

-- Insert sample Users
INSERT INTO "User" (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
('550e8400-e29b-41d4-a716-446655440001', 'John', 'Doe', 'john.doe@example.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYIAq5z1234', '+1234567890', 'guest', CURRENT_TIMESTAMP),
('550e8400-e29b-41d4-a716-446655440002', 'Jane', 'Smith', 'jane.smith@example.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYIAq5z5678', '+1234567891', 'host', CURRENT_TIMESTAMP),
('550e8400-e29b-41d4-a716-446655440003', 'Alice', 'Johnson', 'alice.johnson@example.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYIAq5z9012', '+1234567892', 'host', CURRENT_TIMESTAMP),
('550e8400-e29b-41d4-a716-446655440004', 'Bob', 'Williams', 'bob.williams@example.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYIAq5z3456', '+1234567893', 'guest', CURRENT_TIMESTAMP),
('550e8400-e29b-41d4-a716-446655440005', 'Admin', 'User', 'admin@example.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYIAq5z7890', '+1234567894', 'admin', CURRENT_TIMESTAMP);

-- Insert sample Properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at) VALUES
('650e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440002', 'Cozy Apartment in Downtown', 'A beautiful and cozy apartment located in the heart of downtown with easy access to public transport.', 'New York, NY', 120.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('650e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440002', 'Luxury Villa with Ocean View', 'Experience luxury living in this stunning villa overlooking the ocean. Perfect for family vacations.', 'Malibu, CA', 450.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('650e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440003', 'Modern Loft in Tech District', 'A sleek, modern loft ideal for business travelers. High-speed internet and workspace included.', 'San Francisco, CA', 200.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('650e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440003', 'Charming Cottage in the Countryside', 'Escape to the countryside in this charming cottage surrounded by nature. Peaceful and serene.', 'Austin, TX', 95.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insert sample Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
('750e8400-e29b-41d4-a716-446655440001', '650e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440001', '2024-11-01', '2024-11-05', 480.00, 'confirmed', CURRENT_TIMESTAMP),
('750e8400-e29b-41d4-a716-446655440002', '650e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440004', '2024-12-10', '2024-12-15', 2250.00, 'confirmed', CURRENT_TIMESTAMP),
('750e8400-e29b-41d4-a716-446655440003', '650e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440001', '2024-11-20', '2024-11-22', 400.00, 'pending', CURRENT_TIMESTAMP),
('750e8400-e29b-41d4-a716-446655440004', '650e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440004', '2024-10-15', '2024-10-18', 285.00, 'canceled', CURRENT_TIMESTAMP);

-- Insert sample Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method) VALUES
('850e8400-e29b-41d4-a716-446655440001', '750e8400-e29b-41d4-a716-446655440001', 480.00, CURRENT_TIMESTAMP, 'credit_card'),
('850e8400-e29b-41d4-a716-446655440002', '750e8400-e29b-41d4-a716-446655440002', 2250.00, CURRENT_TIMESTAMP, 'paypal'),
('850e8400-e29b-41d4-a716-446655440003', '750e8400-e29b-41d4-a716-446655440004', 285.00, CURRENT_TIMESTAMP, 'stripe');

-- Insert sample Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at) VALUES
('950e8400-e29b-41d4-a716-446655440001', '650e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440001', 5, 'Amazing place! Very clean and the location was perfect. Highly recommend!', CURRENT_TIMESTAMP),
('950e8400-e29b-41d4-a716-446655440002', '650e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440004', 5, 'Absolutely stunning villa. The ocean view was breathtaking. Will definitely come back!', CURRENT_TIMESTAMP),
('950e8400-e29b-41d4-a716-446655440003', '650e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440001', 4, 'Great loft for business trips. Internet was fast and workspace was comfortable.', CURRENT_TIMESTAMP),
('950e8400-e29b-41d4-a716-446655440004', '650e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440004', 3, 'Nice cottage but a bit far from the city. Good for a quiet retreat.', CURRENT_TIMESTAMP);

-- Insert sample Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
('a50e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440002', 'Hi Jane, I am interested in booking your apartment. Is it available next month?', CURRENT_TIMESTAMP),
('a50e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440001', 'Hi John, yes it is available! Let me know your preferred dates.', CURRENT_TIMESTAMP),
('a50e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440003', 'Hello Alice, I would like to inquire about the loft. Does it have parking?', CURRENT_TIMESTAMP),
('a50e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440004', 'Hi Bob, yes we have parking available. Feel free to book anytime!', CURRENT_TIMESTAMP);
