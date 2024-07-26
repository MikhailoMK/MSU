const n=50;

var i:integer;

begin
assign(output,'5_6.tst');
rewrite(output);
writeln(n);
for i:=1 to n do
  writeln((integer(random(100))-5000)/10:1:1,' ',(integer(random(100))-5000)/10:1:1);
close(output);
end.


