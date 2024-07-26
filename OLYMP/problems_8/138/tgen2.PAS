var i,n,j,k:longint;
    s:string;
    a:array[1..50] of integer;
begin
for i:=8 to 12 do begin
  a[1]:=random(2)+1;
  for j:=2 to 50 do
    a[j]:=a[j-1]+random(2)+1;
  str(i,s);
  if i<10 then s:='0'+s;
  assign(output,'input'+s+'.txt');
  rewrite(output);
  n:=(random(1000)+1)*100;
  writeln(n);
  for j:=1 to n do
    writeln(a[random(50)+1]);
  close(output);
  end;
end.
