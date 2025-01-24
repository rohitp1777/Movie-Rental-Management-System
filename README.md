# Movie-Rental-Management-System
This Project Is Based on Movie Rental Management System
# Movie Rental Management System

This project is a Movie Rental Management System built using SQL. 

## Database Structure

The system utilizes a relational database with the following tables:

* **Customer:** Stores information about customers, including CustomerID, FirstName, LastName, Email, PhoneNumber, and RegistrationDate.
* **Movie:** Stores information about movies, including MovieID, Title, Genre, ReleaseYear, Rating, and PricePerDay.
* **Rental:** Stores rental information, including RentalID, CustomerID, MovieID, RentalDate, ReturnDate, and RentalStatus.
* **Payment:** Stores payment information, including PaymentID, RentalID, PaymentDate, Amount, and PaymentMethod.

## Features

* **Customer Management:**
    - Add, view, and update customer information.
* **Movie Management:**
    - Add, view, and update movie information.
* **Rental Management:**
    - Rent movies to customers.
    - Record movie returns.
    - Track pending rentals.
* **Payment Management:**
    - Record payments for rentals.
    - Generate payment reports.
* **Reporting:**
    - Generate reports on revenue, rental history, and customer spending.

## Usage

1. **Create the database:**
   ```sql
   create database movie_rental;
   use movie_rental;
   Create tables and populate with data:
2. Refer to the provided SQL code for table creation and data insertion.

3.Run queries:
Execute the provided SQL queries to interact with the database and retrieve information.

