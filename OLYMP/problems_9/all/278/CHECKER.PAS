uses testlib;

const nmax=10;

var
  a:array[1..3,1..nmax] of integer;
  b:array[1..3] of integer;
  i:integer;
  q,w:integer;
  n:integer;

begin
b[2]:=0;
b[3]:=0;
n:=inf.readinteger;
b[1]:=n;
for i:=1 to n do
  a[1,i]:=i;
while not ouf.seekeof do begin
  q:=ouf.readinteger;
  w:=ouf.readinteger;
  if (q<1) or (q>3) or (w<1) or (w>3) then quit(_PE,'Должны быть числа от 1 до 3');
  if q=w then quit(_PE,'Нельзя перекладывать со стержня на него же');
  if b[q]=0 then quit(_WA,'Перекладываем с пустого стержня');
  inc(b[w]);
  a[w,b[w]]:=a[q,b[q]];
  dec(b[q]);
  if b[w]>1 then
    if a[w,b[w]]<a[w,b[w]-1] then
      quit(_WA,'Положили большее кольцо на меньшее');
  end;
if b[2]<>n then quit(_WA,'В конце все кольца не оказались на 2-м стержне');
quit(_OK,'');
end.