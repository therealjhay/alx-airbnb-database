# Advanced SQL Joins 

## Overview

This module demonstrates advanced SQL joining techniques using the simulated Airbnb database schema. The queries show how to connect related tables using different types of joins to answer real-world business questions.

---

## Included Queries

1. **INNER JOIN**  
   Retrieves all bookings and the users who made those bookings by matching `Booking.user_id` to `User.user_id`.

2. **LEFT JOIN**  
   Retrieves all properties and their associated reviews. Properties without reviews are included with `NULL` values for the review fields (`Review.review_id`, `Review.rating`, etc).

3. **FULL OUTER JOIN**  
   Returns all users and bookings, including users who have never made a booking and bookings not linked to a valid user (if any). This can reveal orphan records or users with no activity.

---

## Usage

- Run these queries in your database client (e.g., psql, DBeaver) after loading the Airbnb schema and sample data.
- Review the results to understand how join types affect row inclusion and NULL handling.

## Learning Objectives

- Master SQL joins: INNER, LEFT, FULL OUTER JOIN
- Learn how tabular data is related and retrieved across normalized database tables

---

# SQL Subqueries 

## Overview

This module demonstrates both non-correlated and correlated subqueries within the Airbnb database schema. Subqueries enable complex filtering and aggregation for real-world data analytics.

---

## Included Queries

1. **Non-Correlated Subquery**  
   Finds all properties with an average review rating greater than 4.0. The subquery groups reviews by property and applies a HAVING clause on average score.

2. **Correlated Subquery**  
   Finds users who have made more than 3 bookings. The subquery counts bookings for each user and filters users with more than the threshold bookings.

---

## Usage

- Run these queries in your database client (e.g., psql, DBeaver) with the Airbnb schema and sample data loaded.
- Analyze the results to see powerful filtering and group logic.

## Learning Objectives

- Differentiate between correlated and non-correlated subqueries
- Practice joining, filtering, and aggregating complex data across multiple tables

---

# Aggregations and Window Functions 

## Overview

This module demonstrates SQL aggregation techniques using COUNT and GROUP BY, as well as advanced analytics with window functions (RANK) on the Airbnb database.

---

## Included Queries

1. **Total Bookings Per User**  
   Calculates the number of bookings for each user using `COUNT()` and `GROUP BY`. All users are included (even those with zero bookings).

2. **Property Ranking by Bookings**  
   Lists all properties, counts the number of bookings, and ranks them using the `RANK()` window function so that ties receive the same rank.

---

## Usage

- Run these queries in your SQL client (e.g., psql, DBeaver) after loading the schema and seed data.
- Review results to identify booking trends and top-performing properties.

## Learning Objectives

- Apply group-based aggregation with COUNT and GROUP BY
- Use window functions to rank or number results for analytical reports

---

