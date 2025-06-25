--Create database
CREATE DATABASE HospitalMS;

--Use the database
USE HospitalMS;

--Departments Table
CREATE TABLE Departments (
Department_ID INT PRIMARY KEY IDENTITY(1,1),
Department_Name VARCHAR(100) NOT NULL
);

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

