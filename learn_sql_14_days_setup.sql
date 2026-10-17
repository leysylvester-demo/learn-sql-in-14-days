/*
===============================================================================
Learn SQL in 14 Days
Sample Store Database
Oracle Database
===============================================================================

Purpose:
This script creates a small normalized store database for learning SQL.

Tables:
  CATEGORIES
  PRODUCTS
  CUSTOMERS
  ADDRESSES
  ORDERS
  ORDER_ITEMS

Notes:
- Designed for Oracle Database.
- Constraints are intentionally kept simple for beginner learning.
- Some columns contain NULL values intentionally for SQL practice.
- Price, quantity, shipping cost, and ship date do not have CHECK constraints.
  These can be used later as data-quality and constraint-learning examples.
===============================================================================
*/

/* ============================================================
   DROP EXISTING TABLES

   These statements remove the tables if they already exist,
   allowing the setup script to be run again from scratch.
   ============================================================ */

drop table if exists order_items cascade constraints;
drop table if exists orders cascade constraints;
drop table if exists addresses cascade constraints;
drop table if exists products cascade constraints;
drop table if exists customers cascade constraints;
drop table if exists categories cascade constraints;

/* ============================================================================
   CATEGORIES
   ============================================================================ */

CREATE TABLE categories (
    category_id NUMBER
        CONSTRAINT categories_pk PRIMARY KEY,
    category_name VARCHAR2(15) NOT NULL
        CONSTRAINT categories_name_uk UNIQUE
);


/* ============================================================================
   CUSTOMERS
   ============================================================================ */

CREATE TABLE customers (
    customer_id NUMBER
        CONSTRAINT customers_pk PRIMARY KEY,
    first_name VARCHAR2(25) NOT NULL,
    last_name VARCHAR2(25) NOT NULL,
    email VARCHAR2(35) NOT NULL
        CONSTRAINT customers_email_uk UNIQUE,
    phone VARCHAR2(15),
    signup_date DATE DEFAULT SYSDATE,
    customer_status VARCHAR2(10) DEFAULT 'ACTIVE' NOT NULL
        CONSTRAINT customers_status_ck
        CHECK (customer_status IN ('ACTIVE', 'INACTIVE'))
);


/* ============================================================================
   PRODUCTS
   ============================================================================ */

CREATE TABLE products (
    product_id NUMBER
        CONSTRAINT products_pk PRIMARY KEY,
    category_id NUMBER NOT NULL
        CONSTRAINT products_category_fk
        REFERENCES categories(category_id),
    product_name VARCHAR2(25) NOT NULL,
    description VARCHAR2(55),
    list_price NUMBER(8,2) NOT NULL,
    stock_quantity NUMBER(4) DEFAULT 0,
    active CHAR(1) DEFAULT 'Y'
        CONSTRAINT products_active_ck
        CHECK (active IN ('Y', 'N'))
);


/* ============================================================================
   ADDRESSES
   ============================================================================ */

CREATE TABLE addresses (
    address_id NUMBER
        CONSTRAINT addresses_pk PRIMARY KEY,
    customer_id NUMBER NOT NULL
        CONSTRAINT addresses_customer_fk
        REFERENCES customers(customer_id),
    address_line1 VARCHAR2(30) NOT NULL,
    address_line2 VARCHAR2(25),
    city VARCHAR2(20) NOT NULL,
    state CHAR(2) NOT NULL,
    zip_code CHAR(5) NOT NULL
);


/* ============================================================================
   ORDERS
   ============================================================================ */

CREATE TABLE orders (
    order_id NUMBER
        CONSTRAINT orders_pk PRIMARY KEY,
    customer_id NUMBER NOT NULL
        CONSTRAINT orders_customer_fk
        REFERENCES customers(customer_id),
    shipping_address_id NUMBER NOT NULL
        CONSTRAINT orders_shipping_address_fk
        REFERENCES addresses(address_id),
    billing_address_id NUMBER NOT NULL
        CONSTRAINT orders_billing_address_fk
        REFERENCES addresses(address_id),
    order_date DATE DEFAULT SYSDATE NOT NULL,
    ship_date DATE,
    order_status VARCHAR2(15) NOT NULL
        CONSTRAINT orders_status_ck
        CHECK (
            order_status IN (
                'PENDING',
                'PROCESSING',
                'SHIPPED',
                'DELIVERED',
                'CANCELLED'
            )
        ),
    shipping_cost NUMBER(6,2) DEFAULT 0
);


/* ============================================================================
   ORDER_ITEMS
   ============================================================================ */

CREATE TABLE order_items (
    order_item_id NUMBER
        CONSTRAINT order_items_pk PRIMARY KEY,
    order_id NUMBER NOT NULL
        CONSTRAINT order_items_order_fk
        REFERENCES orders(order_id),
    product_id NUMBER NOT NULL
        CONSTRAINT order_items_product_fk
        REFERENCES products(product_id),
    quantity NUMBER(3) DEFAULT 1 NOT NULL,
    price_each NUMBER(8,2) NOT NULL
);


/* ============================================================================
   INSERT CATEGORIES
   ============================================================================ */

INSERT INTO categories (category_id, category_name)
VALUES (1, 'Computers');

INSERT INTO categories (category_id, category_name)
VALUES (2, 'Mobile Devices');

INSERT INTO categories (category_id, category_name)
VALUES (3, 'Accessories');

INSERT INTO categories (category_id, category_name)
VALUES (4, 'Audio');

INSERT INTO categories (category_id, category_name)
VALUES (5, 'Home Office');


/* ============================================================================
   INSERT CUSTOMERS
   ============================================================================ */

INSERT INTO customers
    (customer_id, first_name, last_name, email, phone, signup_date, customer_status)
VALUES
    (1001, 'Maya', 'Johnson', 'maya.johnson@example.com', '5125550101',
     DATE '2025-01-10', 'ACTIVE');

INSERT INTO customers
    (customer_id, first_name, last_name, email, phone, signup_date, customer_status)
VALUES
    (1002, 'Daniel', 'Smith', 'daniel.smith@example.com', NULL,
     DATE '2025-02-15', 'ACTIVE');

INSERT INTO customers
    (customer_id, first_name, last_name, email, phone, signup_date, customer_status)
VALUES
    (1003, 'Aisha', 'Williams', 'aisha.williams@example.com', '2145550103',
     DATE '2025-03-20', 'ACTIVE');

INSERT INTO customers
    (customer_id, first_name, last_name, email, phone, signup_date, customer_status)
VALUES
    (1004, 'Carlos', 'Garcia', 'carlos.garcia@example.com', '3055550104',
     DATE '2025-04-12', 'ACTIVE');

INSERT INTO customers
    (customer_id, first_name, last_name, email, phone, signup_date, customer_status)
VALUES
    (1005, 'Emily', 'Brown', 'emily.brown@example.com', NULL,
     DATE '2025-05-18', 'ACTIVE');

INSERT INTO customers
    (customer_id, first_name, last_name, email, phone, signup_date, customer_status)
VALUES
    (1006, 'Noah', 'Davis', 'noah.davis@example.com', '2065550106',
     DATE '2025-06-21', 'INACTIVE');

INSERT INTO customers
    (customer_id, first_name, last_name, email, phone, signup_date, customer_status)
VALUES
    (1007, 'Amara', 'Okafor', 'amara.okafor@example.com', '5125550107',
     DATE '2025-07-05', 'ACTIVE');

INSERT INTO customers
    (customer_id, first_name, last_name, email, phone, signup_date, customer_status)
VALUES
    (1008, 'Jason', 'Lee', 'jason.lee@example.com', NULL,
     DATE '2025-08-11', 'ACTIVE');

INSERT INTO customers
    (customer_id, first_name, last_name, email, phone, signup_date, customer_status)
VALUES
    (1009, 'Sophia', 'Martinez', 'sophia.martinez@example.com', '7135550109',
     DATE '2025-09-22', 'ACTIVE');

INSERT INTO customers
    (customer_id, first_name, last_name, email, phone, signup_date, customer_status)
VALUES
    (1010, 'Michael', 'Anderson', 'michael.anderson@example.com', '4075550110',
     DATE '2025-10-02', 'ACTIVE');

INSERT INTO customers
    (customer_id, first_name, last_name, email, phone, signup_date, customer_status)
VALUES
    (1011, 'Grace', 'Wilson', 'grace.wilson@example.com', NULL,
     DATE '2025-11-17', 'ACTIVE');

INSERT INTO customers
    (customer_id, first_name, last_name, email, phone, signup_date, customer_status)
VALUES
    (1012, 'Ethan', 'Thomas', 'ethan.thomas@example.com', '6025550112',
     DATE '2026-01-08', 'ACTIVE');


/* ============================================================================
   INSERT PRODUCTS
   ============================================================================ */

INSERT INTO products
    (product_id, category_id, product_name, description,
     list_price, stock_quantity, active)
VALUES
    (101, 1, 'Laptop Pro 15', '15-inch professional laptop',
     1299.99, 25, 'Y');

INSERT INTO products
    (product_id, category_id, product_name, description,
     list_price, stock_quantity, active)
VALUES
    (102, 1, 'Laptop Air 13', 'Lightweight 13-inch laptop',
     899.99, 40, 'Y');

INSERT INTO products
    (product_id, category_id, product_name, description,
     list_price, stock_quantity, active)
VALUES
    (103, 1, 'Desktop Workstation', 'High-performance desktop computer',
     1599.99, 10, 'Y');

INSERT INTO products
    (product_id, category_id, product_name, description,
     list_price, stock_quantity, active)
VALUES
    (104, 2, 'Smartphone X', '5G smartphone with 256GB storage',
     799.99, 60, 'Y');

INSERT INTO products
    (product_id, category_id, product_name, description,
     list_price, stock_quantity, active)
VALUES
    (105, 2, 'Tablet Plus', '10-inch tablet',
     499.99, 35, 'Y');

INSERT INTO products
    (product_id, category_id, product_name, description,
     list_price, stock_quantity, active)
VALUES
    (106, 3, 'Wireless Mouse', 'Bluetooth wireless mouse',
     29.99, 100, 'Y');

INSERT INTO products
    (product_id, category_id, product_name, description,
     list_price, stock_quantity, active)
VALUES
    (107, 3, 'Mechanical Keyboard', 'Backlit mechanical keyboard',
     89.99, 75, 'Y');

INSERT INTO products
    (product_id, category_id, product_name, description,
     list_price, stock_quantity, active)
VALUES
    (108, 3, 'USB-C Hub', NULL,
     49.99, 50, 'Y');

INSERT INTO products
    (product_id, category_id, product_name, description,
     list_price, stock_quantity, active)
VALUES
    (109, 4, 'Noise Cancel Headphones',
     'Wireless headphones with active noise cancellation',
     249.99, 30, 'Y');

INSERT INTO products
    (product_id, category_id, product_name, description,
     list_price, stock_quantity, active)
VALUES
    (110, 4, 'Bluetooth Speaker', 'Portable wireless speaker',
     119.99, 45, 'Y');

INSERT INTO products
    (product_id, category_id, product_name, description,
     list_price, stock_quantity, active)
VALUES
    (111, 5, '27-inch Monitor', '4K desktop monitor',
     349.99, 20, 'Y');

INSERT INTO products
    (product_id, category_id, product_name, description,
     list_price, stock_quantity, active)
VALUES
    (112, 5, 'Standing Desk', 'Adjustable standing desk',
     599.99, 12, 'Y');

INSERT INTO products
    (product_id, category_id, product_name, description,
     list_price, stock_quantity, active)
VALUES
    (113, 5, 'Office Chair', 'Ergonomic office chair',
     429.99, 15, 'Y');

INSERT INTO products
    (product_id, category_id, product_name, description,
     list_price, stock_quantity, active)
VALUES
    (114, 3, 'Webcam HD', '1080p USB webcam',
     79.99, 0, 'N');

INSERT INTO products
    (product_id, category_id, product_name, description,
     list_price, stock_quantity, active)
VALUES
    (115, 3, 'Laptop Sleeve', 'Protective 15-inch laptop sleeve',
     24.99, 80, 'Y');


/* ============================================================================
   INSERT ADDRESSES
   ============================================================================ */

INSERT INTO addresses
    (address_id, customer_id, address_line1, address_line2, city, state, zip_code)
VALUES
    (201, 1001, '1200 Congress Ave', NULL, 'Austin', 'TX', '78701');

INSERT INTO addresses
    (address_id, customer_id, address_line1, address_line2, city, state, zip_code)
VALUES
    (202, 1002, '450 Market Street', 'Apt 8', 'San Francisco', 'CA', '94105');

INSERT INTO addresses
    (address_id, customer_id, address_line1, address_line2, city, state, zip_code)
VALUES
    (203, 1003, '800 Main Street', NULL, 'Dallas', 'TX', '75201');

INSERT INTO addresses
    (address_id, customer_id, address_line1, address_line2, city, state, zip_code)
VALUES
    (204, 1004, '75 Ocean Drive', NULL, 'Miami', 'FL', '33139');

INSERT INTO addresses
    (address_id, customer_id, address_line1, address_line2, city, state, zip_code)
VALUES
    (205, 1005, '500 Madison Ave', 'Suite 12', 'New York', 'NY', '10022');

INSERT INTO addresses
    (address_id, customer_id, address_line1, address_line2, city, state, zip_code)
VALUES
    (206, 1006, '900 Pine Street', NULL, 'Seattle', 'WA', '98101');

INSERT INTO addresses
    (address_id, customer_id, address_line1, address_line2, city, state, zip_code)
VALUES
    (207, 1007, '250 Lake Road', NULL, 'Round Rock', 'TX', '78664');

INSERT INTO addresses
    (address_id, customer_id, address_line1, address_line2, city, state, zip_code)
VALUES
    (208, 1008, '88 Sunset Blvd', 'Apt 14', 'Los Angeles', 'CA', '90028');

INSERT INTO addresses
    (address_id, customer_id, address_line1, address_line2, city, state, zip_code)
VALUES
    (209, 1009, '1700 Westheimer Rd', NULL, 'Houston', 'TX', '77098');

INSERT INTO addresses
    (address_id, customer_id, address_line1, address_line2, city, state, zip_code)
VALUES
    (210, 1010, '140 Central Blvd', NULL, 'Orlando', 'FL', '32801');

INSERT INTO addresses
    (address_id, customer_id, address_line1, address_line2, city, state, zip_code)
VALUES
    (211, 1011, '325 Michigan Ave', NULL, 'Chicago', 'IL', '60601');

/* Customer 1012 intentionally has no address. */


/* Additional addresses for customers with different billing/shipping addresses */

INSERT INTO addresses
    (address_id, customer_id, address_line1, address_line2, city, state, zip_code)
VALUES
    (212, 1001, '4100 Burnet Road', 'Suite 100', 'Austin', 'TX', '78756');

INSERT INTO addresses
    (address_id, customer_id, address_line1, address_line2, city, state, zip_code)
VALUES
    (213, 1007, '100 Main Street', NULL, 'Georgetown', 'TX', '78626');


/* ============================================================================
   INSERT ORDERS
   ============================================================================ */

INSERT INTO orders
    (order_id, customer_id, shipping_address_id, billing_address_id,
     order_date, ship_date, order_status, shipping_cost)
VALUES
    (5001, 1001, 201, 212,
     DATE '2026-01-05', DATE '2026-01-07', 'DELIVERED', 9.99);

INSERT INTO orders
    (order_id, customer_id, shipping_address_id, billing_address_id,
     order_date, ship_date, order_status, shipping_cost)
VALUES
    (5002, 1002, 202, 202,
     DATE '2026-01-10', DATE '2026-01-12', 'DELIVERED', 12.99);

INSERT INTO orders
    (order_id, customer_id, shipping_address_id, billing_address_id,
     order_date, ship_date, order_status, shipping_cost)
VALUES
    (5003, 1003, 203, 203,
     DATE '2026-01-15', NULL, 'PROCESSING', 8.99);

INSERT INTO orders
    (order_id, customer_id, shipping_address_id, billing_address_id,
     order_date, ship_date, order_status, shipping_cost)
VALUES
    (5004, 1001, 212, 212,
     DATE '2026-02-02', DATE '2026-02-04', 'DELIVERED', 9.99);

INSERT INTO orders
    (order_id, customer_id, shipping_address_id, billing_address_id,
     order_date, ship_date, order_status, shipping_cost)
VALUES
    (5005, 1004, 204, 204,
     DATE '2026-02-10', NULL, 'CANCELLED', 0);

INSERT INTO orders
    (order_id, customer_id, shipping_address_id, billing_address_id,
     order_date, ship_date, order_status, shipping_cost)
VALUES
    (5006, 1005, 205, 205,
     DATE '2026-02-18', DATE '2026-02-20', 'SHIPPED', 14.99);

INSERT INTO orders
    (order_id, customer_id, shipping_address_id, billing_address_id,
     order_date, ship_date, order_status, shipping_cost)
VALUES
    (5007, 1007, 207, 213,
     DATE '2026-03-01', DATE '2026-03-03', 'DELIVERED', 10.99);

INSERT INTO orders
    (order_id, customer_id, shipping_address_id, billing_address_id,
     order_date, ship_date, order_status, shipping_cost)
VALUES
    (5008, 1008, 208, 208,
     DATE '2026-03-05', NULL, 'PENDING', 11.99);

INSERT INTO orders
    (order_id, customer_id, shipping_address_id, billing_address_id,
     order_date, ship_date, order_status, shipping_cost)
VALUES
    (5009, 1009, 209, 209,
     DATE '2026-03-12', DATE '2026-03-14', 'DELIVERED', 7.99);

INSERT INTO orders
    (order_id, customer_id, shipping_address_id, billing_address_id,
     order_date, ship_date, order_status, shipping_cost)
VALUES
    (5010, 1003, 203, 203,
     DATE '2026-03-20', DATE '2026-03-22', 'DELIVERED', 8.99);

INSERT INTO orders
    (order_id, customer_id, shipping_address_id, billing_address_id,
     order_date, ship_date, order_status, shipping_cost)
VALUES
    (5011, 1010, 210, 210,
     DATE '2026-04-01', DATE '2026-04-03', 'DELIVERED', 12.99);

INSERT INTO orders
    (order_id, customer_id, shipping_address_id, billing_address_id,
     order_date, ship_date, order_status, shipping_cost)
VALUES
    (5012, 1001, 201, 212,
     DATE '2026-04-10', NULL, 'PROCESSING', 9.99);

INSERT INTO orders
    (order_id, customer_id, shipping_address_id, billing_address_id,
     order_date, ship_date, order_status, shipping_cost)
VALUES
    (5013, 1007, 213, 207,
     DATE '2026-04-14', DATE '2026-04-16', 'DELIVERED', 10.99);

INSERT INTO orders
    (order_id, customer_id, shipping_address_id, billing_address_id,
     order_date, ship_date, order_status, shipping_cost)
VALUES
    (5014, 1002, 202, 202,
     DATE '2026-05-01', DATE '2026-05-03', 'DELIVERED', 12.99);

INSERT INTO orders
    (order_id, customer_id, shipping_address_id, billing_address_id,
     order_date, ship_date, order_status, shipping_cost)
VALUES
    (5015, 1009, 209, 209,
     DATE '2026-05-08', NULL, 'PENDING', 7.99);

/*
Customers 1006, 1011, and 1012 intentionally have no orders.
*/


/* ============================================================================
   INSERT ORDER ITEMS
   ============================================================================ */

INSERT INTO order_items
    (order_item_id, order_id, product_id, quantity, price_each)
VALUES (1, 5001, 101, 1, 1299.99);

INSERT INTO order_items
    (order_item_id, order_id, product_id, quantity, price_each)
VALUES (2, 5001, 106, 1, 29.99);

INSERT INTO order_items
    (order_item_id, order_id, product_id, quantity, price_each)
VALUES (3, 5002, 104, 1, 799.99);

INSERT INTO order_items
    (order_item_id, order_id, product_id, quantity, price_each)
VALUES (4, 5002, 109, 1, 249.99);

INSERT INTO order_items
    (order_item_id, order_id, product_id, quantity, price_each)
VALUES (5, 5003, 111, 2, 349.99);

INSERT INTO order_items
    (order_item_id, order_id, product_id, quantity, price_each)
VALUES (6, 5004, 107, 1, 89.99);

INSERT INTO order_items
    (order_item_id, order_id, product_id, quantity, price_each)
VALUES (7, 5004, 108, 2, 49.99);

INSERT INTO order_items
    (order_item_id, order_id, product_id, quantity, price_each)
VALUES (8, 5005, 112, 1, 599.99);

INSERT INTO order_items
    (order_item_id, order_id, product_id, quantity, price_each)
VALUES (9, 5006, 103, 1, 1599.99);

INSERT INTO order_items
    (order_item_id, order_id, product_id, quantity, price_each)
VALUES (10, 5006, 111, 1, 349.99);

INSERT INTO order_items
    (order_item_id, order_id, product_id, quantity, price_each)
VALUES (11, 5007, 102, 1, 899.99);

INSERT INTO order_items
    (order_item_id, order_id, product_id, quantity, price_each)
VALUES (12, 5007, 115, 1, 24.99);

INSERT INTO order_items
    (order_item_id, order_id, product_id, quantity, price_each)
VALUES (13, 5008, 105, 2, 499.99);

INSERT INTO order_items
    (order_item_id, order_id, product_id, quantity, price_each)
VALUES (14, 5009, 109, 2, 249.99);

INSERT INTO order_items
    (order_item_id, order_id, product_id, quantity, price_each)
VALUES (15, 5009, 110, 1, 119.99);

INSERT INTO order_items
    (order_item_id, order_id, product_id, quantity, price_each)
VALUES (16, 5010, 106, 3, 29.99);

INSERT INTO order_items
    (order_item_id, order_id, product_id, quantity, price_each)
VALUES (17, 5010, 107, 1, 89.99);

INSERT INTO order_items
    (order_item_id, order_id, product_id, quantity, price_each)
VALUES (18, 5011, 112, 1, 599.99);

INSERT INTO order_items
    (order_item_id, order_id, product_id, quantity, price_each)
VALUES (19, 5011, 113, 1, 429.99);

INSERT INTO order_items
    (order_item_id, order_id, product_id, quantity, price_each)
VALUES (20, 5012, 101, 1, 1299.99);

INSERT INTO order_items
    (order_item_id, order_id, product_id, quantity, price_each)
VALUES (21, 5013, 104, 1, 799.99);

INSERT INTO order_items
    (order_item_id, order_id, product_id, quantity, price_each)
VALUES (22, 5013, 108, 1, 49.99);

INSERT INTO order_items
    (order_item_id, order_id, product_id, quantity, price_each)
VALUES (23, 5014, 103, 1, 1599.99);

INSERT INTO order_items
    (order_item_id, order_id, product_id, quantity, price_each)
VALUES (24, 5014, 109, 1, 249.99);

INSERT INTO order_items
    (order_item_id, order_id, product_id, quantity, price_each)
VALUES (25, 5015, 111, 1, 349.99);

/*
Product 114 intentionally has never been ordered.
*/


/* ============================================================================
   SAVE THE INSERTS
   ============================================================================ */

COMMIT;


/* ============================================================================
   VERIFY TABLES
   ============================================================================ */

SELECT table_name
FROM user_tables
WHERE table_name IN (
    'CATEGORIES',
    'PRODUCTS',
    'CUSTOMERS',
    'ADDRESSES',
    'ORDERS',
    'ORDER_ITEMS'
)
ORDER BY table_name;


/* ============================================================================
   VERIFY ROW COUNTS
   ============================================================================ */

SELECT COUNT(*) AS category_count
FROM categories;

SELECT COUNT(*) AS product_count
FROM products;

SELECT COUNT(*) AS customer_count
FROM customers;

SELECT COUNT(*) AS address_count
FROM addresses;

SELECT COUNT(*) AS order_count
FROM orders;

SELECT COUNT(*) AS order_item_count
FROM order_items;
