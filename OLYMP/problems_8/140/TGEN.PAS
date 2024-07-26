var i,n,j,k:longint;
    s:string;
begin
for i:=4 to 10 do begin
  str(i,s);
  if i<10 then s:='0'+s;
  assign(output,'input'+s+'.txt');
  rewrite(output);
  n:=(random(100)+1);
  writeln(n);
  for j:=1 to n do
    writeln(random(6*i*i)+1);
  close(output);
  end;
end.
