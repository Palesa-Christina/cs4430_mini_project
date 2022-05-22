set serveroutput on;

declare
    -- Patient Insertion Info

    name_ PATIENT.name%TYPE := &name;
    gender_ PATIENT.gender%TYPE := &gender;
    address_ PATIENT.Address%TYPE := &address;
    contactno_ PATIENT.ContactNo%TYPE := &contact;
    age_ PATIENT.age%TYPE := &age;

   
begin

    addPatientFromInputToDipta(
        name_,
        gender_ ,
        address_,
        contactno_ ,
        age_
    );


end;
/
