-- Create database
CREATE DATABASE HospitalMS;

-- Use the database
USE HospitalMS;

-- Departments Table
CREATE TABLE Departments (
Department_ID INT PRIMARY KEY IDENTITY(1,1),
Department_Name VARCHAR(100) NOT NULL
);

-- Patients Table
CREATE TABLE Patients (
P_ID INT PRIMARY KEY IDENTITY (1,1),
F_Name VARCHAR(50) NOT NULL,
M_Name VARCHAR(50) NOT NULL,
L_Name VARCHAR(50) NOT NULL,
DOB DATE NOT NULL,
Gender VARCHAR(10) CHECK (Gender IN ('Male', 'Female')),
ContactNumber VARCHAR(20) UNIQUE
);