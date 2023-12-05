-- Exercise 1-1
/* Write a query that generates five copies of each employee row */
SELECT e1.empid, e1.firstname, e1.lastname, e2.empid as n
FROM [HR].[Employees] e1
CROSS JOIN [HR].[Employees] e2
INNER JOIN [dbo].[Nums] num
   ON e2.empid = num.n
WHERE num.n <= 5
ORDER BY num.n
;

-- Exercise 1-2
/* Write a query that returns a row for each employee and 
   day in the range June 12, 2022 through June 16, 2022 */