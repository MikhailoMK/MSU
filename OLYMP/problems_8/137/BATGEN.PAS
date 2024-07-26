var i,n,j,k:integer;
    s:string;
begin
assign(output,'a.bat');
rewrite(output);

for i:=1 to 50 do begin
  str(i,s);
  if i<10 then s:='0'+s;
  writeln('copy input'+s+'.txt input.txt');
  writeln('solution');
  writeln('copy output.txt answer'+s+'.txt');
  end;
close(output);
end.
