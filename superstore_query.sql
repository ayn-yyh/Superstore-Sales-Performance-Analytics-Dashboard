create database superstore_bi;

USE superstore_bi;

CREATE TABLE dim_customer (
    customer_id VARCHAR(20) PRIMARY KEY,
    customer_name VARCHAR(50),
    segment VARCHAR(30),
    country VARCHAR(50),
    state VARCHAR(50),
    city VARCHAR(50),
    postal_code VARCHAR(20),
    region VARCHAR(20)
);

CREATE TABLE dim_product (
    product_id VARCHAR(30) PRIMARY KEY,
    product_name VARCHAR(200),
    category VARCHAR(50),
    sub_category VARCHAR(50)
);

CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    date DATE,
    year INT,
    month INT,
    month_name VARCHAR(20),
    quarter INT
);

CREATE TABLE fact_sales (
    sales_id INT PRIMARY KEY,
    order_id VARCHAR(30),
    customer_id VARCHAR(20),
    product_id VARCHAR(30),
    order_date DATE,
    sales FLOAT,
    quantity INT,
    discount FLOAT,
    profit FLOAT,
    profit_margin FLOAT,
    order_processing_days INT
);

SELECT COUNT(*) FROM fact_sales;

SELECT COUNT(*) FROM dim_product;

SELECT COUNT(*) FROM dim_customer;

SELECT COUNT(*) FROM dim_date;

DESC fact_sales;

DESC dim_customer;

DESC dim_product;

DESC dim_date;

#检查客户关联
SELECT 
    COUNT(*)
FROM fact_sales f
LEFT JOIN dim_customer c
ON f.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

#检查商品关联
SELECT 
    COUNT(*)
FROM fact_sales f
LEFT JOIN dim_product p
ON f.product_id = p.product_id
WHERE p.product_id IS NULL;

