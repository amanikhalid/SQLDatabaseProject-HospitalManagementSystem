--Create database
CREATE DATABASE HospitalMS;

--Use the database
USE HospitalMS;

--Departments Table
CREATE TABLE Departments (
Department_ID INT PRIMARY KEY IDENTITY(1,1),
Department_Name VARCHAR(100) NOT NULL
);

-- Insert Departments
INSERT INTO Departments (Department_Name) VALUES
('Cardiology'),
('Neurology'),
('Pediatrics'),
('Orthopedics'),
('Oncology'),
('Radiology'),
('Emergency'),
('Pathology'),
('Anesthesiology'),
('Dermatology'),
('Gastroenterology'),
('Endocrinology'),
('Psychiatry'),
('Urology'),
('Nephrology'),
('Ophthalmology'),
('ENT'),
('General Surgery'),
('Obstetrics and Gynecology'),
('Physical Therapy');


--Patients Table
CREATE TABLE Patients (
P_ID INT PRIMARY KEY IDENTITY (1,1),
F_Name VARCHAR(50) NOT NULL,
M_Name VARCHAR(50) NOT NULL,
L_Name VARCHAR(50) NOT NULL,
DOB DATE NOT NULL,
Gender VARCHAR(10) CHECK (Gender IN ('Male', 'Female')),
ContactNumber VARCHAR(20) UNIQUE
);

--Doctors Table
CREATE TABLE Doctors (
D_ID INT PRIMARY KEY IDENTITY(1,1),
F_Name VARCHAR(50) NOT NULL,
M_Name VARCHAR(50) NOT NULL,
L_Name VARCHAR(50) NOT NULL,
Specialization VARCHAR(100) NOT NULL,
ContactNumber VARCHAR(20),
Department_ID INT NOT NULL FOREIGN KEY REFERENCES Departments(Department_ID)
);

--Appointments Table
CREATE TABLE Appointments (
Appointment_ID INT PRIMARY KEY IDENTITY(1,1),
P_ID INT NOT NULL FOREIGN KEY REFERENCES Patients(P_ID),
D_ID INT NOT NULL FOREIGN KEY REFERENCES Doctors(D_ID),
Appointment_Date DATETIME NOT NULL,
Appointment_Time DATETIME NOT NULL
);

--MedicalRecords Table
CREATE TABLE MedicalRecords (
M_ID INT PRIMARY KEY IDENTITY(1,1),
P_ID INT NOT NULL FOREIGN KEY REFERENCES Patients(P_ID),
D_ID INT NOT NULL FOREIGN KEY REFERENCES Doctors(D_ID),
Diagnosis VARCHAR(200) NOT NULL,
Treatment_Plans VARCHAR(600) NOT NULL,
VisitDate DATE NOT NULL,
Notes VARCHAR(1000)
);


--Billing Table
CREATE TABLE Billing (
B_ID INT PRIMARY KEY IDENTITY(1,1),
P_ID INT NOT NULL FOREIGN KEY REFERENCES Patients(P_ID),
Total_Cost DECIMAL(10,2) NOT NULL,
BServices VARCHAR(500),
BillDate DATE NOT NULL
);

--Rooms Table
CREATE TABLE Rooms (
Room_No INT PRIMARY KEY,
Room_Type VARCHAR(50) CHECK (Room_Type IN ('ICU', 'General', 'CCU', 'NICU', 'Outpatient Examination Room')),
IsAvailable VARCHAR(6) DEFAULT 'True'
);

--Users Table
CREATE TABLE Users (
Username VARCHAR(50) PRIMARY KEY,
PasswordHT VARCHAR(255),
U_Role VARCHAR(20) CHECK (U_Role IN ('Admin', 'Nurses', 'Doctors'))
);

--Staff Table
CREATE TABLE Staff (
S_ID INT PRIMARY KEY IDENTITY(1,1),
FullName VARCHAR(100),
Role VARCHAR(50),
Shift VARCHAR(20),
Department_ID INT NOT NULL FOREIGN KEY REFERENCES Departments(Department_ID)
);

--Admissions Table
CREATE TABLE Admissions (
A_ID INT PRIMARY KEY IDENTITY(1,1),
P_ID INT NOT NULL FOREIGN KEY REFERENCES Patients(P_ID),
Room_No INT NOT NULL FOREIGN KEY REFERENCES Rooms(Room_No),
ADate DATE NOT NULL,
DateOut DATE
);

--Insert Data
--Patients
INSERT INTO Patients (F_Name, M_Name, L_Name, DOB, Gender, ContactNumber) VALUES
('Nasser', 'Hamad', 'Al Shaqsi', '1988-02-19', 'Male', '96892810101'),
('Asma', 'Talib', 'Al Ghabshi', '1994-05-27', 'Female', '96892810102'),
('Sultan', 'Zahir', 'Al Barwani', '1990-10-11', 'Male', '96892810103'),
('Ruqaya', 'Salim', 'Al Jabri', '1986-09-02', 'Female', '96892810104'),
('Ahmed', 'Saeed', 'Al Hinawi', '1991-01-14', 'Male', '96892810105'),
('Nawal', 'Mubarak', 'Al Riyami', '1993-12-25', 'Female', '96892810106'),
('Ibrahim', 'Juma', 'Al Mukhaini', '1987-06-18', 'Male', '96892810107'),
('Hind', 'Faisal', 'Al Subhi', '1995-04-03', 'Female', '96892810108'),
('Adnan', 'Yaqoub', 'Al Balushi', '1992-08-08', 'Male', '96892810109'),
('Amal', 'Hilal', 'Al Shanfari', '1989-07-10', 'Female', '96892810110'),
('Walid', 'Hassan', 'Al Lawati', '1996-11-22', 'Male', '96892810111'),
('Marwa', 'Ali', 'Al Amri', '1990-03-09', 'Female', '96892810112'),
('Zaid', 'Rashid', 'Al Ghafri', '1985-05-05', 'Male', '96892810113'),
('Huda', 'Khalfan', 'Al Mauly', '1994-10-17', 'Female', '96892810114'),
('Khalfan', 'Nabil', 'Al Sinani', '1993-06-20', 'Male', '96892810115'),
('Noor', 'Basim', 'Al Shukri', '1992-12-30', 'Female', '96892810116'),
('Yahya', 'Talal', 'Al Mahrouqi', '1988-09-14', 'Male', '96892810117'),
('Amina', 'Sulaiman', 'Al Rahbi', '1991-04-12', 'Female', '96892810118'),
('Salem', 'Mansoor', 'Al Naabi', '1995-01-05', 'Male', '96892810119'),
('Rasha', 'Adil', 'Al Badwawi', '1986-11-26', 'Female', '96892810120'),
('Bassam', 'Majid', 'Al Kindi', '1990-07-16', 'Male', '96892810121'),
('Lujain', 'Jabir', 'Al Shehhi', '1996-02-23', 'Female', '96892810122');

--Doctors Table
INSERT INTO Doctors (F_Name, M_Name, L_Name, Specialization, ContactNumber, Department_ID) VALUES
('Hassan', 'Juma', 'Al Gheilani', 'Cardiology', '96893311001', 1),
('Suhaila', 'Rami', 'Al Qasimi', 'Neurology', '96893311002', 2),
('Rajiv', 'Kumar', 'Patel', 'Pediatrics', '96893311003', 3),
('Anna', 'Maria', 'Sokolova', 'Orthopedics', '96893311004', 4),
('Tariq', 'Fahmi', 'Al Dhahli', 'Oncology', '96893311005', 5),
('Fatma', 'Younis', 'Al Rashdi', 'Radiology', '96893311006', 6),
('Lee', 'Chong', 'Min', 'Emergency', '96893311007', 7),
('Khalfan', 'Zayed', 'Al Rawahi', 'Pathology', '96893311008', 8),
('Noura', 'Yahya', 'Al Araimi', 'Anesthesiology', '96893311009', 9),
('Samuel', 'Benjamin', 'Souza', 'Dermatology', '96893311010', 10),
('Lubna', 'Saeed', 'Al Shuaili', 'Gastroenterology', '96893311011', 11),
('Ahmed', 'Yasir', 'Al Riyami', 'Endocrinology', '96893311012', 12),
('Fiona', 'Grace', 'Mendez', 'Psychiatry', '96893311013', 13),
('Omar', 'Khamis', 'Al Habsi', 'Urology', '96893311014', 14),
('Maria', 'Elena', 'Garcia', 'Nephrology', '96893311015', 15),
('Yousef', 'Salman', 'Al Abri', 'Ophthalmology', '96893311016', 16),
('Reem', 'Talal', 'Al Nabhani', 'ENT', '96893311017', 17),
('Rashid', 'Basim', 'Al Mahrouqi', 'General Surgery', '96893311018', 18),
('Maya', 'Ali', 'Abraham', 'Obstetrics and Gynecology', '96893311019', 19),
('Huda', 'Suhail', 'Al Zakwani', 'Physical Therapy', '96893311020', 20);


SELECT * FROM Departments;
SELECT * FROM Doctors;

--Appointment Table
INSERT INTO Appointments (P_ID, D_ID, Appointment_Date, Appointment_Time) VALUES
(1, 1, '2025-07-01', '09:00:00'),
(2, 2, '2025-07-02', '10:30:00'),
(3, 3, '2025-07-03', '11:15:00'),
(4, 4, '2025-07-04', '08:45:00'),
(5, 5, '2025-07-05', '13:00:00'),
(6, 6, '2025-07-06', '14:30:00'),
(7, 7, '2025-07-07', '09:15:00'),
(8, 8, '2025-07-08', '10:45:00'),
(9, 9, '2025-07-09', '11:30:00'),
(10, 10, '2025-07-10', '08:30:00'),
(11, 11, '2025-07-11', '09:00:00'),
(12, 12, '2025-07-12', '10:00:00'),
(13, 13, '2025-07-13', '11:45:00'),
(14, 14, '2025-07-14', '14:00:00'),
(15, 15, '2025-07-15', '09:30:00'),
(16, 16, '2025-07-16', '10:15:00'),
(17, 17, '2025-07-17', '13:45:00'),
(18, 18, '2025-07-18', '08:15:00'),
(19, 19, '2025-07-19', '12:30:00'),
(20, 20, '2025-07-20', '14:15:00');

SELECT D_ID FROM Doctors ORDER BY D_ID;

Drop Table Appointments;
DROP TABLE MedicalRecords;
DROP TABLE Billing;
DROP TABLE Admissions;
DROP TABLE Staff;

DROP TABLE  Doctors;
DROP TABLE Departments;

CREATE TABLE Departments (
    Department_ID INT PRIMARY KEY IDENTITY(1,1),
    Department_Name VARCHAR(100) NOT NULL
);


INSERT INTO Departments (Department_Name) VALUES
('Cardiology'), ('Neurology'), ('Pediatrics'), ('Orthopedics'),
('Oncology'), ('Radiology'), ('Emergency'), ('Pathology'),
('Anesthesiology'), ('Dermatology'), ('Gastroenterology'), ('Endocrinology'),
('Psychiatry'), ('Urology'), ('Nephrology'), ('Ophthalmology'),
('ENT'), ('General Surgery'), ('Obstetrics and Gynecology'), ('Physical Therapy');

--Recreate doctors Table 
CREATE TABLE Doctors (
    D_ID INT PRIMARY KEY IDENTITY(1,1),
    F_Name VARCHAR(50) NOT NULL,
    M_Name VARCHAR(50) NOT NULL,
    L_Name VARCHAR(50) NOT NULL,
    Specialization VARCHAR(100) NOT NULL,
    ContactNumber VARCHAR(20),
    Department_ID INT NOT NULL FOREIGN KEY REFERENCES Departments(Department_ID)
);

--Insert 20 doctors with correct Department_IDs 1–20
INSERT INTO Doctors (F_Name, M_Name, L_Name, Specialization, ContactNumber, Department_ID) VALUES
('Hassan', 'Juma', 'Al Gheilani', 'Cardiology', '96893311001', 1),
('Suhaila', 'Rami', 'Al Qasimi', 'Neurology', '96893311002', 2),
('Rajiv', 'Kumar', 'Patel', 'Pediatrics', '96893311003', 3),
('Anna', 'Maria', 'Sokolova', 'Orthopedics', '96893311004', 4),
('Tariq', 'Fahmi', 'Al Dhahli', 'Oncology', '96893311005', 5),
('Fatma', 'Younis', 'Al Rashdi', 'Radiology', '96893311006', 6),
('Lee', 'Chong', 'Min', 'Emergency', '96893311007', 7),
('Khalfan', 'Zayed', 'Al Rawahi', 'Pathology', '96893311008', 8),
('Noura', 'Yahya', 'Al Araimi', 'Anesthesiology', '96893311009', 9),
('Samuel', 'Benjamin', 'Souza', 'Dermatology', '96893311010', 10),
('Lubna', 'Saeed', 'Al Shuaili', 'Gastroenterology', '96893311011', 11),
('Ahmed', 'Yasir', 'Al Riyami', 'Endocrinology', '96893311012', 12),
('Fiona', 'Grace', 'Mendez', 'Psychiatry', '96893311013', 13),
('Omar', 'Khamis', 'Al Habsi', 'Urology', '96893311014', 14),
('Maria', 'Elena', 'Garcia', 'Nephrology', '96893311015', 15),
('Yousef', 'Salman', 'Al Abri', 'Ophthalmology', '96893311016', 16),
('Reem', 'Talal', 'Al Nabhani', 'ENT', '96893311017', 17),
('Rashid', 'Basim', 'Al Mahrouqi', 'General Surgery', '96893311018', 18),
('Maya', 'Ali', 'Abraham', 'Obstetrics and Gynecology', '96893311019', 19),
('Huda', 'Suhail', 'Al Zakwani', 'Physical Therapy', '96893311020', 20);

CREATE TABLE Appointments (
    Appointment_ID INT PRIMARY KEY IDENTITY(1,1),
    P_ID INT NOT NULL FOREIGN KEY REFERENCES Patients(P_ID),
    D_ID INT NOT NULL FOREIGN KEY REFERENCES Doctors(D_ID),
    Appointment_Date DATETIME NOT NULL,
    Appointment_Time DATETIME NOT NULL
);

SELECT COUNT(*) AS PatientCount FROM Patients;

--Insert Appointments (only using D_ID 1–20)
INSERT INTO Appointments (P_ID, D_ID, Appointment_Date, Appointment_Time) VALUES
(1, 1, '2025-07-01', '09:00:00'),
(2, 2, '2025-07-02', '10:30:00'),
(3, 3, '2025-07-03', '11:15:00'),
(4, 4, '2025-07-04', '08:45:00'),
(5, 5, '2025-07-05', '13:00:00'),
(6, 6, '2025-07-06', '14:30:00'),
(7, 7, '2025-07-07', '09:15:00'),
(8, 8, '2025-07-08', '10:45:00'),
(9, 9, '2025-07-09', '11:30:00'),
(10, 10, '2025-07-10', '08:30:00'),
(11, 11, '2025-07-11', '09:00:00'),
(12, 12, '2025-07-12', '10:00:00'),
(13, 13, '2025-07-13', '11:45:00'),
(14, 14, '2025-07-14', '14:00:00'),
(15, 15, '2025-07-15', '09:30:00'),
(16, 16, '2025-07-16', '10:15:00'),
(17, 17, '2025-07-17', '13:45:00'),
(18, 18, '2025-07-18', '08:15:00'),
(19, 19, '2025-07-19', '12:30:00'),
(20, 20, '2025-07-20', '14:15:00');

--Staff Table
INSERT INTO Staff (FullName, Role, Shift, Department_ID) VALUES
('Fatima Al Jahwari', 'Nurse', 'Morning', 1),
('John Smith', 'Receptionist', 'Evening', 2),
('Hanan Al Siyabi', 'Admin', 'Night', 3),
('Mohammed Al Habsi', 'Nurse', 'Morning', 4),
('Linda Carter', 'Receptionist', 'Evening', 5),
('Yahya Al Rawahi', 'Admin', 'Night', 6),
('Salma Al Lawati', 'Nurse', 'Morning', 7),
('David Lee', 'Receptionist', 'Evening', 8),
('Noor Al Amri', 'Admin', 'Night', 9),
('Saeed Al Kharusi', 'Nurse', 'Morning', 10),
('Aisha Al Hinai', 'Receptionist', 'Evening', 11),
('Omar Al Busaidi', 'Admin', 'Night', 12),
('Susan Miller', 'Nurse', 'Morning', 13),
('Hamad Al Maskari', 'Receptionist', 'Evening', 14),
('Lina Al Riyami', 'Admin', 'Night', 15),
('Rashid Al Nabhani', 'Nurse', 'Morning', 16),
('Nora Al Maamari', 'Receptionist', 'Evening', 17),
('Khalid Al Ghafri', 'Admin', 'Night', 18),
('Mona Al Azri', 'Nurse', 'Morning', 19),
('Peter Johnson', 'Receptionist', 'Evening', 20);
