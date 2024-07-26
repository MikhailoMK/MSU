uses testlib;

const nmax=100;

var a,b:array[1..nmax] of integer;
    n,i,j,jj,jjj:integer;

begin
n:=inf.readinteger;
j:=0;
for i:=1 to n do begin
  a[i]:=inf.readinteger;
  b[i]:=ouf.readinteger;
  end;
jjj:=1;
jj:=1;
for i:=2 to n do begin
  if a[i]<>b[i] then begin
    inc(j);
    jj:=i;
    end;
  if a[i]<a[jjj] then jjj:=i;
  end;

if j>1 then quit(_WA,'Изменилось слишком много элементов');
if (b[1]=a[jjj]) and (b[jj]=a[1]) then quit(_OK,'');
quit(_WA,'');
end.
