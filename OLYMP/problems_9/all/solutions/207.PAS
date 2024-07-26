var s:string;
     i:integer;
begin
assign(input,'input.txt');
reset(input);
assign(output,'output.txt');
rewrite(output);
readln(s);
i:=pos(' ',s);
write(copy(s,i+1,length(s)-i),' ',copy(s,1,i-1));
close(input);
close(output);
end.
