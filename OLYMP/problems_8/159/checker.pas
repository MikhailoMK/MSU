{$A+,B-,D+,E+,F-,G-,I+,L+,N+,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
uses testlib;

const nmax=50;
      Max=1e+20;
      eps=1e-4;

type extended=real;

var n:integer;
    a:array[1..nmax,1..nmax] of extended;
    b:array[1..nmax,1..2] of extended;
    s:array[1..3] of integer;
    q:extended;

procedure init;
  var i,j:integer;
  begin
  n:=inf.readinteger;
  for i:=1 to n do begin
    b[i,1]:=inf.readreal;
    b[i,2]:=inf.readreal;
    end;
  for i:=1 to n do
    for j:=1 to n do
      a[i,j]:=sqrt((b[i,1]-b[j,1])*(b[i,1]-b[j,1])+(b[i,2]-b[j,2])*(b[i,2]-b[j,2]));
  q:=Max;
  end;

procedure work;
  var i,j,g:integer;
      qq:extended;
  begin
  for i:=1 to n do
    for j:=i+1 to n do
      for g:=j+1 to n do
        begin
        qq:=a[i,j]+a[i,g]+a[j,g];
        if qq<q then begin
          q:=qq;
          s[1]:=i;
          s[2]:=j;
          s[3]:=g;
          end;
        end;
  end;

procedure out;
  var i,j:integer;
      qq:real;
  begin
  for i:=1 to 3 do begin
    s[i]:=ouf.readinteger;
    if (s[i]<1) or (s[i]>n) then quit(_PE,'Недопустимый номер точки');
    for j:=1 to i-1 do
      if s[i]=s[j] then quit(_WA,'Точки не могут повторяться');
    end;
  qq:=a[s[1],s[2]]+a[s[2],s[3]]+a[s[1],s[3]];
  if qq<q-eps then quit(_fl,'Ошибка в проверяющей программе');
  if qq>q+eps then quit(_WA,'Решение имеет не минимальную длину');
  quit(_ok,'');
  end;




begin
init;
work;
out;
end.