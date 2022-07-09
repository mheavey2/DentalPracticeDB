--Queries for dentalPractice database.


--SELECT Queries

SELECT * FROM PATIENTS;--select all records from Table PATIENTS
SELECT * FROM PAYMENT;--select all records from Table PAYMENT
SELECT * FROM APPOINTMENT;--select all records from Table APPOINTMENT
SELECT * FROM REFERRAL;--select all records from Table REFERRAL
SELECT * FROM TREATMENT;--select all records from Table TREATMENT
SELECT * FROM SPECIALIST;--select all records from Table SPECIALIST
SELECT * FROM INVOICE;--select all records from Table INVOICE
SELECT * FROM dentalPractice.INVOICE where InvID = 3227; --select record with InvID of 3327 from the INVOICE table of the dentalPractice db
SELECT * FROM dentalPractice.APPOINTMENT where AptID = 8045; --select record with AptID of 8045 from the APPOINTMENT table of the dentalPractice db

--INSERT Queries

--insert some patients data into PATIENTS table
INSERT INTO PATIENTS (PatID, FIRSTNAME, LASTNAME, ADDRESS, PHONENO) VALUES ('0001', 'Joe', 'Bloggs', 'HillsideDrive', '091876543');
INSERT INTO PATIENTS (PatID, FIRSTNAME, LASTNAME, ADDRESS, PHONENO) VALUES ('0002', 'Davy', 'OBrien', 'Salthill', '091879845');
INSERT INTO PATIENTS (PatID, FIRSTNAME, LASTNAME, ADDRESS, PHONENO) VALUES ('0003', 'Nora', 'Daly', 'HillsideGrove', '091871267');
INSERT INTO PATIENTS (PatID, FIRSTNAME, LASTNAME, ADDRESS, PHONENO) VALUES ('0005', 'Sean', 'McGrath', 'DalysfortRd', '091871069');
INSERT INTO PATIENTS (PatID, FIRSTNAME, LASTNAME, ADDRESS, PHONENO) VALUES ('0006', 'Mary', 'OMahony', 'Mervue', '091871266');
INSERT INTO PATIENTS (PatID, FIRSTNAME, LASTNAME, ADDRESS, PHONENO) VALUES ('0007', 'Sid', 'James', 'DaltonPark', '091873442');
INSERT INTO PATIENTS (PatID, FIRSTNAME, LASTNAME, ADDRESS, PHONENO) VALUES ('0004', 'Ted', 'Keane', 'BelvedereViews', '091879986');

--insert some payment records info into PAYMENT
INSERT INTO PAYMENT (InvoiceID, AccBal, RecDate, AmtRcvd) VALUES ('3842', '00.00', '2020-01-23', '25.00');
INSERT INTO PAYMENT (InvoiceID, AccBal, RecDate, AmtRcvd) VALUES ('3645', '75.00', '2020-04-02', '50.00');
INSERT INTO PAYMENT (InvoiceID, AccBal) VALUES ('3318', '10.00');
INSERT INTO PAYMENT (InvoiceID, AccBal) VALUES ('3227', '70.00');
INSERT INTO PAYMENT (InvoiceID, AccBal, RecDate, AmtRcvd) VALUES ('3948', '20.00', '2019-10-16', '125.00');
INSERT INTO PAYMENT (InvoiceID, AccBal, RecDate, AmtRcvd) VALUES ('3337', '50.00', '2020-03-03', '30.00');
INSERT INTO PAYMENT (InvoiceID, AccBal, RecDate, AmtRcvd) VALUES ('3317', '30.00', '2019-05-23', '25.00');

--insert some appointment records into APPOINTMENT
INSERT INTO APPOINTMENT (AptID, DateTime, PatientID, TreatmentID) VALUES ('8045', '2019-08-19','0005', '7958');
INSERT INTO APPOINTMENT (AptID, DateTime, PatientID, TreatmentID) VALUES ('8046', '2019-12-03', '0001', '7959');
INSERT INTO APPOINTMENT (AptID, DateTime, PatientID, TreatmentID) VALUES ('8047', '2020-02-14', '0003', '7960');
INSERT INTO APPOINTMENT (AptID, DateTime, PatientID, TreatmentID) VALUES ('8048', '2020-01-10', '0002','7958');
INSERT INTO APPOINTMENT (AptID, DateTime, PatientID, TreatmentID) VALUES ('8049', '2020-02-14', '0004', '7964');
INSERT INTO APPOINTMENT (AptID, DateTime, PatientID, TreatmentID) VALUES ('8050', '2020-02-15', '0006', '7964');
INSERT INTO APPOINTMENT (AptID, DateTime, PatientID, TreatmentID) VALUES ('8051', '2020-02-15', '0007', '7964');

--insert referral information into REFERRAL
INSERT INTO REFERRAL (RefID, TreatmentID, SpecialistID, ReferralDate) VALUES ('9645', '7958', '4259', '2019-08-22');
INSERT INTO REFERRAL (RefID, TreatmentID, SpecialistID, ReferralDate) VALUES ('9647', '7961', '4260', '2020-01-16');
INSERT INTO REFERRAL (RefID, TreatmentID, SpecialistID, ReferralDate) VALUES ('9646', '7964', '4262', '2019-10-09');
	
--insert treatment records into TREATMENT
INSERT INTO TREATMENT (TrID, Name, Fee, Type, AppointmentID) VALUES ('7958', 'Clean', '50', 'new', '8048'); 
INSERT INTO TREATMENT (TrID, Name, Fee, Type, ReferralID, AppointmentID) VALUES ('7959', 'RootCanal', '100', 'followup','9646', '8047');
INSERT INTO TREATMENT (TrID, Name, Fee, Type, AppointmentID) VALUES ('7960', 'Braces', '250', 'new', '8046');
INSERT INTO TREATMENT (TrID, Name, Fee, AppointmentID) VALUES ('7961', 'ToothRemoval', '500', '8045');
INSERT INTO TREATMENT (TrID, Name, Fee, AppointmentID) VALUES ('7962', 'Clean', '50', '8050' );
INSERT INTO TREATMENT (TrID, Name, Fee, AppointmentID) VALUES ('7963', 'Clean', '50', '8051');	
INSERT INTO TREATMENT (TrID, Name, Fee, ReferralID, AppointmentID) VALUES ('7964', 'followup', '100', '9646', '8049');	
			
--insert specialist data into SPECIALIST
INSERT INTO SPECIALIST (SptID, Name, Address, AreaofExpertise, ReferralID) VALUES ('4259', 'DrDrake', 'Menlo', 'OralHygiene', '9645');
INSERT INTO SPECIALIST (SptID, Name, Address, AreaofExpertise, ReferralID) VALUES ('4260', 'DrOKeefe', 'Salthill', 'GumDisease', '9647');
INSERT INTO SPECIALIST (SptID, Name, Address, AreaofExpertise, ReferralID) VALUES ('4262', 'DrNick', 'Springfield', 'Dentures', '9646');
	
--insert invoice data into INVOICE
INSERT INTO INVOICE (InvID, AppointmentID, AmtDue, IssueDate, DueDate) VALUES ('3645', '8048', '50', '2020-03-03', '2020-03-31');
INSERT INTO INVOICE (InvID, AppointmentID, AmtDue, IssueDate, DueDate) VALUES ('3842', '8047', '100', '2020-03-03', '2020-03-31');
INSERT INTO INVOICE (InvID, AppointmentID, AmtDue, IssueDate, DueDate) VALUES ('3318', '8046', '250', '2020-03-03', '2020-03-31');
INSERT INTO INVOICE (InvID, AppointmentID, AmtDue, IssueDate, DueDate) VALUES ('3227', '8045', '300', '2020-03-03', '2020-03-31');
INSERT INTO INVOICE (InvID, AppointmentID, AmtDue, IssueDate, DueDate) VALUES ('3337', '8049', '100', '2020-03-03', '2020-03-31');
INSERT INTO INVOICE (InvID, AppointmentID, AmtDue, IssueDate, DueDate) VALUES ('3948', '8050', '700',  '2020-03-03', '2020-03-31');
INSERT INTO INVOICE (InvID, AppointmentID, AmtDue, IssueDate, DueDate) VALUES ('3317', '8051', '50', '2020-03-03', '2020-03-31');

--UPDATE Queries

UPDATE PATIENTS SET PhoneNo = ‘00001234’ WHERE PatID = ‘1’; --update the phone number of patient record with PatID '1' to '00001234'
UPDATE INVOICE SET DueDate = ‘2020-04-15’ WHERE AmtDue = ‘100’; --update the due date of invoice record with AmtDue value of '100' to ‘2020-04-15’

--DELETE Queries

DELETE FROM PAYMENT WHERE AmtRcvd = '25.00'; --delete records from PAYMENT table where the AmtRecvd value is '25.00' 
DELETE FROM PAYMENT WHERE InvoiceID = '3318'; --delete record with InvoiceID of '3318' from PAYMENT table

--CREATE Queries

CREATE DATABASE dentalPractice; --create the database dentalPractice

CREATE TABLE PATIENTS ( --create table that contains all patient info
    PatID int(4) NOT NULL,
    FirstName varchar(255) NOT NULL,
	LastName varchar(255) NOT NULL,
    Address varchar(255),
    PhoneNo int(9) NOT NULL,
	AccBal decimal (7,2),
	PRIMARY KEY (PatID)
);

CREATE TABLE PAYMENT ( --create table that contains all relevant payment info
	InvoiceID int(4) NOT NULL,
	AccBal decimal (7,2),   
	RecDate DATE, 
	AmtRcvd decimal (7,2),
	PRIMARY KEY (AccBal)
);

CREATE TABLE APPOINTMENT ( --create table that contains all relevant appointment data  
	AptID int(4) NOT NULL, 
	DateTime DATETIME NOT NULL,
	PatientID int(4) NOT NULL,
	TreatmentID int(4) NOT NULL,
	PRIMARY KEY (AptID),
	FOREIGN KEY (PatientID) REFERENCES PATIENTS(PatID)
);

CREATE TABLE REFERRAL ( --create table that contains all relevant patient referral data
	RefID int(4), 
	TreatmentID int(4) NOT NULL, 
	SpecialistID int(4) NOT NULL, 
	ReferralDate DATE,
	PRIMARY KEY (RefID)
);

CREATE TABLE TREATMENT (  --create table that contains all relevant treatment data
	TrID int(4) NOT NULL,  
	Name varchar(255) NOT NULL, 
	Fee int(4) NOT NULL, 
	Type varchar(255), 
	ReferralID int(4), 
	AppointmentID int(4) NOT NULL,
	PRIMARY KEY (TrID),
	FOREIGN KEY (ReferralID) REFERENCES REFERRAL (RefID),
	FOREIGN KEY (AppointmentID) REFERENCES APPOINTMENT (AptID)
);

CREATE TABLE SPECIALIST (  --create table that contains all info relating to specialists
	SptID int(4), 
	Name varchar(255) NOT NULL UNIQUE, 
	Address varchar(255) NOT NULL, 
	AreaofExpertise varchar(255) NOT NULL, 
	ReferralID int(4) NOT NULL,
	PRIMARY KEY (SptID),
	FOREIGN KEY (ReferralID) REFERENCES REFERRAL (RefID)
);

CREATE TABLE INVOICE ( --create table that create table that contains all relevant info for invoices
	InvID int(4) NOT NULL, 
	AppointmentID int(4) NOT NULL, 
	AmtDue int(4) NOT NULL, 
	IssueDate DATE NOT NULL, 
	DueDate DATE NOT NULL,
	PRIMARY KEY (InvID),
	FOREIGN KEY (AppointmentID) REFERENCES APPOINTMENT (AptID)
);
CREATE VIEW balDue AS SELECT * FROM INVOICE WHERE AmtDue > ‘50’; --create a view that allows user to see all records in INVOICE that have an AmtDue value greater than '50'

CREATE TABLE NewSurgery ( -- create a table with the below columns and divide it into 6 partitions based on the DentistID
	PatientID int(4), AppointmentID int(4), 
	TreatmentID int(4), 
	DentistID int(4) NOT NULL, 
	DentistName varchar(255)) 
	ENGINE +INNODB PARTITION BY HASH(DentistID) PARTITIONS 6;