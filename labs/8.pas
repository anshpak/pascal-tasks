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
        for i:=n.len downto 1 do
                write(n.a[i]);
        writeln;
end;

function comparing(var n1,n2: bigNum): bigNum;
var
        i: integer;
begin
        if (n1.len = n2.len) then
        begin
                i := n1.len - 1;
                while i <> 0 do
                begin
                        if(n1.a[i] >  n2.a[i]) then
                                comparing := n1
                        else
                                comparing := n2;
                        i := i - 1;
                end;
        end
        else if (n1.len > n2.len) then
                comparing := n1
        else
                comparing := n2;
end;

function subtraction(n1,n2: bigNum): bigNum;
var
        temp: bigNum;
begin
        temp := comparing(n1, n2);
        if (temp
end;

begin
        n1.len:=3;
        n1.a[1]:=1;
        n1.a[2]:=3;
        n1.a[3]:=9;
        {n1.a[4]:=1;
        n1.a[5]:=2;
        n1.a[6]:=2;
        n1.a[7]:=2;
        n1.a[8]:=2;
        n1.a[9]:=2;
        n1.a[10]:=2;}
        showNum(n1);

        n2.len:=4;
        n2.a[1]:=2;
        n2.a[2]:=2;
        n2.a[3]:=2;
        n2.a[4]:=2;
        {n2.a[5]:=2;
        n2.a[6]:=2;
        n2.a[7]:=2;
        n2.a[8]:=2;
        n2.a[9]:=2;
        n2.a[10]:=2;}
        showNum(n2);
        showNum(comparing(n1, n2));
        readln;
end.
