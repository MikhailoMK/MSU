var n:integer;

procedure rec(q,a,b,c:integer);
  begin
  if q>1 then rec(q-1,a,c,b);
  writeln(a,' ',b);
  if q>1 then rec(q-1,c,b,a);
  end;



begin
assign(input,'input.txt');
reset(input);
assign(output,'output.txt');
rewrite(output);
read(n);
rec(n,1,2,3);
close(input);
close(output);
end.