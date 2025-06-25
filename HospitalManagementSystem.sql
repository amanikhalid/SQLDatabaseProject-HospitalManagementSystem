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

SELECT * FROM Appointments;
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

--Rooms Table
INSERT INTO Rooms (Room_No, Room_Type, IsAvailable) VALUES
(101, 'ICU', 'True'),
(102, 'General', 'True'),
(103, 'CCU', 'False'),
(104, 'NICU', 'True'),
(105, 'Outpatient Examination Room', 'True'),
(106, 'ICU', 'False'),
(107, 'General', 'True'),
(108, 'CCU', 'True'),
(109, 'NICU', 'False'),
(110, 'Outpatient Examination Room', 'True'),
(111, 'General', 'True'),
(112, 'ICU', 'True'),
(113, 'CCU', 'False'),
(114, 'NICU', 'True'),
(115, 'Outpatient Examination Room', 'False'),
(116, 'General', 'True'),
(117, 'ICU', 'True'),
(118, 'CCU', 'True'),
(119, 'NICU', 'False'),
(120, 'Outpatient Examination Room', 'True');


--Billing Table
INSERT INTO Billing (P_ID, Total_Cost, BServices, BillDate) VALUES
(1, 1200.50, 'Cardiology Consultation, ECG, Blood Test', '2025-07-02'),
(2, 800.00, 'Neurology Consultation, MRI Scan', '2025-07-03'),
(3, 600.75, 'Pediatrics Checkup, Vaccination', '2025-07-04'),
(4, 950.00, 'Orthopedics Consultation, X-Ray', '2025-07-05'),
(5, 1500.00, 'Oncology Chemotherapy Session', '2025-07-06'),
(6, 700.25, 'Radiology Ultrasound', '2025-07-07'),
(7, 400.00, 'Emergency Room Visit', '2025-07-08'),
(8, 550.00, 'Pathology Blood Test', '2025-07-09'),
(9, 900.00, 'Anesthesiology Consultation', '2025-07-10'),
(10, 650.00, 'Dermatology Treatment', '2025-07-11'),
(11, 1100.00, 'Gastroenterology Consultation', '2025-07-12'),
(12, 750.00, 'Endocrinology Tests', '2025-07-13'),
(13, 500.00, 'Psychiatry Session', '2025-07-14'),
(14, 1300.00, 'Urology Surgery', '2025-07-15'),
(15, 1200.00, 'Nephrology Dialysis', '2025-07-16'),
(16, 850.00, 'Ophthalmology Checkup', '2025-07-17'),
(17, 600.00, 'ENT Consultation', '2025-07-18'),
(18, 950.00, 'General Surgery Operation', '2025-07-19'),
(19, 1400.00, 'Obstetrics and Gynecology Delivery', '2025-07-20'),
(20, 700.00, 'Physical Therapy Sessions', '2025-07-21'),
(21, 1000.00, 'Cardiology Follow-up', '2025-07-22'),
(22, 900.00, 'Neurology Scan', '2025-07-23');

--MedicalRecords Table
INSERT INTO MedicalRecords (P_ID, D_ID, Diagnosis, Treatment_Plans, VisitDate, Notes) VALUES
(1, 1, 'Hypertension', 'Medication and lifestyle changes', '2025-07-02', 'Patient advised to reduce salt intake'),
(2, 2, 'Migraine', 'Prescribed painkillers', '2025-07-03', 'Follow up in 2 weeks'),
(3, 3, 'Bronchitis', 'Antibiotics prescribed', '2025-07-04', 'Monitor respiratory symptoms'),
(4, 4, 'Fractured arm', 'Cast and rest', '2025-07-05', 'X-ray to be repeated in 4 weeks'),
(5, 5, 'Breast cancer', 'Chemotherapy plan started', '2025-07-06', 'Patient responded well to treatment'),
(6, 6, 'Gallstones', 'Surgical removal scheduled', '2025-07-07', 'Pre-op tests completed'),
(7, 7, 'Appendicitis', 'Appendectomy performed', '2025-07-08', 'Recovery progressing well'),
(8, 8, 'Diabetes', 'Insulin therapy', '2025-07-09', 'Blood sugar levels monitored daily'),
(9, 9, 'Skin rash', 'Topical creams prescribed', '2025-07-10', 'Avoid allergens'),
(10, 10, 'Ulcerative colitis', 'Medication and diet control', '2025-07-11', 'Symptom improvement noted'),
(11, 11, 'Thyroid disorder', 'Medication adjusted', '2025-07-12', 'Regular blood tests required'),
(12, 12, 'Depression', 'Counseling and antidepressants', '2025-07-13', 'Follow up scheduled'),
(13, 13, 'Kidney stones', 'Hydration and pain management', '2025-07-14', 'Ultrasound planned'),
(14, 14, 'Glaucoma', 'Eye drops prescribed', '2025-07-15', 'Intraocular pressure monitored'),
(15, 15, 'Sinusitis', 'Antibiotics and nasal spray', '2025-07-16', 'Symptom relief noted'),
(16, 16, 'Hernia', 'Surgery scheduled', '2025-07-17', 'Pre-surgical assessment done'),
(17, 17, 'Gallbladder infection', 'Antibiotics started', '2025-07-18', 'Monitor for complications'),
(18, 18, 'Tonsillitis', 'Antibiotics and rest', '2025-07-19', 'Patient advised to stay hydrated'),
(19, 19, 'Skin cancer', 'Surgical excision planned', '2025-07-20', 'Biopsy performed'),
(20, 20, 'Labor and delivery', 'Normal delivery', '2025-07-21', 'Healthy baby delivered');

--Admission Table
INSERT INTO Admissions (P_ID, Room_No, ADate, DateOut) VALUES
(1, 101, '2025-07-01', '2025-07-10'),
(2, 102, '2025-07-02', '2025-07-09'),
(3, 103, '2025-07-03', '2025-07-12'),
(4, 104, '2025-07-04', '2025-07-11'),
(5, 105, '2025-07-05', '2025-07-14'),
(6, 106, '2025-07-06', '2025-07-13'),
(7, 107, '2025-07-07', '2025-07-15'),
(8, 108, '2025-07-08', '2025-07-16'),
(9, 109, '2025-07-09', '2025-07-17'),
(10, 110, '2025-07-10', '2025-07-18'),
(11, 111, '2025-07-11', '2025-07-19'),
(12, 112, '2025-07-12', '2025-07-20'),
(13, 113, '2025-07-13', '2025-07-21'),
(14, 114, '2025-07-14', '2025-07-22'),
(15, 115, '2025-07-15', '2025-07-23'),
(16, 116, '2025-07-16', '2025-07-24'),
(17, 117, '2025-07-17', '2025-07-25'),
(18, 118, '2025-07-18', '2025-07-26'),
(19, 119, '2025-07-19', '2025-07-27'),
(20, 120, '2025-07-20', '2025-07-28'),
(21, 101, '2025-07-21', '2025-07-29'),
(22, 102, '2025-07-22', NULL);

SELECT * FROM Admissions;

--User Table
INSERT INTO Users (Username, PasswordHT, U_Role) VALUES
('admin1', 'hashedpassword1', 'Admin'),
('nurse1', 'hashedpassword2', 'Nurses'),
('doctor1', 'hashedpassword3', 'Doctors'),
('reception1', 'hashedpassword4', 'Nurses'),
('admin2', 'hashedpassword5', 'Admin'),
('nurse2', 'hashedpassword6', 'Nurses'),
('doctor2', 'hashedpassword7', 'Doctors'),
('reception2', 'hashedpassword8', 'Nurses'),
('admin3', 'hashedpassword9', 'Admin'),
('nurse3', 'hashedpassword10', 'Nurses'),
('doctor3', 'hashedpassword11', 'Doctors'),
('user1', 'hashedpassword12', 'Nurses');

--Part 3: Test Queries (DQL, DML, TCL examples) 
-- 1. List all patients who visited a certain doctor (D_ID = 3) 
SELECT DISTINCT p.P_ID, p.F_Name, p.M_Name, p.L_Name
FROM Patients p
JOIN Appointments a ON p.P_ID = a.P_ID
WHERE a.D_ID = 3;

--2. Count of appointments per department 
SELECT d.Department_ID, d.Department_Name,
       COUNT(a.Appointment_ID) AS AppointmentCount
FROM Departments d
LEFT JOIN Doctors doc ON d.Department_ID = doc.Department_ID
LEFT JOIN Appointments a ON doc.D_ID = a.D_ID
GROUP BY d.Department_ID, d.Department_Name;

--3. Doctors with more than 5 appointments in July 2025 
SELECT doc.D_ID, doc.F_Name + ' ' + doc.M_Name + ' ' + doc.L_Name AS DoctorName,
       COUNT(a.Appointment_ID) AS ApptCount
FROM Doctors doc
JOIN Appointments a ON doc.D_ID = a.D_ID
WHERE a.Appointment_Date BETWEEN '2025-07-01' AND '2025-07-31'
GROUP BY doc.D_ID, doc.F_Name, doc.M_Name, doc.L_Name
HAVING COUNT(a.Appointment_ID) > 5;

--4. Join across 4 tables: medical records with patient, doctor, department 
SELECT m.M_ID,
       p.F_Name + ' ' + p.L_Name AS PatientName,
       doc.F_Name + ' ' + doc.L_Name AS DoctorName,
       d.Department_Name,
       m.Diagnosis
FROM MedicalRecords m
JOIN Patients p ON m.P_ID = p.P_ID
JOIN Doctors doc ON m.D_ID = doc.D_ID
JOIN Departments d ON doc.Department_ID = d.Department_ID;

--5. Group by/having: patients billed over 1000 
SELECT p.P_ID, p.F_Name + ' ' + p.L_Name AS PatientName,
       COUNT(b.B_ID) AS BillingCount,
       SUM(b.Total_Cost) AS TotalBilled
FROM Billing b
JOIN Patients p ON b.P_ID = p.P_ID
GROUP BY p.P_ID, p.F_Name, p.L_Name
HAVING SUM(b.Total_Cost) > 1000;


--6. Subquery/EXISTS: patients with no appointments 
SELECT p.P_ID, p.F_Name + ' ' + p.L_Name AS PatientName
FROM Patients p
WHERE NOT EXISTS (
    SELECT 1 FROM Appointments a WHERE a.P_ID = p.P_ID
);



--Functions & Stored Procedures
--Scalar function to calculate patient age from DOB
CREATE FUNCTION fn_CalculateAge (@DOB DATE)
RETURNS INT
AS
BEGIN
RETURN DATEDIFF(YEAR, @DOB, GETDATE()) 
- CASE WHEN DATEADD(YEAR, DATEDIFF(YEAR, @DOB, GETDATE()), @DOB) > GETDATE()
THEN 1 ELSE 0 END;
END;

-- Stored procedure to admit a patient (insert to Admissions, update Room availability)
CREATE PROCEDURE sp_AdmitPatient
@P_ID INT,
@Room_No INT,
@ADate DATE
AS
BEGIN
SET NOCOUNT ON;
BEGIN TRANSACTION;
BEGIN TRY
IF EXISTS (SELECT 1 FROM Rooms WHERE Room_No = @Room_No AND IsAvailable = 'True')
BEGIN
INSERT INTO Admissions (P_ID, Room_No, ADate) VALUES (@P_ID, @Room_No, @ADate);
UPDATE Rooms SET IsAvailable = 'False' WHERE Room_No = @Room_No;
COMMIT;
END
ELSE
BEGIN
RAISERROR('Room not available.', 16, 1);
ROLLBACK;
END
END TRY
BEGIN CATCH
ROLLBACK;
THROW;
END CATCH
END;

--Procedure to generate invoice (insert into Billing based on treatments)
CREATE PROCEDURE sp_GenerateInvoice
@P_ID INT,
@Services VARCHAR(500),
@Total_Cost DECIMAL(10,2)
AS
BEGIN
INSERT INTO Billing (P_ID, BServices, Total_Cost, BillDate)
VALUES (@P_ID, @Services, @Total_Cost, GETDATE());
END;

--Procedure to assign doctor to department and shift
ALTER TABLE Doctors ADD Shift VARCHAR(20); 

CREATE PROCEDURE sp_AssignDoctorToDepartmentAndShift
@D_ID INT,
@Department_ID INT,
@Shift VARCHAR(20)
AS
BEGIN
UPDATE Doctors
SET Department_ID = @Department_ID,
Shift = @Shift
WHERE D_ID = @D_ID;
END;

--Triggers
-- After insert on Appointments → auto log in MedicalRecords
CREATE TRIGGER trg_LogAppointmentToMedicalRecords
ON Appointments
AFTER INSERT
AS
BEGIN
INSERT INTO MedicalRecords (P_ID, D_ID, VisitDate, Diagnosis, Treatment_Plans, Notes)
SELECT P_ID, D_ID, Appointment_Date, '', '', 'Auto-log from appointment'
FROM inserted;
END;

--Before delete on Patients → prevent deletion if pending bills exist
CREATE TRIGGER trg_PreventPatientDeleteIfBillsExist
ON Patients
INSTEAD OF DELETE
AS
BEGIN
IF EXISTS (
SELECT 1
FROM Billing b
JOIN deleted d ON b.P_ID = d.P_ID
)
BEGIN
RAISERROR('Cannot delete patient with pending bills.', 16, 1);
ROLLBACK;
END
ELSE
BEGIN
DELETE FROM Patients WHERE P_ID IN (SELECT P_ID FROM deleted);
END
END;

--After update on Rooms → ensure no two patients occupy same room
CREATE TRIGGER trg_PreventPatientDeleteIfBillsExist
ON Patients
INSTEAD OF DELETE
AS
BEGIN
IF EXISTS (
SELECT 1
FROM Billing b
JOIN deleted d ON b.P_ID = d.P_ID
)
BEGIN
RAISERROR('Cannot delete patient with pending bills.', 16, 1);
ROLLBACK;
END
ELSE
BEGIN
DELETE FROM Patients WHERE P_ID IN (SELECT P_ID FROM deleted);
END
END;
-----------------
DROP TRIGGER IF EXISTS trg_PreventPatientDeleteIfBillsExist;
GO

CREATE TRIGGER trg_PreventPatientDeleteIfBillsExist
ON Patients
INSTEAD OF DELETE
AS
BEGIN
-- Check for pending bills
IF EXISTS (
SELECT 1
FROM Billing b
JOIN deleted d ON b.P_ID = d.P_ID
)
BEGIN
RAISERROR('Cannot delete patient with pending bills.', 16, 1);
ROLLBACK;
RETURN;
END

-- If no bills, proceed with delete
DELETE FROM Patients
WHERE P_ID IN (SELECT P_ID FROM deleted);
END;

--Security Roles & Permissions
--Create at least two user roles: DoctorUser, AdminUser
-- Create roles
CREATE ROLE DoctorUser;
CREATE ROLE AdminUser;

--GRANT SELECT for DoctorUser on Patients and Appointments only

GRANT SELECT ON Patients TO DoctorUser;
GRANT SELECT ON Appointments TO DoctorUser;

--GRANT INSERT, UPDATE for AdminUser on all tables
GRANT INSERT, UPDATE ON Patients TO AdminUser;
GRANT INSERT, UPDATE ON Doctors TO AdminUser;
GRANT INSERT, UPDATE ON Departments TO AdminUser;
GRANT INSERT, UPDATE ON Appointments TO AdminUser;
GRANT INSERT, UPDATE ON MedicalRecords TO AdminUser;
GRANT INSERT, UPDATE ON Billing TO AdminUser;
GRANT INSERT, UPDATE ON Rooms TO AdminUser;
GRANT INSERT, UPDATE ON Staff TO AdminUser;
GRANT INSERT, UPDATE ON Admissions TO AdminUser;
GRANT INSERT, UPDATE ON Users TO AdminUser;

--REVOKE DELETE for Doctors
REVOKE DELETE ON Doctors FROM PUBLIC;

--Transactions (TCL)
--TCL Example: admit a patient within a transaction 
BEGIN TRANSACTION;
BEGIN TRY
INSERT INTO Admissions (P_ID, Room_No, ADate)
VALUES (5, 105, GETDATE());
UPDATE Rooms SET IsAvailable = 'False' WHERE Room_No = 105;
INSERT INTO Billing (P_ID, Total_Cost, BServices, BillDate)
VALUES (5, 200.00, 'Admission Fee', GETDATE());
COMMIT;
END TRY
BEGIN CATCH
ROLLBACK;
THROW;
END CATCH;

--Views
--vw_DoctorSchedule: Upcoming appointments per doctor
CREATE VIEW vw_DoctorSchedule AS
SELECT doc.D_ID,
doc.F_Name + ' ' + doc.M_Name + ' ' + doc.L_Name AS DoctorName,
a.Appointment_Date,
a.Appointment_Time,
p.P_ID,
p.F_Name + ' ' + p.L_Name AS PatientName
FROM Doctors doc
JOIN Appointments a ON doc.D_ID = a.D_ID
JOIN Patients p ON a.P_ID = p.P_ID;


--vw_PatientSummary: Patient info with their latest visit
CREATE VIEW vw_PatientSummary AS
SELECT p.P_ID,
p.F_Name + ' ' + p.M_Name + ' ' + p.L_Name AS FullName,
MAX(m.VisitDate) AS LastVisitDate,
m.Diagnosis,
m.Treatment_Plans
FROM Patients p
JOIN MedicalRecords m ON p.P_ID = m.P_ID
GROUP BY p.P_ID, p.F_Name, p.M_Name, p.L_Name, m.Diagnosis, m.Treatment_Plans;

--vw_DepartmentStats: Number of doctors and patients per department
CREATE VIEW vw_DepartmentStats AS
SELECT d.Department_ID,
d.Department_Name,
COUNT(DISTINCT doc.D_ID) AS DoctorCount,
COUNT(DISTINCT a.P_ID) AS PatientCount
FROM Departments d
LEFT JOIN Doctors doc ON d.Department_ID = doc.Department_ID
LEFT JOIN Appointments a ON doc.D_ID = a.D_ID
GROUP BY d.Department_ID, d.Department_Name;

--SQL Agent Job for Daily Doctor Schedule

--Create Report Table
CREATE TABLE DoctorDailyScheduleLog (
LogID INT IDENTITY(1,1) PRIMARY KEY,
Doctor_ID INT,
Doctor_Name VARCHAR(100),
Patient_ID INT,
Patient_Name VARCHAR(100),
AppointmentTime DATETIME,
Department VARCHAR(100),
LogDate DATETIME DEFAULT GETDATE()
);

-- Create the log table
USE HospitalMS;
GO
IF OBJECT_ID('DoctorDailyScheduleLog', 'U') IS NULL
BEGIN
CREATE TABLE DoctorDailyScheduleLog (
LogID INT IDENTITY(1,1) PRIMARY KEY,
Doctor_ID INT,
Doctor_Name VARCHAR(100),
Patient_ID INT,
Patient_Name VARCHAR(100),
AppointmentTime DATETIME,
Department VARCHAR(100),
LogDate DATETIME DEFAULT GETDATE()
);
END
GO

--switch to msdb
USE msdb;
GO

