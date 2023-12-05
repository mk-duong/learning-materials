-- Exercise 1
/* Write a query against the Sales.Orders table 
   that returns orders placed in June 2021 */
SELECT orderid, orderdate, custid, empid
FROM [Sales].[Orders]
WHERE orderdate BETWEEN '2021-06-01' AND '2021-06-30'
;

-- Exercise 2
/* Write a query against the Sales.Orders table 
   that returns orders placed on the day before 
   the last day of the month */
SELECT 
   orderdate
   , DATEDIFF(month, '1900-12-31', orderdate) AS diff
   , DATEADD(month, DATEDIFF(month, '1900-12-31', orderdate), '1900-12-31') AS last_day_of_month
   , DATEADD(month, DATEDIFF(month, '1900-12-31', orderdate), '1900-12-31') - 1 AS day_before
FROM [Sales].[Orders]
;

SELECT orderid, orderdate, custid, empid
FROM [Sales].[Orders]
WHERE orderdate = DATEADD(month, DATEDIFF(month, '1900-01-31', orderdate), '1900-01-31') - 1
;

-- Exercise 3
/* Write a query against the HR.Employees table that 
   returns employees with a last name containing the 
   letter 'e' twice or more */
SELECT
   lastname
   , LEN(lastname) - LEN(REPLACE(lastname, 'e', '')) AS number_of_letter_e_in_name
FROM [HR].[Employees]
;

SELECT
   empid
   , firstname
   , lastname
FROM [HR].[Employees]
WHERE LEN(lastname) - LEN(REPLACE(lastname, 'e', '')) >= 2
;

-- Exercise 4
/* Write a query against the Sales.OrderDetails table that returns orders 
   with a total value (quantity * unitprice) greater than 10,000, sorted 
   by total value, descending */
SELECT
   orderid
   , SUM(qty * unitprice) AS totalvallue
FROM [Sales].[OrderDetails]
GROUP BY orderid
HAVING SUM(qty * unitprice) > 10000
ORDER BY totalvallue DESC
;

-- Exercise 5
/* write a query against the HR.Employees table that 
   returns employees with a last name that starts with 
   a lowercase English letter in the range a through z */
SELECT empid, lastname
FROM [HR].[Employees]
WHERE lastname COLLATE Latin1_General_BIN LIKE N'[a-z]%'
;

-- Exercise 6
/* Explain the difference between the following two queries */

   -- Query 1
   SELECT empid, COUNT(*) AS numorders
   FROM Sales.Orders
   WHERE orderdate < '20220501'
   GROUP BY empid;

   -- Query 2
   SELECT empid, COUNT(*) AS numorders
   FROM Sales.Orders
   GROUP BY empid
   HAVING MAX(orderdate) < '20220501'; 

   /* Query 1 filters for orders placed before May, 2022, then count the number of orders each employee handled among the filtered ones.
      In short, it returns the number of orders each employee handled prior to May, 2022.
   
      Query 2 group empid as groups, then take only groups with MAX(orderdate) before May, 2022 and count the number of orders each employee group handled.
      In short, it discards the ENTIRE employee group if the employee handled any orders after May, 2022.
   */

-- Exercise 7
/* Write a query against the Sales.Orders table that returns 
   the three shipped-to countries with the highest average 
   freight for orders placed in 2021 */
SELECT TOP(3) shipcountry, AVG(freight) AS avgfreight
FROM Sales.Orders
WHERE orderdate BETWEEN '2021-01-01' AND '2021-12-31'
GROUP BY shipcountry
ORDER BY avgfreight DESC
;

-- Exercise 8
/* Write a query against the Sales.Orders table that calculates row numbers 
   for orders based on order date sorting for each customer separately
   (use the order ID as the tiebreaker, i.e., in case of a tie in orderdate, 
   I want to see that of the greater 'order id' first) */
SELECT custid, orderdate, orderid, ROW_NUMBER() OVER(PARTITION BY custid ORDER BY orderdate ASC, orderid DESC)
FROM Sales.Orders
;

-- Exercise 9
/* Using the HR.Employees table, write a SELECT statement that returns for each employee the gender 
   based on the title of courtesy. For 'Ms.' and 'Mrs.' return 'Female'; for 'Mr.' return 'Nale'; 
   and in all other cases (for example, 'Dr.') return 'UnNnown' */
SELECT
   empid
   , firstname
   , lastname
   , titleofcourtesy
   , CASE
      WHEN titleofcourtesy IN ('Ms.', 'Mrs.') THEN 'Female'
      WHEN titleofcourtesy = 'Mr.' THEN 'Male'
      ELSE 'Unknown' END AS gender
FROM [HR].[Employees]
;

-- Exercise 10
/* Write a query against the Sales.Customers table that returns for each customer the 
   customer ID and region. Sort the rows in the output by region in DESCENDING order 
   having NULLs sort last */
SELECT custid, region
FROM [Sales].[Customers]
ORDER BY 
   CASE WHEN region IS NOT NULL then 0 ELSE 1 END
   , region DESC
;