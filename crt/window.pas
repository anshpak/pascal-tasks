uses crt;
var x1,y1,x2,y2,x,y,w,h,i:byte;
begin
textbackground(0);{???????? ??? ??????}
clrscr;
x1:=10;y1:=4;{?????????? ???????? ????}
x2:=70;y2:=20;
w:=42;h:=10;{?????? ? ?????? ?????}
window(x1,y1,x2,y2);{?????? ??????? ????}
textbackground(2);
clrscr;
window(x1+10,y1+4,x2-10,y2-4);{??????? ????}
textbackground(5);
clrscr;
window(x1,y1,x2,y2);{????????? ? ???????}
textbackground(2);{??? ???????? ????}
textcolor(14);{???? ?????}
gotoXY(x1,y1);{?????? ??????? ????? ????????? ?????????????}
write(#201);
for i:=1 to w-1 do write('*');
write(#187);
for i:=1 to h-1 do
 begin
  gotoXY(x1,y1+i);write('*');
  gotoXY(x1+w,y1+i);write('*');
 end;
gotoXY(x1,y1+h);write('*');
for i:=1 to w-1 do write('*');
write(#188);
readln
end.

