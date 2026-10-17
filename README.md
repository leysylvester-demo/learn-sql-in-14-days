# Learn SQL in 14 Days

Welcome to **Learn SQL in 14 Days**, a free, hands-on SQL tutorial series by **Ley Sylvester, Ph.D., Ed.D.**

This series is designed for beginners who want to learn SQL through practical examples. Over 14 days, you'll learn how to retrieve, filter, summarize, and modify data using a sample store database.

You don't need prior SQL experience to get started.

## Getting Started

You have two options for practicing SQL. Choose whichever works best for you.

### Option 1: Oracle FreeSQL (Recommended for Beginners)

You can practice SQL directly in your browser without installing Oracle Database on your computer.

Watch my tutorial to learn how to get started:

**[How to Use Oracle AI Database in Your Browser | No Installation Required](https://youtu.be/0itn8Di8Llo)**

Once your environment is ready, you can use the sample database script provided in this repository.

### Option 2: Install Oracle Database on Your Computer

If you prefer a more hands-on experience and want to learn how to install and work with Oracle Database locally, follow my step-by-step installation tutorial.

**[How to Install Oracle AI Database 26ai Free on Windows (Step by Step)](https://youtu.be/ztrPZq7uv50)**

This option is especially useful if you want to gain experience setting up and working with a local database environment.

## Download the Sample Database

All 14 lessons use the same sample store database.

**[Download the Sample Database Setup Script](learn_sql_14_days_setup.sql)**

The script creates six related tables:

| Table | Description |
|---|---|
| CATEGORIES | Product categories |
| PRODUCTS | Product information, pricing, and inventory |
| CUSTOMERS | Customer information |
| ADDRESSES | Customer addresses |
| ORDERS | Customer orders and shipping details |
| ORDER_ITEMS | Products included in each order |

The database includes sample records for practicing SQL joins, filtering, aggregate functions, subqueries, and data modifications.

### How to Run the Script

**Using Oracle FreeSQL:**

1. Open Oracle FreeSQL and sign in.
2. Open the SQL worksheet.
3. Copy the contents of the setup script into the worksheet.
4. Run the script using the worksheet's script execution option.

**Using SQL*Plus:**

1. Download the SQL setup script.
2. Connect to your Oracle Database.
3. Run the script:

```sql
@learn_sql_14_days_setup.sql
```

If the file is saved in another directory, provide its full path.

**Important:** The script drops and recreates the sample tables. Run it only in a dedicated practice schema. It is designed for Oracle AI Database 26ai, and older versions may require adjustments.

## Learn SQL in 14 Days: Lessons

| Day | Topic |
|---|---|
| 1 | SQL Basics: Your First SELECT Statement |
| 2 | SQL SELECT: Aliases, Calculations, and DISTINCT |
| 3 | Filter Data with WHERE |
| 4 | SQL AND, OR, IN, and BETWEEN |
| 5 | SQL LIKE and NULL |
| 6 | Sort and Limit Results with ORDER BY |
| 7 | SQL Aggregate Functions |
| 8 | GROUP BY and HAVING |
| 9 | SQL INNER JOIN Explained |
| 10 | SQL LEFT JOIN and Other JOINs |
| 11 | Joining Multiple Tables in SQL |
| 12 | SQL Subqueries |
| 13 | INSERT, UPDATE, and DELETE Safely |
| 14 | Real-World SQL Challenge |

## Watch the Video Series

Follow the lessons on my YouTube channel:

**[Ley Sylvester on YouTube](https://www.youtube.com/@leysylvester)**

## Continue Learning with TaleyLearn

Want to keep building your SQL skills? Visit **[TaleyLearn](https://taleylearn.com/)** for more learning resources.

## Practice Makes Progress

Learning SQL is about more than memorizing commands. It's about understanding how to work with data and solve problems.

As you follow the lessons, run the examples, complete the challenges, and experiment with your own queries.

You can also use AI tools to help you learn SQL, but make sure you understand what the queries are doing and why they work.

Happy learning!

**Ley Sylvester, Ph.D., Ed.D.**
