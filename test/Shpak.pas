program kontrolnayaRabota;
{$R-}
uses graph;
type
        titem = integer;
        elements = array [1..1] of titem;
        ptrRow = ^elements;
        rows = array [1..1] of ptrRow;
        matrix = ^rows;

var
        t1, t2: text;
        m, n: byte;     {�᫨ �����⭠�, � n}
        myArr: matrix;
        i, j: byte;
begin
        assign(t1, 'size.txt');
        assign(t2, 'matrix.txt');
        reset(t1);
        reset(t2);
        readln(t1, m);
        readln(t1, n);

        getMem(myArr, m * sizeOf(rows));
        for i := 1 to m do
                getMem(myArr^[i], n * sizeof(elements));



        for i := 1 to m do
                freeMem(myArr^[i], n * sizeof(elements));
        freeMem(myArr, m * sizeOf(rows));

        close(t2);
        close(t1);
        readln;
end.
