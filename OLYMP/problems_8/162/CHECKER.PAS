uses testlib;
const nmax=100;
var
      a:array[1..nmax,1..nmax] of integer;
      l,la:integer;
      n:integer;
      i,j:integer;
      vc,vn:integer;
      v1,v2:integer;


begin
n:=inf.readinteger;
for i:=1 to n do
  for j:=1 to n do
    a[i,j]:=inf.readinteger;
v1:=inf.readinteger;
v2:=inf.readinteger;


l:=ouf.readinteger;
la:=ans.readinteger;

if l=-1 then begin
  if la=-1 then quit(_OK,'Нет пути');
  quit(_WA,'Ответ нет пути, когда путь есть');
  end;


vc:=ouf.readinteger;
if vc<>v1 then quit(_WA,'Путь начинается не в той вершине');
for i:=1 to l do begin
  vn:=ouf.readinteger;
  if a[vc,vn]=0 then quit(_WA,'Проход по несуществующему ребру');
  vc:=vn;
  end;
if vc<>v2 then quit(_WA,'Закончили не в той вершине');
if (l<la) or (la=-1) then quit(_Fail,'Найдено решение лучше, чем в ответе!!!!');
if l>la then quit(_WA,'Найден не кратчайший путь');
quit(_OK,'Удивительно :-) ');
end.



end.