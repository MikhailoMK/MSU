uses testlib;

var s1,s2:string;

    i:integer;


begin
s1:=inf.readstring;
for i:=length(s1) downto 2 do
  if (s1[i]=' ') and (s1[i-1]=' ') then delete(s1,i,1);
s2:=ouf.readstring;
if s1=s2 then quit(_OK,'');
quit(_WA,'');
end.