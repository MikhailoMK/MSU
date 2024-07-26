uses testlib;

var a:array[1..9 ]of longint;
    i,j:longint;
    s,s1,s2:string;

begin
fillchar(a,sizeof(a),0);
i:=inf.readlongint;
while i<>0 do begin
  inc(a[i]);
  i:=inf.readlongint;
  end;

for i:=1 to 9 do begin

  j:=ouf.readlongint;
  if j<>a[i] then begin
    str(i,s);
    str(a[i],s1);
    str(j,s2);
    quit(_WA,'Неверно посчитано количество цифр '+s+': выведено '+s2+', должно быть'+s1);
    end;
  end;
quit(_OK,'');
end.


