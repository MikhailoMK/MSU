const nmax=100;

var n,m:integer;
    a,b:array[1..nmax] of longint;
    i,j:integer;
    f:boolean;

begin
assign(input,'input.txt');
reset(input);
assign(output,'output.txt');
rewrite(output);
read(n);
for i:=1 to n do read(a[i]);
read(m);
for j:=1 to m do read(b[j]);
for i:=1 to n do begin
  f:=true;
  for j:=1 to m do
    if a[i]=b[j] then f:=false;
  if f then write(a[i],' ');
  end;
close(input);
close(output);
end.
