uses testlib;
var a,s:string;
    i:integer;

begin
for i:=1 to 26 do begin
  s:=ouf.readstring;
  a:=ans.readstring;
  if s<>a then begin
    if copy(s,1,4)<>copy(a,1,4) then quit(_PE,'') else quit(_WA,'');
    end;
  end;
quit(_OK,'');
end.