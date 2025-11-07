-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Lab Experiment 03: Implementation of different types of SQL functions.

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: Abhimanyu Kotari
-- USN: 1RUA24SCS0002
-- SECTION: A
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Paste the Output below by execution of above command
#'root@localhost', 'LAPTOP-K7791IUN', '8.0.43', '2025-09-29 09:50:00'


-- -----------------------------------------------------------------------------------------------------------------------------------------
-- PreCoded Relational Schema and Instance.
-- -----------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10, 2),
    BirthDate DATE,
    HireDate DATE
);

INSERT INTO Employees (FirstName, LastName, Salary, BirthDate, HireDate) VALUES
('John', 'Doe', 55000.30, '1985-06-15', '2010-01-20'),
('Jane', 'Smith', 65000.50, '1990-08-22', '2012-07-10'),
('Alice', 'Johnson', 72000.10, '1982-11-30', '2015-05-25'),
('Bob', 'Brown', 48000.90, '1978-03-12', '2018-09-15');

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    EmployeeID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

INSERT INTO Orders (OrderDate, TotalAmount, EmployeeID) VALUES
('2024-07-15', 250.00, 1),
('2024-08-10', 175.50, 2),
('2024-09-01', 300.00, 3),
('2024-09-10', 450.75, 1),
('2024-08-25', 123.40, 4);
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Print the Information of the Employee and Order Table. [ Hint: SELECT * FROM TABLENAME ]
-- Write the SQL Query below this line.

select * from Employees;
select * from orders;

-- Output: 

# Employee table
-- '1', 'John', 'Doe', '55000.30', '1985-06-15', '2010-01-20'
-- '2', 'Jane', 'Smith', '65000.50', '1990-08-22', '2012-07-10'
-- '3', 'Alice', 'Johnson', '72000.10', '1982-11-30', '2015-05-25'
-- '4', 'Bob', 'Brown', '48000.90', '1978-03-12', '2018-09-15'

#Orders Table
-- 1	2024-07-15	250.00	1
-- 2	2024-08-10	175.50	2
-- 3	2024-09-01	300.00	3
-- 4	2024-09-10	450.75	1
-- 5	2024-08-25	123.40	4

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Number Functions Section
-- ------------------------------------------------------------
/* a. Round Salaries: Round employee salaries to nearest integer */
SELECT EmployeeID, FirstName, LastName, Salary, ROUND(Salary) AS Rounded_Salary
FROM Employees;

-- Output: 

	-- EmployeeID	FirstName	LastName	Salary	Rounded_Salary
-- 	1	John	Doe	55000.30	55000
-- 	2	Jane	Smith	65000.50	65001
-- 	3	Alice	Johnson	72000.10	72000
-- 	4	Bob	Brown	48000.90	48001

/* b. Absolute Values: Show absolute values of salaries */
SELECT EmployeeID, FirstName, Salary, ABS(Salary) AS Absolute_Salary
FROM Employees;

-- Output: 
-- 	EmployeeID	FirstName	Salary	Absolute_Salary
-- 	1	John	55000.30	55000.30
-- 	2	Jane	65000.50	65000.50
-- 	3	Alice	72000.10	72000.10
-- 	4	Bob	48000.90	48000.90

/* c. Ceiling Values: Get ceiling values of order amounts */

SELECT OrderID, TotalAmount, CEIL(TotalAmount) AS Ceiling_Amount
FROM Orders;

-- Output: 

-- 	OrderID	TotalAmount	Ceiling_Amount
-- 	1	250.00	250
-- 	2	175.50	176
-- 	3	300.00	300
-- 	4	450.75	451
-- 	5	123.40	124
-- ------------------------------------------------------------
-- Aggregate Functions Section
-- ------------------------------------------------------------
/* a. Count of Employees: Find total number of employees */
SELECT COUNT(*) AS Total_Employees FROM Employees;

-- Output: 
	-- Total_Employees
-- 	4

/* b. Sum of Salaries: Calculate total salary expense */

SELECT SUM(Salary) AS Total_Salary_Expense FROM Employees;

-- Output: 

-- 	Total_Salary_Expense
-- 	240001.80

/* c. Average Order Amount: Find average order value */

SELECT AVG(TotalAmount) AS Average_Order_Amount FROM Orders;

-- Output: 
-- 	Average_Order_Amount
-- 	259.930000

/* d. Max/Min Salary: Find highest and lowest salaries */

SELECT MAX(Salary) AS Highest_Salary, MIN(Salary) AS Lowest_Salary
FROM Employees;

-- Output: 
-- 	Highest_Salary	Lowest_Salary
-- 	72000.10	48000.90
-- ------------------------------------------------------------

-- Character Functions Section
-- ------------------------------------------------------------
/* a. Case Conversion: Show names in uppercase and lowercase */
SELECT UPPER(FirstName) AS Upper_Name, LOWER(LastName) AS Lower_Name
FROM Employees;

-- Output: 
-- 	Upper_Name	Lower_Name
-- 	JOHN	doe
-- 	JANE	smith
-- 	ALICE	johnson
-- 	BOB	brown

/* b. Concatenate Names: Create full names */

-- SELECT CONCAT(FirstName, ' ', LastName) AS Full_Name
-- FROM Employees;

-- Output: 
	-- Upper_Name	Lower_Name
-- 	JOHN	doe
-- 	JANE	smith
-- 	ALICE	johnson
-- 	BOB	brown

/* c. Extract Substring: Get first 3 characters of first names */

SELECT FirstName, SUBSTRING(FirstName, 1, 3) AS First_3_Chars
FROM Employees;

-- Output: 

-- 	FirstName	First_3_Chars
-- 	John	Joh
-- 	Jane	Jan
-- 	Alice	Ali
-- 	Bob	Bob

-- ------------------------------------------------------------
-- Conversion Functions Section
-- ------------------------------------------------------------
/* Convert String to Date: Convert text to DATE type */

SELECT STR_TO_DATE('2025-12-25', '%Y-%m-%d') AS Converted_Date;

-- Output: 
	-- Converted_Date
-- 	2025-12-25
-- 	Converted_Date
-- 	2025-12-25
-- ------------------------------------------------------------
-- Date Functions Section
-- ------------------------------------------------------------
/* a. Current Date/Time: Get current timestamp */

SELECT NOW() AS CurrentTime;


-- Output: 
-- 	CurrentTime
-- 	2025-09-29 10:16:57

/* b. Extract Year: Get year from order dates */

SELECT OrderID, OrderDate, YEAR(OrderDate) AS Order_Year
FROM Orders;

-- Output: 

-- 	OrderID	OrderDate	Order_Year
-- 	1	2024-07-15	2024
-- 	2	2024-08-10	2024
-- 	3	2024-09-01	2024
-- 	4	2024-09-10	2024
-- 	5	2024-08-25	2024
    
/* c. Add Months: Add 3 months to order dates */

SELECT OrderID, OrderDate, DATE_ADD(OrderDate, INTERVAL 3 MONTH) AS Plus_3_Months
FROM Orders;

-- Output: 

-- 	OrderID	OrderDate	Plus_3_Months
-- 	1	2024-07-15	2024-10-15
-- 	2	2024-08-10	2024-11-10
-- 	3	2024-09-01	2024-12-01
-- 	4	2024-09-10	2024-12-10
-- 	5	2024-08-25	2024-11-25
    
/* d. Days Since Order: Calculate days between order date and now */

SELECT OrderID, OrderDate, DATEDIFF(NOW(), OrderDate) AS Days_Since_Order
FROM Orders;

-- Output: 
	-- OrderID	OrderDate	Days_Since_Order
-- 	1	2024-07-15	441
-- 	2	2024-08-10	415
-- 	3	2024-09-01	393
-- 	4	2024-09-10	384
-- 	5	2024-08-25	400

-- END of the Task -- 