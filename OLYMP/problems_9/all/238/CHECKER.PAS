uses testlib;

var a,b:longint;

begin
a:=ans.readlongint;
b:=ouf.readlongint;

if a=b then quit(_ok,'')
else quit(_WA,'');

end.
