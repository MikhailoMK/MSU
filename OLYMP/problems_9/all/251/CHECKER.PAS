uses testlib;
const nmax=100;
var n:integer;
    a:array[1..nmax,1..2] of integer;
    max:integer;
    i:integer;
    an:integer;
begin
n:=inf.readinteger;
max:=-1;
for i:=1 to n do begin
  a[i,1]:=inf.readinteger;
  a[i,2]:=inf.readinteger;
  if (a[i,2]=1) and (a[i,1]>max) then max:=a[i,1];
  end;
an:=ouf.readinteger;
if (an=-1) and (max=-1) then quit(_OK,'');
if an=-1 then quit(_WA,'');
if (an<1) or (an>n) then quit(_PE,'');
if (a[an,1]=max) and (a[an,2]=1) then quit(_OK,'');
quit(_WA,'');
end.

