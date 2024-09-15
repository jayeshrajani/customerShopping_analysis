
use customer_shopping;

drop TABLE customers;

CREATE TABLE IF NOT EXISTS customers (
    CustomerID INT, 
    Gender VARCHAR(10), 
    Age INT, 
    Annual_Income INT,   
    Spending_Score INT,   
    Profession VARCHAR(30),
    Work_Experience INT, 
    Family_Size INT
);

Select * from customers;


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Customers.csv'
INTO TABLE customers
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from customers;

-- cleaning the data according to our use case
DELETE FROM customers
WHERE Age < 12;

-- Distribution of Annual Income

SELECT 
    MIN(Annual_Income) AS Min_Income,
    MAX(Annual_Income) AS Max_Income,
    ROUND(AVG(Annual_Income),2) AS Avg_Income,
    ROUND(STDDEV(Annual_Income),2) AS Std_Income
FROM customers;

-- Distribution of Spending Score

SELECT 
    MIN(Spending_Score) AS Min_Spending_Score,
    MAX(Spending_Score) AS Max_Spending_Score,
    ROUND(AVG(Spending_Score),2) AS Avg_Spending_Score,
    ROUND(STDDEV(Spending_Score),2) AS Std_Spending_Score
FROM customers;


-- average annual income and spending score by age
SELECT 
    Age,
    ROUND(AVG(Annual_Income),2) AS Avg_Income,
    ROUND(AVG(Spending_Score),2) AS Avg_Spending_Score
FROM customers
GROUP BY Age
ORDER BY Age;


-- distribution of profession
SELECT Profession, COUNT(*) AS Count
FROM customers
WHERE Profession IS NOT NULL 
GROUP BY Profession
ORDER BY Count DESC;


-- distribution of gender
SELECT Gender, COUNT(*) AS Count
FROM customers
GROUP BY Gender;

-- average income and average spending score according to respective ages

SELECT 
    Age,
    ROUND(AVG(Annual_Income), 2) AS Avg_Income,
    ROUND(AVG(Spending_Score), 2) AS Avg_Spending_Score
FROM customers
GROUP BY Age
ORDER BY Age;

-- Average spending score and annual income by gender
SELECT 
    Gender,
    ROUND(AVG(Spending_Score), 2) AS Avg_Spending_Score,
    ROUND(AVG(Annual_Income), 2) AS Avg_Income
FROM customers
GROUP BY Gender;



