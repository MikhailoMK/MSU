uses testlib;
const nmax=100;
var a:array[1..nmax,1..nmax] of byte;
    b:array[1..nmax] of byte;
    n,m:integer;
    i,j,k,l:integer;

begin
fillchar(a,sizeof(a),0);
n:=inf.readinteger;
m:=inf.readinteger;
for i:=1 to m do begin
  k:=inf.readinteger;
  l:=inf.readinteger;
  if (a[k,l]=1) or (k=l) then quit(_Fail,'Botva in input');
  a[k,l]:=1;
  a[l,k]:=1;
  end;
for i:=1 to n do
  b[i]:=i;
for i:=1 to n-1 do begin
  k:=ouf.readinteger;
  l:=ouf.readinteger;
  if a[k,l]=0 then quit(_WA,'В дереве есть ребро, которого не было в исходном графе');
  if b[k]=b[l] then quit(_WA,'В дереве есть циклы');
  l:=b[l];
  for j:=1 to n do
    if b[j]=l then b[j]:=b[k];
  end;
quit(_ok,'');
end.