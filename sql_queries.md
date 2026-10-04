
Database  Creation

CREATE  TABLE   shopping_mall(
  invoice_id  VARCHAR(20)  PRIMARY KEY,
	invoice_duplicate  varchar(10),
	customer_id  VARCHAR(20),
	GENDER  VARCHAR(20)  CHECK (GENDER  IN ('Male',   'Female')),
	AGE  INT,
	category  VARCHAR(20),
	quantity INT,
	PRICE  FLOAT,
	Payment_method  VARCHAR(25)  CHECK( Payment_method  IN('Credit Card','Cash','Debit Card')),
	Invoice_date  VARCHAR(10),
	shopping_mall varchar(20)
);



--  Total  Sales

SELECT  SUM(quantity *  price)  AS  Total_Sales
FROM  shopping_mall;



--  Total  Transaction

Select  Count(invoice_id)  AS  total_Transaction 
From  shopping_mall;



--  Total  Customers

Select COUNT(DISTINCT  customer_id) AS  Total_Customers
From  shopping_mall;



-- Total Quantity

select  Sum(quantity)  AS  Total_quantity
From  shopping_mall;



--  Average  Order  Value 

Select 
  Sum(quantity * price)/COUNT(DISTINCT invoice_id)   AS    Average_Order_Value
From  shopping_mall;



-- Sales by Category

select 
  category , 
  Sum(price * quantity) as total_sales
FROM  shopping_mall
Group by category
ORDER by total_sales DESC;



--  Quantity  by  Category

SELECT 
category , 
sum(quantity)  as  total_quantity
FROM  shopping_mall
GROUP BY  CATEGORY
ORDER BY  total_quantity  DESC;



--  Transaction  by category

SELECT
    category,
    COUNT(DISTINCT invoice_id) AS transactions
FROM shopping_mall
GROUP BY category
ORDER BY transactions DESC;



--  Sales  by  gender  


Select  
  gender,
  Sum(quantity  *  price)  as  total_sales
from shopping_mall
group by gender;
  


-- customer  by gender


SELECT
    gender,
    COUNT(DISTINCT customer_id) AS customers
FROM shopping_mall
GROUP BY gender;




--  Sales  by  Age


SELECT
    CASE
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        WHEN age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56+'
    END AS age_group,
    SUM(quantity * price) AS total_sales
FROM shopping_mall
GROUP BY
    CASE
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        WHEN age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56+'
    END
ORDER BY total_sales DESC;



-- Sales  by  payment  method


Select  
    payment_method,
	Sum(quantity *  price)  as  total_sales
From  shopping_mall
Group by payment_method
Order by  total_sales DESC;





-- Transactions by Payment Method


SELECT
    payment_method,
    COUNT(DISTINCT invoice_id) AS transactions
FROM shopping_mall
GROUP BY payment_method
ORDER BY transactions DESC;



--  Sales by Shopping Mall


SELECT
    shopping_mall,
    SUM(quantity * price) AS total_sales
FROM shopping_mall
GROUP BY shopping_mall
ORDER BY total_sales DESC;



-- Transactions by Shopping Mall


SELECT
    shopping_mall,
    COUNT(DISTINCT invoice_id) AS transactions
FROM shopping_mall
GROUP BY shopping_mall
ORDER BY transactions DESC;



--   Average Order Value by Mall


SELECT
    shopping_mall,
    SUM(quantity * price) / COUNT(DISTINCT invoice_id) AS avg_order_value
FROM shopping_mall
GROUP BY shopping_mall
ORDER BY avg_order_value DESC;




--  Monthly Sales


SELECT
    TO_CHAR(invoice_date::date, 'YYYY-MM') AS month,
    SUM(quantity * price) AS total_sales
FROM shopping_mall
GROUP BY TO_CHAR(invoice_date::date, 'YYYY-MM')
ORDER BY month;


--  Monthly Transactions

SELECT
    TO_CHAR(TO_DATE(invoice_date, 'DD/MM/YYYY'), 'YYYY-MM') AS month,
    COUNT(invoice_id) AS transactions
FROM shopping_mall
GROUP BY TO_CHAR(TO_DATE(invoice_date, 'DD/MM/YYYY'), 'YYYY-MM')
ORDER BY month;


--  Sales by Year


SELECT
    EXTRACT(YEAR FROM invoice_date::DATE) AS year,
    SUM(quantity * price) AS total_sales
FROM shopping_mall
GROUP BY EXTRACT(YEAR FROM invoice_date::DATE)
ORDER BY year;




--  Top 10 Customers


SELECT
    customer_id,
    SUM(quantity * price) AS total_spending
FROM shopping_mall
GROUP BY customer_id
ORDER BY total_spending DESC
LIMIT 10;



