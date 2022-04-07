program kr;
uses crt;
const
        n = 10;
        stopN = 200;
type
        ptrNode = ^node;
        node = record
                data: longint;
                ptrNext: ptrNode;
                end;
        tmas = array[1..1] of longint;
        massiv = ^tmas;
        {$r-}

procedure addL(var first, last: ptrNode; data: longint);
var
        cur: ptrNode;
begin
        new(cur);
        cur^.data := data;
        cur^.ptrNext := last^.ptrNext;
        last^.ptrNext := cur;
        last := cur;
end;

procedure createList(var first, last: ptrNode; n: integer; stopN: longint);
var
        cur: ptrNode;
        i: integer;
begin
        randomize;
        new(cur);
        cur^.data := random(1000000);
        cur^.ptrNext := first;
        first := cur;
        last := cur;
        i := 1;
        while ((i <> n) and (cur <> Nil)) do
        begin
                addL(first, last, random(1000000));
                i := i + 1;
        end;
end;

procedure writeLToFile(path: string; var first: ptrNode);
var
        f: file of longint;
        cur: ptrNode;
begin
        assign(f, path);
        rewrite(f);
        cur := first;
        while(cur <> Nil) do
        begin
                write(f, cur^.data);
                cur := cur^.ptrNext;
        end;
        close(f);
end;

procedure writeMToFile(path: string; var m: massiv; size: integer);
var
        f: file of longint;
        i: integer;
begin
        assign(f, path);
        rewrite(f);
        for i := 1 to size do
        begin
                write(f, m^[i]);
                i := i + 1;
        end;
        close(f);
end;

procedure datToTxt(fPath,tPath: string);
var
        f: file of longint;
        t: text;
        a: longint;
begin
        assign(f,fPath);
        assign(t,tPath);
        reset(f);
        rewrite(t);
        while(not eof(f)) do
        begin
                read(f, a);
                writeln(t, a);
        end;
        close(t);
        close(f);
end;

function ifOdd(num: longint): boolean;
var
        s, x: longint;
begin
        s := 0;
        x := num;
        while(x <> 0) do
        begin
                s := s + (x mod 10);
                x := x div 10;
        end;
        if (s mod 2 = 1) then
                ifOdd := true
        else
                ifOdd := false;
end;

function getOddAmount(var first: ptrNode): integer;
var
        cur: ptrNode;
        i: integer;
begin
        cur := first;
        i := 0;
        while(cur <> NIL) do
        begin
                if(ifOdd(cur^.data)) then
                        i := i + 1;
                cur := cur^.ptrNext;
        end;
        getOddAmount := i;
end;

function getEvenAmount(var first: ptrNode): integer;
var
        cur: ptrNode;
        i: integer;
begin
        cur := first;
        i := 0;
        while(cur <> NIL) do
        begin
                if(not ifOdd(cur^.data)) then
                        i := i + 1;
                cur := cur^.ptrNext;
        end;
        getEvenAmount := i;
end;

procedure delF(var first: ptrNode);
var
        cur: ptrNode;
begin
        if (first = NIL) then
                writeln('���᮪ ����')
        else
        begin
                cur := first;
                first := first^.ptrNext;
                dispose(cur);
        end;
end;

procedure delList(var first: ptrNode);
var
        cur: ptrNode;
begin
        if(first = NIL) then
                writeln('���᮪ ����, 㤠���� ��祣�')
        else
                while(first <> NIL) do
                        delF(first);
end;

procedure showList(var first: ptrNode);
var
        cur: ptrNode;
begin
        if(first = Nil) then
                writeln('���᮪ ����, �������� ��祣�')
        else
        begin
                cur := first;
                while(cur <> NIL) do
                begin
                        writeln(cur^.data);
                        cur := cur^.ptrNext;
                        end;
        end;
end;

procedure fillOddMas(var mas: massiv; size: integer; var first: ptrNode);
var
        cur: ptrNode;
        i: integer;
begin
        cur := first;
        i := 1;
        while(cur <> NIL) do
        begin
                if(ifOdd(cur^.data)) then
                begin
                        mas^[i] := cur^.data;
                        i := i + 1;
                end;
                cur := cur^.ptrNext;
        end;
end;

procedure fillEvenMas(var mas: massiv; size: integer; var first: ptrNode);
var
        cur: ptrNode;
        i: integer;
begin
        cur := first;
        i := 1;
        while(cur <> NIL) do
        begin
                if(not ifOdd(cur^.data)) then
                begin
                        mas^[i] := cur^.data;
                        i := i + 1;
                end;
                cur := cur^.ptrNext;
        end;
end;

procedure showMas(var mas: massiv; size: integer);
var
        i: integer;
begin
        for i := 1 to size do
        begin
                writeln(mas^[i]);
        end;
end;

var
        first: ptrNode;
        last: ptrNode;
        Odd, Even: massiv;
        a, b: integer;
begin
        clrscr;
        createList(first, last, n, stopN);
        showList(first);
        writeLToFile('src/Numbers.dat', first);
        datToTxt('src/Numbers.dat', 'src/Numbers.txt');
        a := getOddAmount(first);
        b := getEvenAmount(first);
        getmem(Odd, a * sizeof(longint));
        getmem(Even, b * sizeof(longint));
        fillOddMas(Odd, a, first);
        fillEvenMas(Even, b, first);
        writeMToFile('src/Odd.dat', Odd, a);
        datToTxt('src/Odd.dat', 'src/Odd.txt');
        writeMToFile('src/Even.dat', Even, b);
        datToTxt('src/Even.dat', 'src/Even.txt');
        readln;
        clrscr;
        showMas(Odd, a);
        readln;
        clrscr;
        showMas(Even, b);
        freemem(Even, b * sizeof(longint));
        freemem(Odd, a * sizeof(longint));
        delList(first);
        readln;
end.
