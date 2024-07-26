uses testlib;

var s,s1:string;

procedure delspaces(var q:string);
  begin
  while (length(q)>0) and (q[1]=' ') do dec(q[0]);
  end;

begin
while not ans.eof do begin
  s:=ans.readstring;
  s1:=ouf.readstring;
  delspaces(s);
  delspaces(s1);
  if s<>s1 then quit(_WA,'');
  end;
quit(_OK,'');
end.