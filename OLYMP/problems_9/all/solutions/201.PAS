var n,i,a,b:integer;

begin
assign(input,'input.txt');
reset(input);
assign(output,'output.txt');
rewrite(output);
read(n);
read(a);
for i:=2 to n do
  begin
  read(b);
  if b<a then a:=b;
  end;
writeln(a);
close(input);
close(output);
end.
