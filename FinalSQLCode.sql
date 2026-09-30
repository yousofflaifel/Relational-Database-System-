-- creating the Database 
/*
CREATE DATABASE NDMS;
*/
-- DDL (Creating tables)
/*
CREATE TABLE coordinatorInfo (
ID INT PRIMARY KEY,
FirstName VARCHAR(10) NOT NULL,
LastName VARCHAR(10) NOT NULL,
PhoneNumber CHAR(10)			
);

CREATE TABLE Disaster ( 
    ID INT PRIMARY KEY,
    Name VARCHAR(30),
    Type VARCHAR(9),
    StartDate DATE,
    EndDate DATE,
    Location VARCHAR(40),
    SeverityLevel VARCHAR(9) CHECK (SeverityLevel IN ('Low','Medium','High')),
    CoordinatorID INT,
    CONSTRAINT fk_Disaster FOREIGN KEY (CoordinatorID) REFERENCES CoordinatorInfo(ID) ON DELETE SET NULL ON UPDATE CASCADE
);


CREATE TABLE Shelter (
    ID INT PRIMARY KEY,
    Name VARCHAR(30),
    Location VARCHAR(40),
    Capacity INT CHECK (Capacity >= 0),
    PhoneNumber CHAR(10),
    DisasterID INT,
   CONSTRAINT fk_shelter FOREIGN KEY (DisasterID) REFERENCES Disaster(ID) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Volunteer (
    ID INT PRIMARY KEY,
    FirstName VARCHAR(10) NOT NULL,
    LastName VARCHAR(10) NOT NULL,
    PhoneNumber CHAR(10) UNIQUE
);


CREATE TABLE VolunteerSkill (
    VolunteerID INT,
    Skill CHAR(9),
    PRIMARY KEY (VolunteerID, Skill),
   CONSTRAINT fk_volunteerSkill FOREIGN KEY (VolunteerID) REFERENCES Volunteer(ID) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Volunteer_Shelter (
    VolunteerID INT,
    ShelterID INT,
    HoursWorked INT,
    PRIMARY KEY (VolunteerID, ShelterID),
    CONSTRAINT fk_Volunteer_Shelter1 FOREIGN KEY (VolunteerID) REFERENCES Volunteer(ID) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_Volunteer_Shelter2 FOREIGN KEY (ShelterID) REFERENCES Shelter(ID) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Evacuee (
    ID INT PRIMARY KEY,
    FirstName VARCHAR(10) NOT NULL,
    LastName VARCHAR(10) NOT NULL,
    DateOfBirth DATE,
    Gender CHAR(1) DEFAULT 'M' CHECK (Gender IN ('M','F')),
    ShelterID INT,
    VolunteerID INT,
    CONSTRAINT fk_Evacuee1 FOREIGN KEY (ShelterID) REFERENCES Shelter(ID) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT fk_Evacuee2 FOREIGN KEY (VolunteerID) REFERENCES Volunteer(ID) ON DELETE SET NULL ON UPDATE CASCADE
);
*/
-- DML (Putting the Data)
/*
INSERT INTO CoordinatorInfo (ID, FirstName, LastName, PhoneNumber) VALUES
(101, 'Ali', 'Khalid', '0791111111'),
(102, 'Sara', 'Omar', '0792222222'),
(103, 'Hani', 'Zaid', '0793333333'),
(104, 'Rana', 'Hussein', '0794444444'),
(105, 'Omar', 'Faisal', '0795555555'),
(106, 'Noor', 'Ahmad', '0796666666'),
(107, 'Lina', 'Salem', '0797777777'),
(108, 'Adel', 'Farah', '0798888888');


INSERT INTO Disaster (ID, Name, Type, StartDate, EndDate, Location, SeverityLevel, CoordinatorID) VALUES
(201, 'Flood Amman', 'Flood', '2025-01-10', '2025-01-20', 'Amman', 'High', 101),
(202, 'Earthquake Zarqa', 'Quake', '2025-02-01', '2025-02-05', 'Zarqa', 'Medium', 102),
(203, 'Fire Irbid', 'Fire', '2025-03-03', '2025-03-07', 'Irbid', 'Low', 103),
(204, 'Storm Karak', 'Storm', '2025-04-01', '2025-04-04', 'Karak', 'High', 104),
(205, 'Flood Salt', 'Flood', '2025-05-01', '2025-05-10', 'Salt', 'Medium', 105),
(206, 'Fire Madaba', 'Fire', '2025-06-02', '2025-06-05', 'Madaba', 'Low', 106),
(207, 'Quake Aqaba', 'Quake', '2025-07-01', '2025-07-03', 'Aqaba', 'High', 107),
(208, 'Storm Mafraq', 'Storm', '2025-08-01', '2025-08-05', 'Mafraq', 'Medium', 108);


INSERT INTO Shelter (ID, Name, Location, Capacity, PhoneNumber, DisasterID) VALUES
(301, 'Amman Shelter A', 'Amman', 200, '0795000011', 201),
(302, 'Amman Shelter B', 'Amman', 150, '0795000022', 201),
(303, 'Zarqa Shelter', 'Zarqa', 100, '0795000033', 202),
(304, 'Irbid Shelter', 'Irbid', 120, '0795000044', 203),
(305, 'Karak Shelter', 'Karak', 80, '0795000055', 204),
(306, 'Salt Shelter', 'Salt', 90, '0795000066', 205),
(307, 'Madaba Shelter', 'Madaba', 70, '0795000077', 206),
(308, 'Aqaba Shelter', 'Aqaba', 110, '0795000088', 207);


INSERT INTO Volunteer (ID, FirstName, LastName, PhoneNumber) VALUES
(401, 'Yousef', 'Hassan', '0781111111'),
(402, 'Maya', 'Ali', '0782222222'),
(403, 'Fadi', 'Odeh', '0783333333'),
(404, 'Islam', 'Omari', '0784444444'),
(405, 'Zain', 'Rami', '0785555555'),
(406, 'Nour', 'Alaa', '0786666666'),
(407, 'Asmaa', 'Sabbah', '0787777777'),
(408, 'Mira', 'Saleh', '0788888888');


INSERT INTO VolunteerSkill (VolunteerID, Skill) VALUES
(401, 'Medical'),
(401, 'Logistics'),
(402, 'Cooking'),
(403, 'FirstAid'),
(404, 'Rescue'),
(405, 'Medical'),
(406, 'Transport'),
(407, 'Logistics');


INSERT INTO Volunteer_Shelter (VolunteerID, ShelterID, HoursWorked) VALUES
(401, 301, 40),
(402, 301, 35),
(403, 302, 20),
(404, 303, 25),
(405, 304, 30),
(406, 305, 15),
(407, 306, 18),
(408, 307, 22);


INSERT INTO Evacuee (ID, FirstName, LastName, DateOfBirth, Gender, ShelterID, VolunteerID) VALUES
(501, 'Huda', 'Ahmad', '1990-01-01', 'F', 301, 401),
(502, 'Omar', 'Ali', '1985-02-02', 'M', 301, 402),
(503, 'Laila', 'Hassan', '1992-03-03', 'F', 302, 403),
(504, 'Rami', 'Yousef', '1980-04-04', 'M', 303, 404),
(505, 'Nada', 'Zaid', '1995-05-05', 'F', 304, 405),
(506, 'Issa', 'Odeh', '1987-06-06', 'M', 305, 406),
(507, 'Mona', 'Saleh', '1993-07-07', 'F', 306, 407),
(508, 'Tariq', 'Fares', '1991-08-08', 'M', 307, 408);
*/
-- views 
/*
-- 1
CREATE VIEW HighSeverityDisasters AS
SELECT ID, Name, Type, Location, SeverityLevel
FROM Disaster
WHERE SeverityLevel = 'High';
-- 2
CREATE VIEW ShelterStatus AS
SELECT Location, COUNT(*) AS NumberOfShelters, AVG(Capacity) AS AvgCapacity
FROM Shelter
GROUP BY Location;
-- 3
CREATE VIEW EvacueeShelter AS
SELECT Evacuee.ID, Evacuee.FirstName, Evacuee.LastName, Shelter.Name
FROM Evacuee
JOIN Shelter ON Evacuee.ShelterID = Shelter.ID;
-- 4
CREATE VIEW VolunteerHoursWork AS
SELECT Volunteer.ID, Volunteer.FirstName, Volunteer.LastName, SUM(Volunteer_Shelter.HoursWorked) AS TotalHours
FROM Volunteer
JOIN Volunteer_Shelter ON Volunteer.ID = Volunteer_Shelter.VolunteerID
GROUP BY Volunteer.ID, Volunteer.FirstName, Volunteer.LastName;
*/
-- Procedures
/*
-- 1
DELIMITER //
CREATE PROCEDURE InsertCoordinator(
    IN CoordinatorID int,
    IN fName VARCHAR(10),
    IN lName VARCHAR(10),
    IN phone CHAR(10)
)
BEGIN
    INSERT INTO CoordinatorInfo(ID,FirstName, LastName, PhoneNumber)
    VALUES (CoordinatorID,fName, lName, phone);
END //
DELIMITER ;
-- 2
DELIMITER //
CREATE PROCEDURE UpdateShelterCapacity(
IN ShelterID int,
IN ShelterCapacity int
)
BEGIN
	UPDATE Shelter SET Capacity = ShelterCapacity WHERE ID = ShelterID ;
END //
DELIMITER ;
-- 3
DELIMITER //
CREATE PROCEDURE SelectVolunteersByShelter(IN ShelterID int)
BEGIN
	SELECT * From Volunteer JOIN Volunteer_Shelter ON Volunteer_Shelter.VolunteerID = Volunteer.ID WHERE Volunteer_Shelter.ShelterID = ShelterID ;
END //
DELIMITER ;
-- 4
DELIMITER //
CREATE PROCEDURE DeleteDisaster(IN DisasterID int)
BEGIN
	DELETE From Disaster WHERE ID = DisasterID ;
END //
DELIMITER ;
*/
-- DCL (users)
/*
-- 1
CREATE USER 'Administrator'@'localhost' IDENTIFIED BY 'Administrator123';
-- 2
CREATE USER 'Coordinator'@'localhost' IDENTIFIED BY 'Coordinator123';
-- 3
CREATE USER 'Volunteer'@'localhost' IDENTIFIED BY 'Volunteer123';
-- 4
CREATE USER 'Government'@'localhost' IDENTIFIED BY 'Government123';
-- Giving privileges
-- 1 
GRANT ALL PRIVILEGES ON NDMS.* TO 'Administrator'@'localhost';
-- 2
GRANT SELECT, INSERT, UPDATE ON NDMS.Disaster TO 'Coordinator'@'localhost';
GRANT SELECT, INSERT, UPDATE ON NDMS.shelter TO 'Coordinator'@'localhost';
GRANT SELECT, INSERT, UPDATE ON NDMS.evacuee TO 'Coordinator'@'localhost';
GRANT SELECT, INSERT, UPDATE ON NDMS.volunteer_shelter TO 'Coordinator'@'localhost';
GRANT SELECT, INSERT, UPDATE ON NDMS.volunteer TO 'Coordinator'@'localhost';
GRANT SELECT, INSERT, UPDATE ON NDMS.volunteerskill TO 'Coordinator'@'localhost';
-- 3
GRANT SELECT ON NDMS.Volunteer_Shelter TO 'Volunteer'@'localhost';
GRANT SELECT ON NDMS.Evacuee TO 'Volunteer'@'localhost';
-- 4
GRANT SELECT ON NDMS.* TO 'Government'@'localhost';
*/
-- Grants the views and procedures
/*
GRANT SELECT ON HighSeverityDisasters TO 'Government'@'localhost';
GRANT SELECT ON ShelterStatus TO 'Volunteer'@'localhost';
GRANT SELECT ON EvacueeShelter TO 'Volunteer'@'localhost';
GRANT SELECT ON VolunteerHoursWork TO 'Volunteer'@'localhost';

GRANT EXECUTE ON PROCEDURE UpdateShelterCapacity TO 'Coordinator'@'localhost';
GRANT EXECUTE ON PROCEDURE SelectVolunteersByShelter TO 'Coordinator'@'localhost';
*/
-- output validation
/*
-- 1
SELECT * FROM disaster 
WHERE StartDate BETWEEN '2025-01-01' AND '2025-12-31' AND SeverityLevel IN ('High','Medium')
ORDER BY StartDate ASC;
-- 2
SELECT Shelter.ID AS ShelterID,Shelter.Name AS ShelterName,COUNT(Evacuee.ID) AS EvacueesNumber
FROM Shelter
JOIN Evacuee ON Shelter.ID = Evacuee.ShelterID
GROUP BY Shelter.ID, Shelter.Name
ORDER BY EvacueesNumber ASC;
-- 3
SELECT Volunteer.ID AS volunteerID, Volunteer.FirstName AS volunteerFirstName,
		Volunteer.LastName AS volunteerLastName, Shelter.Name AS ShelterName,
		Disaster.Name AS DisasterName, Disaster.Type AS DisasterType
FROM Volunteer
JOIN Volunteer_Shelter ON Volunteer.ID = Volunteer_Shelter.VolunteerID
JOIN Shelter ON Volunteer_Shelter.ShelterID = Shelter.ID
JOIN Disaster ON Shelter.DisasterID = Disaster.ID
ORDER BY Volunteer.FirstName, Volunteer.LastName ASC;
-- 4
SELECT Disaster.ID AS DisasterID,Disaster.Name AS DisasterName,COUNT(Evacuee.ID) AS TotalEvacuees
FROM Disaster
JOIN Shelter ON Shelter.DisasterID = Disaster.ID
JOIN Evacuee ON Evacuee.ShelterID = Shelter.ID
GROUP BY Disaster.ID, Disaster.Name
ORDER BY TotalEvacuees DESC;
*/


