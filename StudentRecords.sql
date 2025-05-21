-- Create Database
CREATE DATABASE StudentRecordsDB;
USE StudentRecordsDB;

-- Students Table
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    date_of_birth DATE NOT NULL
);

-- Courses Table
CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    course_code VARCHAR(10) UNIQUE NOT NULL,
    department VARCHAR(50) NOT NULL
);

-- Enrollments Table (Many-to-Many Relationship)
CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Grades Table (Stores Grades for Enrolled Students)
CREATE TABLE grades (
    grade_id INT PRIMARY KEY AUTO_INCREMENT,
    enrollment_id INT NOT NULL,
    grade VARCHAR(5) NOT NULL,
    FOREIGN KEY (enrollment_id) REFERENCES enrollments(enrollment_id)
);


-- Insert Sample Students
INSERT INTO students (first_name, last_name, email, phone, date_of_birth) VALUES
('Alice', 'Johnson', 'alice.johnson@example.com', '1234567890', '2001-05-10'),
('Bob', 'Smith', 'bob.smith@example.com', '9876543210', '2000-09-15');

-- Insert Sample Courses
INSERT INTO courses (course_name, course_code, department) VALUES
('Database Systems', 'DB101', 'Computer Science'),
('Software Engineering', 'SE102', 'Engineering');

-- Insert Sample Enrollments
INSERT INTO enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2025-03-01'),
(2, 2, '2025-03-02');

-- Insert Sample Grades
INSERT INTO grades (enrollment_id, grade) VALUES
(1, 'A'),
(2, 'B+');
