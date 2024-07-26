uses testlib;
var i,n:integer;
begin
n:=inf.readinteger;
for i:=1 to n do
  if ans.readinteger<>ouf.readinteger then quit(_WA,'');
quit(_ok,'');
end.
