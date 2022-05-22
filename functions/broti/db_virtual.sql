DROP TABLE PATIENT CASCADE CONSTRAINTS;
CREATE TABLE PATIENT(
    PatientId int, 
    Name varchar2(15), 
    gender VARCHAR(7),
    Address varchar2(20),
    ContactNo varchar2(11),
    Age number(3), 
    PRIMARY KEY(PatientId),
    check(gender in ('Male', 'Female', 'Unknown'))
);

insert into PATIENT values (7, 'Rethabile', 'Male', 'Roma', '56838382', 30);
insert into PATIENT values (8, 'Mopeli', 'Male', 'Mafefowane', '67645372', 21);

select * from PATIENT;

DROP TABLE HOSPITAL CASCADE CONSTRAINTS;
CREATE TABLE HOSPITAL (
    HosId int, 
    hosName varchar2(15), 
    HosDist varchar2(20),
    HosAddress varchar2(20),
    PRIMARY KEY(HosId)
);

/* insert into HOSPITAL values (id, 'name', 'city', 'add'); */
insert into HOSPITAL values (1, 'Paray', 'Thaba`-Tseka', 'Thaba-Tseka');
insert into HOSPITAL values (2, 'Scott', 'Maseru', 'Morija');
select * from HOSPITAL;

DROP TABLE ROOM CASCADE CONSTRAINTS;
CREATE TABLE ROOM (
    RoomId int, 
    RoomNo varchar(5), /* 7B04 */
    HosId int, 
    PRIMARY KEY(RoomId),
    FOREIGN KEY(HosId) REFERENCES HOSPITAL(HosId)
);

/* insert into ROOM values (RoomId, RoomNo, HosId); */
/* Paray Hospital */
insert into ROOM values (1, '7B01', 1);
insert into ROOM values (2, '7B04', 1);
insert into ROOM values (3, '7B06', 1);
/* Scott Hospital */
insert into ROOM values (4, '7B01', 2);
insert into ROOM values (5, '7B04', 2);
insert into ROOM values (6, '7B07', 2);

select * from ROOM;


DROP TABLE DOCTOR CASCADE CONSTRAINTS;
CREATE TABLE DOCTOR(
    DocId int, 
    Name varchar2(15), 
    Qualification varchar2(10),
    Salary number(7),
    Address varchar2(18),
    ContactNo varchar2(11),
    PRIMARY KEY(DocId)
);

/* insert into DOCTOR values (DocId, Name, Qualification, Salary, Address, ContactNo); */
insert into DOCTOR values (1, 'Sutha', 'FCPS', 150000, 'Roma', '67476337');
insert into DOCTOR values (2, 'Palesa', 'MBBS', 100000, 'Roma', '56473633');


select * from doctor;

DROP TABLE MEDICAL_RECORD
CASCADE CONSTRAINTS;
CREATE TABLE MEDICAL_RECORD (
    RecordId int,
    PatientId int,
    DocId int,
    RoomId int,
    dateOfAdmission date,
    discharged number(1),
    /* dateOfExamination date, */
    /* HosId int, */
    check(discharged in (0, 1)),
    PRIMARY KEY(RecordId),
    FOREIGN KEY(RoomId) REFERENCES ROOM(RoomId),
    /* FOREIGN KEY(HosId) REFERENCES HOSPITAL(HosId), */
    FOREIGN KEY(PatientId) REFERENCES PATIENT(PatientId),
    FOREIGN KEY(DocId) REFERENCES DOCTOR(DocId)
);

insert into MEDICAL_RECORD values (6, 7, 2, 5, '27-May-2022', 0);

select * from MEDICAL_RECORD;
-- trigger table
DROP TABLE RECORD_LOG
CASCADE CONSTRAINTS;
create table RECORD_LOG (
    RecordId int,
    newDischarged number(1),
    oldDischarged number(1),
    time date
);

@@triggerRecord.sql
@@addPatientFromInputProc.sql
@@addPatientFromInputToBrotiProc.sql
@@all_patient_view.sql
@@checkDoctorFunc.sql
@@checkHospitalFunc.sql
@@checkPatientFunc.sql
@@dischargePatientProc.sql
@@findDoctorForPatientFunc.sql
@@findRoomForPatientFunc.sql
@@showAvailabeRoomsProc.sql
@@showAvailableRoomNoForHos.sql
@@showPatientHosRoomNo.sql
@@showPatientInfo.sql
@@showTotalPatientUnderDocProc.sql
@@admitPatientProc.sql
@@mergePatientProc.sql