program temp;
{$R-}
uses crt;
type
        letter = record
                counter: integer;
                symbol: char;
        end;
        letters = array['a'..'z'] of letter;

procedure swap(var x, y: letter);
var
        t: letter;
begin
        t := x;
        x := y;
        y := t;
end;


procedure sortArr(var mas: letters);
var
        c, h: char;
begin
        for c := 'a' to 'y' do begin
                for h := 'a' to chr(ord('z') - ord(c) + 97) do
                        {if mas[h].counter > mas[chr(ord(h) + 1)].counter then begin}
                        writeln(mas[h].symbol, ' ', mas[chr(ord(h) + 1)].symbol);
                                {swap(mas[h], mas[chr(ord(h) + 1)]);}
                        {end;}
        writeln('***************');
        readln;
        end;
end;

procedure countLetters(var mas: letters; st: string);
var
        alphabet: set of 'a'..'z';
        ch: char;
        i: integer;
begin
        alphabet := [];
        for ch := 'a' to 'z' do
                alphabet := alphabet + [ch];
        for i := 1 to length(st) do begin
                ch := lowercase(st[i]);
                if (ch in alphabet) then begin
                        {�� ���� �ॡ�� �஢�ન.
                        ��祬�-� �஡�� ��⠥��� ᨬ�����,
                        ����� ��室���� � ��䠢��.}                                          {1}
                        {writeln('Simvol ', ch, ' prisutstvuet v alfavite.');
                        readln;}
                        inc(mas[ch].counter);
                end;
        end;
end;

procedure getLetters(var t1, t2: text);
var
        ch: char;
        poem: letters;
        strTemp: string;
begin
        for ch := 'a' to 'z' do begin
                poem[ch].counter := 0;
                poem[ch].symbol := ch;
        end;

        while not eof(t1) do begin
                readln(t1, strTemp);
                countLetters(poem, strTemp);
        end;

        {��� ��������� �஢�ப.}
        {for ch := 'a' to 'z' do begin
                write(poem[ch].symbol, ' ');
                write(poem[ch].counter, ' ');
                writeln;
        end;
        readln;}

        sortArr(poem);

        {for ch := 'a' to 'z' do begin
                write(poem[ch].symbol, ' ');
                write(poem[ch].counter, ' ');
                writeln;
        end;
        readln;}


        {���� �� �����뢠� � 䠩�, ��⮬� �� �㦭� �������� ���஢��}
        {for ch := 'a' to 'z' do
                writeln(t2, poem[ch].symbol, ': ', poem[ch].counter);}
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