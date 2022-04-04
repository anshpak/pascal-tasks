program eightLab;
const
        nMax = 2000;
type
        digit = 0..9;
        num = array[1..nMax] of digit;
        bigNum = record
                len: word;
                a: num;
                end;

var
        n1, n2: bigNum;
        j: integer;

procedure showNum(n: bigNum);
var
        i: integer;
begin
        writeln;
        for i:=n.len downto 1 do
                write(n.a[i]);
end;

begin
        n1.len:=10;
        write(n1.len);
        for j:=n1.len downto 1  do
                n1.a[j]:=j-1;
        showNum(n1);
        writeln;
        n2.len:=10;
        write(n2.len);
        for j:=n2.len downto 1  do
                n2.a[j]:=1;
        showNum(n2);
        readln;
end.
