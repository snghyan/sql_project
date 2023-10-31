-- Create a new database (change 'sales_samaple_data' to your desired database name)
CREATE DATABASE sales_samaple_data;

-- Connect to the newly created database
\c sales_samaple_data;

-- Create the "sales_sample" table with the specified columns
CREATE TABLE sales_sample (
    Product_id INTEGER,
    Region VARCHAR(50),
    Date DATE,
    Sales_Amount NUMERIC
);
-- Insert 10 sample records into the "sales_sample" table
INSERT INTO sales_sample (Product_id, Region, Date, Sales_Amount)
VALUES
    (1, 'East', '2023-10-01', 1000.00),
    (2, 'West', '2023-10-02', 750.50),
    (3, 'North', '2023-10-03', 1200.75),
    (4, 'South', '2023-10-04', 900.25),
    (5, 'Central', '2023-10-05', 1500.00),
    (6, 'East', '2023-10-06', 800.00),
    (7, 'West', '2023-10-07', 950.75),
    (8, 'North', '2023-10-08', 1100.50),
    (9, 'South', '2023-10-09', 850.25),
    (10, 'Central', '2023-10-10', 1300.00);


--Task 4. 3a

SELECT Region, Product_id, SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY Region, Product_id
ORDER BY Region, Product_id;

 

--Task 4. 3b
SELECT Region, SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY Region
ORDER BY Region;

 
--Task 4. 3c
SELECT Region, Product_id, Date, SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY CUBE (Region, Product_id, Date)
ORDER BY Region, Product_id, Date;
 

SELECT *
FROM sales_sample
WHERE Region = 'East';
SELECT *
FROM sales_sample
WHERE Date BETWEEN '2023-10-01' AND '2023-10-05';


SELECT *
FROM sales_sample
WHERE Product_id = 1
  AND Region = 'East'
  AND Date BETWEEN '2023-10-01' AND '2023-10-05';
