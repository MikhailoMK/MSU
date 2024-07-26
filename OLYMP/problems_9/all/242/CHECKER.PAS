{$A+,B-,D+,E+,F-,G-,I-,L+,N+,O-,P-,Q+,R+,S+,T-,V+,X+,Y+}
{$M 65520,0,655360}

Uses TestLib;

Var R,Sum:LongInt;
    S:Integer;
    infWord, oufWord:String;
    stringlength:Integer;

Function skipSpace(Var F:inStream;Flag:Boolean):LongInt;
Var Sum,Result:LongInt;
Begin
  Result:=0;

  while F.curChar in Blanks do begin
    while F.curChar in [#10,#13] do begin
      if stringLength>S then
        QUIT(_WA,'Длина строки слишком большая');
      stringLength:=0;
      F.nextChar;
    end;

    Sum:=0;
    while (F.curChar in (Blanks-[#13,#10])) do begin
      if F.curChar = ' ' then Inc(Sum);
      F.nextChar;
      if Flag then
        inc(stringLength);
    end;

    Inc(Result,Sum*Sum*Sum);
  end;

  skipSpace:=Result;
End;

Var Err:Boolean;
    oufR:LongInt;

Begin
  Err:=False;
  R:=ans.readLongInt;
  oufR:=ouf.readLongInt;
  if oufR>R then begin
    Str(R, infWord);
    Str(oufR, oufWord);
    QUIT(_WA,oufWord+' вместо '+infWord);
  end
  else if oufR<R then
    Err:=True;

  Sum:=0;
  S:=inf.readInteger;

  skipSpace(inf,False);
  while not inf.Eof and not ouf.Eof do begin
    Inc(Sum,skipSpace(ouf,True));

    infWord:=inf.readWord([],Blanks);
    oufWord:=ouf.readWord([],Blanks);
    inc(stringLength,Length(oufWord));

    if infWord<>oufWord then
      QUIT(_WA,'Изменился отчет');

    skipSpace(inf,False);
  end;
  Inc(Sum,skipSpace(ouf,True));

  if inf.Eof and not ouf.Eof then
    QUIT(_WA,'Отчет удлинился');
  if ouf.Eof and not inf.Eof then
    QUIT(_WA,'Отчет укоротился');

  if Sum<>R then
    QUIT(_WA,'Неправильно подсчитана сумма кубов пустот');

  if Err then
    QUIT(_Fail,' Неправильный тест');

  Quit(_Ok,'');
End.
