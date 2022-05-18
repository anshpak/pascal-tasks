program tenthLab;
uses crt;
const
        maxwin = 3;
type
        symbols = array[1..26] of integer;       {ॣ����}
        winrecord = record
                xl, yl, xr, yr: byte
                end;
        tmw = array[1..maxwin] of winrecord;
const
        alph = 'abcdefghijklmnopqrstuvwxyz';
        win1: tmw = ((xl: 15; yl: 7; xr: 55; yr: 27),
                (xl: 9; yl: 4; xr: 51; yr: 26),
                (xl: 10; yl: 5; xr: 50; yr: 25));
        win2: tmw = ((xl: 75; yl: 7; xr: 115; yr: 27),
                (xl: 69; yl: 4; xr: 111; yr: 26),
                (xl: 70; yl: 5; xr: 110; yr: 25));

procedure getLetters(var t1, t2: text);
var
        letters: symbols;
        ch: char;
        i, p, lastIter: byte;
        temp: integer;
begin
        for i := 1 to 26 do
                letters[i] := 0;

        while not eof(t1) do begin
                read(t1, ch);
                p := pos(ch, alph);
                if p <> 0 then
                        inc(letters[p]);
        end;

        for i := 1 to 26 do
                if letters[i] <> 0 then
                        break;

        temp := letters[i];

        while temp <> 0 do begin
                for i := 1 to 26 do
                        if temp <= letters[i] then begin
                                temp := letters[i];
                                lastIter := i;
                                end;

                {writeln(alph[lastIter], ': ', temp);}
                write(t2, alph[lastIter], ': ', letters[lastIter], #13);

                letters[lastIter] := 0;

                for i := 1 to 26 do
                        if letters[i] <> 0 then
                                break;

                temp := letters[i];
        end;
end;

procedure writeFromFile(var t: text);
var
        i: integer;
        str: string;
begin
        while not eof(t) do begin
                readln(t, str);
                writeln(str);
        end;
end;

var
        t1, t2: text;
        ch: char;

begin
        clrscr;
        assign(t1, 'src\poem.txt');
        assign(t2, 'src\letters.txt');
        reset(t1);
        rewrite(t2);
        getLetters(t1, t2);
        reset(t1);
        reset(t2);

        textBackground(Yellow);
        clrscr;

        {���� ��ࢮ�� ����}
        with win1[1] do
                window(xl, yl, xr, yr);
        textBackground(DarkGray);
        clrscr;

        {������� ��ࢮ�� ����}
        with win1[2] do
                window(xl, yl, xr, yr);
        textBackground(White);
        clrscr;

        {��ࢮ� ����}
        with win1[3] do
                window(xl, yl, xr, yr);
        textBackground(5);
        clrscr;

        textBackGround(5);
        textColor(0);
        writeFromFile(t1);

        {���� ��ண� ����}
        with win2[1] do
                window(xl, yl, xr, yr);
        textBackground(DarkGray);
        clrscr;

        {������� ��ண� ����}
        with win2[2] do
                window(xl, yl, xr, yr);
        textBackground(White);
        clrscr;

        {��஥ ����}
        with win2[3] do
                window(xl, yl, xr, yr);
        textBackground(5);
        clrscr;

        textBackGround(5);
        textColor(0);
        writeFromFile(t2);

        close(t2);
        close(t1);
        readln;
end.
