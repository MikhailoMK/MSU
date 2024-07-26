{$A+,B-,D+,E+,F-,G-,I+,L+,N-,O-,P-,Q-,R-,S+,T-,V+,X+}
{$M 64000,0,655360}
Program Bar30_1;

{ Pflfxf j if,kjyf[ }

Const
  inf=32000;
Var
  S1,S2:String;
  L,H1,H2:Array[0..80,0..80] of Integer;
  Min1,Min2:Array[1..80,0..80] of Byte;



Procedure Input;
  Var
    F:Text;
    S:String;
  Begin
{   Write('Type input file name - '); Readln(S);}
    Assign(F,'input.txt'); ReSet(F);
    Readln(F,S1); Readln(F,S2); Close(F);
  End;

Procedure Init;
  Var
    I,J,K:Integer;
  Begin
    For I:=0 to 80 do
      For J:=0 to 80 do
        L[i,j]:=-1;
    L[0,0]:=0;
    For I:=1 to Length(S1) do
    Begin
      K:=0;
      For J:=I to Length(S1) do
      Begin
        if S1[j]<>'*' then Inc(K);
        Min1[i,j]:=K;
      End;
    End;
    For I:=1 to Length(S2) do
    Begin
      K:=0;
      For J:=I to Length(S2) do
      Begin
        if S2[j]<>'*' then Inc(K);
        Min2[i,j]:=K;
      End;
    End;
  End;

Function M(p,i,j:Integer):Integer;
  Begin
    if i>j then
      M:=0
    else
      Case p of
        1: M:=Min1[i,j];
        2: M:=Min2[i,j];
      End;
  End;

Function GetM(p,i,j:Integer):String;
  Var
    k,l:Integer;
    S:String;
    Ch:Char;
  Begin
    S:='';
    For k:=i to j do
    Begin
      Case p of
        1: Ch:=S1[k];
        2: Ch:=S2[k];
      End;
      if Ch='?' then Ch:='@';
      if Ch<>'*' then S:=S+Ch;
    End;
    GetM:=S;
  End;


Function CalcLength(a,b:Integer):Integer;
  Var
    I,J:Integer;
  Begin
    if L[a,b]=-1 then
    Begin
      L[a,b]:=inf;
      if (a>0) and (s1[a]='*') then
      Begin
        For I:=b downto 0 do
          if L[a,b]>CalcLength(a-1,i)+M(2,i+1,b) then
          Begin
            L[a,b]:=CalcLength(a-1,i)+M(2,i+1,b); H1[a,b]:=a-1; H2[a,b]:=i;
          End;
      End Else
      if (b>0) and (s2[b]='*') then
      Begin
        For I:=a downto 0 do
          if L[a,b]>CalcLength(i,b-1)+M(1,i+1,a) then
          Begin
            L[a,b]:=CalcLength(i,b-1)+M(1,i+1,a); H1[a,b]:=i; H2[a,b]:=b-1;
          End;
      End Else
      if (a>0) and (b>0) and ((s1[a]='?') or (s2[b]='?') or (s1[a]=s2[b])) then
      Begin
        L[a,b]:=CalcLength(a-1,b-1)+1;
        H1[a,b]:=a-1; H2[a,b]:=b-1;
      End;
    End;
    CalcLength:=L[a,b];
  End;

Procedure WriteM(a,b,c:Integer);
  Begin
    Write(GetM(a,b,c));
  End;

Procedure WriteStr(a,b:Integer);
  Var
    I:Integer;
  Begin
    if (a>0) and (s1[a]='*') then
    Begin
      I:=H2[a,b];
      WriteStr(H1[a,b],H2[a,b]);
      WriteM(2,i+1,b);
    End Else
    if (b>0) and (s2[b]='*') then
    Begin
      I:=H1[a,b];
      WriteStr(H1[a,b],H2[a,b]);
      WriteM(1,i+1,a);
    End Else
    if (a>0) and (b>0) and ((s1[a]='?') or (s2[b]='?') or (s1[a]=s2[b])) then
    Begin
      WriteStr(H1[a,b],H2[a,b]);
      if s1[a]<>'?' then
        Write(s1[a])
      else
      if s2[b]<>'?' then
        Write(s2[b])
      else
        Write('@');
    End;
  End;

Procedure Print;
  Var
    L:Integer;
    S:String;
  Begin
    assign(output, 'output.txt');
    reWrite(output);

    L:=CalcLength(Length(s1),Length(s2));
    if L>=inf then
      WriteLn('-1')
{     Writeln('There is no such a string...')}
    else
    Begin
{     Write('Length ',L,': "'); }
      WriteStr(Length(S1),Length(S2));
{     Writeln('".');}
    End;
  End;


Begin
  Input;
  Init;
  Print;
End.





