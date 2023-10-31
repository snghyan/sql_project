CREATE DATABASE student_database;
-- Connect to the "student_database"
\c student_database;
-- Create the student_table
CREATE TABLE student_table (
    Student_id serial PRIMARY KEY,
    Stu_name text,
    Department text,
    email_id text,
    Phone_no numeric,
    Address text,
    Date_of_birth date,
    Gender text,
    Major text,
    GPA numeric,
    Grade text
);


INSERT INTO student_table (Stu_name, Department, email_id, Phone_no, Address, Date_of_birth, Gender, Major, GPA, Grade)

VALUES
    ('Naveen Kumar', 'Computer Science', 'Naveen.kumar@email.com', 9876543210, '111 Rajwada', '1998-05-15', 'Male', 'Computer Science', 3.7, 'A'),
    ('Shree Sharma', 'Mathematics', 'Shree.sharma@email.com', 9876543211, '112 Sanwer', '1999-03-22', 'Female', 'Mathematics', 3.5, 'B'),
  
  ('Dheeraj Patel', 'Physics', 'dheeraj.patel@email.com', 9876543212, '113 Indore', '1997-11-10', 'Male', 'Physics', 3.9, 'A'),
   
 ('Deepika Mishra', 'Biology', 'deepika.mishra@email.com', 9876543213, '114 Jaipur', '1999-07-08', 'Female', 'Biology', 3.2, 'C'),
  
  ('Sachin Verma', 'Chemistry', 'sachin.verma@email.com', 9876543214, '115 Rajwada', '1998-01-30', 'Male', 'Chemistry', 3.8, 'A'),
  
  ('Heena Gupta', 'History', 'heena.gupta@email.com', 9876543215, '116 Rajwada', '1997-09-05', 'Female', 'History', 3.4, 'B'),
   
 ('Vikas Singh', 'Economics', 'vikas.singh@email.com', 9876543216, '117 Rajwada', '1998-04-18', 'Male', 'Economics', 3.6, 'A'),
   
 ('Ritu Agarwal', 'Engineering', 'ritu.agarwal@email.com', 9876543217, '118 Rajwada', '1997-06-25', 'Female', 'Engineering', 3.3, 'B'),
    
('Rakesh Tiwari', 'Psychology', 'rakesh.tiwari@email.com', 9876543218, '119 Rajwada', '1999-02-14', 'Male', 'Psychology', 3.7, 'A'),
 
   ('Meera Yadav', 'English', 'meera.yadav@email.com', 9876543219, '120 Rajwada', '1998-08-20', 'Female', 'English', 3.1, 'C');



-- Retrieve all students' information and sort by grade in descending order
SELECT *
FROM student_table
ORDER BY Grade DESC;

-- Retrieve information about all male students
SELECT *
FROM student_table
WHERE Gender = 'Male';


-- Fetch details of students with GPA less than 5.0
SELECT *
FROM student_table
WHERE GPA < 5.0;


-- Update the email and grade for a specific student (replace with the desired Student_id)
UPDATE student_table
SET email_id = 'new.email@example.com', Grade = 'B'
WHERE Student_id = 1;


-- Retrieve names and ages of students with a grade of "B"
SELECT Stu_name, EXTRACT(YEAR FROM AGE(current_date, Date_of_birth)) AS Age
FROM student_table
WHERE Grade = 'B';
 

-- Group by Department and Gender, and calculate the average GPA for each combination
SELECT Department, Gender, AVG(GPA) AS Average_GPA
FROM student_table
GROUP BY Department, Gender;
 

-- Rename the table from student_table to student_info
ALTER TABLE student_table RENAME TO student_info;


-- Retrieve the name of the student with the highest GPA
SELECT Stu_name
FROM student_info
WHERE GPA = (SELECT MAX(GPA) FROM student_info);

 

