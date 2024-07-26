var i,n,j,k:integer;
    s:string;
begin
for i:=3 to 50 do begin
  str(i,s);
  if i<10 then s:='0'+s;
  assign(output,'input'+s+'.txt');
  rewrite(output);
  n:=random(100)+1;
  writeln(n);
  for j:=1 to n do
    writeln(random(24),' ',random(60),' ',random(60));
  close(output);
  end;
end.
