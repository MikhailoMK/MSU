uses crt;
var
f1,f2:text;
s:string;
t:boolean;
i:longint;
begin
clrscr;
assign(f1,'input.txt');
assign(f2,'output.txt');
reset(f1);
rewrite(f2);
t:=false;
while not(eof(f1))do begin
read(f1,s);
if s<>'' then t:=true;
if (t) then write(f2,s)
else begin
readln(f1); writeln(f2); end;
t:=false;
end;
close(f1);
close(f2);
end.