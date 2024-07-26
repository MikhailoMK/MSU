uses testlib;

const nmax=100;
var n:integer;

var a:array[1..nmax] of integer;
    i:integer; 

begin
n:=inf.readinteger;
for i:=1 to n do a[i]:=inf.readinteger;
for i:=n downto 1 do
  if a[i]<>ouf.readinteger then quit(_WA,'');
quit(_OK,'');
end.