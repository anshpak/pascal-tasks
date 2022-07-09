program secondLab;

var
	x, y: real;
    i, allHits, trueHits: integer;
    hit, centerHit: boolean;

function getHitResult(x, y:real):boolean;
var
	isHitTrue1, isHitTrue2: boolean;

begin

	isHitTrue1 := (((x >= -2) and (x <= 1)) and ((y >= -1/3*x-2/3) and (y <= 1/3*x+2/3)));
	isHitTrue2 := (((x >= 1) and (x <= 2)) and ((y >= -sqrt(1-(x-1)*(x-1))) and (y <= sqrt(1-(x-1)*(x-1)))));
	getHitResult := isHitTrue1 or isHitTrue2;
end;

function getCenterResult(x, y:real):boolean;
  begin
	getCenterResult := ((x = 0) and (y = 0));
  end;

procedure printTableHead;
begin
	writeln('���������������������������������������������Ŀ':70);
        writeln('�      x      �      y      �    �������    �':70);
	writeln('���������������������������������������������Ĵ':70);
end;

procedure printTableMiddle(x, y:real; hit, centerHit: boolean);
begin
	if centerHit then
		writeln('�  ':26, x:5:1, '      �    ':10, y:5:2, '    �':4,'    � �窮!   �')
	else if hit then
		writeln('�  ':26, x:5:1, '      �    ':10, y:5:2, '    �':4,'      �����!     �')
	else
		writeln('�  ':26, x:5:1, '      �    ':10, y:5:2, '    �':4,'      ����!      �');
end;

procedure printTableFooter;
begin
	writeln('�����������������������������������������������':70);
end;

begin
	trueHits:=0;
	randomize;
	printTableHead;
	allHits:=random(50);
	for i := 1 to allHits do
	begin
		x := random(5);
        y := random(5);
		{getHitResult(x,y);}
		centerHit:=getCenterResult(x,y);
		hit:=getHitResult(x,y);
		printTableMiddle(x,y,hit,centerHit);
		if hit then
        begin
			inc(trueHits);
			if centerHit then
				break;
        end;
	end;
	allHits:=i;
	printTableFooter;
	writeln('�ᥣ� ����५��: ':40, allHits);
	writeln('������⢮ ���������: ':45, trueHits);
	writeln('������⢮ �஬�客: ':44, (allHits - trueHits));
	writeln('��業� ���������: ':42, ((trueHits / allHits)*100):4:2, '%');
	readln;
end.