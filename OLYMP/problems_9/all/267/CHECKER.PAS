uses testlib;
var s,a:string;

procedure ppp(var s:string);
  var i:integer;
  begin
  while (s[1]=' ') and (length(s)>1) do delete(s,1,1);
  while (s[length(s)]=' ') and (length(s)>1) do delete(s,length(s),1);
  for i:=1 to length(s) do
    s[i]:=upcase(s[i]);
  end;



begin
s:=ouf.readstring;
a:=ans.readstring;
ppp(s);
ppp(a);
if a=s then quit(_OK,'');
if (s='NO') or (s='YES') then quit(_WA,'');
quit(_PE,'Выведена какая-то ерунда');
end.

