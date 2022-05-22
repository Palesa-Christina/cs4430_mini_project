DROP TABLE PATIENT CASCADE CONSTRAINTS;
CREATE TABLE PATIENT(
    PatientId int, 
    Name varchar2(15), 
    gender VARCHAR(9),
    Address varchar2(20),
    ContactNo varchar2(11),
    Age int, 
    PRIMARY KEY(PatientId),
    check(gender in ('Male', 'Female', 'Unknown'))
);

/* insert into PATIENT values(id, 'name', 'gender', 'add', 'contactno', age); */
insert into PATIENT values (1, 'Sutha', 'Male', 'Maseru' ,'57575757', 23);
insert into PATIENT values (2, 'Lesenyeho', 'Male', 'Mafikeng', '67676766', 27);
select * from PATIENT;


DROP TABLE HOSPITAL CASCADE CONSTRAINTS;
CREATE TABLE HOSPITAL (
    HosId int, 
    hosName varchar2(15), 
    HosCity varchar2(20),
    HosAddress varchar2(20),
    PRIMARY KEY(HosId)
);

/* insert into HOSPITAL values (id, 'name', 'city', 'add'); */
insert into HOSPITAL values (1, 'Paray', 'Thaba-Tseka', 'Thaba-Tseka');
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
insert into DOCTOR values (1, 'Lesenyeho', 'FCPS', 150000, 'Maseru', '57577557');
insert into DOCTOR values (2, 'Litsiba', 'MBBS', 100000, 'Maseru', '67676767');


DROP TABLE MEDICAL_RECORD
CASCADE CONSTRAINTS;
CREATE TABLE MEDICAL_RECORD (
    RecordId int,
    PatientId int,
    DocId int,
    RoomId int,
    admitDate date,
    releaseDate date,
    /* HosId int, */
    PRIMARY KEY(RecordId),
    FOREIGN KEY(RoomId) REFERENCES ROOM(RoomId),
    /* FOREIGN KEY(HosId) REFERENCES HOSPITAL(HosId), */
    FOREIGN KEY(PatientId) REFERENCES PATIENT(PatientId),
    FOREIGN KEY(DocId) REFERENCES DOCTOR(DocId)
);



/* insert into MEDICAL_RECORD values (RecordId, PatientId, DocId, RoomId); */

insert into MEDICAL_RECORD values (1, 1, 1, 2,'14-Jul-2019','19-Jul-2019');
insert into MEDICAL_RECORD values (2, 2, 2, 5,'15-Sep-2019','25-Sep-2019');
insert into MEDICAL_RECORD values (3, 3, 1, 9,'23-Aug-2019','26-Aug-2019');

select * from MEDICAL_RECORD;

