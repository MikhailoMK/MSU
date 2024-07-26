{$A+,B-,D+,E-,F-,G-,I+,L+,N+,O-,P-,Q-,R-,S+,T-,V+,X+}
{$M 16384,0,655360}

{ Подсчет количества разбиений числа N на различные слагаемые }
Program Addends;

{
  Пусть a[i,j] -- количество разбиений числа i на слагаемые, не превышающие j
  Тогда верны следующие рекуррентные соотношения:
    a[0,j] = 1 для j>=0 (i=0)
    a[i,0] = 0 для i>=1 (j=0)
    a[i,j] = a[i,j-1]+a[i-j,j-1] для i,j>0
}

{
  Результат влазит в 10^9 при N<=212 (          995645336 вариантов),
  в LongInt      --       при N<=225 (         2114965120 вариантов),
  в Comp         --       при N<=769 (9031248611609428980 вариантов),
  но, начиная с N=705, последние цифры содержат ошибки (не влазит в 10^18)
}

Const MaxN = 1000;

Var A : Array [0..MaxN] Of Comp;
    N,i,j : Integer;

Begin
  assign(input,'c.in');
  reset(input);
  assign(output,'c.out');
  rewrite(output);

  Read(N);
  FillChar(A,SizeOf(A),0); A[0]:=1;
  For j:=1 To N Do
  Begin
    For i:=N DownTo j Do {Inc(A[i],A[i-j]);} A[i]:=A[i]+A[i-j];
    {WriteLn(j,' - ',A[j]:0:0);}
  End;
  WriteLn(A[N]:0:0);
End.