uses testlib;

const nmax=100;

var n:integer;
    a,q:array[1..nmax] of integer;
    b:integer;
    i:integer;

begin
n:=inf.readinteger;
for i:=1 to n do
  a[i]:=inf.readinteger;
b:=inf.readinteger;

for i:=1 to b-1 do
  if a[i]<>ouf.readinteger then quit(_WA,'');
for i:=b+1 to n do
  if a[i]<>ouf.readinteger then quit(_WA,'');
quit(_OK,'');
end.



