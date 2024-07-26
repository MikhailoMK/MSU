uses testlib;

const nmax=100;

var a:array[1..nmax] of integer;
    b:array[1..nmax] of byte;
    n:integer;
    i,j,k,l:integer;

begin
n:=inf.readinteger;
for i:=1 to n do begin
  a[i]:=inf.readinteger;
  b[i]:=0;
  end;
j:=ouf.readinteger;
if (j<1) or (j>n) then quit(_PE,'Wrong number of participant');
b[j]:=1;
k:=j;
for i:=2 to n do begin
  j:=ouf.readinteger;
  if (j<1) or (j>n) then quit(_PE,'Wrong number of participant');
  if b[j]<>0 then quit(_WA,'One participant printed more then once');
  if a[k]<a[j] then quit(_WA,'Wrong order');
  b[j]:=1;
  k:=j;
  end;
quit(_OK,'');
end.

