uses testlib;

const nmax=100;

var n:integer;
    a:array[1..nmax] of integer;
    b,c:integer;
    i:integer;

begin
n:=inf.readinteger;
for i:=1 to n do
  a[i]:=inf.readinteger;
b:=inf.readinteger;
c:=inf.readinteger;

for i:=1 to b-1 do
  if a[i]<>ouf.readinteger then quit(_WA,'');

if ouf.readinteger<>c then quit(_WA,'');

for i:=b to n do
  if a[i]<>ouf.readinteger then quit(_WA,'');
quit(_OK,'');
end.



