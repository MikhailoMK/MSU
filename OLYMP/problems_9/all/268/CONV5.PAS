var n:integer;
    m:integer;
    a:array[1..100,1..100] of byte;
    i,j:integer;

begin
assign(input,'input05.txt');
reset(input);
read(n);
for i:=1 to n do
  for j:=1 to n do
    begin
    read(a[i,j]);
    m:=m+a[i,j];
    end;
m:=m div 2;
assign(output,'input052.txt');
rewrite(output);
writeln(n,' ',m);
for i:=1 to n do
  for j:=i+1 to n do
    if a[i,j]=1 then
      writeln(i,' ',j);
close(input);
close(output);
end.