-- FINAL PROJECT: UNIVERSITY COURSE MANAGEMENT SYSTEM
-- SQL Dialect: MySQL 8.0
-- Run this script in MySQL Workbench.

CREATE DATABASE IF NOT EXISTS UniversityCourseManagement;
USE UniversityCourseManagement;

-- Drop tables in dependency order so the script can be rerun.
DROP TABLE IF EXISTS Enrollments;
DROP TABLE IF EXISTS Instructors;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Departments;

-- 1. Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE
);

-- 2. Students table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(150) NOT NULL UNIQUE,
    BirthDate DATE,
    EnrollmentDate DATE NOT NULL
);

-- 3. Courses table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    DepartmentID INT NOT NULL,
    Credits INT NOT NULL,
    CONSTRAINT fk_courses_department
        FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
    CONSTRAINT chk_courses_credits CHECK (Credits > 0)
);

-- 4. Instructors table
-- Salary is included to support Query 8 in the assignment.
CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(150) NOT NULL UNIQUE,
    DepartmentID INT NOT NULL,
    Salary DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    CONSTRAINT fk_instructors_department
        FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- 5. Enrollments table
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    EnrollmentDate DATE NOT NULL,
    CONSTRAINT fk_enrollments_student
        FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    CONSTRAINT fk_enrollments_course
        FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    CONSTRAINT uq_student_course UNIQUE (StudentID, CourseID)
);

-- SAMPLE DATA
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Business Administration'),
(4, 'Physics');

INSERT INTO Students
(StudentID, FirstName, LastName, Email, BirthDate, EnrollmentDate) VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '2000-01-15', '2022-08-01'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '1999-05-25', '2021-08-01'),
(3, 'Michael', 'Brown', 'michael.brown@email.com', '2002-03-12', '2023-01-10'),
(4, 'Emily', 'Davis', 'emily.davis@email.com', '2001-11-08', '2020-07-15'),
(5, 'David', 'Wilson', 'david.wilson@email.com', '2003-06-20', '2024-08-01'),
(6, 'Sarah', 'Taylor', 'sarah.taylor@email.com', '2000-09-17', '2022-01-12'),
(7, 'Daniel', 'Anderson', 'daniel.anderson@email.com', '2002-12-02', '2023-08-01'),
(8, 'Olivia', 'Thomas', 'olivia.thomas@email.com', '2001-04-28', '2019-08-01'),
(9, 'James', 'Jackson', 'james.jackson@email.com', '2003-02-14', '2024-01-15'),
(10, 'Sophia', 'White', 'sophia.white@email.com', '2002-07-05', '2022-08-15'),
(11, 'Liam', 'Harris', 'liam.harris@email.com', '2001-10-21', '2021-01-10'),
(12, 'Ava', 'Martin', 'ava.martin@email.com', '2003-08-09', '2025-01-10');

INSERT INTO Courses (CourseID, CourseName, DepartmentID, Credits) VALUES
(101, 'Introduction to SQL', 1, 3),
(102, 'Data Structures', 2, 4),
(103, 'Database Management', 1, 3),
(104, 'Calculus I', 2, 4),
(105, 'Business Communication', 3, 3),
(106, 'Statistics', 2, 3),
(107, 'Physics Fundamentals', 4, 4),
(108, 'Advanced SQL', 1, 4);

INSERT INTO Instructors
(InstructorID, FirstName, LastName, Email, DepartmentID, Salary) VALUES
(1, 'Alice', 'Johnson', 'alice.johnson@univ.com', 1, 72000.00),
(2, 'Bob', 'Lee', 'bob.lee@univ.com', 2, 68000.00),
(3, 'Carol', 'Williams', 'carol.williams@univ.com', 3, 65000.00),
(4, 'David', 'Clark', 'david.clark@univ.com', 4, 70000.00),
(5, 'Emma', 'Lewis', 'emma.lewis@univ.com', 1, 81000.00);

INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate) VALUES
(1, 1, 101, '2022-08-01'),
(2, 2, 102, '2021-08-01'),
(3, 3, 101, '2023-01-10'),
(4, 4, 103, '2020-07-15'),
(5, 5, 104, '2024-08-01'),
(6, 6, 102, '2022-01-12'),
(7, 7, 101, '2023-08-01'),
(8, 8, 105, '2019-08-01'),
(9, 9, 106, '2024-01-15'),
(10, 10, 103, '2022-08-15'),
(11, 11, 104, '2021-01-10'),
(12, 12, 105, '2025-01-10'),
(13, 1, 102, '2022-08-05'),
(14, 2, 101, '2021-08-05'),
(15, 3, 103, '2023-01-15'),
(16, 4, 101, '2020-07-20'),
(17, 5, 106, '2024-08-05'),
(18, 6, 104, '2022-01-15'),
(19, 7, 102, '2023-08-05'),
(20, 9, 101, '2024-01-20');

-- =========================================================
-- QUERIES TO PERFORM (1-16)
-- =========================================================

-- 1. Perform CRUD operations on all tables.
-- CREATE: Create a sample row (use a unique ID/email).
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES (99, 'Temporary Department');

-- READ: Retrieve records.
SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Instructors;
SELECT * FROM Enrollments;
SELECT * FROM Departments;

-- UPDATE: Update the temporary row.
UPDATE Departments
SET DepartmentName = 'Updated Temporary Department'
WHERE DepartmentID = 99;

-- DELETE: Delete the temporary row.
DELETE FROM Departments
WHERE DepartmentID = 99;

-- CRUD examples for the other tables (uncomment and change IDs as needed):
-- INSERT INTO Students VALUES (99,'Test','Student','test.student@email.com','2000-01-01','2025-01-01');
-- UPDATE Students SET FirstName='Updated' WHERE StudentID=99;
-- DELETE FROM Students WHERE StudentID=99;
-- INSERT INTO Courses VALUES (199,'Test Course',1,3);
-- UPDATE Courses SET Credits=4 WHERE CourseID=199;
-- DELETE FROM Courses WHERE CourseID=199;
-- INSERT INTO Instructors VALUES (99,'Test','Instructor','test.instructor@univ.com',1,50000.00);
-- UPDATE Instructors SET Salary=55000.00 WHERE InstructorID=99;
-- DELETE FROM Instructors WHERE InstructorID=99;
-- INSERT INTO Enrollments VALUES (999,1,101,'2025-01-01');
-- UPDATE Enrollments SET EnrollmentDate='2025-02-01' WHERE EnrollmentID=999;
-- DELETE FROM Enrollments WHERE EnrollmentID=999;

-- 2. Retrieve students who enrolled after 2022.
SELECT *
FROM Students
WHERE EnrollmentDate >= '2023-01-01';

-- 3. Retrieve Mathematics department courses, limited to 5 courses.
SELECT c.CourseID, c.CourseName, c.DepartmentID, c.Credits
FROM Courses AS c
JOIN Departments AS d ON d.DepartmentID = c.DepartmentID
WHERE d.DepartmentName = 'Mathematics'
ORDER BY c.CourseID
LIMIT 5;

-- 4. Count students enrolled in each course; show courses with more than 5 students.
SELECT c.CourseID, c.CourseName, COUNT(e.StudentID) AS StudentCount
FROM Courses AS c
JOIN Enrollments AS e ON e.CourseID = c.CourseID
GROUP BY c.CourseID, c.CourseName
HAVING COUNT(e.StudentID) > 5;

-- 5. Find students enrolled in BOTH Introduction to SQL and Data Structures.
SELECT s.StudentID, s.FirstName, s.LastName
FROM Students AS s
JOIN Enrollments AS e ON e.StudentID = s.StudentID
JOIN Courses AS c ON c.CourseID = e.CourseID
WHERE c.CourseName IN ('Introduction to SQL', 'Data Structures')
GROUP BY s.StudentID, s.FirstName, s.LastName
HAVING COUNT(DISTINCT c.CourseName) = 2;

-- 6. Find students enrolled in EITHER Introduction to SQL OR Data Structures.
SELECT DISTINCT s.StudentID, s.FirstName, s.LastName
FROM Students AS s
JOIN Enrollments AS e ON e.StudentID = s.StudentID
JOIN Courses AS c ON c.CourseID = e.CourseID
WHERE c.CourseName IN ('Introduction to SQL', 'Data Structures');

-- 7. Calculate the average number of credits for all courses.
SELECT AVG(Credits) AS AverageCredits
FROM Courses;

-- 8. Find the maximum instructor salary in the Computer Science department.
SELECT MAX(i.Salary) AS MaximumSalary
FROM Instructors AS i
JOIN Departments AS d ON d.DepartmentID = i.DepartmentID
WHERE d.DepartmentName = 'Computer Science';

-- 9. Count students enrolled in each department.
-- Counts distinct students taking courses in each department.
SELECT d.DepartmentID, d.DepartmentName,
       COUNT(DISTINCT e.StudentID) AS StudentCount
FROM Departments AS d
LEFT JOIN Courses AS c ON c.DepartmentID = d.DepartmentID
LEFT JOIN Enrollments AS e ON e.CourseID = c.CourseID
GROUP BY d.DepartmentID, d.DepartmentName
ORDER BY d.DepartmentID;

-- 10. INNER JOIN: Retrieve students and their corresponding courses.
SELECT s.StudentID, s.FirstName, s.LastName, c.CourseID, c.CourseName
FROM Students AS s
INNER JOIN Enrollments AS e ON e.StudentID = s.StudentID
INNER JOIN Courses AS c ON c.CourseID = e.CourseID
ORDER BY s.StudentID, c.CourseID;

-- 11. LEFT JOIN: Retrieve all students and their corresponding courses, if any.
SELECT s.StudentID, s.FirstName, s.LastName, c.CourseName
FROM Students AS s
LEFT JOIN Enrollments AS e ON e.StudentID = s.StudentID
LEFT JOIN Courses AS c ON c.CourseID = e.CourseID
ORDER BY s.StudentID, c.CourseID;

-- 12. Subquery: Find students enrolled in courses that have more than 10 students.
SELECT DISTINCT s.StudentID, s.FirstName, s.LastName
FROM Students AS s
JOIN Enrollments AS e ON e.StudentID = s.StudentID
WHERE e.CourseID IN (
    SELECT CourseID
    FROM Enrollments
    GROUP BY CourseID
    HAVING COUNT(DISTINCT StudentID) > 10
);

-- 13. Extract the year from the EnrollmentDate of students.
SELECT StudentID, FirstName, LastName,
       YEAR(EnrollmentDate) AS EnrollmentYear
FROM Students;

-- 14. Concatenate each instructor's first and last name.
SELECT InstructorID,
       CONCAT(FirstName, ' ', LastName) AS InstructorFullName
FROM Instructors;

-- 15. Calculate the running total of students enrolled in courses.
SELECT EnrollmentID, StudentID, CourseID, EnrollmentDate,
       COUNT(*) OVER (
           ORDER BY EnrollmentDate, EnrollmentID
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS RunningTotalEnrollments
FROM Enrollments;

-- 16. Label students Senior or Junior based on their enrollment date.
-- Senior = enrollment date is more than 4 years before today's date.
SELECT StudentID, FirstName, LastName, EnrollmentDate,
       CASE
           WHEN EnrollmentDate < DATE_SUB(CURDATE(), INTERVAL 4 YEAR)
               THEN 'Senior'
           ELSE 'Junior'
       END AS StudentLevel
FROM Students;

-- END OF PROJECT
