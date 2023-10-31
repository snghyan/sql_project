CREATE TABLE Studentinfo (
    STU_ID INT PRIMARY KEY,
    STU_NAME VARCHAR(255),
    DOB DATE,
    PHONE_NO VARCHAR(15),
    EMAIL_ID VARCHAR(255),
    ADDRESS VARCHAR(255)
);




-- Create Coursesinfo table
CREATE TABLE Coursesinfo (
    COURSE_ID INT PRIMARY KEY,
    COURSE_NAME VARCHAR(255),
    COURSE_INSTRUCTOR_NAME VARCHAR(255)
);



-- Create Enrollmentinfo table with foreign key constraints
CREATE TABLE Enrollmentinfo (
    ENROLLMENT_ID INT PRIMARY KEY,
    STU_ID INT,
    COURSE_ID INT,
    ENROLL_STATUS VARCHAR(20), -- You can use an enum or foreign key to a status table for more control
    FOREIGN KEY (STU_ID) REFERENCES Studentinfo(STU_ID),
    FOREIGN KEY (COURSE_ID) REFERENCES Coursesinfo(COURSE_ID)
);

INSERT INTO Studentinfo (STU_ID, STU_NAME, DOB, PHONE_NO, EMAIL_ID, ADDRESS)
VALUES
    (1, 'Namit Goyal' , '1995-05-12', '6876543205', 'namit.goyal@gmail.com', '111, Lajpat Nagar, Indore'),
    (2, 'Abhilasha Gour', '1998-08-25', '8749804640' , 'abhilasha.gour@gmail.com',  '444, Avantika Nager, Dewas'),
    (3, 'Rahul Patel', '1997-03-10', '8664643109' , 'rahul.patel@gmail.com', '888, Lake Road, Bangalore');

INSERT INTO Coursesinfo (COURSE_ID, COURSE_NAME, COURSE_INSTRUCTOR_NAME)
VALUES
    (101, 'Computer Science', 'Dr. Neha Verma'),
    (102, 'Electrical Engineering', 'Prof. Rajesh Singh'),
    (103, 'Economics', 'Dr. Abhilasha Singh');


INSERT INTO Enrollmentinfo (ENROLLMENT_ID, STU_ID, COURSE_ID, ENROLL_STATUS)
VALUES
    (501, 1, 101, 'Enrolled'),
    (502, 2, 102, 'Enrolled'),
    (503, 3, 101, 'Enrolled'),
    (504, 1, 103, 'Not Enrolled');




SELECT s.STU_NAME, s.PHONE_NO, s.EMAIL_ID, e.ENROLL_STATUS
FROM Studentinfo s
JOIN Enrollmentinfo e ON s.STU_ID = e.STU_ID;

 

SELECT c.COURSE_NAME
FROM Coursesinfo c
JOIN Enrollmentinfo e ON c.COURSE_ID = e.COURSE_ID
WHERE e.STU_ID = 1;
 


SELECT c.COURSE_NAME, c.COURSE_INSTRUCTOR_NAME
FROM Coursesinfo c;

 

SELECT c.COURSE_NAME, c.COURSE_INSTRUCTOR_NAME
FROM Coursesinfo c
WHERE c.COURSE_ID = 101;

 

SELECT c.COURSE_NAME, c.COURSE_INSTRUCTOR_NAME
FROM Coursesinfo c
WHERE c.COURSE_ID IN (101, 102);

 


SELECT c.COURSE_NAME, COUNT(e.STU_ID) AS Enrolled_Students
FROM Coursesinfo c
LEFT JOIN Enrollmentinfo e ON c.COURSE_ID = e.COURSE_ID
GROUP BY c.COURSE_NAME;

 

SELECT s.STU_NAME
FROM Studentinfo s
JOIN Enrollmentinfo e ON s.STU_ID = e.STU_ID
WHERE e.COURSE_ID = 101;
 

SELECT c.COURSE_INSTRUCTOR_NAME, COUNT(DISTINCT e.STU_ID) AS Enrolled_Students
FROM Coursesinfo c
LEFT JOIN Enrollmentinfo e ON c.COURSE_ID = e.COURSE_ID
GROUP BY c.COURSE_INSTRUCTOR_NAME;

 

SELECT s.STU_NAME, COUNT(e.COURSE_ID) AS Enrolled_Courses
FROM Studentinfo s
JOIN Enrollmentinfo e ON s.STU_ID = e.STU_ID
GROUP BY s.STU_NAME
HAVING COUNT(e.COURSE_ID) > 1;

 

SELECT   c.COURSE_NAME, COUNT(e.STU_ID) AS Enrolled_Students_Count
FROM Coursesinfo c
LEFT JOIN Enrollmentinfo e ON c.COURSE_ID = e.COURSE_ID
GROUP BY c.COURSE_NAME
ORDER BY Enrolled_Students_Count DESC;
