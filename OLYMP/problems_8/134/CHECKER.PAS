uses testlib;

const nmax=100;

var a:array[1..nmax] of integer;
    n,k,i,q,w,e:integer;

function itoa(q:longint):string;
var s:string;
begin
str(q,s);
itoa:=s;
end;


begin
n:=inf.readinteger;
for i:=1 to n do
  a[i]:=i;
k:=inf.readinteger;
for i:=1 to k do begin
  q:=inf.readinteger;
  w:=inf.readinteger;
  e:=a[q];
  a[q]:=a[w];
  a[w]:=e;
  end;
for i:=1 to n do
  if a[i]<>ouf.readinteger then quit(_WA,'Неверное число на месте '+itoa(i));
quit(_OK,'');
end.