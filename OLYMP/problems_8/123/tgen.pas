const n=70000;
      fname='input12.txt';

var i:longint;

begin
randomize;
assign(output,fname);
rewrite(output);
for i:=1 to n-1 do
  write(9,' ');
write(0);
close(output);
end.
