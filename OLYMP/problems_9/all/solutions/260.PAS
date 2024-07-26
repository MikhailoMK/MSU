type integer=longint;

const nmax=50;
      inf=maxlongint div 2;
var a,b:array[1..nmax,1..nmax] of integer;
    n:integer;
    i,j,k:integer;

begin
assign(input,'input.txt');
reset(input);
assign(output,'output.txt');
rewrite(output);
read(n);
for i:=1 to n do
  for j:=1 to n do begin
    read(a[i,j]);
    if (a[i,j]=0) and (i<>j) then a[i,j]:=inf;
    if (i=j) and (a[i,i]>0) then a[i,i]:=0;
    end;


for k:=1 to n do
  for i:=1 to n do
    for j:=1 to n do begin
      if a[i,k]+a[k,j]<a[i,j] then a[i,j]:=a[i,k]+a[k,j];
      if a[i,j]>inf div 2 then a[i,j]:=inf;
      end;

for i:=1 to n do
  for j:=1 to n do
    if a[i,j]=inf then b[i,j]:=0 else begin
      b[i,j]:=1;
      for k:=1 to n do
        if (a[i,k]<inf) and (a[k,j]<inf) and (a[k,k]<0) then b[i,j]:=2;
      end;
for i:=1 to n do begin
  for j:=1 to n do
    write(b[i,j],' ');
  writeln;
  end;
close(input);
close(output);
end.
