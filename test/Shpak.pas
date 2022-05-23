program kontrolnayaRabota;
{$R-}
uses crt, graph;
type
        titem = integer;
        elements = array [1..1] of titem;
        ptrRow = ^elements;
        rows = array [1..1] of ptrRow;
        matrix = ^rows;

procedure initArr(var arr: matrix; m, n: byte; var t: text);
var
        i, j: byte;
begin
        for i := 1 to m do
                for j := 1 to n do
                        read(t, arr^[i]^[j]);
end;

procedure showArr(var arr: matrix; m, n: byte);
var
        i, j: byte;
begin
        for i := 1 to m do begin
                for j := 1 to n do
                        write(arr^[i]^[j], ' ');
                writeln;
        end;
end;

var
        t1, t2: text;
        m, n, i, j: byte;     {�᫨ �����⭠�, � n}
        myArr: matrix;
        gd, gm, lxc, lyc, rxc, ryc: integer;
        strTmp1, strTmp2: string;
begin
        clrscr;
        assign(t1, 'size.txt');
        assign(t2, 'matrix.txt');
        reset(t1);
        reset(t2);
        readln(t1, m);
        readln(t1, n);

        getMem(myArr, m * sizeOf(rows));
        for i := 1 to m do
                getMem(myArr^[i], n * sizeof(elements));

        initArr(myArr, m, n, t2);
        showArr(myArr, m, n);

        for i := 1 to m do
                freeMem(myArr^[i], n * sizeof(elements));
        freeMem(myArr, m * sizeOf(rows));
        close(t2);
        close(t1);

        gd := 0;
        str(m, strTmp1);
        str(n, strTmp2);
        initgraph(gd, gm, '');
        setTextStyle(GothicFont, Horizdir, 10);
        setTextJustify(1, 1);
        outTextXY(getMaxX div 2, 100, 'Matrix');
        outTextXY(getMaxX div 2, 200, strTmp1 + ' x ' + strTmp2);

        setTextStyle(1, Horizdir, 4);

        {200 - ��⮬� �� �� �ਬ��� ����� �� ⥪�� ���}
        lxc := getMaxX div 4;
        lyc := ((getMaxY - 300) div 2) + 300;
        rxc := 3 * lxc;
        ryc := lyc;

        setFillStyle(SolidFill, LightGray);
        bar(lxc - 100, lyc - 100, lxc + 100, lyc + 100);
        setViewPort(lxc - 100 , lyc - 100, lxc + 100, lyc + 100, true);
        setviewport(0, 0, getmaxx - 1, getmaxy - 1, true);

        bar(rxc - 100, ryc - 100, rxc + 100, ryc + 100);
        setViewPort(rxc - 100 , ryc - 100, rxc + 100, ryc + 100, true);

        readln;
end.