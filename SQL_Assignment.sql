-- # 1 1. Create a table called employees with the following structure?
-- : emp_id (integer, should not be NULL and should be a primary key)Q
-- : emp_name (text, should not be NULL)Q
-- : age (integer, should have a check constraint to ensure the age is at least 18)Q
-- : email (text, should be unique for each employee)Q
-- : salary (decimal, with a default value of 30,000).

-- Write the SQL query to create the above table with all constraints.

-- A- 
CREATE TABLE employees (
    emp_id INTEGER PRIMARY KEY NOT NULL,
    emp_name TEXT NOT NULL,
    age INTEGER CHECK (age >= 18),
    email TEXT UNIQUE,
    salary DECIMAL DEFAULT 30000
);

# 2.  Explain the purpose of constraints and how they help maintain data integrity in a database. Provide examples of common types of constraints.

-- A- Constraints are rules applied to table columns to enforce data accuracy, consistency, and integrity. They ensure that the data entered into a database follows certain rules and prevents invalid or inconsistent data from being stored.

-- By using constraints, we can:

-- Enforce business rules (e.g., no employee under 18)

-- Prevent duplication (e.g., unique emails)

-- Avoid nulls in required fields (e.g., employee name must be present)

-- Maintain relationships between tables (e.g., foreign keys)

-- Set default values when none are provided

# 3. .Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values? Justify your answer.

-- A- The NOT NULL constraint is used to ensure that a column must always have a value—in other words, it cannot be left blank or contain a NULL. This is crucial for fields that are essential to the meaning or identity of a record.

--  Reasons to Use NOT NULL:
-- Data Integrity – Ensures that required information is always provided.

-- Avoid Logical Errors – Prevents issues in queries or operations that rely on complete data.

-- Business Rules Enforcement – Reflects real-world requirements (e.g., an employee must have a name).

# 4.  Explain the steps and SQL commands used to add or remove constraints on an existing table. Provide an example for both adding and removing a constraint

-- A- Adding
ALTER TABLE employees
ADD CONSTRAINT unique_email UNIQUE (email);

-- Removing
ALTER TABLE employees
DROP CONSTRAINT unique_email;

# 5. Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints. Provide an example of an error message that might occur when violating a constraint

-- A- Constraints are there to protect data integrity, so if you try to insert, update, or delete data that violates them, the database will reject the operation and return an error message.

# 6.  You created a products table without constraints as follows:

-- CREATE TABLE products (

--     product_id INT,

--     product_name VARCHAR(50),

--     price DECIMAL(10, 2));  
-- Now, you realise that?
-- : The product_id should be a primary keyQ
-- : The price should have a default value of 50.00

-- A- Adding primary key
ALTER TABLE products
ADD CONSTRAINT pk_product_id PRIMARY KEY (product_id);

-- Set a DEFAULT value for price
ALTER TABLE products
ALTER COLUMN price SET DEFAULT 50.00;

# 7. You have two tables:

 # Write a query to fetch the student_name and class_name for each student using an INNER JOIN

-- A- 
SELECT s.student_name, c.class_name
FROM students s
INNER JOIN classes c ON s.class_id = c.class_id;

#8.  Consider the following three tables:
# Write a query that shows all order_id, customer_name, and product_name, ensuring that all products are listed even if they are not associated with an order 

# Hint: (use INNER JOIN and LEFT JOIN)

-- A- 
SELECT o.order_id, c.customer_name, p.product_name
FROM products p
LEFT JOIN orders o ON p.product_id = o.product_id
LEFT JOIN customers c ON o.customer_id = c.customer_id;

# 9. Given the following tables:

# Write a query to find the total sales amount for each product using an INNER JOIN and the SUM() function.

-- A- 
SELECT 
    p.product_name,
    SUM(o.quantity * o.price) AS total_sales
FROM orders o
INNER JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_name;

# 10. You are given three tables: Write a query to display the order_id, customer_name, and the quantity of products ordered by each customer using an INNER JOIN between all three tables.

-- A- 
SELECT 
    o.order_id,
    c.customer_name,
    od.quantity
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN order_details od ON o.order_id = od.order_id;

# 11. Identify the primary keys and foreign keys in maven movies db. Discuss the differences

-- A- Primary Key:
-- A primary key is a column (or a combination of columns) in a table that uniquely identifies each row in that table.

-- It must have unique values and cannot contain NULL values.

-- Every table can have only one primary key.

-- Foreign Key:
-- A foreign key is a column (or a set of columns) in one table that refers to the primary key of another table.

-- It establishes a link between the two tables.

-- A foreign key ensures referential integrity by restricting actions that would violate the relationships between tables (e.g., preventing a movie from referencing a non-existent director).

# 12.  List all details of actors.
-- A- 
 select * from actor;
 
# 13 -List all customer information from DB.
SELECT *  FROM customer;

# 4 -List different countries 
SELECT *  FROM country;

# 5 -Display all active customers
SELECT *  FROM customer where active = 1; 

# 6 -List of all rental IDs for customer with ID 1.

SELECT rental_id
FROM rental
WHERE customer_id = 1;

# 7 - Display all the films whose rental duration is greater than 5 .
SELECT*  
FROM film
WHERE rental_duration > 5;

# 8 - List the total number of films whose replacement cost is greater than $15 and less than $20
SELECT COUNT(*) AS total_films
FROM film
WHERE replacement_cost > 15 AND replacement_cost < 20;

# 9 - Display the count of unique first names of actors.
SELECT COUNT(DISTINCT first_name) AS unique_first_names
FROM actor;

# 10- Display the first 10 records from the customer table .
SELECT * FROM customer LIMIT 10;

# 11 - Display the first 3 records from the customer table whose first name starts with ‘b’.
SELECT * FROM customer 
WHERE first_name LIKE 'B%' LIMIT 3;

# 12 -Display the names of the first 5 movies which are rated as ‘G’.
select * from film where rating='G' limit 5;

# 13-Find all customers whose first name starts with "a".
select * from customer where first_name LIKE 'a%' ;

# 14- Find all customers whose first name ends with "a".
select * from customer where first_name LIKE '%a' ;

# 15- Display the list of first 4 cities which start and end with ‘a’ .
SELECT * FROM customer 
WHERE first_name LIKE 'a%a';

# 16- Find all customers whose first name have "NI" in any position.
SELECT * FROM customer 
WHERE first_name LIKE '%NI%';

# 17- Find all customers whose first name have "r" in the second position .
SELECT * FROM customer 
WHERE first_name LIKE '_r%';

# 18 - Find all customers whose first name starts with "a" and are at least 5 characters in length.
SELECT * FROM customer
WHERE first_name LIKE 'a%'and length(first_name) >=5;

# 19- Find all customers whose first name starts with "a" and ends with "o".
SELECT * FROM customer
WHERE first_name REGEXP '^a.*o$';

# 20 - Get the films with pg and pg-13 rating using IN operator.
SELECT * FROM film 
WHERE rating IN ('PG', 'PG-13');

# 21 - Get the films with length between 50 to 100 using between operator.
SELECT * FROM film 
WHERE length BETWEEN 50 AND 100;

# 22 - Get the top 50 actors using limit operator.
select * from actor limit 50;

# 23 - Get the distinct film ids from inventory table.
select distinct(film_id) from inventory;

# Basic Aggregate Functions:

#1. Retrieve the total number of rentals made in the Sakila database.
# Hint: Use the COUNT() function.
SELECT COUNT(*) AS total_rentals FROM rental;

#2. Find the average rental duration (in days) of movies rented from the Sakila database.
# Hint: Utilize the AVG() function.
SELECT AVG(rental_duration) AS average_rental_duration
FROM film;

# String Functions:

# 3 Display the first name and last name of customers in uppercase.
#Hint: Use the UPPER () function.
SELECT 
    UPPER(first_name) AS first_name_upper,
    UPPER(last_name) AS last_name_upper
FROM customer;

# 4 Extract the month from the rental date and display it alongside the rental ID.
# Hint: Employ the MONTH() function.
SELECT rental_id, 
MONTH(rental_date) AS rental_month FROM rental;

# GROUP BY:

# 5 Retrieve the count of rentals for each customer (display customer ID and the count of rentals).
#Hint: Use COUNT () in conjunction with GROUP BY.
select customer_id,count(*) as Total_rentals from rental 
group by customer_id;

# 6 Find the total revenue generated by each store.
# Hint: Combine SUM() and GROUP BY.
SELECT s.store_id, SUM(p.amount) AS total_revenue
FROM payment p
JOIN staff s ON p.staff_id = s.staff_id
GROUP BY s.store_id;

# 7 Determine the total number of rentals for each category of movies.
# Hint: JOIN film_category, film, and rental tables, then use cOUNT () and GROUP BY.
SELECT 
    c.name AS category_name,
    COUNT(r.rental_id) AS total_rentals
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY total_rentals DESC;

# 8 Find the average rental rate of movies in each language.
# Hint: JOIN film and language tables, then use AVG () and GROUP BY.
SELECT 
    l.name AS language_name, 
    AVG(f.rental_rate) AS avg_rental_rate
FROM language AS l
JOIN film AS f ON l.language_id = f.language_id
GROUP BY l.name;

# Joins

# 9 Display the title of the movie, customer s first name, and last name who rented it.
# Hint: Use JOIN between the film, inventory, rental, and customer tables.
SELECT 
    f.title AS movie_title,
    c.first_name AS customer_first_name,
    c.last_name AS customer_last_name
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN customer c ON r.customer_id = c.customer_id;

# 10 Retrieve the names of all actors who have appeared in the film "Gone with the Wind."
# Hint: Use JOIN between the film actor, film, and actor tables.
SELECT CONCAT(first_name, ' ', last_name) AS Actor_name
FROM actor AS a
JOIN film_actor AS fa ON a.actor_id = fa.actor_id
JOIN film AS f ON f.film_id = fa.film_id
WHERE f.title = 'Gone with the Wind';
select description from film where description = 'Gone with the Wind';

# 11 Retrieve the customer names along with the total amount they've spent on rentals.
# Hint: JOIN customer, payment, and rental tables, then use SUM() and GROUP BY.

# Creating column name as full name
ALTER TABLE customer
ADD COLUMN full_name VARCHAR(100);

UPDATE customer
SET full_name = CONCAT(first_name, ' ', last_name);

SELECT 
    c.customer_id, 
    c.full_name, 
    SUM(p.amount) AS total_spent
FROM 
    payment AS p
JOIN 
    customer AS c ON c.customer_id = p.customer_id
GROUP BY 
    c.full_name, c.customer_id
ORDER BY 
    c.full_name;


# 12 List the titles of movies rented by each customer in a particular city (e.g., 'London').
# Hint: JOIN customer, address, city, rental, inventory, and film tables, then use GROUP BY.
# Advanced Joins and GROUP BY:
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,
    ci.city,
    f.title
FROM 
    customer c
JOIN 
    address a ON c.address_id = a.address_id
JOIN 
    city ci ON a.city_id = ci.city_id
JOIN 
    rental r ON c.customer_id = r.customer_id
JOIN 
    inventory i ON r.inventory_id = i.inventory_id
JOIN 
    film f ON i.film_id = f.film_id
WHERE 
    ci.city = 'London'
GROUP BY 
    c.customer_id, f.film_id, full_name, ci.city, f.title
ORDER BY 
    full_name, f.title;

# 13 Display the top 5 rented movies along with the number of times they've been rented.
# Hint: JOIN film, inventory, and rental tables, then use COUNT () and GROUP BY, and limit the results.
SELECT 
    f.title,
    COUNT(r.rental_id) AS times_rented
FROM 
    film f
JOIN 
    inventory i ON f.film_id = i.film_id
JOIN 
    rental r ON i.inventory_id = r.inventory_id
GROUP BY 
    f.film_id, f.title
ORDER BY 
    times_rented DESC
LIMIT 5;

#14 Determine the customers who have rented movies from both stores (store ID 1 and store ID 2).
# Hint: Use JOINS with rental, inventory, and customer tables and consider COUNT() and GROUP BY.
SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS full_name
FROM 
    customer c
JOIN 
    rental r ON c.customer_id = r.customer_id
JOIN 
    inventory i ON r.inventory_id = i.inventory_id
GROUP BY 
    c.customer_id, full_name
HAVING 
    COUNT(DISTINCT i.store_id) = 2;

# Windows Function:

# 1. Rank the customers based on the total amount they've spent on rentals.

    SELECT 
        c.customer_id,
        CONCAT(c.first_name, ' ', c.last_name) AS full_name,
        SUM(p.amount) AS total_spending
    FROM 
        payment p
    JOIN 
        customer c ON c.customer_id = p.customer_id
    GROUP BY 
        c.customer_id, full_name
ORDER BY 
    total_spending DESC;


# 2. Calculate the cumulative revenue generated by each film over time.
select (f.title) as film,
p.payment_date,
sum(p.amount) over(partition by f.film_id order by p.payment_date) as total_amount
FROM 
    payment p
JOIN 
    rental as r ON p.rental_id = r.rental_id
JOIN 
    inventory as  i ON r.inventory_id = i.inventory_id
JOIN 
    film as f ON i.film_id = f.film_id

ORDER BY 
    f.title, p.payment_date;

# 3. Determine the average rental duration for each film, considering films with similar lengths.
select title,ROUND(avg(rental_duration)) as rental_duration from film
group by title order by  avg(rental_duration) ;

# 4. Identify the top 3 films in each category based on their rental counts.
select * from inventory;
select * from film_category;
select * from category;
select * from inve;

WITH cte AS (
    SELECT 
        c.name AS category,
        f.title,
        COUNT(r.rental_id) AS rental,
        RANK() OVER(PARTITION BY c.name ORDER BY COUNT(r.rental_id) DESC) AS rnk
    FROM 
        category AS c
        JOIN film_category AS fc ON c.category_id = fc.category_id
        JOIN film AS f ON f.film_id = fc.film_id
        JOIN inventory AS i ON i.film_id = f.film_id
        JOIN rental AS r ON r.inventory_id = i.inventory_id
    GROUP BY 
        c.name, f.title
)
SELECT * 
FROM cte
WHERE rnk <= 3
ORDER BY  rnk;

# 5. Find the monthly revenue trend for the entire rental store over time.
select * from payment;

select month(payment_date) as month, 
sum(amount) as total_monthly_revenue from payment
group by month(payment_date)
order by month(payment_date) desc;

# 6. Identify the customers whose total spending on rentals falls within the top 20% of all customers.
select * from payment;

with cx_20percent as (select customer_id, sum(amount) as total_spending ,
percent_rank() over(order by sum(amount)) as spending_rnk from payment
group by customer_id)

select customer_id,
FORMAT(total_spending, 2) AS total_spending,
FORMAT(spending_rnk, 2) AS spending_rnk
    from cx_20percent
where spending_rnk>=0.8
group by customer_id;

# 7. Calculate the running total of rentals per category, ordered by rental count.
select * from payment;
select *from film_category;
select * from film;

with cte2 as (Select
        c.name AS category,
        COUNT(r.rental_id) AS rental_count
      
    FROM  category c
        JOIN film_category fc ON c.category_id = fc.category_id
        JOIN film f ON fc.film_id = f.film_id
        JOIN inventory i ON f.film_id = i.film_id
        JOIN rental r ON i.inventory_id = r.inventory_id
        group by c.name)
        
select category,
SUM(rental_count) OVER (ORDER BY rental_count DESC) AS running_total
 from cte2
 group by category
 order by rental_count;

#8. Find the films that have been rented less than the average rental count for their respective categories.
  
  WITH FilmRentalCounts AS (
    SELECT 
        f.film_id,
        f.title,
        c.name AS category,
        COUNT(r.rental_id) AS rental_count
    FROM 
        film f
        JOIN film_category fc ON f.film_id = fc.film_id
        JOIN category c ON fc.category_id = c.category_id
        JOIN inventory i ON f.film_id = i.film_id
        JOIN rental r ON i.inventory_id = r.inventory_id
    GROUP BY 
        f.film_id, f.title, c.name
),
CategoryAvg AS (
    SELECT 
        category,
        AVG(rental_count) AS avg_rental_count
    FROM 
        FilmRentalCounts
    GROUP BY 
        category
)
SELECT 
    f.title,
    f.category,
    f.rental_count,
    c.avg_rental_count
FROM 
    FilmRentalCounts f
    JOIN CategoryAvg c ON f.category = c.category
WHERE 
    f.rental_count < c.avg_rental_count
ORDER BY 
    f.category, f.rental_count;

#9. Identify the top 5 months with the highest revenue and display the revenue generated in each month.
SELECT 
    DATE_FORMAT(payment_date, '%Y-%m') AS month,
    SUM(amount) AS total_revenue
FROM 
    payment
GROUP BY 
    DATE_FORMAT(payment_date, '%Y-%m')
ORDER BY 
    total_revenue DESC
LIMIT 5;
# 10. Calculate the difference in rental counts between each customer's total rentals and the average rentals across all customers.
select * from customer;
WITH cte4 AS (
    SELECT 
        r.customer_id,
        CONCAT(c.first_name, ' ', c.last_name) AS full_name, 
        COUNT(r.rental_id) AS rental_count
    FROM 
        rental r 
        JOIN customer c ON r.customer_id = c.customer_id
    GROUP BY  
        r.customer_id
),
cte5 AS (
    SELECT 
        AVG(rental_count) AS avg_rentals 
    FROM 
        cte4
)

SELECT 
    cr.customer_id,
    cr.full_name,
    cr.rental_count,
    ar.avg_rentals,
    cr.rental_count - ar.avg_rentals AS rental_difference
FROM 
    cte4 cr
    CROSS JOIN cte5 ar
ORDER BY 
    rental_difference DESC;

# Normalisation & CTE

# 1. First Normal Form (1NF):
-- 1. Atomic values only – Each column should have indivisible (atomic) values. No arrays, lists, or multiple values in a single field.

-- 2 Each record is unique – There must be a primary key that uniquely identifies each row.

-- 3. No repeating groups or multivalued attributes – You shouldn't have columns like phone1, phone2, etc.

 # a. Identify a table in the Sakila database that violates 1NF. Explain how you
# would normalize it to achieve 1NF.
-- A - The Sakila database is generally well-normalized, but for educational purposes, 
-- let’s imagine a scenario where 1NF could be violated. 
-- One such potential candidate is the customer table — 
-- if it stored multiple phone numbers in one field (which it doesn't by default, 
-- but let's pretend it did).

#2. Second Normal Form (2NF):
 #a. Choose a table in Sakila and describe how you would determine whether it is in 2NF. 
-- A table is in Second Normal Form (2NF) if:
-- It is already in First Normal Form (1NF) 
-- Every non-prime attribute is fully functionally dependent on the entire primary key.


# If it violates 2NF, explain the steps to normalize it.
#3. Third Normal Form (3NF):
 #a. Identify a table in Sakila that violates 3NF. Describe the transitive dependencies 
 #present and outline the steps to normalize the table to 3NF.
 
 -- 1NF (First Normal Form): No repeating groups or arrays; each field contains atomic values.
-- 2NF (Second Normal Form): Must be in 1NF and no partial dependency (non-key attributes must 
-- depend on the whole primary key, not just part of it).
 
#4. Normalization Process:
 #a. Take a specific table in Sakila and guide through the process of normalizing it from the initial 

-- Step 1: First Normal Form (1NF)
-- Step 2: Second Normal Form (2NF)
-- Step 3: Third Normal Form (3NF)

 #unnormalized form up to at least 2NF.
-- Be in 1NF
-- No partial dependencies (all non-key attributes must depend on the whole primary key)

#5. CTE Basics:
 #a. Write a query using a CTE to retrieve the distinct list of actor names and the number of films they 
WITH ActorFilmCount AS (
    SELECT 
        a.actor_id,
        CONCAT(a.first_name, ' ', a.last_name) AS actor_name,
        COUNT(DISTINCT fa.film_id) AS film_count
    FROM 
        actor a
    JOIN 
        film_actor fa ON a.actor_id = fa.actor_id
    GROUP BY 
        a.actor_id, a.first_name, a.last_name
)

SELECT 
    actor_name,
    film_count
FROM 
    ActorFilmCount
ORDER BY 
    film_count DESC;


# have acted in from the actor and film_actor tables.
#6. CTE with Joins:
 #a. Create a CTE that combines information from the film and language tables to display the film title, 
WITH FilmLanguage AS (
    SELECT 
        f.film_id,
        f.title AS film_title,
        l.name AS language_name
    FROM 
        film f
    JOIN 
        language l ON f.language_id = l.language_id
)

SELECT 
    film_title,
    language_name
FROM 
    FilmLanguage
ORDER BY 
    film_title;



# language name, and rental rate.
#c\ CTE for Aggregation:
WITH FilmLanguageInfo AS (
    SELECT 
        f.film_id,
        f.title AS film_title,
        l.name AS language_name,
        f.rental_rate
    FROM 
        film f
    JOIN 
        language l ON f.language_id = l.language_id
)

SELECT 
    film_title,
    language_name,
    rental_rate
FROM 
    FilmLanguageInfo
ORDER BY 
    film_title;

# a. Write a query using a CTE to find the total revenue generated by each customer (sum of payments) 
# from the customer and payment tables.
WITH CustomerRevenue AS (
    SELECT 
        c.customer_id,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        SUM(p.amount) AS total_revenue
    FROM 
        customer c
    JOIN 
        payment p ON c.customer_id = p.customer_id
    GROUP BY 
        c.customer_id, c.first_name, c.last_name
)

SELECT 
    customer_name,
    total_revenue
FROM 
    CustomerRevenue
ORDER BY 
    total_revenue DESC;

#\ CTE with Window Functions:
# a. Utilize a CTE with a window function to rank films based on their rental duration from the film table.
#È\ CTE and Filtering:
WITH FilmRentalRank AS (
    SELECT 
        film_id,
        title,
        rental_duration,
        RANK() OVER (ORDER BY rental_duration DESC) AS duration_rank
    FROM 
        film
)

SELECT 
    film_id,
    title,
    rental_duration,
    duration_rank
FROM 
    FilmRentalRank
ORDER BY 
    duration_rank;


# a. Create a CTE to list customers who have made more than two rentals, and then join this CTE with the 
 #customer table to retrieve additional customer details.

#EC' CTE for Date Calculations:
# a. Write a query using a CTE to find the total number of rentals made each month, considering the 
WITH FrequentRenters AS (
    SELECT 
        customer_id,
        COUNT(rental_id) AS rental_count
    FROM 
        rental
    GROUP BY 
        customer_id
    HAVING 
        COUNT(rental_id) > 2
)

SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.email,
    fr.rental_count
FROM 
    FrequentRenters fr
JOIN 
    customer c ON c.customer_id = fr.customer_id
ORDER BY 
    fr.rental_count DESC;


# rental_date from the rental table
#EE' CTE and Self-Join:
WITH FrequentRenters AS (
    SELECT 
        customer_id,
        COUNT(rental_id) AS rental_count
    FROM 
        rental
    GROUP BY 
        customer_id
    HAVING 
        COUNT(rental_id) > 2
)

SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.email,
    r.rental_date
FROM 
    FrequentRenters fr
JOIN 
    customer c ON c.customer_id = fr.customer_id
JOIN 
    rental r ON r.customer_id = c.customer_id
WHERE 
    fr.rental_count > 2
ORDER BY 
    r.rental_date DESC;

# a. Create a CTE to generate a report showing pairs of actors who have appeared in the same film 
 #together, using the film_actor table.
WITH ActorPairs AS (
    SELECT 
        fa1.actor_id AS actor_1_id,
        fa2.actor_id AS actor_2_id,
        fa1.film_id
    FROM 
        film_actor fa1
    JOIN 
        film_actor fa2 ON fa1.film_id = fa2.film_id
    WHERE 
        fa1.actor_id < fa2.actor_id  -- Ensures unique pairs (no duplicates)
)

SELECT 
    ap.actor_1_id,
    ap.actor_2_id,
    CONCAT(a1.first_name, ' ', a1.last_name) AS actor_1_name,
    CONCAT(a2.first_name, ' ', a2.last_name) AS actor_2_name,
    ap.film_id
FROM 
    ActorPairs ap
JOIN 
    actor a1 ON ap.actor_1_id = a1.actor_id
JOIN 
    actor a2 ON ap.actor_2_id = a2.actor_id
ORDER BY 
    ap.film_id, actor_1_name, actor_2_name;


#12. CTE for Recursive Search:
# a. Implement a recursive CTE to find all employees in the staff table who report to a specific manager, 
 #considering the reports_to column
 
WITH RECURSIVE EmployeeHierarchy AS (
    -- Base case: Find employees directly reporting to the specified manager
    SELECT 
        staff_id,
        first_name,
        last_name,
        reports_to
    FROM 
        staff
    WHERE 
        reports_to = 1  -- Replace 1 with the specific manager's staff_id

    UNION ALL

    -- Recursive case: Find employees who report to the employees found in the previous step
    SELECT 
        s.staff_id,
        s.first_name,
        s.last_name,
        s.reports_to
    FROM 
        staff s
    JOIN 
        EmployeeHierarchy eh ON s.reports_to = eh.staff_id
)

SELECT 
    staff_id,
    first_name,
    last_name,
    reports_to
FROM 
    EmployeeHierarchy
ORDER BY 
    first_name, last_name;
