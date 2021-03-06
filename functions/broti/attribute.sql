/* PATIENT TABLE */
    patientId_ PATIENT.PatientId%TYPE;
    name_ PATIENT.name%TYPE;
    gender_ PATIENT.gender%TYPE;
    address_ PATIENT.Address%TYPE;
    contactNo_ PATIENT.ContactNo%TYPE;
    age_ PATIENT.age%TYPE;


/* HOSPITAL TABLE */
    hosId_ HOSPITAL.hosId%TYPE;
    hosName_ HOSPITAL.hosName%TYPE;
    hosDist_ HOSPITAL.HosCity%TYPE; 
    hosAddress_ HOSPITAL.HosAddress%TYPE;


/* ROOM TABLE */
    roomId_ ROOM.RoomId%TYPE;
    roomNo_ ROOM.RoomNo%TYPE;
    hosId_ ROOM.HosId%TYPE;


/* DOCTOR TABLE */
    docId_ DOCTOR.DocId%TYPE;         
    name_ DOCTOR.Name%TYPE; 
    qualification_ DOCTOR.Qualification%TYPE;        
    salary_ DOCTOR.Salary%TYPE;        
    address_ DOCTOR.Address%TYPE;          
    contactNo_ DOCTOR.ContactNo%TYPE;         


/* MEDICAL RECORD TABLE */
    recordId_ MEDICAL_RECORD.RecordId%TYPE;           
    patientId_ MEDICAL_RECORD.PatientId%TYPE;                  
    docId_ MEDICAL_RECORD.DocId%TYPE;               
    roomId_ MEDICAL_RECORD.RoomId%TYPE;   
    dateOfAdmission MEDICAL_RECORD.dateOfAdmission%TYPE;
    discharged MEDICAL_RECORD.discharged%TYPE;


