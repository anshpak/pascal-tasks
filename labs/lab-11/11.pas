program eleventhLab;
uses crt;
type
        sType = string[30];
        tour = record
                country: sType; {��࠭�}
                city: sType; {��த}
                residence: sType; {���� �஦������ (�⥫� ��� ��� ����)}
                class: sType; {��ࠪ�� ��� (�������᪨�, ����஢�⥫�� � �. �.)}
                price: word; {����}
                vacancies: byte; {������⢮ ᢮������ ����}
        end;
        fTour = file of tour;

procedure showMenu;
begin
        writeln('Vibirite optsiy:');
        writeln('1 - Prochitat tekstoviy file');
        writeln('2 - Prochitat tipizirovanyi file');
        writeln('3 - Dobavit tour');
        writeln('4 - Redaktirovat tour');
        writeln('Nazhmite klavishu ESC shtoby zaconchit rabotu...');
end;

procedure showBack;
begin
        writeln('*********************************************');
        writeln('Nazhmite klavishu 0, shtoby vernytsya v menu');
        writeln('Nazhmite klavishu ESC shtoby zaconchit rabotu...');
end;

procedure showTour(var myTour: tour);
begin
        write(myTour.country, '. ');
        write(myTour.city, '. ');
        write(myTour.residence, '. ');
        write(myTour.class, '. ');
        write(myTour.price, '. ');
        write(myTour.vacancies, '.', #10#13);
end;

procedure showTextFile(var t: text);
var
        myTour: tour;
        i: byte;
begin
        while not eof(t) do begin
                readln(t, myTour.country);
                readln(t, myTour.city);
                readln(t, myTour.residence);
                readln(t, myTour.class);
                readln(t, myTour.price);
                readln(t, myTour.vacancies);
                showTour(myTour);
        end;
end;

procedure showTypeFile(var f: fTour);
var
        myTour: tour;
begin
        while not eof(f) do begin
                read(f, myTour);
                showTour(myTour);
        end;
end;

procedure fillTypeFile(var t: text; var f: fTour);
var
        myTour: tour;
begin
        while not eof(t) do begin
                readln(t, myTour.country);
                readln(t, myTour.city);
                readln(t, myTour.residence);
                readln(t, myTour.class);
                readln(t, myTour.price);
                readln(t, myTour.vacancies);
                write(f, myTour);
        end;
end;

procedure addTour(var f: fTour; country, city, residence, class: sType; price: word; vacancies: byte);
var
        myTour: tour;
begin
        myTour.country := country;
        myTour.city := city;
        myTour.residence := residence;
        myTour.class := class;
        myTour.price := price;
        myTour.vacancies := vacancies;
        write(f, myTour);
end;

procedure editTour(var f: fTour);
var
        n: byte;
        myTour, tempTour: tour;
        fTemp: fTour;
begin
        assign(fTemp, 'temp.dat');
        rewrite(fTemp);
        writeln('Enter the number of tour: ');
        readln(n);
        writeln('Enter the country of a tour:');
        readln(myTour.country);
        writeln('Enter the city of a tour:');
        readln(myTour.city);
        writeln('Enter the residence of a tour:');
        readln(myTour.residence);
        writeln('Enter the type of a tour:');
        readln(myTour.class);
        writeln('Enter the price of a tour:');
        readln(myTour.price);
        writeln('Enter the number of vacancies of a tour:');
        readln(myTour.vacancies);
        while not eof(f) do begin
                if filePos(f) <> n - 1  then begin
                        read(f, tempTour);
                        write(fTemp, tempTour);
                end
                else begin
                        write(fTemp, myTour);
                        seek(f, filePos(f) + 1);
                end;
        end;

        writeln('Im here');
        showTypeFile(fTemp);
        readln;

        seek(f, 0);
        truncate(f);
        while not eof(fTemp) do begin
                read(fTemp, tempTour);
                write(f, tempTour);
        end;
        close(fTemp);
end;

var
        t: text;
        f: fTour;
        ch: char;
        country, city, residence, class, change: sType;
        price: word;
        vacancies, variant, changeNum: byte;

begin
        {�����:}
        {����� �������᪨� ����.
        ����� ���� ����.
        ����� �� ᠬ�� ��ண�� ���.
        ����� �� ᠬ�� ��襢�� ���.}
        clrscr;
        assign(t, 'tour-agency.txt');
        assign(f, 'tour-agency.dat');
        reset(t);
        rewrite(f);
        fillTypeFile(t, f);
        showMenu;
        repeat
                ch := readkey;
                case ch of
                        #49: begin
                                reset(t);
                                clrscr;
                                showTextFile(t);
                                showBack;
                        end;
                        #50: begin
                                seek(f, 0);
                                clrscr;
                                showTypeFile(f);
                                showBack;
                        end;
                        #51: begin
                                clrscr;
                                writeln('Enter the country of a tour:');
                                readln(country);
                                writeln('Enter the city of a tour:');
                                readln(city);
                                writeln('Enter the residence of a tour:');
                                readln(residence);
                                writeln('Enter the type of a tour:');
                                readln(class);
                                writeln('Enter the price of a tour:');
                                readln(price);
                                writeln('Enter the number of vacancies of a tour:');
                                readln(vacancies);
                                seek(f, fileSize(f));
                                addTour(f, country, city, residence, class, price, vacancies);
                                showBack;
                        end;
                        #52: begin
                                clrscr;
                                writeln('Shto budete izmenyat?');
                                writeln('1 - country');
                                writeln('2 - city');
                                writeln('3 - residence');
                                writeln('4 - type');
                                writeln('5 - price');
                                writeln('6 - vacancies');
                                case variant of
                                        1: begin
                                                clrscr;
                                                writeln('Vvedite country:');
                                                readln(change);
                                                changeNum := 1;
                                        end;
                                        2: begin
                                                clrscr;
                                                writeln('Vvedite city:');
                                                readln(change);
                                                changeNum := 2;
                                        end;
                                        3: begin
                                                clrscr;
                                                writeln('Vvedite residence:');
                                                readln(change);
                                                changeNum := 3;
                                        end;
                                        4: begin
                                                clrscr;
                                                writeln('Vvedite type:');
                                                readln(change);
                                                changeNum := 4;
                                        end;
                                        5: begin
                                                clrscr;
                                                writeln('Vvedite price:');
                                                readln(change);
                                                changeNum := 5;
                                        end;
                                        6: begin
                                                clrscr;
                                                writeln('Vvedite vacncies:');
                                                readln(change);
                                                changeNum := 6;
                                        end;
                                end;
                                seek(f, 0);
                                editTour(f, change, changeNum);
                                showBack;
                        end;
                        #48: begin
                                clrscr;
                                showMenu;
                        end;
                end;
        until ch = #27;
        close(t);
end.
