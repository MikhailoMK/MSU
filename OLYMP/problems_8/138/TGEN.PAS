var i,n,j,k:longint;
    s:string;
begin
for i:=4 to 7 do begin
  str(i,s);
  if i<10 then s:='0'+s;
  assign(output,'input'+s+'.txt');
  rewrite(output);
  n:=(random(1000)+1)*100;
  writeln(n);
  for j:=1 to n do
    writeln(random(100)+1);
  close(output);
  end;
end.
