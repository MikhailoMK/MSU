var i:integer;
    s,d:string;
    j:integer;
begin
assign(input,'input.txt');
reset(input);
assign(output,'output.txt');
rewrite(output);
readln(s);
readln(d);
j:=0;
for i:=1 to length(d)-length(s)+1 do
  if copy(d,i,length(s))=s then j:=j+1;
writeln(j);
close(output);
close(input);
end.