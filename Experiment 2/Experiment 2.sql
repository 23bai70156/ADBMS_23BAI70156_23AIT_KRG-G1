USE ADBMS
---------------------Medium level problem---------------------
CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    ManagerID INT NULL  
);

INSERT INTO Employee (EmpID, EmpName, Department, ManagerID)
VALUES
(1, 'Alice', 'HR', NULL),        
(2, 'Bob', 'Finance', 1),
(3, 'Charlie', 'IT', 1),
(4, 'David', 'Finance', 2),
(5, 'Eve', 'IT', 3),
(6, 'Frank', 'HR', 1);

SELECT E1.EmpName AS [EMPLOYEE_NAME], E2.EmpName AS [MANAGER_NAME], E1.Department AS [EMPLOYEE_DEPT], E2.Department AS [MANAGER_DEPT]
FROM
Employee AS E1
LEFT OUTER JOIN
Employee AS E2
ON
E1.ManagerID = E2.EmpID




--Hard level problem
--------------(HARD LEVEL)--------------
--(B) part
-- Create Year_tbl (holds actual NPV values)
CREATE TABLE Year_tbl (
    ID INT,
    YEAR INT,
    NPV INT
);
-- Create Queries table (requested values)
CREATE TABLE Queries (
    ID INT,
    YEAR INT
);

-- Insert data into Year_tbl
INSERT INTO Year_tbl (ID, YEAR, NPV) VALUES
(1, 2018, 100),
(7, 2020, 30),
(13, 2019, 40),
(1, 2019, 113),
(2, 2008, 121),
(3, 2009, 12),
(11, 2020, 99),
(7, 2019, 0);

-- Insert data into Queries
INSERT INTO Queries (ID, YEAR)
VALUES
(1, 2019),
(2, 2008),
(3, 2009),
(7, 2018),
(7, 2019),
(7, 2020),
(13, 2019);

SELECT Q.ID, Q.YEAR, ISNULL(Y.NPV,0)
FROM
Year_tbl AS Y
LEFT OUTER JOIN
Queries AS Q
ON
Y.ID = Q.ID
AND
Q.YEAR = Y.YEAR
