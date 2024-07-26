const n=25;

var i:integer;

begin
assign(output,'5_4.tst');
rewrite(output);
writeln(n);
for i:=1 to n do
  writeln((integer(random(10000))-5000)/10:1:1,' ',(integer(random(10000))-5000)/10:1:1);
close(output);
end.


