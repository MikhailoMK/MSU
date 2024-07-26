{$A+,B-,D+,E+,F-,G-,I+,L+,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
USES TestLib;

BEGIN
 If (ouf.ReadLongInt<>ans.ReadLongInt) or (ouf.ReadLongInt<>ans.ReadLongInt) Then QUIT(_wa, '')
  Else QUIT(_ok, '');
END.