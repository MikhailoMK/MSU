uses testlib;

const nmax=6;

var n:integer;
    a:array[1..nmax,1..nmax] of byte;
    b:array[1..nmax] of longint;
    i,j:integer;

procedure swap(var a,b:longint);
  var c:longint;
  begin
  c:=a;
  a:=b;
  b:=c;
  end;

function nod(a,b:longint):longint;
  begin
  if a<b then swap(a,b);
  while a mod b<>0 do begin
    a:=a mod b;
    swap(a,b);
    end;
  nod:=b;
  end;

begin
n:=inf.readinteger;
for i:=1 to n do
  for j:=1 to n do
    a[i,j]:=inf.readinteger;
for i:=1 to n do begin
  b[i]:=ouf.readlongint;
  if b[i]<1 then quit(_PE,'Number must be positive');
  end;
for i:=1 to n do
  for j:=1 to n do
    if i<>j then begin
      if a[i,j]=1 then
        if nod(b[i],b[j])<2 then quit(_WA,'NOD=1 when must be more 1');
      if a[i,j]=0 then
        if nod(b[i],b[j])<>1 then quit(_WA,'NOD<>1 when must be 1');
      end;
quit(_OK,'');
end.



