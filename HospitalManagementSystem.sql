-- Create database
CREATE DATABASE HospitalMS;

-- Use the database
USE HospitalMS;

-- Departments Table
CREATE TABLE Departments (
Department_ID INT PRIMARY KEY IDENTITY(1,1),
Department_Name VARCHAR(100) NOT NULL
);
