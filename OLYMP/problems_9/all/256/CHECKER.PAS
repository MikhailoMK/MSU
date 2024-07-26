{$A+,B-,D+,E+,F-,G+,I+,L+,N-,O-,P-,Q+,R+,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Uses Testlib;
var
  o, a : longint;
begin
  a := ans.readlongint;
  o := ouf.readlongint;
  if (o = -1) and (a = -1) then quit(_OK, 'Пути не существует');
  if o = a then quit(_OK, ':-)');
  if o < -1 then quit(_PE, 'Получено отрицательное число <-1');
  if o = -1 then quit(_WA, 'Получен ответ -1 при наличии пути');
  if a = -1 then quit(_WA, 'Получено неотрицательное число при отсутствии пути');
  if o > a then quit(_WA, 'Не оптимально');
  if o < a then quit(_WA, 'Путь такой длины не существует');
end.