uses testlib;
var a,b:longint;
begin
while not ans.seekeof do begin
  a:=ans.readlongint;
  if ouf.seekeof then quit(_WA,'Не все числа');
  b:=ouf.readlongint;
  if a<>b then quit(_WA,'Выведено неверное число или число пропущено');
  end;
if not ouf.seekeof then quit(_WA,'Выведены лишние числа');
quit(_OK,'');
end.
