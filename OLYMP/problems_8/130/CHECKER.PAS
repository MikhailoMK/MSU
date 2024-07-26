uses testlib;

const nmax=100;

var n:integer;
    t:integer;
    a:array[1..nmax] of integer;
    b:integer;
    i,j,g:integer;

begin
n:=inf.readinteger;
t:=inf.readinteger;
for i:=1 to n do
  a[i]:=i;
t:=t mod n;
for i:=1 to t do begin
  g:=a[n];
  for j:=n downto 2 do
    a[j]:=a[j-1];
  a[1]:=g;
  end;

for i:= 1 to n do
  if ouf.readinteger<>a[i] then quit(_WA,'');
quit(_OK,'');
end.



