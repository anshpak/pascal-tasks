program writeToFile;
const
        n = 100;
        x = 55;
var
        f: file of integer;
        len, i, a: integer;
begin
        Randomize;
        Assign(f, 'rndm_num.dat');
        rewrite(f);
        for i := 1 to n do
        begin
                a:=random(200);
                write(f, a);
                if a = x then
                        break;
        end;
        len:=filesize(f);
        writeln(len);
        readln;
        seek(f, 0);
        while not eof(f) do
        begin
                read(f, a);
                write(a:5);
        end;
        readln;
        close(f);
end.