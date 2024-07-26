uses testlib;

const nmax=100;

var i,j:integer;
    a:array[1..nmax] of integer;
    n:integer;
    ans:integer;
    o:integer;
    s1,s2:string;

begin
ans:=0;
n:=inf.readinteger;
for i:=1 to n do begin
  a[i]:=inf.readinteger;
  for j:=1 to i-1 do
    if a[i]=a[j] then inc(ans);
  end;
o:=ouf.readinteger;
str(o,s1);
str(ans,s2);
if ans<>o then quit(_WA,'Выведено: '+s1+', должно быть: '+s2);
quit(_OK,'Ответ: '+s1);
end.

