const test='input05.txt';
const n=9;

var a:array[1..n,1..n] of integer;
    i,j:integer;

begin
randomize;
assign(output,test);
rewrite(output);
writeln(n);
for i:=1 to n do
  for j:=i+1 to n do begin
    a[i,j]:=random(5);
    a[j,i]:=a[i,j];
    end;
for i:=1 to n do begin
  for j:=1 to n do
    write(a[i,j],' ');
  writeln;
  end;
close(output);
end.
