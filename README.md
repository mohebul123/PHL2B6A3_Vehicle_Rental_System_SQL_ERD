# 🚗 Vehicle Rental System – Database Design & SQL Queries

## 📌 Assignment Overview
This project is a **database-focused assignment** for a Vehicle Rental System.  
The goal is to demonstrate understanding of:

- ERD (Entity Relationship Diagram) design
- Primary & Foreign Keys
- SQL Queries using JOIN, EXISTS, WHERE, GROUP BY, HAVING
- Real-world database relationships

---

## 🎯 Objectives
By completing this assignment, I have practiced:

- Designing relational database schemas
- Creating ERD with proper relationships
- Writing optimized SQL queries
- Understanding business rules in database systems

---

## 🛠️ Technology Used
- **Database:** PostgreSQL
- **ERD Tool:** DrawSQL / Lucidchart
- **Language:** SQL

---

## 📊 Database Tables

### 1️⃣ Users Table
Stores system users (Admin / Customer).

| Column | Description |
|------|------------|
| id | Primary Key |
| name | User name |
| email | Unique email |
| password | Encrypted password |
| phone | Phone number |
| role | admin / customer |

---

### 2️⃣ Vehicles Table
Stores rental vehicles.

| Column | Description |
|------|------------|
| id | Primary Key |
| vehicle_name | Name of vehicle |
| type | car / bike / truck |
| model | Vehicle model |
| registration_number | Unique registration |
| daily_rent_price | Price per day |
| availability_status | available / rented / maintenance |

---

### 3️⃣ Bookings Table
Stores rental bookings.

| Column | Description |
|------|------------|
| id | Primary Key |
| user_id | Foreign Key → users.id |
| vehicle_id | Foreign Key → vehicles.id |
| start_date | Rental start |
| end_date | Rental end |
| status | pending / confirmed / completed / cancelled |
| total_cost | Total rent cost |

---

## 🔗 Database Relationships

- **One-to-Many:** Users → Bookings
- **Many-to-One:** Bookings → Vehicles
- **Logical One-to-One:** Each booking links one user and one vehicle

---

## 🧩 ERD Diagram
🔗 **ERD Link:**  
> _Add your DrawSQL / Lucidchart public link here_


---

## 🧪 SQL Queries

### 🔹 Query 1: JOIN
Retrieve booking information with customer and vehicle details.

```sql
SELECT 
  u.name AS customer_name,
  v.vehicle_name,
  b.start_date,
  b.end_date,
  b.total_cost
FROM bookings b
INNER JOIN users u ON b.user_id = u.id
INNER JOIN vehicles v ON b.vehicle_id = v.id;
```

### 🔹 Query 2: EXISTS
Find vehicles that have never been booked.

```sql
SELECT *
FROM vehicles v
WHERE NOT EXISTS (
  SELECT 1 FROM bookings b
  WHERE b.vehicle_id = v.id
);
```

### 🔹 Query 3: WHERE
Retrieve all available vehicles of a specific type.

```sql
SELECT *
FROM vehicles
WHERE type = 'car'
AND availability_status = 'available';
```

### 🔹 Query 4: GROUP BY & HAVING
Find vehicles with more than 2 bookings.

```sql
SELECT 
  vehicle_id,
  COUNT(*) AS total_bookings
FROM bookings
GROUP BY vehicle_id
HAVING COUNT(*) > 2;

```

### 📖 Theory Questions (Viva Practice)

 - 1-What is a foreign key and why is it important in relational databases?
 - 2-What is the difference between WHERE and HAVING clauses in SQL?
 - 3-What is a primary key and what are its characteristics?
 - 4-4What is the difference between INNER JOIN and LEFT JOIN in SQL?
📂 Google Drive (Viva & Resources):
https://drive.google.com/drive/folders/1R5F1kX7Xw59rIpJMfutrtNiAVjo9dMsq?usp=drive_link
