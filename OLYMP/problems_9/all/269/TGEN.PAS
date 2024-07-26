var tnum:integer;
    tt:string;
    n:integer;
    a:array[1..100] of integer;
    q,w,qq,ww:integer;
    i:integer;

begin
for tnum:=2 to 50 do begin
  str(tnum,tt);
  if tnum<10 then tt:='0'+tt;
  assign(output,'input'+tt+'.txt');
  rewrite(output);
  n:=random(100)+1;
  for i:=1 to n do
    a[i]:=random(n)+1;
  q:=random(n)+1;
  w:=random(n)+1;
  writeln(n);
  for i:=1 to n do
    writeln(a[i]);
  write(q,' ',w);
  qq:=a[q];
  ww:=a[w];
  for i:=1 to n do
    if a[i]=qq then a[i]:=ww;
  close(output);
  assign(output,'answer'+tt+'.txt');
  rewrite(output);
  for i:=1 to n do
    writeln(a[i]);
  close(output);
  end;
end.

