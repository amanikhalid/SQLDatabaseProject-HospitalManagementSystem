# Hospital Management System

### Project Overview
To handle crucial hospital procedures, this hospital management system has a powerful relational database integrated into SQL Server.  Patients, staff, appointments, billing, admissions, departments, and security are all covered by its components.

### Part 1: Schema Design (Tables)
Tables were created with proper primary keys, foreign key constraints, data types, and checks to maintain integrity. Major tables include:

- Patients – stores personal and contact info

- Doctors – stores specialization and assigned department

- Departments – various hospital departments

- Appointments – links patients and doctors with time/date

- MedicalRecords – tracks diagnoses and treatments

- Billing – maintains patient bills and services

- Rooms – room types and availability

- Admissions – admission details of patients

- Staff – nurses/admins with shifts

- Users – login and roles for system access

### Part 2: Sample Data
Each table is populated with realistic sample data:

- 22 Patients with Omani names

- 20 Doctors assigned across departments

- 20+ Appointments

- MedicalRecords, Admissions, and Billing entries

### Part 3: Queries (DQL, DML)
Demonstrated SQL queries:

- Join queries across tables (Patients + Doctors + Departments)

- Aggregate functions with GROUP BY / HAVING

- Subqueries using EXISTS

- Search/filter logic

- DISTINCT and COUNT queries

### Part 4: Views
Views are created for simplified reporting and abstraction:

- vw_DoctorSchedule – doctor and their appointments

- vw_PatientSummary – diagnosis and last visit

- Svw_DepartmentStats – number of doctors & patients per department

