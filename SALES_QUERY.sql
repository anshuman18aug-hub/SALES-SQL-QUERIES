SELECT * FROM Sales;
SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM SalesPerson;

-- BASIC QUERIES
-- ALL SALES RECORDS
SELECT * FROM Sales;

-- Show all completed sales
SELECT * FROM Sales WHERE Sales.Status = 'Completed';

-- Find total number of sales
SELECT COUNT(Sales.SaleID) AS TOTAL_SALES FROM Sales;

-- Find total revenue (NetAmount)
SELECT SUM(Sales.NetAmount) AS TOTAL_REVENUE FROM Sales;

-- Find highest single sale amount
SELECT MAX(Sales.TotalAmount) AS HIGHEST_SALE_AMOUNT FROM Sales;

-- Find lowest single sale amount
SELECT MIN(Sales.TotalAmount) AS LOWEST_SALE_AMOUNT FROM Sales;

-- Find average discount given
SELECT AVG(Sales.Discount) AS AVG_DISCOUNT FROM Sales;

-- Show sales in year 2024 only
SELECT * FROM Sales WHERE Sales.Year = 2024;

-- Count total number of customers
SELECT COUNT(Customers.CustomerID) AS TOTAL_CUSTOMERS FROM Customers;

-- Show all Premium customers
SELECT * FROM Customers WHERE Customers.CustomerType = 'Premium';

-- Show all customers from Mumbai
SELECT * FROM Customers WHERE Customers.City = 'Mumbai';

-- Find all active products
SELECT * FROM Products WHERE Products.Status = 'Active';

-- Find product with highest unit price
SELECT Products.ProductName FROM Products ORDER BY Products.UnitPrice DESC;

-- Show all active salespersons
SELECT * FROM SalesPerson WHERE SalesPerson.Status = 'Active';

-- Find salesperson with highest base salary
SELECT SalesPerson.SalespersonName, SalesPerson.BaseSalary FROM SalesPerson ORDER BY SalesPerson.BaseSalary DESC;

-- Count total cancelled sales
SELECT COUNT(Sales.Status) AS CANCELLED_SALES FROM Sales WHERE Sales.Status = 'Cancelled';

-- Show top 5 highest net amount sales
SELECT TOP 5 Sales.NetAmount FROM Sales ORDER BY Sales.NetAmount DESC;

-- Find average unit price of all products
SELECT AVG(Products.UnitPrice) AS AVG_UNITPRICE FROM Products;

-- Show all male customers
SELECT * FROM Customers WHERE Customers.Gender = 'Male';

-- Count products by category
SELECT COUNT(Products.Category) AS TOTAL_COUNT, Products.Category FROM Products GROUP BY Products.Category;

-- JOINS QUERY
-- Show sale ID with customer name for each sale
SELECT Sales.SaleID, Customers.CustomerName FROM Customers INNER JOIN Sales ON Sales.CustomerID=Customers.CustomerID;

-- Show sale ID with product name for each sale
SELECT Sales.SaleID, Products.ProductName FROM Products INNER JOIN Sales ON Sales.ProductID=Products.ProductID;

-- Show sale ID with salesperson name for each sale
SELECT Sales.SaleID, SalesPerson.SalespersonName FROM SalesPerson INNER JOIN Sales ON Sales.SalespersonID=SalesPerson.SalespersonID;

-- Show complete sale details with customer and product
SELECT * FROM Products INNER JOIN Sales ON Sales.ProductID=Products.ProductID INNER JOIN Customers ON Customers.CustomerID=Sales.CustomerID;

-- Show customer name with total amount they spent
SELECT Customers.CustomerName, SUM(Sales.TotalAmount) AS TOTAL_AMOUNT FROM Sales INNER JOIN Customers ON Customers.CustomerID=Sales.CustomerID GROUP BY Customers.CustomerName;

-- Show product name with total quantity sold
SELECT Products.ProductName, SUM(Sales.Quantity) AS TOTAL_QUANTITY_SOLD FROM Sales INNER JOIN Products ON Products.ProductID=Sales.ProductID GROUP BY Products.ProductName;

-- Show salesperson name with total sales they made
SELECT SalesPerson.SalespersonName, SUM(Sales.TotalAmount) AS TOTAL_SALE FROM Sales INNER JOIN SalesPerson ON SalesPerson.SalespersonID=Sales.SalespersonID GROUP BY SalesPerson.SalespersonName;

-- Show customers who never made any purchase
SELECT Customers.CustomerName FROM Customers LEFT JOIN Sales ON Customers.CustomerID=Sales.CustomerID WHERE Sales.CustomerID IS NULL;

-- Show products that were never sold
SELECT Products.ProductName FROM Products LEFT JOIN Sales ON Sales.ProductID=Products.ProductID WHERE Products.ProductID IS NULL;

-- Show category wise total revenue
SELECT Products.Category, SUM(Sales.NetAmount) AS TOTAL_REVENUE FROM Sales INNER JOIN Products ON Products.ProductID=Sales.ProductID GROUP BY Products.Category;

-- Show salesperson name with their region and total sales
SELECT SalesPerson.SalespersonName, SalesPerson.Region, SUM(Sales.NetAmount) AS TOTAL_SALE FROM Sales INNER JOIN SalesPerson ON SalesPerson.SalespersonID=Sales.SalespersonID GROUP BY SalesPerson.Region, SalesPerson.SalespersonName;

-- Show customer name with their city and total purchases
SELECT Customers.CustomerName, Customers.City, SUM(Sales.NetAmount) AS TOTAL_PURCHASE FROM Sales INNER JOIN Customers ON Customers.CustomerID=Sales.CustomerID GROUP BY Customers.City,Customers.CustomerName;

-- Show product name with profit % and total revenue
SELECT Products.ProductName, Products.Profit, SUM(Sales.NetAmount) AS TOTAL_REVENUE FROM Sales INNER JOIN Products ON Products.ProductID=Sales.ProductID GROUP BY Products.ProductName, Products.Profit;

-- Show salesperson with highest sales amount
SELECT SalesPerson.SalespersonName, Sales.TotalAmount FROM Sales INNER JOIN SalesPerson ON SalesPerson.SalespersonID=Sales.SalespersonID ORDER BY Sales.TotalAmount DESC;

-- Show top 3 customers by total purchase amount
SELECT TOP 3 Customers.CustomerName, Sales.TotalAmount FROM Sales INNER JOIN Customers ON Customers.CustomerID=Sales.CustomerID ORDER BY Sales.TotalAmount DESC;

-- Find customers who spent more than average customer spending
SELECT DISTINCT(Customers.CustomerName) FROM Customers INNER JOIN Sales ON Sales.CustomerID=Customers.CustomerID WHERE Sales.TotalAmount > (SELECT AVG(Sales.TotalAmount) FROM Sales);

-- Find products with price above average product price
SELECT Products.ProductName, Products.UnitPrice FROM Products WHERE Products.UnitPrice > (SELECT AVG(Products.UnitPrice) FROM Products);

-- Find salesperson with sales above average sales amount
SELECT DISTINCT(SalesPerson.SalespersonName) FROM SalesPerson INNER JOIN Sales ON Sales.SalespersonID=SalesPerson.SalespersonID WHERE Sales.NetAmount > (SELECT AVG(Sales.NetAmount) FROM Sales);

-- Find top selling product in each category
SELECT Products.Category, Products.ProductName, MAX(Sales.Quantity) AS TOTAL_QUANTITY FROM Sales INNER JOIN Products ON Products.ProductID=Sales.ProductID GROUP BY Products.Category,Products.ProductName ORDER BY MAX(Sales.Quantity) DESC;

-- Find customers who bought Electronics products
SELECT Customers.CustomerName, Products.Category, Products.ProductName FROM Products INNER JOIN Sales ON Sales.ProductID=Products.ProductID INNER JOIN Customers ON Sales.CustomerID=Customers.CustomerID WHERE Products.Category = 'Electronics';



