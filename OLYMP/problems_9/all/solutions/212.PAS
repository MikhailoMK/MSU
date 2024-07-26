var c:char;
    uu,u:integer;

begin
assign(input,'input.txt');
reset(input);
assign(output,'output.txt');
rewrite(output);
u:=0;
while not eof(input) do begin
  read(c);
  uu:=u;
  if c='1' then u:=1;
  if (c='5') and (u=1) then u:=2;
  if (c='4') and (u=2) then u:=3;
  if (c='3') and (u=3) then begin
    writeln('URA');
    close(input);
    close(output);
    halt;
    end;
  if uu=u then u:=0;
  end;

writeln('NO');
close(input);
close(output);
end.