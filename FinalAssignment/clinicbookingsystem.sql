-- Clinic Booking System SQL Schema
-- Author: Abas
-- Description: Full MySQL database for managing clinic appointments, patients, and billing

-- Drop tables if they exist to avoid errors

CREATE DATABASE clinicbookingsystem;
DROP TABLE IF EXISTS Billing, Treatment, Appointment, Patient, Doctor;

-- Create Patient table
CREATE TABLE Patient (
    PatientID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Email VARCHAR(255) UNIQUE,
    Phone VARCHAR(15)
);

-- Create Doctor table
CREATE TABLE Doctor (
    DoctorID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Specialty VARCHAR(100) NOT NULL,
    Email VARCHAR(255) UNIQUE
);

-- Create Appointment table
CREATE TABLE Appointment (
    AppointmentID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    AppointmentDate DATETIME NOT NULL,
    Reason VARCHAR(255),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);

-- Create Treatment table (1-to-1 with Appointment)
CREATE TABLE Treatment (
    TreatmentID INT PRIMARY KEY AUTO_INCREMENT,
    AppointmentID INT UNIQUE NOT NULL,
    Diagnosis TEXT,
    Prescription TEXT,
    FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID)
);

-- Create Billing table (1-to-1 with Appointment)
CREATE TABLE Billing (
    BillingID INT PRIMARY KEY AUTO_INCREMENT,
    AppointmentID INT UNIQUE NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    PaymentStatus ENUM('Paid', 'Unpaid', 'Pending') DEFAULT 'Pending',
    FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID)
);
