uses testlib;

var s1,s2:string;
    an:integer;

procedure test_for_strings;
  var i:integer;
  begin
  if length(s1)<>length(s2) then quit(_WA,'Строки входного и выходного файлов имеют разную длину');
  for i:=1 to length(s1) do begin
    if not( (s1[i]=s2[i]) or (s1[i]='?') ) then
        quit(_WA,'Строка не могла быть получена из начальной только заменой ? цифрами');
    if not (s2[i] in ['0'..'9','=','+']) then quit(_WA,'Недопустимый символ в выходной строке');
    end;
  end;

procedure test_for_cisla;
  var uk:array[1..3] of integer;
      b:array[1..3] of boolean;
      ost:byte;
      c:array[1..3] of byte;
      i:byte;
  begin
  uk[1]:=pos('+',s2)-1;
  uk[2]:=pos('=',s2)-1;
  uk[3]:=length(s2);
  fillchar(b,sizeof(b),false);
  ost:=0;
  while not(b[1]) or not(b[2]) or not(b[3]) do begin
    for i:=1 to 3 do begin
      if b[i] then c[i]:=0
      else
        if uk[i]<1 then begin
          b[i]:=true;
          c[i]:=0;
          end
        else
          if s2[uk[i]] in ['0'..'9'] then c[i]:=ord(s2[uk[i]])-ord('0')
          else begin
            b[i]:=true;
            c[i]:=0;
            end;
      dec(uk[i]);
      end;
    ost:=ost+c[1]+c[2];
    if ost mod 10<>c[3] then quit(_WA,'Равенство не выполняется');
    ost:=ost div 10;
    end;
  if ost<>0 then quit(_WA,'Равенство не выполняется');
  end;





begin
an:=ans.readinteger;
if an=0 then begin
  s1:=ouf.readstring;
  if s1<>'No solution' then quit(_wa,'"'+s1+'" вместо "решения не существует"');
  quit(_ok,'');
  end;
s1:=inf.readstring;
s2:=ouf.readstring;
test_for_strings;
test_for_cisla;
quit(_ok,'');
end.
