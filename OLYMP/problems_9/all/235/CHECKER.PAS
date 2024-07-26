uses testlib;
var s,a:string;

function delsp(s:string):string;
  begin
  while (length(s)>1) and (s[1]=' ') do delete(s,1,1);
  while (length(s)>1) and (s[length(s)]=' ') do delete(s,length(s),1);
  delsp:=s;
  end;

begin
a:=ans.readstring;
s:=ouf.readstring;
if delsp(s)=delsp(a) then quit(_OK,'');
quit(_WA,'Expected: '+a+', found: '+s);
end.