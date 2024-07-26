var n,m:integer;
    i,j,k:integer;
    a:integer;

begin
assign(input,'input.txt');
reset(input);
assign(output,'output.txt');
rewrite(output);
read(n,m);

a:=0;

for i:=1 to n do begin
  j:=i;
  k:=0;
  while j>0 do begin
    k:=k+j mod 10;
    j:=j div 10;
    end;
  if k mod m = 0 then inc(a);
  end;
writeln(a);
close(input);
close(output);
end.


