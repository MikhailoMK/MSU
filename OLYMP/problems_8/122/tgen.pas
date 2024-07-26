const n=100;
      fname='input06.txt';

var i:integer;

begin
randomize;
assign(output,fname);
rewrite(output);
for i:=1 to n-1 do
  write(random(9)+1,' ');
write(0);
close(output);
end.
