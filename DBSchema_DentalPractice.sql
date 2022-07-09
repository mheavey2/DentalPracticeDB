CREATE DATABASE dentalPractice; --create database
USE dentalPractice; --ensures any following commands are carried out on the correct database (i.e. dentalPractice)

-- create 7 tables within the db

CREATE TABLE PATIENTS ( --contains all patient info
    PatID int(4) NOT NULL,
    FirstName varchar(255) NOT NULL,
	LastName varchar(255) NOT NULL,
    Address varchar(255),
    PhoneNo int(9) NOT NULL,
	AccBal decimal (7,2),
	PRIMARY KEY (PatID)
);

CREATE TABLE PAYMENT ( --contains all relevant payment info
	InvoiceID int(4) NOT NULL,
	AccBal decimal (7,2),   
	RecDate DATE, 
	AmtRcvd decimal (7,2),
	PRIMARY KEY (AccBal)
);

CREATE TABLE APPOINTMENT ( --contains all relevant appointment data  
	AptID int(4) NOT NULL, 
	DateTime DATETIME NOT NULL,
	PatientID int(4) NOT NULL,
	TreatmentID int(4) NOT NULL,
	PRIMARY KEY (AptID),
	FOREIGN KEY (PatientID) REFERENCES PATIENTS(PatID)
);

CREATE TABLE REFERRAL ( --contains all relevant patient referral data
	RefID int(4), 
	TreatmentID int(4) NOT NULL, 
	SpecialistID int(4) NOT NULL, 
	ReferralDate DATE,
	PRIMARY KEY (RefID)
);

CREATE TABLE TREATMENT (  --contains all relevant treatment data
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

CREATE TABLE SPECIALIST (  --contains all info relating to specialists
	SptID int(4), 
	Name varchar(255) NOT NULL UNIQUE, 
	Address varchar(255) NOT NULL, 
	AreaofExpertise varchar(255) NOT NULL, 
	ReferralID int(4) NOT NULL,
	PRIMARY KEY (SptID),
	FOREIGN KEY (ReferralID) REFERENCES REFERRAL (RefID)
);

CREATE TABLE INVOICE ( --contains all relevant info for invoices
	InvID int(4) NOT NULL, 
	AppointmentID int(4) NOT NULL, 
	AmtDue int(4) NOT NULL, 
	IssueDate DATE NOT NULL, 
	DueDate DATE NOT NULL,
	PRIMARY KEY (InvID),
	FOREIGN KEY (AppointmentID) REFERENCES APPOINTMENT (AptID)
);


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

--add foreign keys to link tables
ALTER TABLE PAYMENT ADD FOREIGN KEY (InvoiceID) REFERENCES INVOICE(InvID);

ALTER TABLE APPOINTMENT ADD FOREIGN KEY (TreatmentID) REFERENCES TREATMENT (TrID);

ALTER TABLE REFERRAL ADD FOREIGN KEY (TreatmentID) REFERENCES TREATMENT (TrID);

ALTER TABLE REFERRAL ADD FOREIGN KEY (SpecialistID) REFERENCES SPECIALIST (SptID);

ALTER TABLE PATIENTS ADD FOREIGN KEY (AccBal) REFERENCES PAYMENT (AccBal);

