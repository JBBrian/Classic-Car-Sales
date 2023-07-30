-- What are the top selling products?
SELECT
	SUM(o.quantityOrdered) AS quantity,
    p.productCode,
    p.productName
FROM orderdetails o
JOIN products p
	ON o.productCode = p.productCode
GROUP BY productCode
ORDER BY SUM(o.quantityOrdered) DESC;

-- What is our biggest account/client?
SELECT
	c.customerNumber,
    c.customerName,
    COUNT(o.customerNumber) AS ordersPlaced
FROM orders o
JOIN customers c
	ON o.customerNumber = c.customerNumber
GROUP BY customerNumber
ORDER BY COUNT(o.customerNumber) DESC;

-- Who is our top performing employee?
SELECT
    COUNT(o.customerNumber) AS ordersPlaced,
    c.salesRepEmployeeNumber,
    e.lastName,
    e.firstName,
    e.email
FROM orders o
JOIN customers c
	ON o.customerNumber = c.customerNumber
JOIN employees e
	ON e.employeeNumber = c.salesRepEmployeeNumber
GROUP BY c.salesRepEmployeeNumber
ORDER BY COUNT(o.customerNumber) DESC;

-- Total sales per year?
SELECT
    YEAR(o.orderDate) AS sales_year,
    SUM(od.quantityOrdered * od.priceEach) AS total_sales
FROM orders o
JOIN orderDetails od 
	ON o.orderNumber = od.orderNumber
GROUP BY YEAR(o.orderDate);

-- Total sales per month
SELECT
  DATE_FORMAT(o.orderDate, '%Y-%m') AS sales_month,
  SUM(od.quantityOrdered * od.priceEach) AS total_sales
FROM orders o
JOIN orderDetails od 
	ON o.orderNumber = od.orderNumber
GROUP BY DATE_FORMAT(o.orderDate, '%Y-%m');

-- Total Accounts?
SELECT 
	COUNT(customerName)
FROM customers;

-- Top performing office?
SELECT
    COUNT(o.customerNumber) AS ordersPlaced,
    oc.city
FROM orders o
JOIN customers c
	ON o.customerNumber = c.customerNumber
JOIN employees e
	ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN offices oc
	on e.officeCode = oc.officeCode
GROUP BY oc.city
ORDER BY COUNT(o.customerNumber) DESC;




