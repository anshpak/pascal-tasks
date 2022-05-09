program shadows;
uses crt;
const
        maxwin = 2;
        maxedges = 4;
type
        winrecord = record
                xl, yl, xr, yr: byte
                end;
        tmw = array[1..maxwin] of winrecord;
        edges = array[1..maxedges] of winrecord;
const
        mw: tmw = ((xl: 10; yl: 5; xr: 100; yr: 20),
                (xl: 18; yl: 7; xr: 108; yr: 22));
        sides: edges = ((xl: 10; yl: 4; xr: 100; yr: 4),
                (xl: 10; yl: 21; xr: 100; yr: 21),
                (xl: 10; yl: 5; xr: 100; yr: 20),
                (xl: 18; yl: 7; xr: 108; yr: 22));
var
        i: integer;
        M: word;
begin
        textBackGround(Yellow);
        clrscr;
        with mw[2] do
                window(xl, yl, xr, yr);
        textBackGround(DarkGray);
        clrscr;
        with mw[1] do
                window(xl, yl, xr, yr);
        textBackGround(LightCyan);
        clrscr;
        with sides[1] do
                window(xl, yl, xr, yr);
        textBackGround(Yellow);
        clrscr;
        textMode(c80);
        for i := 1 to 91 do
                write(#95);
        with mw[1] do
                window(xl, yl, xr, yr);
        textBackGround(LightCyan);
        clrscr;
        gotoXY(1, 16);
        for i := 1 to 91 do
                write(#95);
        gotoXY(1,1);
        readln;
end.

