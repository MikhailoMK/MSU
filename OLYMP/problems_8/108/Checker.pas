{$A+,B-,D+,E+,F-,G-,I+,L+,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}

uses testlib;

var i,j,k:integer;
    a:integer;
    s:string;

begin
for i:=1 to 9 do
  for j:=0 to 9 do
    for k:=0 to 9 do
      if (i<>j) and (i<>k) and (j<>k) then begin
        a:=ouf.readinteger;
        str(a,s);
        if (a<100) or (a>999) then quit(_PE,'Выведено не трехзначное число '+s);
        if a>100*i+10*j+k then begin
          str(100*i+10*j+k,s);
          quit(_WA,'Пропущено число '+s);
          end;
        if a<100*i+10*j+k then quit(_WA,'Лишнее число '+s);
        end;
quit(_OK,'');
end.
