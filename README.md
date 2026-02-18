# Enterprise SQL Analytics Project

A comprehensive SQL project demonstrating end-to-end database design, advanced querying, performance optimization, and enterprise-level analytics using a business sales dataset.

This project simulates a real-world transactional system involving customers, products, employees, departments, orders, and sales.

---

## Project Objective

To design a normalized relational database and implement structured SQL queries that generate meaningful business insights while applying performance-aware best practices.

The project progresses from foundational SQL concepts to advanced analytics and optimization techniques.

---

## Database Design

The schema models a transactional retail business environment.

### Core Entities

- Customers
- Products
- Orders
- Order_Items
- Employees
- Departments
- Sales

### Key Features

- Fully normalized relational schema
- Primary and foreign key constraints
- Transactional order structure
- Employee-to-department relationships
- Sales attribution to employees

---

## Technical Scope

### 1. Fundamental SQL
- SELECT statements
- Filtering (WHERE, BETWEEN, IN)
- GROUP BY and HAVING
- Basic aggregations

### 2. Relational Joins
- INNER JOIN
- LEFT JOIN
- SELF JOIN
- Multi-table joins
- Subqueries

### 3. Aggregations & Business Metrics
- Revenue calculations
- Average order value
- Customer spending patterns
- Department-level sales performance

### 4. Advanced Query Techniques
- Conditional aggregation
- CASE statements
- Correlated subqueries
- Multi-step analytical queries

### 5. Window Functions
- ROW_NUMBER
- RANK / DENSE_RANK
- LAG / LEAD
- Running totals
- Partitioned analytics

### 6. Recursive Queries
- Manager hierarchy traversal using CTEs

### 7. Enterprise Analytics
- Customer Lifetime Value (LTV)
- Cohort analysis
- Churn detection logic
- Revenue growth trends
- Employee contribution metrics
- Top-performing products analysis

---

## Project Structure
Enterprise_SQL_Project/
│
├── schema/
│ ├── departments.sql
│ ├── employees.sql
│ ├── customers.sql
│ ├── products.sql
│ ├── orders.sql
│ ├── order_items.sql
│ └── sales.sql
│
├── data/
│ └── insert_statements.sql
│
├── queries/
│ ├── phase1_basics.sql
│ ├── phase2_joins.sql
│ ├── phase3_aggregations.sql
│ ├── phase4_advanced.sql
│ ├── phase5_window_functions.sql
│ ├── phase6_optimization.sql
│ └── phase7_enterprise_analytics.sql
│
└── README.md


---

## Tools & Environment

- MySQL
- Structured Query Language (SQL)
- Relational Database Design Principles

---

## Key Business Insights Generated

- Identification of top revenue-generating employees
- Department-level contribution analysis
- Monthly revenue trend tracking
- Customer lifetime value measurement
- Customer inactivity detection
- Product performance ranking
- Revenue growth analysis

---

## Learning Outcomes

- Strong command over SQL fundamentals
- Ability to design normalized schemas
- Writing performance-optimized queries
- Using analytical functions for enterprise reporting
- Translating business problems into structured SQL logic

---

## How to Run

1. Create database in MySQL.
2. Execute schema files from the `schema/` directory.
3. Load data using insert scripts.
4. Run queries phase-wise from the `queries/` folder.

---

## Author

Developed as part of an advanced SQL portfolio project to demonstrate full-spectrum SQL expertise from foundational queries to enterprise analytics.

