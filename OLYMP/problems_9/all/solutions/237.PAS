const
 maxl = 260;
var
 i,j,l1,l2:integer;
 s1,s2,s3:string;
 may1,may2:array[0..maxl]of boolean;

function word(s:string):boolean;
var
 i:integer;
begin
  word := false;
  for i:=1 to length(s) do
    if not (s[i] in ['A'..'Z']) then exit;

  word := true;
end;

begin
  assign(input,'input.txt');
  assign(output,'output.txt');
  reset(input);
  rewrite(output);
  readln(s1);
  readln(s2);
  if word(s2) then
    begin
      s3 := s1;
      s1 := s2;
      s2 := s3;
    end;
  l1:= length(s1); { word }
  l2:= length(s2);
  for j:=0 to l1 do
    may1[j] := j=0;
  for i:=1 to l2 do
    begin
      may2[0] := may1[0] and ( s2[i] = '*' );
      for j:=1 to l1 do
        begin
          if s2[i] = '?' then may2[j] := may1[j-1]
          else
          if s2[i] = '*' then may2[j] := may1[j] or may1[j-1] or may2[j-1]
          else
            may2[j] := may1[j-1] and (s1[j] = s2[i]);
        end;
      may1 := may2;
    end;
 if may1[l1] then writeln('YES')
 else writeln('NO');
end.