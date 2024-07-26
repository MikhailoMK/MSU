{$A+,B-,D+,E+,F-,G-,I+,L+,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
USES TestLib;

const nmax=100;

var a:array[1..nmax,1..nmax] of longint;
    n,m:integer;
    i,j:integer;
    s,ss:longint;
    o:integer;

BEGIN
n:=inf.readinteger;
m:=inf.readinteger;
for i:=1 to n do
  for j:=1 to m do a[i,j]:=inf.readinteger;
o:=ouf.readinteger;
ss:=0;
for j:=1 to m do ss:=ss+a[o,j];

for i:=1 to n do begin
  s:=0;
  for j:=1 to m do
    s:=s+a[i,j];
  if s>ss then quit(_wa,'');
  end;
quit(_ok,'');
end.






END.