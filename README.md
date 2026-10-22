<div align="center">

# 🎓 University Course Management System

**A MySQL Database Project for Managing University Academic Records**

Manage departments, students, courses, instructors, and enrollments with a structured relational database.

</div>

---

## 📌 About the Project

The **University Course Management System** is a database management project developed using **MySQL 8.0**. It organizes essential university information and demonstrates how relational tables and SQL queries can be used to manage academic records.

The project includes table creation, sample data, data manipulation, reporting queries, and analysis using joins, subqueries, aggregate functions, and window functions.

## ✨ Key Features

- Manage university departments and student records
- Store course details, credits, and department associations
- Maintain instructor information and salary details
- Track students' course enrollments
- Perform **CRUD operations** (Create, Read, Update, Delete)
- Generate reports using SQL joins and aggregate functions
- Analyze enrollment trends and student levels

## 🧰 Tech Stack

| Tool | Purpose |
|---|---|
| MySQL 8.0 | Database |
| MySQL Workbench | SQL editor and execution |
| SQL | Database creation, management, and queries |

## 🗃️ Database Structure

**Database:** `UniversityCourseManagement`

The database contains five tables:

| Table | Description |
|---|---|
| `Departments` | Department IDs and unique department names |
| `Students` | Student names, email, birth date, and enrollment date |
| `Courses` | Course name, department, and credits |
| `Instructors` | Instructor details, department, email, and salary |
| `Enrollments` | Student-course enrollment records and dates |

### 🔗 Relationships

- `Courses.DepartmentID` references `Departments.DepartmentID`.
- `Instructors.DepartmentID` references `Departments.DepartmentID`.
- `Enrollments.StudentID` references `Students.StudentID`.
- `Enrollments.CourseID` references `Courses.CourseID`.
- A unique constraint on `(StudentID, CourseID)` prevents duplicate enrollment of the same student in the same course.

## 📊 Sample Dataset

The included SQL script inserts:

- **4** departments
- **12** students
- **8** courses
- **5** instructors
- **20** enrollment records

These records are sample data for practice and demonstration.

## 🔍 SQL Topics Demonstrated

- Database and table creation
- Primary keys, foreign keys, and constraints
- `INSERT`, `SELECT`, `UPDATE`, `DELETE`
- Filtering, sorting, and limiting results
- `GROUP BY` and `HAVING`
- Aggregate functions: `COUNT()`, `AVG()`, `MAX()`
- `INNER JOIN` and `LEFT JOIN`
- Subqueries
- Date functions: `YEAR()`, `CURDATE()`, `DATE_SUB()`
- String function: `CONCAT()`
- Window function: `COUNT() OVER()` for a running enrollment total
- `CASE` expression for Senior/Junior classification

## 📝 Query Tasks

The SQL file contains 16 query tasks, including:

1. CRUD examples for the database tables
2. Students enrolled after 2022
3. Mathematics department courses
4. Courses with more than 5 enrollments
5. Students taking both Introduction to SQL and Data Structures
6. Students taking either selected course
7. Average credits across courses
8. Highest instructor salary in Computer Science
9. Distinct enrolled student count by department
10. Student-course report using `INNER JOIN`
11. All students and their courses, where available, using `LEFT JOIN`
12. Students taking courses with more than 10 students
13. Enrollment year extraction
14. Instructor full-name formatting
15. Running enrollment total
16. Senior/Junior classification based on enrollment date

## 🚀 Getting Started

### Prerequisites

- MySQL Server 8.0
- MySQL Workbench (recommended)

### Installation & Execution

1. Download or copy `University_Course_Management_System.sql`.
2. Open **MySQL Workbench** and connect to your MySQL server.
3. Open the SQL script.
4. Execute the script using the **Execute** button (lightning icon).
5. Refresh the **Schemas** panel.
6. Select `UniversityCourseManagement` and inspect the tables.
7. Run the included `SELECT` queries to explore the results.

### Quick Check

After running the script, execute:

```sql
USE UniversityCourseManagement;

SHOW TABLES;

SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Enrollments;
```

## ⚠️ Important Notes

- The script creates the database if it does not already exist.
- It **drops and recreates the five project tables** before inserting sample records. Rerunning it will delete existing data in those tables.
- Use a practice database and keep a backup of any data you need.
- The Senior/Junior result is calculated relative to the current date.
- Some query tasks may return no rows with the included sample dataset; this depends on the query condition and available records.

## 📁 Project Files

```text
University-Course-Management-System/
├── University_Course_Management_System.sql
└── README.md
```

## 🎯 Learning Outcomes

By completing this project, you can practice relational database design, table relationships, constraints, CRUD operations, reporting, joins, subqueries, aggregate functions, and window functions in MySQL.

---

<div align="center">

**University Course Management System**  
*SQL Practice • Database Design • Academic Records*

</div>
