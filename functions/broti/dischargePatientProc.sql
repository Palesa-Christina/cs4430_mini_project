
create or replace procedure dischargePatient(
    patientId_ PATIENT.PatientId%TYPE
)
    is
    
    cnt int;
    noPatientSuchException EXCEPTION;
    already_discharged EXCEPTION;

begin

    cnt := checkPatient(patientId_);
    if (cnt <= 0) then
        RAISE noPatientSuchException; 
        return;
    end if;

    select DISCHARGED into cnt from MEDICAL_RECORD where PatientId = patientId_ and
    dateOfAdmission = (
        select max(dateOfAdmission) from MEDICAL_RECORD where PatientId = patientId_
    );


    if (cnt = 1) then
        RAISE already_discharged;
        return;
    end if;

    update MEDICAL_RECORD set DISCHARGED = 1 where PatientId = patientId_ and
    dateOfAdmission = (
        select max(dateOfAdmission) from MEDICAL_RECORD where PatientId = patientId_
    );
    dbms_output.put_line('Patient Discharged');

    commit;

    EXCEPTION 
       WHEN noPatientSuchException THEN 
          dbms_output.put_line('EXCEPTION:: THE PATIENT WITH ID ' || patientId_ || ' DOES NOT EXIST ANYWHERE'); 
       WHEN already_discharged THEN 
          dbms_output.put_line('THE PATIENT IS ALREADY DISCHARGED'); 
       WHEN no_data_found THEN 
          dbms_output.put_line('THE PATIENT IS NOT ADMITTED IN THE CURRENT SITE, CHECK OTHER SITES.  A PATIENT CAN ONLY BE DISCHARGED FROM WITHIN THE SITE HE/SHE IS ADMITTED IN.'); 


end dischargePatient;
/
