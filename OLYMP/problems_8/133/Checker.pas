uses testlib;

var
  N,M:integer;
  A:array[1..30,1..30] of integer;
  x1,y1,z1,x,y,z:integer;
  FirstFlag:boolean;
  i,j,l:integer;
begin
  n:=inf.readinteger;
  m:=inf.readinteger;
  fillchar(a,sizeof(a),0);
  FirstFlag:=true;
  repeat
    x:=ouf.readinteger;y:=ouf.readinteger;
    if (x<0) or (x>N) or (y<0) or (y>M) then
      QUIT(_WA,'室 ��� ���');
    if not FirstFlag then begin
      if abs(x1-x)>1 then QUIT(_WA,'室 �� � �ᥤ��� �����');
      if abs(y1-y)>1 then QUIT(_WA,'室 �� � �ᥤ��� �����');
      if abs(x1-x)+abs(y1-y)<>1 then
        QUIT(_WA,'室 �� � �ᥤ��� �����');
      end;
    if a[x,y]<>0 then QUIT(_WA,'� ��� ����� 㦥 �ꥫ�');
    a[x,y]:=1;
    x1:=x;y1:=y;
  until ouf.seekeof;
  for i:=1 to N do
    for j:=1 to M do
        if a[i,j]=0 then
          QUIT(_WA,'�� ���� ��� �ꥤ��');
  QUIT(_ok, '');
end.