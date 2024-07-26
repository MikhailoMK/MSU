{
Задача "Отчет о сборах"
4 июня 1998 года Малоярославец
V.Berov
}

{$A+,B-,D+,E+,F-,G-,I-,L+,N+,O-,P-,Q+,R+,S+,T-,V+,X+,Y+}
{$M 65520,0,655360}

Const NMax=5000;

Type SString = String[81];

Var A:Array[1..NMax] of Word;
    MinCost:Array[0..NMax] of LongInt;
    Which:Array[1..NMax] of Integer;
    Vari:Array[1..NMax] of Integer;
    S,N:Integer;
    Ch:Char;

Const Blanks = [' ',#9,#10,#13];

Function ReadWord:SString;
Var S:SString;
Begin
  S:='';
  While Not Eof and (ch in Blanks) do read(ch);

  while not Eof and Not (ch in Blanks) do begin
    S:=S+ch;
    read(ch);
  end;
  if Eof then S:=S+ch;

  While Not Eof and (ch in Blanks) do read(ch);

  readWord:=S;
End;

Procedure Init;
Var i:Integer;
Begin
  Assign(Input,'input.txt');
  ReSet(Input);

  ReadLn(S);
  N:=0;
  Read(Ch);
  while Not Eof do begin
    Inc(N);
    A[N]:=Length(ReadWord);
  end;

  Close(Input);
End;

Function Cost(l,hole:Integer):LongInt;
Var a,b:LongInt;
Begin
  if hole=0 then Cost:=2147483647
  else begin
    a:=l div hole;
    b:=l mod hole;
    cost:=b*(a+1)*(a+1)*(a+1) + (hole-b)*a*a*a;
  end;
End;

Var Variant:Integer;

Function BestCost(j,i,Cnt:Integer):LongInt;
Var l:Integer;
    Res,Res1:LongInt;
Begin
  l:=S-(Cnt-(i-j));
  Res:=Cost(l,i-j); Variant:=1;
  Res1:=Cost(l,i-j+1);
  if Res1<Res then begin
    Res:=Res1;
    Variant:=2;
  end;
  Res1:=Cost(l,i-j+2);
  if Res1<Res then begin
    Res:=Res1;
    Variant:=3;
  end;
  BestCost:=Res;
End;

Procedure Solve;
Var i,j,Cnt:Integer;
    R:LongInt;
Begin
  For i:=1 to N do MinCost[i]:=2147483647;
  MinCost[0]:=0;
  for i:=1 to N do begin
    j:=i;
    Cnt:=A[j];
    repeat
      R:=BestCost(j,i,Cnt)+MinCost[j-1];
      if R<MinCost[i] then begin
        MinCost[i]:=R;
        Which[i]:=j;
        Vari[i]:=Variant;
      end;
      Dec(j);
      if (j>0) then
         Inc(Cnt,1+A[j]);
    until (Cnt>S) or (j=0);
  end;
End;

Procedure PrintString(j,i,vari:Integer);
Var l,k,t,hole,aa,bb:Integer;
Begin
  l:=0;
  for k:=j to i  do
    Inc(l, A[k]);
  l:=s-l;
  hole:=i-j+vari-1;

  if vari=1 then
    write(readWord);

  aa:=l div hole;
  bb:=l mod hole;
  for k:=1 to bb do begin
    for t:=1 to aa+1 do Write(' ');
    Write(readWord);
  end;
  for k:=1 to hole-bb do begin
    for t:=1 to aa do write(' ');
    if (k<hole-bb) or (vari<>3) then
      Write(readWord);
  end;
End;

Procedure Print;
Var i,j,Cnt:Integer;
    Res:Array[1..NMax] of Integer;
Begin
  i:=N; Cnt:=1; Res[1]:=N+1;
  While i>0 do begin
    inc(Cnt);
    Res[Cnt]:=Which[i];
    i:=Which[i]-1;
  end;

  Assign(Output,'Output.txt');
  ReWrite(Output);
  Assign(Input,'Input.txt');
  ReSet(Input);
  WriteLn(MinCost[N]);
  ReadLn;
  for i:=Cnt downto 2 do begin
    PrintString(Res[i], Res[i-1]-1, Vari[Res[i-1]-1]);
    WriteLn;
  end;

  Close(Input);
  Close(Output);
End;

Begin
  Init;
  Solve;
  Print;
End.
