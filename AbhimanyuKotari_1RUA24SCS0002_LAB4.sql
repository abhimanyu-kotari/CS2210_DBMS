-- ======================================================================
-- Lab Experiment 04 – Implementation of Different Types of Operators in SQL
-- ======================================================================
-- Name: Abhimanyu Kotari
-- USN : 1RUA24SCS0002
-- Section : A

-- Step 1: Create Database
DROP DATABASE IF EXISTS OperatorLab;
CREATE DATABASE OperatorLab;
USE OperatorLab;

-- Step 2: Create Tables
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Salary DECIMAL(10, 2),
    Department VARCHAR(50),
    HireDate DATE,
    Address VARCHAR(100)
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    EmployeeID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Step 3: Insert Sample Data
INSERT INTO Employees (EmployeeID, Name, Age, Salary, Department, HireDate, Address) VALUES
(1001, 'Ashish', 28, 60000, 'IT', '2024-05-01', '123 Main St, New York'),
(1002, 'Binay', 45, 80000, 'HR', '2020-07-15', '456 Elm St, Chicago'),
(1003, 'Charlie', 32, 55000, 'Finance', '2022-01-10', '789 Oak St, Los Angeles'),
(1004, 'Dhruv', 38, 75000, 'HR', '2021-10-30', '101 Pine St, New York');

INSERT INTO Departments (DepartmentID, DepartmentName, EmployeeID) VALUES
(1, 'IT', 1001),
(2, 'HR', 1002),
(3, 'Finance', 1003);

-- ======================================================================
-- PRACTICE TASKS
-- ======================================================================

-- ========================
-- Exercise 1: Arithmetic Operators
-- ========================

-- a. Add a bonus (10% of Salary) to each employee's salary.
-- WRITE YOUR QUERY BELOW
SELECT EmployeeID, Name, Salary, (Salary + (Salary * 0.10)) AS Salary_With_Bonus
FROM Employees;

-- output
-- 	EmployeeID	Name	Salary	Salary_With_Bonus
-- 	1001	Ashish	60000.00	66000.0000
-- 	1002	Binay	80000.00	88000.0000
-- 	1003	Charlie	55000.00	60500.0000
-- 	1004	Dhruv	75000.00	82500.0000

-- b. Subtract tax (15% of Salary) from each employee's salary.
-- WRITE YOUR QUERY BELOW
SELECT EmployeeID, Name, Salary, (Salary - (Salary * 0.15)) AS Salary_After_Tax
FROM Employees;

-- output
-- 	EmployeeID	Name	Salary	Salary_After_Tax
-- 	1001	Ashish	60000.00	51000.0000
-- 	1002	Binay	80000.00	68000.0000
-- 	1003	Charlie	55000.00	46750.0000
-- 	1004	Dhruv	75000.00	63750.0000

-- -- c. Calculate the yearly salary from the monthly salary (Salary * 12).
-- WRITE YOUR QUERY BELOW

SELECT EmployeeID, Name, Salary, (Salary * 12) AS Yearly_Salary
FROM Employees;

-- output

-- 	EmployeeID	Name	Salary	Yearly_Salary
-- 	1001	Ashish	60000.00	720000.00
-- 	1002	Binay	80000.00	960000.00
-- 	1003	Charlie	55000.00	660000.00
-- 	1004	Dhruv	75000.00	900000.00
    
-- d. Find the remainder when employees' ages are divided by 5.
-- WRITE YOUR QUERY BELOW

SELECT EmployeeID, Name, Age, (Age % 5) AS Age_Remainder
FROM Employees;

-- output
-- 	EmployeeID	Name	Age	Age_Remainder
-- 	1001	Ashish	28	3
-- 	1002	Binay	45	0
-- 	1003	Charlie	32	2
-- 	1004	Dhruv	38	3



-- ========================
-- Exercise 2: Logical Operators
-- ========================

-- a. Employees older than 30 and salary greater than 50000.
-- WRITE YOUR QUERY BELOW
SELECT * FROM Employees
WHERE Age > 30 AND Salary > 50000;

-- output
-- 1002	Binay	45	80000.00	HR	2020-07-15	456 Elm St, Chicago
-- 1003	Charlie	32	55000.00	Finance	2022-01-10	789 Oak St, Los Angeles
-- 1004	Dhruv	38	75000.00	HR	2021-10-30	101 Pine St, New York
						

-- b. Employees either in 'HR' department OR salary > 70000.
-- WRITE YOUR QUERY BELOW
SELECT * FROM Employees
WHERE Department = 'HR' OR Salary > 70000;

-- output
-- 1002	Binay	45	80000.00	HR	2020-07-15	456 Elm St, Chicago
-- 1004	Dhruv	38	75000.00	HR	2021-10-30	101 Pine St, New York
						
-- c. Employees who do NOT live in 'New York'.
-- WRITE YOUR QUERY BELOW
SELECT * FROM Employees
WHERE Address NOT LIKE '%New York%';

-- output
-- 1002	Binay	45	80000.00	HR	2020-07-15	456 Elm St, Chicago
-- 1003	Charlie	32	55000.00	Finance	2022-01-10	789 Oak St, Los Angeles
						

-- ========================
-- Exercise 3: Comparison Operators
-- ========================

-- a. Find employees with salary = 60000.
-- WRITE YOUR QUERY BELOW
SELECT * FROM Employees
WHERE Salary = 60000;

-- output
-- 1001	Ashish	28	60000.00	IT	2024-05-01	123 Main St, New York
						

-- b. List employees not in the 'IT' department.
-- WRITE YOUR QUERY BELOW
SELECT * FROM Employees
WHERE Department <> 'IT';

-- output

-- 1002	Binay	45	80000.00	HR	2020-07-15	456 Elm St, Chicago
-- 1003	Charlie	32	55000.00	Finance	2022-01-10	789 Oak St, Los Angeles
-- 1004	Dhruv	38	75000.00	HR	2021-10-30	101 Pine St, New York
						

-- c. Retrieve employees younger than 25 with salary > 50000.
-- WRITE YOUR QUERY BELOW
SELECT * FROM Employees
WHERE Age < 25 AND Salary > 50000;

-- output:

-- null null null null null null null



-- ========================
-- Exercise 4: Special Operators
-- ========================

-- a. BETWEEN → List employees with age between 25 and 35.
-- WRITE YOUR QUERY BELOW
SELECT * FROM Employees
WHERE Age BETWEEN 25 AND 35;

-- output:

-- 	EmployeeID	Name	Age	Salary	Department	HireDate	Address
-- 	1001	Ashish	28	60000.00	IT	2024-05-01	123 Main St, New York
-- 	1003	Charlie	32	55000.00	Finance	2022-01-10	789 Oak St, Los Angeles
							

-- b. IN → Find employees working in 'HR', 'IT', or 'Finance'.
-- WRITE YOUR QUERY BELOW
SELECT * FROM Employees
WHERE Department IN ('HR', 'IT', 'Finance');

-- output:
-- 	EmployeeID	Name	Age	Salary	Department	HireDate	Address
-- 	1001	Ashish	28	60000.00	IT	2024-05-01	123 Main St, New York
-- 	1003	Charlie	32	55000.00	Finance	2022-01-10	789 Oak St, Los Angeles
							

-- c. LIKE → Find employees whose names start with 'A'.
-- WRITE YOUR QUERY BELOW

SELECT * FROM Employees
WHERE Name LIKE 'A%';

-- output:

-- 1001	Ashish	28	60000.00	IT	2024-05-01	123 Main St, New York
						

-- d. IS NULL → List employees whose address is not available.
-- WRITE YOUR QUERY BELOW

SELECT * FROM Employees
WHERE Address IS NULL;

-- output:

-- null null null null null null null

-- ========================
-- Exercise 5: Set Operators
-- ========================

-- NOTE: For these, assume you have two Employee tables (Employees2022 and Employees2023).

-- a. UNION → Retrieve employees from 'HR' department in 2023 and 2022.
-- WRITE YOUR QUERY BELOW


-- b. INTERSECT → Find common employees in 'IT' department across 2022 & 2023.
-- (MySQL doesn’t have INTERSECT directly – use INNER JOIN / EXISTS workaround)
-- WRITE YOUR QUERY BELOW


-- c. EXCEPT → Find employees who worked in 2023 but not in 2022.
-- (MySQL doesn’t have EXCEPT directly – use LEFT JOIN / NOT EXISTS workaround)
-- WRITE YOUR QUERY BELOW


-- ======================================================================
-- END OF EXPERIMENT 04
-- ======================================================================