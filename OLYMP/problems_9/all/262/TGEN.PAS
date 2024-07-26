var i,j:integer;
    n,m,mm:integer;
    s:string;
    f:text;

begin
assign(f,'genans.bat');
rewrite(f);

for i:=3 to 50 do begin
  str(i,s);
  if i<10 then s:='0'+s;
  assign(output,'input'+s+'.txt');
  rewrite(output);
  n:=random(100)+1;
  mm:=random(3);
  case mm of
     0:m:=random(10000);
     1:m:=random(n);
     2:m:=random(4*n);
  end;
  writeln(n);
  writeln(m);
  for j:=1 to m do
    writeln(random(n)+1,' ',random(n)+1,' ',random(101));
  close(output);
  writeln(f,'del output.txt');
  writeln(f,'copy input',s,'.txt input.txt');
  writeln(f,'solution.exe');
  writeln(f,'copy output.txt answer',s,'.txt');

  end;
close(f);
end.