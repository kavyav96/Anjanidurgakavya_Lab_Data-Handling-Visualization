
-- Create the e_commerce database
CREATE DATABASE IF NOT EXISTS e_commerce;
USE e_commerce;

-- Table for customer details
CREATE TABLE IF NOT EXISTS customer (
    CUS_ID INT PRIMARY KEY,
    CUS_NAME VARCHAR(50),
    CUS_PHONE BIGINT,
    CUS_CITY VARCHAR(50),
    CUS_GENDER VARCHAR(20)
);

-- Table for product category
CREATE TABLE IF NOT EXISTS category (
    CAT_ID INT PRIMARY KEY,
    CAT_NAME VARCHAR(50)
);

-- Table for products
CREATE TABLE IF NOT EXISTS product (
    PRO_ID INT PRIMARY KEY,
    PRO_NAME VARCHAR(50),
    PRO_DESC VARCHAR(50),
    CAT_ID INT,
    FOREIGN KEY (CAT_ID) REFERENCES category(CAT_ID)
);

-- Table for suppliers
CREATE TABLE IF NOT EXISTS supplier (
    SUPP_ID INT PRIMARY KEY,
    SUPP_NAME VARCHAR(50),
    SUPP_CITY VARCHAR(50),
    SUPP_PHONE BIGINT
);

-- Table for product details (mapping supplier and product)
CREATE TABLE IF NOT EXISTS productdetails (
    PROD_ID INT PRIMARY KEY,
    PRO_ID INT,
    SUPP_ID INT,
    PRICE FLOAT,
    FOREIGN KEY (PRO_ID) REFERENCES product(PRO_ID),
    FOREIGN KEY (SUPP_ID) REFERENCES supplier(SUPP_ID)
);

-- Table for orders
CREATE TABLE IF NOT EXISTS orders (
    ORD_ID INT PRIMARY KEY,
    ORD_AMOUNT FLOAT,
    ORD_DATE DATE,
    CUS_ID INT,
    PROD_ID INT,
    FOREIGN KEY (CUS_ID) REFERENCES customer(CUS_ID),
    FOREIGN KEY (PROD_ID) REFERENCES productdetails(PROD_ID)
);

-- Table for ratings
CREATE TABLE IF NOT EXISTS rating (
    RAT_ID INT PRIMARY KEY,
    CUS_ID INT,
    SUPP_ID INT,
    RAT_RATSTARS FLOAT,
    FOREIGN KEY (CUS_ID) REFERENCES customer(CUS_ID),
    FOREIGN KEY (SUPP_ID) REFERENCES supplier(SUPP_ID)
);

-- Insert sample data into customer table
INSERT INTO customer (CUS_ID, CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER)
VALUES (1, 'John Doe', 9876543210, 'New York', 'Male'),
       (2, 'Jane Smith', 9876543211, 'Los Angeles', 'Female');

-- Insert sample data into category table
INSERT INTO category (CAT_ID, CAT_NAME)
VALUES (1, 'Electronics'), (2, 'Clothing');

-- Insert sample data into product table
INSERT INTO product (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID)
VALUES (1, 'Laptop', 'High-end gaming laptop', 1),
       (2, 'T-shirt', 'Cotton T-shirt', 2);

-- Insert sample data into supplier table
INSERT INTO supplier (SUPP_ID, SUPP_NAME, SUPP_CITY, SUPP_PHONE)
VALUES (1, 'Tech Supplier', 'San Francisco', 9876543212),
       (2, 'Fashion Supplier', 'New York', 9876543213);

-- Insert sample data into productdetails table
INSERT INTO productdetails (PROD_ID, PRO_ID, SUPP_ID, PRICE)
VALUES (1, 1, 1, 1200.99), (2, 2, 2, 19.99);

-- Insert sample data into orders table
INSERT INTO orders (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PROD_ID)
VALUES (1, 1200.99, '2024-01-01', 1, 1),
       (2, 19.99, '2024-01-02', 2, 2);

-- Insert sample data into rating table
INSERT INTO rating (RAT_ID, CUS_ID, SUPP_ID, RAT_RATSTARS)
VALUES (1, 1, 1, 4.5), (2, 2, 2, 3.8);
