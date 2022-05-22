
create or replace trigger record_log
after update
on medical_record
for each row

begin
	insert into record_log
	values(:old.RecordId, :old.discharged, :new.discharged, sysdate);
end;
/
