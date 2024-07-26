uses testlib;


var n,m:integer;
    i,j,k:integer;
    s,ss:string;
begin
n:=inf.readinteger;
m:=ouf.readinteger;
if n<>m then quit(_WA,'Wrong N');
for i:=1 to n do begin
  j:=inf.readinteger;
  k:=ouf.readinteger;
  if j+1<>k then quit(_WA,'Wrong number');
  s:=inf.readstring;
  ss:=ouf.readstring;
  if s<>ss then quit(_WA,'Wrong string');
  end;
quit(_OK,'');
end.


