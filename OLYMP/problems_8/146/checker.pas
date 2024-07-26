{$A+,B-,D+,E+,F-,G-,I+,L+,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
USES TestLib;

var t,n,m,i,j,x,y : integer;

BEGIN
	n := inf.readinteger;
	m := inf.readinteger;
	y := ouf.readinteger;
	x := ouf.readinteger;
	for i:= 1 to n do
		for j:= 1 to m do begin
			t := inf.readinteger;
			if (i=y) and (j=x) then begin
				if t=0 then quit(_ok,'');
				if t<>0 then quit(_wa,'<>0');
			end;
		end;
	QUIT(_Wa, 'Нет такого элемента');
END.