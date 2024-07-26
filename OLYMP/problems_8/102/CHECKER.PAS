{$A+,B-,D+,E+,F-,G-,I+,L+,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
{III открытая командная олимипиада по информатике.
Проверяющая программа для задачи Y tytorial тура 
(c) Матюхин В.А.
26 октября 2000}

uses testlib;


var s1,s2:string;
    i:integer;

begin
s1:=ans.readstring;
s2:=ouf.readstring;
for i:=length(s1) downto 1 do begin
  s1[i]:=upcase(s1[i]);
  if s1[i]=' ' then delete(s1,i,1);
  end;
for i:=length(s2) downto 1 do begin
  s2[i]:=upcase(s2[i]);
  if s2[i]=' ' then delete(s2,i,1);
  end;

if s1<>s2 then quit(_wa,'');
quit(_ok,'');
end.
