uses testlib;
var n:integer;
    a:array[1..100,1..100] of integer;
    b:array[1..100] of integer;
    q,w,qq,ww:integer;
    i,j:integer;

begin
n:=inf.readinteger;
for i:=1 to n do
  for j:=1 to n do
    a[i,j]:=inf.readinteger;
for i:=1 to n do
  b[i]:=inf.readinteger;
q:=ouf.readinteger;
w:=ouf.readinteger;
if (q<1) or (q>n) or (w<1) or (w>n) then quit(_PE,'');
qq:=ans.readinteger;
ww:=ans.readinteger;
if not ((b[q]=0) and (b[w]=1)) then quit(_WA,'');
if a[q,w]=a[qq,ww] then quit(_OK,'');
if a[q,w]<a[qq,ww] then quit(_FAIL,'');
quit(_WA,'');
end.