var s,ss:string;
    n,i:integer;
    j,k,err:integer;

begin
assign(input,'input.txt');
reset(input);
assign(output,'output.txt');
rewrite(output);
readln(n);
writeln(n);
for i:=1 to n do begin
  readln(s);
  j:=pos(' ',s);
  ss:=copy(s,j+1,length(s)-1);
  val(ss,k,err);
  if err<>0 then begin
    writeln('Botva in line ',i);
    close(input);
    close(output);
    halt;
    end;
  writeln(copy(s,1,j),k+1);
  end;
close(input);
close(output);
end.
