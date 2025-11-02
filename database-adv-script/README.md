# Advanced SQL Joins – Airbnb Clone Database

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