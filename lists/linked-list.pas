program linkedList;
type
        ptrNode = ^node;
        node = record
                data: integer;
                ptrNext: ptrNode;
                end;

procedure addFirstNode(var first, last: ptrNode; data: integer);
var
        temp: ptrNode;
begin
        new(temp);
        temp^.data := data;
        temp^.ptrNext := first;
        first := temp;
        last := temp;
end;

procedure addNode(var first, last: ptrNode; data: integer);
begin
        if(first = NIL) then
                addFirstNode(first, last, data);
end;

procedure showList(var first: ptrNode);
var
        temp: ptrNode;
begin
        temp := first;
        while(temp <> NIL) do
        begin

                writeln(temp^.data);
                temp := temp^.ptrNext;
        end;
end;

var
        first: ptrNode;
        last: ptrNode;
begin
        first := NIL;
        last := NIL;
        addNode(first, last, 5);
        showList(first);
        readln;
end.