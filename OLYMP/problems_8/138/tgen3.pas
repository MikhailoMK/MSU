var i,n,j,k:longint;
    s:string;
    a:array[1..50] of integer;
begin
for i:=13 to 13 do begin
  str(i,s);
  if i<10 then s:='0'+s;
  assign(output,'input'+s+'.txt');
  rewrite(output);
  n:=100000;
  writeln(n);
  for j:=1 to n do
    writeln(25);
  close(output);
  end;
end.
