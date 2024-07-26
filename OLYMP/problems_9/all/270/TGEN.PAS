var tnum:integer;
    tt:string;
    n:integer;
    a:array[1..100,1..100] of integer;
    b:array[1..100] of integer;
    i,j,q,w,qq,ww:integer;


begin
for tnum:=2 to 50 do begin
  str(tnum,tt);
  if tnum<10 then tt:='0'+tt;
  assign(output,'input'+tt+'.txt');
  rewrite(output);

  n:=random(99)+2;
  for i:=1 to n do
    for j:=i+1 to n do
      begin
      a[i,j]:=random(1000)+1;
      a[j,i]:=a[i,j];
      end;

  qq:=random(n-1)+1;
  fillchar(b,sizeof(b),0);
  for q:=1 to qq do
    b[random(n)+1]:=1;

  writeln(n);
  for i:=1 to n do begin
    for j:=1 to n do
      write(a[i,j],' ');
    writeln;
    end;
  for i:=1 to n do
    write(b[i],' ');
  close(output);
  assign(output,'answer'+tt+'.txt');
  rewrite(output);
  qq:=1000;
  for i:=1 to n do
    for j:=1 to n do
      if (b[i]=0) and (b[j]=1) and (a[i,j]<qq) then begin
        qq:=a[i,j];
        q:=i;
        w:=j;
        end;
  writeln(q,' ',w);
  close(output);
  end;
end.


