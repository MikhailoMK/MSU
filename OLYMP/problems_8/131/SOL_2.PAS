const nmax=500;

var a:array[1..nmax] of integer;
    i,j:integer;
    k,n:integer;
    u:integer;

begin
assign(input,'input.txt');
reset(input);
assign(output,'output.txt');
rewrite(output);
read(n,k);
for i:=1 to n do a[i]:=i;
i:=1;
while n>1 do begin
  i:=(i+k-1) mod n;
  if i=0 then i:=n;
  for j:=i to n-1 do a[j]:=a[j+1];
  n:=n-1;
  end;
writeln(a[1]);
close(input);
close(output);
end.

