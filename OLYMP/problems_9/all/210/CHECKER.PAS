uses testlib;

procedure delsp(var s:string);
  begin
  while (s[1]=' ') and (length(s)>1) do delete(s,1,1);
  while (s[length(s)]=' ') and (length(s)>1) do delete(s,length(s),1);
  end;



var n,m:integer;
    i,j,k:integer;
    s,ss:string;
    b1,b2:boolean;

begin
n:=ans.readinteger;
m:=ouf.readinteger;
ans.readstring;
ouf.readstring;
if n<>m then quit(_WA,'Wrong N');
for i:=1 to n do begin
  s:=ans.readstring;
  ss:=ouf.readstring;
  b1:=s=ss;
  delsp(s);
  delsp(ss);
  b2:=s=ss;
  if ((not b1) and b2) then quit(_WA,'Check spaces in output');
  if not b1 then quit(_WA,'Wrong strings');
  end;
quit(_OK,'');
end.


