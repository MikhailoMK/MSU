var i:integer;
    s:string;
begin

for i:=1 to 50 do begin
  str(i,s);
  if i<10 then s:='0'+s;
  assign(output,'input'+s+'.txt');
  rewrite(output);
  writeln(random(2000)+1);
  close(output);
  end;
end.
