uses testlib;

var a,b:longint;
    s1,s2:string;

begin
a:=ans.readlongint;
b:=ouf.readlongint;
str(a,s1);
str(b,s2);
if a=b then quit(_OK,'Answer: '+s1);
quit(_WA,'Output: '+s2+', expected: '+s1);
end.

