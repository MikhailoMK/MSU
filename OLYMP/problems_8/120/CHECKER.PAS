uses testlib;

const nmax=100;

var a:array[1..nmax] of integer;
    n,i,j,k,l:integer;

begin
n:=inf.readinteger;
for i:=1 to n do
  a[i]:=inf.readinteger;

k:=0;
for i:=1 to n do
  for j:=i+1 to n do
    if a[i]=a[j] then k:=1;

i:=ouf.readinteger;
j:=ouf.readinteger;
if k=0 then begin
  if (i=0) and (j=0) then quit(_OK,'') else quit(_WA,'');
  end;
if (i<1) or (i>n) or (j<1) or (j>n) then quit(_PE,'');
if i=j then quit(_WA,'Выведено два одинаковых числа');
if a[i]=a[j] then quit(_OK,'') else quit(_WA,'Числа не равные');
end.
