uses testlib;

const nmax=100;
var n:integer;

var a,b:array[1..nmax] of integer;
    i:integer;
    j:integer;

begin
n:=inf.readinteger;
for i:=1 to n do a[i]:=inf.readinteger;
j:=0;
for i:=1 to n do
  if i mod 2 = 1 then begin
    inc(j);
    b[j]:=a[i];
    end;
for i:=1 to n do
  if i mod 2 = 0 then begin
    inc(j);
    b[j]:=a[i];
    end;

for i:=1 to n do if b[i]<>ouf.readinteger then quit(_WA,'');
quit(_ok,'');
end.