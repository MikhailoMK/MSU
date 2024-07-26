{$A+,B-,D+,E+,F-,G-,I+,L+,N-,O-,P-,Q-,R-,S-,T-,V+,X+}
{$M 16384,0,655360}
{$R+,S+,Q+}
  Const
    Digits = ['0'..'9'];

  Var
    hh,mm,ss: Longint;
    h,m,s: Longint;

  Function ReadNum: Longint;
    Var c: Char; res: Longint;
  Begin
    Repeat Read(c) Until (c in digits);
    Res := 0;
    While (c in Digits) Do
     Begin
       Res := Res*10+(Ord(c)-Ord('0'));
       Read(c);
     End;
    ReadNum := Res;
  End;

  Procedure Init;
  Begin
    Assign(input, 'input.txt'); Reset(input);
      hh := ReadNum; mm := ReadNum; ss := ReadNum;
      h := ReadNum;
      If Not SeekEof Then
       Begin
         m := ReadNum;
         If Not SeekEof Then s := ReadNum
         Else Begin s := m; m := h; h := 0 End;
       End
      Else Begin s := h; m := 0; h := 0 End;
    Close(input);
  End;

  Procedure Out(num: Longint);
  Begin
    If num < 9 Then Write('0'); Write(num);
  End;

  Procedure Done;
  Begin
    Assign(output, 'output.txt'); Rewrite(output);
      inc(mm, m+(s+ss) div 60); ss := (ss+s) mod 60;
      inc(hh, h+mm div 60); mm := mm mod 60;
      Out(hh mod 24); Write(':'); Out(mm); Write(':'); Out(ss);
      If hh div 24 > 0 Then Write('+',hh div 24,' days');
    Close(output);
  End;

BEGIN
  Init; Done;
END.
