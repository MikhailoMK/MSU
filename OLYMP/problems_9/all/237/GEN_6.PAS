var
 i:integer;
 s1,s2:string;
begin
  assign(output,'39_6.tst');
  rewrite(output);
  randseed := 2345987;
  s1:='';
  for i:=1 to 123 do
    begin
      s1 :=s1 + chr(ord('A')+random(25));
      s2 := s2 + s1[i];
      if random(1234) < 500 then s2[i]:='?';
      if random(1234) < 100 then s2[i]:='*';
    end;
  writeln(s1);
  writeln(s2);
end.