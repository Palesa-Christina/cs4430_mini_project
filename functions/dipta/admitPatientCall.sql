
set serveroutput on;

declare

    patientId_ MEDICAL_RECORD.PatientId%TYPE := &patientId;                  
    docId_ MEDICAL_RECORD.DocId%TYPE := &doctorId;               
    roomId_ MEDICAL_RECORD.RoomId%TYPE := &roomId;   
    
begin
    admitPatient(
        patientId_,
        docId_,
        roomId_
    );

end;
/
