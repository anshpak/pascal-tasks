program temp;
uses crt;
type
        letter = record
                counter: integer;
                symbol: char;
        end;

procedure getLetters(var t1, t2: text);
var
        poemAlph: array['a'..'z'] of letter;
        ch: char;
        strTemp: string;
begin
        for ch := 'a' to 'z' do begin
                poemAlph[ch].counter := 0;
                poemAlph[ch].symbol := ch;
        end;
        read(t1, strTemp);
        writeln(strTemp);

        readln;
        for ch := 'a' to 'z' do begin
                write(poemAlph[ch].counter, ' ');
                write(poemAlph[ch].symbol, ' ');
        end;
end;


var
        t1, t2: text;
begin
        clrscr;
        assign(t1, 'src\poem.txt');
        assign(t2, 'src\letters.txt');
        reset(t1);
        rewrite(t2);
        getLetters(t1, t2);
        close(t2);
        close(t1);
        readln;
end.
