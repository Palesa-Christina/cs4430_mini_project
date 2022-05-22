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




DROP TABLE HOSPITAL CASCADE CONSTRAINTS;
CREATE TABLE HOSPITAL (
    HosId int, 
    hosName varchar2(15), 
    HosDist varchar2(20),
    HosAddress varchar2(20),
    PRIMARY KEY(HosId)
);



DROP TABLE ROOM CASCADE CONSTRAINTS;
CREATE TABLE ROOM (
    RoomId int, 
    RoomNo varchar(5), /* 7B04 */
    HosId int, 
    PRIMARY KEY(RoomId),
    FOREIGN KEY(HosId) REFERENCES HOSPITAL(HosId)
);

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
