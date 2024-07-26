const n=10;

var i:integer;

begin
assign(output,'input06.txt');
rewrite(output);
writeln(n);
for i:=1 to n do
  write(random(7),' ');
close(output);
end.

