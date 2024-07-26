uses testlib;
const nmax=100;

var a:array[1..nmax] of longint;
    n:integer;
    x:longint;
    i:integer;
    b,c:integer;

begin
n:=inf.readinteger;
for i:=1 to n do
  a[i]:=inf.readinteger;
x:=inf.readinteger;
b:=ans.readinteger;
c:=ouf.readinteger;
if (c<1) or (c>n) then quit(_PE,'Wrong number in output');
if abs(x-a[b])<abs(x-a[c]) then quit(_WA,'Answer is not optimal');
if abs(x-a[b])=abs(x-a[c]) then quit(_OK,'');
quit(_Fail,'Unexpected error or error in jury solution');
end.


