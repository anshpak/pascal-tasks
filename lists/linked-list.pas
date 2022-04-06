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

procedure addToEnd(var first, last: ptrNode; data: integer);
var
        temp: ptrNode;
begin
        if(first = NIL) then
                addFirstNode(first, last, data)
        else
        begin
                new(temp);
                temp^.data := data;
                temp^.ptrNext := last^.ptrNext;
                last^.ptrNext := temp;
                last := temp;
        end;
end;

procedure addToStart(var first, last: ptrNode; data: integer);
var
        temp: ptrNode;
begin
        if(first = NIL) then
                addFirstNode(first, last, data)
        else
        begin
                new(temp);
                temp^.data := data;
                temp^.ptrNext := first;
                first := temp;
        end;
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
        addToEnd(first, last, 5);
        addToEnd(first, last, 0);
        addToEnd(first, last, 11);
        addToEnd(first, last, 9);
        addToEnd(first, last, 4);
        addToEnd(first, last, -4);
        addToStart(first, last, 0);
        addToStart(first, last, -3);
        showList(first);
        readln;
end.