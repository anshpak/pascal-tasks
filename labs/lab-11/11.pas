program eleventhLab;
uses crt;
type
        tour = record
                country: string[30]; {��࠭�}
                city: string[30]; {��த}
                residence: string[30]; {���� �஦������ (�⥫� ��� ��� ����)}
                class: string[30]; {��ࠪ�� ��� (�������᪨�, ����஢�⥫�� � �. �.)}
                price: word; {����}
                vacancies: byte; {������⢮ ᢮������ ����}
        end;

var
        t: text;
begin
        {�����:}
        {����� �������᪨� ����.
        ����� ���� ����.
        ����� �� ᠬ�� ��ண�� ���.
        ����� �� ᠬ�� ��襢�� ���.}
        clrscr;
        assign(t, 'tour-agency.txt');
        close(t);
        readln;
end.