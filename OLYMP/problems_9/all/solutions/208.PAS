var s:string;
    i:integer;
begin
assign(input,'input.txt');
reset(input);
assign(output,'output.txt');
rewrite(output);
readln(s);
for i:=length(s) downto 2 do
  if (s[i]=' ') and (s[i-1]=' ') then delete(s,i,1);
writeln(s);
close(input);
close(output);
end.