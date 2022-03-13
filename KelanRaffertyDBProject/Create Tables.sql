Drop database if exists Dentist;
Show databases;
create database Dentist;
Use Dentist;
Show tables;
Drop table if exists Patients;

CREATE TABLE Patients (
	PatientId int NOT NULL AUTO_INCREMENT,
    FirstName varchar(15) NOT NULL,
    LastName varchar(15) NOT NULL,
	DateOfBirth DateTime NOT NULL,
	Email varchar(40),
	PhoneNumber int,
    Address varchar(255),
	PRIMARY KEY (PatientId)
);

CREATE TABLE Treatments (
	TreatmentId int AUTO_INCREMENT,
    Name varchar(50) NOT NULL DEFAULT 'Checkup',
    Cost DECIMAL(10,2) NOT NULL DEFAULT '50.00',
	PRIMARY KEY (TreatmentId)
);

CREATE TABLE Specialists (
	SpecialistId int AUTO_INCREMENT,
    FirstName varchar(15) NOT NULL,
    LastName varchar(15) NOT NULL,
	Address varchar(255),
	SpecialistType varchar(50) NOT NULL,
	PRIMARY KEY (SpecialistId)
);

CREATE TABLE Appointments (
    AppointmentId int AUTO_INCREMENT,
    PatientId int,
    TreatmentId int,
    SpecialistId int,
    StartDate DateTime NOT NULL,
	EndDate DateTime NOT NULL,
    Report BLOB,
    file_path varchar(20),
    PRIMARY KEY (AppointmentId),
    FOREIGN KEY (PatientId) REFERENCES Patients(PatientId),
    FOREIGN KEY (TreatmentId) REFERENCES Treatments(TreatmentId),
    FOREIGN KEY (SpecialistId) REFERENCES Specialists(SpecialistId)
);

CREATE TABLE Bills (
    BillId int AUTO_INCREMENT,
    AppointmentId int,
    PatientId int,
	Amount DECIMAL(10,2) NOT NULL,
	Paid BOOLEAN,
    PRIMARY KEY (BillId),
	FOREIGN KEY (AppointmentId) REFERENCES Appointments(AppointmentId),
	FOREIGN KEY (PatientId) REFERENCES Patients(PatientId)
);

CREATE TABLE Payments (
    PaymentId int AUTO_INCREMENT,
    PaymentDetailId int,
    BillId int,
    Date DateTime,
    Amount DECIMAL(10,2) NOT NULL,
    PaymentMethod ENUM('online', 'post', 'drop-in'),
    PaymentType varchar(10) DEFAULT 'Cash',
    PRIMARY KEY (PaymentId),
    FOREIGN KEY (PaymentDetailId) REFERENCES Payments(PaymentDetailId),
    FOREIGN KEY (BillId) REFERENCES Bills(BillId)
);

CREATE TABLE PaymentDetails (
    PaymentDetailId int AUTO_INCREMENT,
    CardNumber int,
    CardCvv int,
    CardExpiryDate int,
    CardExpiryYear int,
    CardOwner varchar(50),
    PRIMARY KEY (PaymentDetailId)
);

-- CREATE TABLE AdminNotes (
--     AdminNotesId int AUTO_INCREMENT,
--     PatientLocations varchar(200),
--     PRIMARY KEY (AdminNotesId)
-- );

