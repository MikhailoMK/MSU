var n:integer;
    s:string;
    i,j:integer;
begin
assign(input,'input.txt');
reset(input);
assign(output,'output.txt');
rewrite(output);
read(n);
writeln(n);
for i:=1 to n do begin
  read(j,s);
  writeln(j+1,s);
  end;
close(input);
close(output);
end.



