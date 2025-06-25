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

