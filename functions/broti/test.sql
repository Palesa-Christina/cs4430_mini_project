set serveroutput on; 

SET VERIFY OFF;
ACCEPT x NUMBER PROMPT 'Enter Option: ';

declare 
    x number := &x;

    -- Patient Insertion Info
    patientId_ PATIENT.PatientId%TYPE;
    name_ PATIENT.name%TYPE;
    gender_ PATIENT.gender%TYPE;
    address_ PATIENT.Address%TYPE;
    contactno_ PATIENT.ContactNo%TYPE;
    age_ PATIENT.age%TYPE;
    temp int;

begin 


    if x = 1 then
        dbms_output.put_line('Adding patient.');
        @@addPatientFromInputCall.sql;
    elsif x = 2 then
        @@checkPatientCall.sql;
    elsif x = 3 then
        dbms_output.put_line('Showing total patient under doctor');
        showTotalPatientUnderDoc(1);
    elsif x = 4 then
        dbms_output.put_line('Showing info about patient');
        showPatientHosRoomNoProc(1);
    elsif x = 5 then
        dbms_output.put_line('Showing Available rooms');
        showAvailableRoomsProc();
    elsif x = 6 then
        dbms_output.put_line('Showing Available rooms given hospital id');
        showAvailableRoomsForHos(1);
    else
        dbms_output.put_line('Input not correct');
    end if;
    

end; 
/

