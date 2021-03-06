create or replace procedure showAvailableRoomsProc
    is

    found int := 0;

    roomId_ ROOM.RoomId%TYPE;
    roomNo_ ROOM.RoomNo%TYPE;
    hosId_ ROOM.HosId%TYPE;
    hosName_ HOSPITAL.hosName%TYPE;

    CURSOR c1 IS
    select room.RoomId, room.RoomNo, room.HosId, hospital.hosName
    from room, hospital
    where RoomId not in (
        select roomId
        from medical_record
        where discharged = 0
    ) and room.hosId = hospital.hosId;

begin

    open c1;
        loop
            fetch  c1 into roomId_, roomNo_, hosId_, hosName_;
            exit when c1%notfound;
            dbms_output.put_line(roomId_ || ' ' || roomNo_ || ' ' || hosId_ || ' ' || hosName_);
            found := 1;
        end loop;
    close c1;

    if found = 0 then
        dbms_output.put_line('The rooms are full!');
    end if;

end showAvailableRoomsProc;
/
