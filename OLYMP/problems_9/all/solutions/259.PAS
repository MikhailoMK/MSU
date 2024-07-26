{$A+,B-,D+,E+,F-,G-,I-,L+,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 65520,0,655360}
Const MaxN = 100;
      Big = 15000;

Var I, J, K, N, MinI, MinJ: Integer;
    A: array[1..MaxN, 1..MaxN] of Integer;

Begin
  Assign(Input, 'input.txt');
  Assign(Output, 'output.txt');
  Reset(Input);
  Rewrite(Output);
  Read(N);
  For I := 1 to N do
    For J := 1 to N do Begin
      Read(A[I, J]);
      If A[I, J] < 0 Then A[I, J] := Big;
    End;
  For K := 1 to N do
    For I := 1 to N do
      For J := 1 to N do
        If A[I, J] > A[I, K] + A[K, J] Then
          A[I, J] := A[I, K] + A[K, J];
  MinI := 1;
  MinJ := 1;
  For I := 1 to N do
    For J := 1 to N do
      If (A[I, J] > A[MinI, MinJ]) and (A[I, J] < Big) Then Begin
        MinI := I;
        MinJ := J;
      End;
  Write(A[MinI, MinJ]);
  Close(Input);
  Close(Output);
End.