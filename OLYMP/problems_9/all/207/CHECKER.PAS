uses testlib;

var s1,s2:string;

procedure delsp(var s:string);
  begin
  while (s[1]=' ') and (length(s)>1) do delete(s,1,1);
  while (s[length(s)]=' ') and (length(s)>1) do delete(s,length(s),1);
  end;

begin
s1:=ouf.readstring;
s2:=ans.readstring;
delsp(s1);
delsp(s2);
if s1=s2 then quit(_OK,'');
quit(_WA,'');
end.