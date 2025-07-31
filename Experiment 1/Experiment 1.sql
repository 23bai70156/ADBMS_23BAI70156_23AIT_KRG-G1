USE ADBMS
---------------------Easy Difficulty Problem---------------------
--Creating table 1 for storing the information of each author
CREATE TABLE TBL_AUTHOR
(
	AUTHOR_ID INT PRIMARY KEY,--Declaring author_id as primary key in order to use it as a foriegn key in the other table
	AUTHOR_NAME VARCHAR(MAX),
	COUNTRY VARCHAR(MAX)
)
--Creating table number 2 for storing the information of books
CREATE TABLE TBL_BOOKS
(	
	BOOK_ID INT PRIMARY KEY,
	BOOK_TITLE VARCHAR(MAX),
	AUTHORID INT
	FOREIGN KEY (AUTHORID) REFERENCES TBL_AUTHOR(AUTHOR_ID)
)

-- Inserting the values into both the tables
INSERT INTO TBL_AUTHOR (AUTHOR_ID, AUTHOR_NAME, COUNTRY) VALUES
(1, 'Leo Tolstoy', 'Russia'),
(2, 'Jane Austen', 'United Kingdom'),
(3, 'R.K. Narayan', 'India'),
(4, 'Ernest Hemingway', 'United States'),
(5, 'Isabel Allende', 'Chile'),
(6, 'Franz Kafka', 'Austria-Hungary');

INSERT INTO TBL_BOOKS (BOOK_ID, BOOK_TITLE, AUTHORID) VALUES
(101, 'War and Peace', 1),
(102, 'Pride and Prejudice', 2),
(103, 'Malgudi Days', 3),
(104, 'The Old Man and the Sea', 4),
(105, 'The House of the Spirits', 5),
(106, 'The Trial', 3);

-- Inner join to get book name, author, and country as specified
SELECT B.BOOK_TITLE AS [BOOK NAME], A.AUTHOR_NAME, A.COUNTRY
FROM TBL_BOOKS AS B
INNER JOIN TBL_AUTHOR AS A
ON B.AUTHORID = A.AUTHOR_ID;



---------------------Medium Difficulty Problem---------------------
-- Creating department table
CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100)
);

-- Createing course table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

-- Inserting values into departments
INSERT INTO Department VALUES
(1, 'Computer Science'),
(2, 'Physics'),
(3, 'Mathematics'),
(4, 'Chemistry'),
(5, 'Biology');

-- Inserting values into courses
INSERT INTO Course VALUES
(101, 'Data Structures', 1),
(102, 'Operating Systems', 1),
(103, 'Quantum Mechanics', 2),
(104, 'Electromagnetism', 2),
(105, 'Linear Algebra', 3),
(106, 'Calculus', 3),
(107, 'Organic Chemistry', 4),
(108, 'Physical Chemistry', 4),
(109, 'Genetics', 5),
(110, 'Molecular Biology', 5),
(111, 'ADBMS', 1),
(112, 'FUll Stack', 1),
(113, 'Discrete Mahematics', 3),
(114, 'Inorganic Chemistry', 4);

--Filtering departments with more than two courses
SELECT DeptName AS [Department Name], CourseCount AS [Number of Courses]
FROM (
    SELECT D.DeptName, COUNT(C.CourseID) AS CourseCount
    FROM Department AS D
    JOIN Course AS C
    ON D.DeptID = C.DeptID
    GROUP BY D.DeptName
) AS DeptCourseCount
WHERE CourseCount > 2;

CREATE LOGIN TEST_LOGIN WITH PASSWORD = 'TEst@123';
USE ADBMS;
CREATE USER TEST_USER FOR LOGIN TEST_LOGIN;
GRANT SELECT ON Course TO TEST_USER;
