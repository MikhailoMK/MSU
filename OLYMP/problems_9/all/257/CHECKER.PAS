Program Check_Probirki;

Uses TestLib;

Var s1, s2 : string;
    i1, i2 : integer;

BEGIN
  s1 := Ouf.ReadString;
  s2 := Ans.ReadString;
  If s1<>s2 then
    QUIT (_WA, '"'+s1+'" вместо "'+s2+'"')
  Else
   If s1='YES' then Begin
     i1 := Ouf.ReadInteger;
     i2 := Ans.ReadInteger;
     If i1<i2 then QUIT (_WA,'Слишком мало!')
     Else If i1>i2 then QUIT (_WA,'Слишком много!')
     Else QUIT (_OK,'')
   End
   Else
     QUIT (_OK,'');
END.