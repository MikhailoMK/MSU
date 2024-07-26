uses testlib;

function trim(s:string):string;
var  i:integer;
begin
while (s[1]=' ') and (length(s)>1) do delete(s,1,1);
while (s[length(s)]=' ') and (length(s)>1) do delete(s,length(s),1);
for i:=1 to length(s) do s[i]:=upcase(s[i]);
trim:=s;
end;


begin
  if trim(ans.readstring) <> trim(ouf.readstring) then
    quit(_wa,'')
  else
    quit(_ok,'');
end.