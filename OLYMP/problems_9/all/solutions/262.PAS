const nmax=100;
      mmax=10000;
      inf=30000;
      inf2=inf div 2;

var a:array[1..mmax,1..3] of integer;
    b:array[1..nmax] of integer;
    i,j:integer;
    n,m:integer;


begin
assign(input,'input.txt');
reset(input);
assign(output,'output.txt');
rewrite(output);
read(n);
read(m);
for i:=1 to m do
  for j:=1 to 3 do
    read(a[i,j]);
for i:=1 to n do
  b[i]:=inf;
b[1]:=0;
for i:=1 to n do
  for j:=1 to m do
    if b[a[j,2]]>b[a[j,1]]+a[j,3] then
        b[a[j,2]]:=b[a[j,1]]+a[j,3];

for i:=1 to n do
  if b[i]>inf2 then write(30000,' ')
  else write(b[i],' ');

close(input);
close(output);
end.