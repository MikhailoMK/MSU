uses testlib;
 
var a,b:longint;

begin
a:=ans.readlongint;
b:=ouf.readlongint;
if a<>b then quit(_WA,'');
quit(_OK,'');
end.
