(* Летние сборы по информатике. 27 июня 1999 *)
(* Задача 1 "Сжатие текста".                 *)
(* Проверяющая программа Виктора Матюхина    *)

{$A+,B-,D+,E+,F-,G-,I-,L+,N+,O-,P-,Q+,R+,S+,T-,V+,X+,Y+}
{$M 65520,0,655360}

uses testlib;

type ttt='A'..'z';

var p:array[ttt] of string;
    n:integer;

procedure init;
  var r:integer;
      i:integer;
      c:char;
      s1,s2:string;
  begin
  fillchar(p,sizeof(p),0);
  r:=inf.readinteger;
  n:=inf.readinteger;
  inf.readstring;
  for i:=1 to r do begin
    s1:=inf.readstring;
    s2:=inf.readstring;
    p[s2[1]]:=s1;
    end;
  end;

procedure work;
  var s1,s2:string;
      i,j:integer;
      ss:string;
  begin
  for i:=1 to n do begin
    str(i,ss);
    ss:='Строка '+ss+': ';
    s1:=ouf.readstring;
    s2:=ans.readstring;
    if length(s2)<length(s1) then quit(_wa,ss+'длина строки больше, чем у жюри');
    if length(s1)<length(s2) then quit(_wa,ss+'длина строки меньше, чем у жюри');
    s2:='';
    for j:=1 to length(s1) do
      if s1[j] in ['a'..'z','A'..'Z'] then s2:=s2+p[s1[j]]
      else s2:=s2+s1[j];
    s1:=inf.readstring;
    if s2<>s1 then quit(_wa,ss+'расшифрованная строка не идентична исходной');
    end;
  end;






begin
init;
work;
quit(_ok,'');
end.
