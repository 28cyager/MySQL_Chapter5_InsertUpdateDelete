/**************************************
DATE: 2026.10.15
NAMES: Christian 
Chapter 5 assignment
GitHub URL: https://github.com/28cyager/MySQL_Chapter5_InsertUpdateDelete
**************************************/

/********************************************
Christian Yager
Exercise 1
•	Part 1.1) Write a query that determines how many records are in the customer table, and document
•	Part 1.2) Write a statement that creates a complete backup table for the customer table 
•	Part 1.3) Write a query that verifies your newly created backup table has the same number of rows as the original table
 •	Part 1.4) Use the MySQL CHECKSUM to verify the two tables are the same
*********************************************/
SELECT COUNT(customer_id)
FROM customer;

CREATE TABLE customer_full_backup
SELECT *
FROM customer;

SELECT *
FROM customer_full_backup;

CHECKSUM TABLE customer, customer_full_backup;

/********************************************
Christian Yager
Exercise 2:
•	Part 2.1) Write three queries to determine the following:
o	2.1.A How many records are in the rental table, and document
o	2.1.B How many rentals have been returned (based on return_date) and document 
o	2.1.C How many rentals have NOT been returned (based on return_date), and document
•	Part 2.2) Write statements to create a partial backup of the rental table 
for all rentals that have been returned. Name your backup table returned_rental
*********************************************/
SELECT *
FROM rental;

SELECT COUNT(*)
FROM rental
WHERE return_date IS NOT NULL;

SELECT COUNT(*)
FROM rental
WHERE return_date IS NULL;

CREATE TABLE returned_rental AS
SELECT *
FROM rental
WHERE return_date IS NOT NULL;

/********************************************
Christian Yager
Excercise 3:
•	Write one or two statements that will drop the backup tables from Exercise 1 and 2
*********************************************/
DROP TABLE returned_rental;
DROP TABLE customer_full_backup

/********************************************
Christian Yager
Exercise 4:
•	Part 4.1: Write multiple statements to setup yourself as a new customer with a new city and address
o	use DEFAULT for auto increment columns
o	use NULL for columns that allow null values
o	use DEFAULT for columns with default values 
*********************************************/
INSERT INTO city VALUES
(DEFAULT, "Allen", 103, DEFAULT);
SELECT *
FROM city
WHERE city_id = 601;

INSERT INTO address VALUES
(DEFAULT, "420 Lincoln St", NULL, "Nebraska", 601, NULL, "111-222-3333", DEFAULT);
SELECT *
FROM address
WHERE city_id = 601;

INSERT INTO customer VALUES
(DEFAULT, 1, "Debbie", "Johnson", NULL, 606, 1, "2025-02-26 15:14:52", "2025-02-26 15:14:52");
SELECT *
FROM customer
WHERE address_id = 606;
