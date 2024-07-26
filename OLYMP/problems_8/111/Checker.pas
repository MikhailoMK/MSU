{$A+,B-,D+,E+,F-,G-,I+,L+,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
{III открытая командная олимипиада по информатике.
Проверяющая программа для задачи Y tytorial тура 
(c) Матюхин В.А.
26 октября 2000}

uses testlib;


var an,ou:longint;

begin
an:=ans.readlongint;
ou:=ouf.readlongint;

if an<>ou then quit(_wa,'');
quit(_ok,'');
end.
