﻿CREATE TABLE STAFF (
ID SERIAL,
Email VARCHAR(30) NOT NULL,
Name VARCHAR(20) NOT NULL,
License CHAR(8) NOT NULL,
Phone CHAR(13) NULL,
PRIMARY KEY (ID));

ALTER SEQUENCE STAFF_ID_seq RESTART WITH 1000;

CREATE TABLE DOCTOR (
ID INT NOT NULL,
AvailableForEmergency  BIT NULL,
PRIMARY KEY (ID),
FOREIGN KEY (ID) REFERENCES STAFF(ID)
          ON DELETE CASCADE);
 
CREATE TABLE GeneralPracticioner (
ID INT NOT NULL,
PRIMARY KEY (ID),
FOREIGN KEY (ID) REFERENCES DOCTOR(ID)
          ON DELETE CASCADE);


CREATE TABLE Specialist (
ID INT NOT NULL,
SPECIALIZATION VARCHAR(20) NULL,
PRIMARY KEY (ID),
FOREIGN KEY (ID) REFERENCES DOCTOR(ID)
          ON DELETE CASCADE);

CREATE TABLE Nurse (
ID INT NOT NULL,
DID INT NOT NULL,
PRIMARY KEY (ID, DID),
FOREIGN KEY (ID) REFERENCES STAFF(ID)
ON DELETE CASCADE,
FOREIGN KEY (DID) REFERENCES DOCTOR(ID)
ON DELETE CASCADE);

CREATE TABLE Facility (
ID CHAR(8) NOT NULL,
Type VARCHAR(20) NOT NULL, 
PRIMARY KEY (ID)); 
 
CREATE TABLE Lab_Technician (
ID INT NOT NULL,
FID CHAR(8) NOT NULL,
PRIMARY KEY (ID, FID),
FOREIGN KEY (ID) REFERENCES STAFF(ID)
ON DELETE CASCADE,
FOREIGN KEY (FID) REFERENCES Facility(ID) 
ON DELETE CASCADE);
 
CREATE TABLE WeeklySchedule (
ID CHAR(8) NOT NULL,
SID INT NOT NULL,
PRIMARY KEY (ID),                                            
FOREIGN KEY (SID) REFERENCES Staff(ID)
ON DELETE CASCADE,
UNIQUE(SID));
 
CREATE TABLE Scheduled_Time (
Date DATE NOT NULL,
StartTime TIME NOT NULL,
EndTime TIME NOT NULL,
WID CHAR(8) NOT NULL,
Notes VARCHAR(60) NULL,
PRIMARY KEY (Date, StartTime, EndTime, WID),
FOREIGN KEY (WID) REFERENCES WeeklySchedule(ID)
ON DELETE CASCADE);


CREATE TABLE Patient (
ID SERIAL NOT NULL,
Email CHAR(30) NOT NULL,
Name CHAR(20) NOT NULL,
HealthCard VARCHAR(20) NOT NULL,
Phone CHAR(13) NULL,
PRIMARY KEY (ID));

ALTER SEQUENCE Patient_ID_seq RESTART WITH 100000;
 
CREATE TABLE Appointment (
AppointmentID SERIAL NOT NULL,
Date DATE NOT NULL,
Time TIME NOT NULL,
PID INT NOT NULL,
DID INT NOT NULL, 
PRIMARY KEY (AppointmentID),
FOREIGN KEY (PID) REFERENCES Patient(ID)
          ON DELETE CASCADE,
FOREIGN KEY (DID) REFERENCES Doctor(ID)
          ON DELETE CASCADE); 

ALTER SEQUENCE Appointment_AppointmentID_seq RESTART WITH 10000000;

CREATE TABLE Books (
FID CHAR(8) NOT NULL,
AppointmentID INT NOT NULL,
PRIMARY KEY (FID, AppointmentID),
FOREIGN KEY (FID) REFERENCES Facility(ID)
			ON DELETE CASCADE, 
FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID)
			ON DELETE CASCADE);

CREATE TABLE Prescription (
PrescriptionID SERIAL NOT NULL,
INSTRUCTION VARCHAR(30) NULL,
Substitutable BIT NULL,
PRIMARY KEY (PrescriptionID));

ALTER SEQUENCE Prescription_PrescriptionID_seq RESTART WITH 10000;
 
CREATE TABLE Treats (
DID INT NOT NULL,
PID INT NOT NULL,
PrescriptionID INT NOT NULL,
PRIMARY KEY (DID, PID, PrescriptionID),
FOREIGN KEY (DID) REFERENCES Doctor(ID)
ON DELETE CASCADE,
FOREIGN KEY (PID) REFERENCES Patient(ID)
ON DELETE CASCADE,
FOREIGN KEY (PrescriptionID) REFERENCES Prescription(PrescriptionID));
 
CREATE TABLE Medicine (
DIN CHAR(8) NOT NULL,
Brand VARCHAR(20) NOT NULL,
Ingredients VARCHAR(20) NULL,
SideEffect VARCHAR(80) NULL,
PRIMARY KEY (DIN));

CREATE TABLE Contains (
PrescriptionID INT NOT NULL,
DIN CHAR(8) NOT NULL,
PRIMARY KEY (PrescriptionID, DIN),
FOREIGN KEY (PrescriptionID) REFERENCES Prescription(PrescriptionID)
ON DELETE CASCADE,
FOREIGN KEY (DIN) REFERENCES Medicine(DIN)
ON DELETE CASCADE);
 
