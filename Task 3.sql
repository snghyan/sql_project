Task 3. 

*Database Creation and Table Creation:*

sql
-- Create the "EventsManagement" database
CREATE DATABASE EventsManagement;

-- Connect to the database
\c EventsManagement;

-- Create tables for Events, Attendees, and Registrations
CREATE TABLE Events (
    Event_id serial PRIMARY KEY,
    Event_Name varchar(255),
    Event_Date date,
    Event_Location varchar(255),
    Event_Description text
);

CREATE TABLE Attendees (
    Attendee_id serial PRIMARY KEY,
    Attendee_Name varchar(255),
    Attendee_Phone varchar(15),
    Attendee_Email varchar(255),
    Attendee_City varchar(255)
);

CREATE TABLE Registrations (
    Registration_id serial PRIMARY KEY,
    Event_id int REFERENCES Events(Event_id),
    Attendee_id int REFERENCES Attendees(Attendee_id),
    Registration_Date date,
    Registration_Amount numeric(10, 2)
);

INSERT INTO Events (Event_Name, Event_Date, Event_Location, Event_Description) 
VALUES
  ('Diwali Celebration', '2023-11-04', 'Mumbai', 'Join us for a grand Diwali celebration!'),
  ('Tech Conference', '2023-12-15', 'Bengaluru', 'Explore the latest in technology and innovation.'),
  ('Cultural Festival', '2024-01-20', 'Jaipur', 'A colorful festival showcasing Indian culture and heritage.');


INSERT INTO Attendees (Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City) 
VALUES
  ('Rajesh Kumar', '9876543210', 'rajesh@gmail.com', 'Delhi'),
  ('Priya Verma', '8765432109', 'priya@gmail.com', 'Mumbai'),
  ('Suresh Sharma', '7654321098', 'suresh@gmail.com', 'Chennai'),
  ('Amit Singh', '6543210987', 'amit@gmail.com', 'Bengaluru'),
  ('Neha Patel', '5432109876', 'neha@gmail.com', 'Ahmedabad');

-- Registrations for Diwali Celebration (Event with ID 1)
INSERT INTO Registrations (Event_id, Attendee_id, Registration_Date, Registration_Amount) 
VALUES
  (1, 1, '2023-11-02', 200.00),
  (1, 2, '2023-11-03', 150.00),
  (1, 3, '2023-11-04', 180.00);

-- Registrations for Tech Conference (Event with ID 2)
INSERT INTO Registrations (Event_id, Attendee_id, Registration_Date, Registration_Amount) 
VALUES
  (2, 4, '2023-12-10', 300.00),
  (2, 5, '2023-12-11', 250.00);

-- Registrations for Cultural Festival (Event with ID 3)
INSERT INTO Registrations (Event_id, Attendee_id, Registration_Date, Registration_Amount) 
VALUES
  (3, 1, '2024-01-18', 100.00),
  (3, 4, '2024-01-19', 120.00),
  (3, 5, '2024-01-20', 150.00);

-- Example: Insert a new event
INSERT INTO Events (Event_Name, Event_Date, Event_Location, Event_Description)
VALUES ('New Year Party', '2023-12-31', 'Goa', 'Celebrate the New Year with us in Goa!');
 

-- Example: Update event information (e.g., for event with ID 1)
UPDATE Events
SET Event_Name = 'Updated Event Name',
    Event_Date = '2023-12-15',
    Event_Location = 'Updated Location',
    Event_Description = 'Updated event description'
WHERE Event_id = 1;


-- Example: Delete an event (e.g., for event with ID 2)
--first delete registration 
delete from Registrations 
where Event_id=2  ;
---then delete event
DELETE FROM Events
WHERE Event_id = 2;
 
 
-- Example: Insert a new attendee
INSERT INTO Attendees (Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City)
VALUES ('New Attendee', '123-456-7890', 'new.attendee@example.com', 'New City');
 


-- Example: Register an attendee (e.g., Attendee with ID 1) for an event (e.g., Event with ID 1)
INSERT INTO Registrations (Event_id, Attendee_id, Registration_Date, Registration_Amount)
VALUES (1, 1, '2023-11-10', 50.00);
 

-- Retrieve event information (e.g., all events)
SELECT Event_id, Event_Name, Event_Date, Event_Location, Event_Description
FROM Events;
 
-- Generate an attendee list for a specific event (e.g., Event with ID 1)
SELECT A.Attendee_Name
FROM Attendees AS A
JOIN Registrations AS R ON A.Attendee_id = R.Attendee_id
WHERE R.Event_id = 1;
 

-- Calculate event attendance statistics (e.g., for Event with ID 1)
SELECT E.Event_Name,
       COUNT(R.Attendee_id) AS Total_Attendees,
       SUM(R.Registration_Amount) AS Total_Revenue
FROM Events AS E
LEFT JOIN Registrations AS R ON E.Event_id = R.Event_id
WHERE E.Event_id = 1
GROUP BY E.Event_Name;