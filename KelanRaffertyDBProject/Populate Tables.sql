
-- Insert into Appointments (fileDB) values (load_file('file:///C:/Users/35387/Desktop/KelanRaffertyDBProject/Receipt.pdf'),'/Receipt.pdf');

INSERT INTO Patients (FirstName, LastName, DateOfBirth, Email, PhoneNumber, Address)
 VALUES ('Tom', 'Hogan', '1992-01-01 15:44:58', 'tomhogan@gmail.com', '0876808860', 'Athenry'),
        ('John', 'steel', '1992-01-01 15:44:58', 'johnsteel@gmail.com', '0877886048', 'Loughrea'),
        ('Tim', 'Kennedy', '1987-11-07 20:01:12', 'timkennedy@hotmail.com', '0918764501', 'Oranmore'),
        ('Joe', 'Burke', '1968-01-06 10:16:34', 'joeburke@hotmail.com', '0872685643', 'Doughiska'),
        ('Cillian', 'Noone', '1971-09-09 09:56:03', 'cilliannoone@bing.com', '0876598365', 'Loughrea');

INSERT INTO Treatments (Name, Cost)
VALUES ('Root Canal', '100.00'),
('Cleaning', '50.00'),
('Extraction', '75.00');

INSERT INTO Specialists (FirstName, LastName, Address, SpecialistType)
 VALUES ('Mary', 'Mulcahy ', 'Athenry', 'Checkup'),
        ('Mary', 'Mulcahy ', 'Athenry', 'Root Canal'),
        ('Gordon', 'Ryan ', 'Loughrea', 'Cleaning'),
        ('Garry', 'Tonon ', 'Carlow', 'Extraction');

INSERT INTO Appointments (PatientId, TreatmentId, SpecialistId, StartDate, EndDate, Report, file_path)
 VALUES ((SELECT PatientId FROM Patients WHERE PatientId = '1'),
            (SELECT TreatmentId FROM Treatments WHERE TreatmentId = '3'),
            (SELECT SpecialistId FROM Specialists WHERE SpecialistId = '4'),
            '2022-03-17 15:00:00',
            '2022-03-17 15:45:00',
            load_file('file:///C:/Users/35387/Desktop/KelanRaffertyDBProject/Receipt.pdf'),'/Receipt.pdf'),
        ((SELECT PatientId FROM Patients WHERE PatientId = '2'),
            (SELECT TreatmentId FROM Treatments WHERE TreatmentId = '2'),
            (SELECT SpecialistId FROM Specialists WHERE SpecialistId = '3'),
            '2022-03-18 12:00:00',
            '2022-03-18 15:30:00',
            load_file('file:///C:/Users/35387/Desktop/KelanRaffertyDBProject/Receipt.pdf'),'/Receipt.pdf'),
        ((SELECT PatientId FROM Patients WHERE PatientId = '3'),
            (SELECT TreatmentId FROM Treatments WHERE TreatmentId = '1'),
            (SELECT SpecialistId FROM Specialists WHERE SpecialistId = '2'),
            '2022-03-14 10:00:00',
            '2022-03-14 11:45:00',
            load_file('file:///C:/Users/35387/Desktop/KelanRaffertyDBProject/Receipt.pdf'),'/Receipt.pdf'),
        ((SELECT PatientId FROM Patients WHERE PatientId = '4'),
            (SELECT TreatmentId FROM Treatments WHERE TreatmentId = '1'),
            (SELECT SpecialistId FROM Specialists WHERE SpecialistId = '2'),
            '2022-03-14 12:00:00',
            '2022-03-14 13:45:00',
            load_file('file:///C:/Users/35387/Desktop/KelanRaffertyDBProject/Receipt.pdf'),'/Receipt.pdf'),
        ((SELECT PatientId FROM Patients WHERE PatientId = '5'),
            (SELECT TreatmentId FROM Treatments WHERE TreatmentId = '3'),
            (SELECT SpecialistId FROM Specialists WHERE SpecialistId = '4'),
            '2022-03-15 12:00:00',
            '2022-03-16 12:00:00',
            load_file('file:///C:/Users/35387/Desktop/KelanRaffertyDBProject/Receipt.pdf'),'/Receipt.pdf');

INSERT INTO Bills (AppointmentId, PatientId, Amount, Paid)
    VALUES ((SELECT AppointmentId FROM Appointments WHERE AppointmentId = '1'),
            (SELECT PatientId FROM Patients WHERE PatientId = '1'),
            '75.00',
            true),
            ((SELECT AppointmentId FROM Appointments WHERE AppointmentId = '2'),
            (SELECT PatientId FROM Patients WHERE PatientId = '2'),
            '50.00',
            false),
            ((SELECT AppointmentId FROM Appointments WHERE AppointmentId = '3'),
            (SELECT PatientId FROM Patients WHERE PatientId = '3'),
            '100.00',
            false),
            ((SELECT AppointmentId FROM Appointments WHERE AppointmentId = '4'),
            (SELECT PatientId FROM Patients WHERE PatientId = '4'),
            '100.00',
            true),
            ((SELECT AppointmentId FROM Appointments WHERE AppointmentId = '5'),
            (SELECT PatientId FROM Patients WHERE PatientId = '5'),
            '75.00',
            true);

INSERT INTO PaymentDetails (CardNumber, CardCvv, CardExpiryDate, CardExpiryYear, CardOwner)
    VALUES  ('12345678', (SELECT ENCRYPT('657','key1234')), '02', '24','Tom Hogan'),
            ('87654321', (SELECT ENCRYPT('721','key1234')), '09', '26','John Steel'),
            ('43345671', (SELECT ENCRYPT('887','key1234')), '11', '25','Tim Kennedy'),
            ('23239887', (SELECT ENCRYPT('765','key1234')), '08', '22','Joe Burke'),
            ('77614315', (SELECT ENCRYPT('114','key1234')), '12', '23','Cillian Noone');

INSERT INTO Payments (PaymentDetailId, BillId, Date, Amount, PaymentMethod, PaymentType)
    VALUES  ((SELECT PaymentDetailId FROM PaymentDetails WHERE PaymentDetailId = '1'),
            (SELECT BillId FROM Bills WHERE BillId = '1'),
            '2022-03-17 15:00:00','75.00','2','Cheque'),
            ((SELECT PaymentDetailId FROM PaymentDetails WHERE PaymentDetailId = '2'),
            (SELECT BillId FROM Bills WHERE BillId = '2'),
            '2022-03-18 12:00:00','50.00','1','Card'),
            ((SELECT PaymentDetailId FROM PaymentDetails WHERE PaymentDetailId = '3'),
            (SELECT BillId FROM Bills WHERE BillId = '3'),
            '2022-03-14 10:00:00','100.00','1','Revolut'),
            ((SELECT PaymentDetailId FROM PaymentDetails WHERE PaymentDetailId = '4'),
            (SELECT BillId FROM Bills WHERE BillId = '4'),
            '2022-03-14 12:00:00','100.00','3','Cash'),
            ((SELECT PaymentDetailId FROM PaymentDetails WHERE PaymentDetailId = '5'),
            (SELECT BillId FROM Bills WHERE BillId = '5'),
            '2022-03-15 12:00:00','75.00','3','Cash');

-- INSERT INTO AdminNotes (OutStandingPayment)
--  VALUES (SELECT FirstName FROM Patients
-- WHERE Address IN ('Athenry');

