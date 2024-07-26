var
 i:integer;
 s1,s2:string;
begin
  assign(output,'39_9.tst');
  rewrite(output);
  randseed := 2345487;
  s1:='';
  for i:=1 to 255 do
    begin
      s1 :=s1 + chr(ord('A')+random(25));
    end;
  s2 :='';
  for i:=1 to 10 do
    s2 :=s2 +'*'+chr(ord('A')+random(25));

  writeln(s1);
  writeln(s2);
end.