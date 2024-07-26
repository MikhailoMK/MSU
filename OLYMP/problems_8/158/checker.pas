uses testlib;

const nmax=100;

var n:integer;
    a:array[1..nmax,1..nmax] of integer;
    s:array[1..3] of integer;
    q:integer;

procedure init;
  var i,j:integer;
  begin
  n:=inf.readinteger;;
  for i:=1 to n do
    for j:=1 to n do
      a[i,j]:=inf.readinteger;
  q:=MaxInt;
  end;

procedure work;
  var i,j,g,qq:integer;
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
      qq:integer;
  begin
  for i:=1 to 3 do begin
    s[i]:=ouf.readinteger;
    if (s[i]<1) or (s[i]>n) then quit(_PE,'Недопустимый номер площади');
    for j:=1 to i-1 do
      if s[i]=s[j] then quit(_WA,'Площади не могут повторяться');
    end;
  qq:=a[s[1],s[2]]+a[s[2],s[3]]+a[s[1],s[3]];
  if qq<q then quit(_fl,'Ошибка в проверяющей программе');
  if qq>q then quit(_WA,'Решение имеет не минимальную длину');
  quit(_ok,'');
  end;




begin
init;
work;
out;
end.