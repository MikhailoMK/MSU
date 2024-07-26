const n=15;

var a:array[1..n,1..n] of integer;

    i,j:integer;

begin
assign(output,'4_5.tst');
rewrite(output);
for i:=1 to n do
  for j:=i to n do begin
    a[i,j]:=random(900)+1;
    a[j,i]:=a[i,j];
    if i=j then a[i,i]:=0;
    end;

writeln(n);
for i:=1 to n do begin
  for j:=1 to n do
    write(a[i,j],' ');
  writeln;
  end;
close(output);
end.
