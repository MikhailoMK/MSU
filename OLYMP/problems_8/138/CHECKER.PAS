uses testlib;

var i,j:longint;
    n:longint;
    a:array[1..100] of longint;

begin
n:=inf.readlongint;
for i:=1 to n do begin
  j:=inf.readinteger;
  inc(a[j]);
  end;

for i:=1 to 100 do
  for j:=1 to a[i] do
    if ouf.readinteger<>i then quit(_WA,'');
quit(_OK,'');
end.
