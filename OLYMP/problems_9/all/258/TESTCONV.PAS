const nmax=100;
var a:array[1..nmax,1..nmax] of integer;
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
    if a[i,j]=-1 then a[i,j]:=100;
    end;
writeln(n);
for i:=1 to n do begin
  for j:=1 to n do
    write(a[i,j],' ');
  writeln;
  end;
close(input);
close(output);
end.
