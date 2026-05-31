-- OPERATOR QUERIES

-- AND QUERIES

-- Show sales where quantity > 20 AND discount > 10
SELECT Sales.Quantity, Sales.Discount FROM Sales WHERE Sales.Quantity > 20 AND Sales.Discount > 10;

-- Show customers who are Male AND from Mumbai
SELECT Customers.Gender, Customers.City, Customers.CustomerName FROM Customers WHERE Customers.Gender = 'Male' AND Customers.City = 'Mumbai';

-- Show products where category is Electronics AND status is Active
SELECT Products.ProductName, Products.Category, Products.Status FROM Products WHERE ProductS.Category = 'Electronics' AND Products.Status = 'Active';

-- Show sales where year is 2024 AND status is Completed
SELECT Sales.SaleID, Sales.Year, Sales.Status FROM Sales WHERE Sales.Year = 2024 AND Sales.Status = 'Completed';

-- Show salespersons from North region AND status is Active
SELECT SalesPerson.SalespersonName, SalesPerson.Region, SalesPerson.Status FROM SalesPerson WHERE SalesPerson.Region = 'North' AND SalesPerson.Status = 'Active';

-- Show customers who are Female AND from Bangalore
SELECT Customers.CustomerName, Customers.Gender, Customers.City FROM Customers WHERE Customers.Gender = 'Female' AND Customers.City = 'Bangalore';

-- Show products where UnitPrice > 10000 AND Stock > 50
SELECT Products.ProductName, Products.UnitPrice, Products.Stock FROM Products WHERE Products.UnitPrice > 10000 AND Products.Stock > 50;

-- Show sales where NetAmount > 50000 AND discount = 0
SELECT Sales.SaleID, Sales.NetAmount, Sales.Discount FROM Sales WHERE Sales.NetAmount > 50000 AND Sales.Discount = 0;


-- OR QUERIES
-- Show customers from Mumbai OR Delhi
SELECT Customers.CustomerName, Customers.City FROM Customers WHERE Customers.City = 'Mumbai' OR Customers.City = 'Delhi';

-- Show products from Electronics OR Sports category
SELECT Products.ProductName, Products.Category FROM Products WHERE Products.Category = 'Electronics' OR Products.Category = 'Sports';

-- Show sales with status Completed OR Pending
SELECT Sales.SaleID , Sales.Status FROM Sales WHERE Sales.Status = 'Completed' OR Sales.Status = 'Pending';

-- Show salespersons from North OR South region
SELECT SalesPerson.SalespersonName, SalesPerson.Region FROM SalesPerson WHERE SalesPerson.Region = 'North' OR SalesPerson.Region = 'South';

-- Show customers who are Premium OR from Chennai
SELECT Customers.CustomerName, Customers.CustomerType, Customers.City FROM Customers WHERE Customers.CustomerType = 'Premium' OR Customers.City = 'Chennai';

-- Show products where stock < 50 OR status is Inactive
SELECT Products.ProductName, Products.Stock, Products.Status FROM Products WHERE Products.Stock < 50 OR Products.Status = 'Inactive';

-- Show sales in year 2023 OR with discount above 15
SELECT Sales.SaleID, Sales.Year, Sales.Discount FROM Sales WHERE Sales.Year = 2023 OR Sales.Discount > 15;

-- Show salespersons joined in 2019 OR 2020
SELECT SalesPerson.SalespersonName, SalesPerson.JoinYear FROM SalesPerson WHERE SalesPerson.JoinYear = 2019 OR SalesPerson.JoinYear = 2020;


-- NOT QUERIES


-- Show all customers NOT from Mumbai
SELECT Customers.CustomerName, Customers.City FROM Customers WHERE Customers.City NOT IN ('Mumbai');

-- Show products that are NOT Electronics
SELECT Products.ProductName, Products.Category FROM Products WHERE Products.Category NOT IN ('Electronics');

-- Show sales that are NOT Cancelled
SELECT Sales.SaleID, Sales.Status FROM Sales WHERE Sales.Status NOT IN ('Cancelled');

-- Show salespersons who are NOT Inactive
SELECT SalesPerson.SalespersonName, SalesPerson.Status FROM SalesPerson WHERE SalesPerson.Status NOT IN ('Inactive');

-- Show customers who are NOT Male
SELECT Customers.CustomerName, Customers.Gender FROM Customers WHERE Customers.Gender NOT IN ('Male');

-- Show products that are NOT from Sports category
SELECT Products.ProductName, Products.Category FROM Products WHERE Products.Category NOT IN ('Sports');

-- Show sales where discount is NOT 0
SELECT Sales.SaleID, Sales.Discount FROM Sales WHERE Sales.Discount NOT IN (0);

-- Show salespersons NOT from North region
SELECT SalesPerson.SalespersonName, SalesPerson.Region FROM SalesPerson WHERE SalesPerson.Region NOT IN ('North');

-- LIKE QUERIES

-- Find customers whose name starts with R
SELECT Customers.CustomerName FROM Customers WHERE Customers.CustomerName LIKE 'R%';

-- Find customers whose name ends with a
SELECT Customers.CustomerName FROM Customers WHERE Customers.CustomerName LIKE '%A';

-- Find salespersons whose name starts with S
SELECT SalesPerson.SalespersonName FROM SalesPerson WHERE SalesPerson.SalespersonName LIKE 'S%';

-- Find products whose name starts with S
SELECT Products.ProductName FROM Products WHERE Products.ProductName LIKE 'S%';

-- Find salespersons whose manager name contains Rajesh
SELECT SalesPerson.SalespersonName, SalesPerson.Manager FROM SalesPerson WHERE SalesPerson.Manager LIKE '%Rajesh%';

-- Find products whose supplier contains Tech
SELECT Products.ProductName, Products.Supplier FROM Products WHERE Products.Supplier LIKE '%Tech%';

-- Find customers whose name contains Kumar
SELECT Customers.CustomerName FROM Customers WHERE Customers.CustomerName LIKE '%Kumar%';

-- BETWEEN QUERIES

-- Show sales where NetAmount is between 10000 and 50000
SELECT Sales.SaleID, Sales.NetAmount FROM Sales WHERE Sales.NetAmount BETWEEN 10000 AND 50000;

-- Show customers whose age is between 25 and 35
SELECT Customers.CustomerName, Customers.Age FROM Customers WHERE Customers.Age BETWEEN 25 AND 35;

-- Show products whose UnitPrice is between 1000 and 10000
SELECT Products.ProductName, Products.UnitPrice FROM Products WHERE Products.UnitPrice BETWEEN 1000 AND 10000;

-- Show salespersons whose salary is between 42000 and 48000
SELECT SalesPerson.SalespersonName, SalesPerson.BaseSalary FROM SalesPerson WHERE SalesPerson.BaseSalary BETWEEN 42000 AND 48000;


-- COMBINED QUERIES

-- Show female customers from Mumbai OR Delhi
SELECT Customers.CustomerName, Customers.Gender, Customers.City FROM Customers WHERE Customers.Gender = 'Female' AND (Customers.City = 'Mumbai' OR Customers.City = 'Delhi');

-- Show active products NOT in Electronics category
SELECT Products.ProductName, Products.Category, Products.Status FROM Products WHERE Products.Status = 'Active' AND (Products.Category NOT IN ('Electronics'));

-- Show completed sales in 2024 with discount between 5 and 15
SELECT Sales.SaleID, Sales.Year, Sales.Discount FROM Sales WHERE Sales.Year = 2024 AND (Sales.Discount BETWEEN 5 AND 15);

-- Show customers whose name starts with R AND are Premium
SELECT Customers.CustomerName, Customers.CustomerType FROM Customers WHERE Customers.CustomerName LIKE 'R%' AND (Customers.CustomerType = 'Premium');

-- Show products whose name contains Phone OR Laptop AND are Active
SELECT Products.ProductName, Products.Status FROM Products WHERE Products.Status = 'Active' AND (Products.ProductName LIKE '%Phone%' OR Products.ProductName LIKE '%Laptop%');

-- Show salespersons from North OR South AND joined after 2020
SELECT SalesPerson.SalespersonName, SalesPerson.Region, SalesPerson.JoinYear FROM SalesPerson WHERE SalesPerson.JoinYear > 2020 AND (SalesPerson.Region = 'North' OR SalesPerson.Region = 'South');

-- Show sales NOT cancelled AND NetAmount between 20000 and 100000
SELECT Sales.SaleID, Sales.Status, Sales.NetAmount FROM Sales WHERE Sales.Status NOT IN ('Cancelled') AND (Sales.NetAmount BETWEEN 20000 AND 100000);

-- Show customers NOT from Mumbai AND age between 25 and 40
SELECT Customers.CustomerName, Customers.City, Customers.Age FROM Customers WHERE Customers.City NOT IN ('Mumbai') AND (Customers.Age BETWEEN 25 AND 40);

-- Show products NOT inactive AND price between 5000 and 30000
SELECT Products.ProductName, Products.Status, Products.UnitPrice FROM Products WHERE Products.Status NOT IN ('Inactive') AND (Products.UnitPrice BETWEEN 5000 AND 30000);

-- Show active salespersons from North OR East region with salary above 45000
SELECT SalesPerson.SalespersonName, SalesPerson.Region, SalesPerson.Status, SalesPerson.BaseSalary FROM SalesPerson WHERE SalesPerson.BaseSalary > 45000 AND (SalesPerson.Region = 'North' OR SalesPerson.Region = 'East');