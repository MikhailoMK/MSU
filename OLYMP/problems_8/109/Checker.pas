{$A+,B-,D+,E+,F-,G-,I+,L+,N-,O-,P-,Q+,R+,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}

uses testlib;

var n:integer;
    m:integer;
    i,j,k:integer;

begin
n:=inf.readinteger;
m:=0;
for i:=1 to n do begin
  k:=0;
  for j:=1 to i do
    if i mod j = 0 then k:=k+j;
  if k>m then m:=k;
  end;

i:=ouf.readinteger;
if (i<1) or (i>n) then quit(_PE,'�뢥���� �᫮ �� �� ��������� �� 1 �� N');
k:=0;
for j:=1 to i do
  if i mod j = 0 then k:=k+j;
if k=m then quit(_OK,'');
if k<m then quit(_WA,'������� �᫮ �� � ���ᨬ��쭮� �㬬�� ����⥫��');
if k>m then quit(_fl,'�祭� ��࠭��');
end.




