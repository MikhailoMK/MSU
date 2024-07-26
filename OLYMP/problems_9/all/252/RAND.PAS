{$A+,B-,D+,E+,F-,G-,I-,L+,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 65520,0,655360}
Var I, J, N, M, V: Longint;
    Err: Integer;

Begin
  Val(ParamStr(4), RandSeed, Err);
  Val(ParamStr(1), N, Err);
  Val(ParamStr(2), M, Err);
  Val(ParamStr(3), V, Err);
  Writeln(N, ' ', Random(N) + 1, ' ', Random(N) + 1);
  For I := 1 to N do Begin
    For J := 1 to N do 
      If I = J 
      Then 
        Write('0 ')
      Else 
        If Random(100) < V Then Write(Random(M - 1) + 2, ' ')
                           Else Write('-1 ');
    Writeln;  
  End;
End.