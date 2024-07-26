uses testlib;

const lmax=50;

var q:string;
    s:string;

    nt:integer;
    len:integer;

    i,j,k:integer;

    a:array[0..lmax,0..lmax] of byte;


begin
s:=ouf.readstring;
len:=ans.readinteger;

if len=-1 then
  if s='-1' then quit(_OK,'No solution');

for nt:=1 to 2 do begin
  q:=inf.readstring;
  for i:=0 to lmax do
    for j:=0 to lmax do
      a[i,j]:=0;
  a[0,0]:=1;
  for i:=1 to length(q) do
    if q[i]='*' then a[0,i]:=1 else break;
  for i:=1 to length(s) do
    for j:=1 to length(q) do begin
      if q[j]='?' then a[i,j]:=a[i-1,j-1]
      else if q[j]='*' then
             for k:=0 to i do begin
               if a[k,j-1]=1 then a[i,j]:=1;
             end
             else
               if q[j]=s[i] then a[i,j]:=a[i-1,j-1] else a[i,j]:=0;
      end;
  if a[length(s),length(q)]=0 then quit(_WA,'Строка не удовлетворяет шаблону '+q);
  end;
  if length(s)<len then quit(_fail,'Найдено лучшее решение');
  if length(s)>len then quit(_WA,'Найдено не кратчайшее решение');
  quit(_OK,'');

end.


