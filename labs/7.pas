program seventhsLab;
uses calc7lab;
{const
        n=78;
        x=0.5;}
var
        n: integer;
        x: real;

procedure readValFromFile(var n: integer; var x: real; path: string);
var
        t: text;
        temp1,temp2: string;

begin
        assign(t,path);
        while not eof(t) do
                read(t,temp1,temp2);
        val(temp1,n);
        val(temp2,x);
        close(t);
end;

begin
        {writeln(getCalcResAndPrint(n,x):60);}
        readValFromFile(n,x,'lab-7-data.txt');
        writeln(n);
        writeln(x);
        readln();
end.