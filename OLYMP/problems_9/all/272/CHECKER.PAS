uses testlib;

const nmax=100;

var s:array[1..nmax] of string;
    i,j,n:integer;
    ss:string;
    a:array[1..9] of integer;
    b:array['A'..'Z'] of integer;
    c:string;
    an:integer;

procedure check(q:string);
  var i,j:integer;
      cc:char;
      sum,res:longint;
  begin
  for i:=1 to 9 do a[i]:=-1;
  for cc:='A' to 'Z' do b[cc]:=-1;
  for i:=1 to length(q) do begin
    if (c[i] in ['A'..'Z']) and not(q[i] in ['1'..'6']) then quit(_PE,'Ожидалась цифра:'+q);
    if c[i] in ['A'..'Z'] then begin
      j:=ord(q[i])-ord('0');
      if b[c[i]]=-1 then
        if a[j]=-1 then begin
          a[j]:=1;
          b[c[i]]:=j;
          end
        else quit(_WA,'Одно и то же число сопоставлено разным буквам: '+q)
      else if b[c[i]]<>j then quit(_WA,'Одной букве сопосотавлены разные числа: '+q);
      end
    else if c[i]<>q[i] then quit(_WA,'Ожидался знак, а найдено что-то другое: '+q);
    end;
  sum:=0;
  res:=0;
  for i:=1 to length(q) do
    if q[i] in ['0'..'6'] then
      sum:=sum*10+ord(q[i])-ord('0')
    else begin
      res:=res+sum;
      sum:=0;
      end;
  if sum<>res then quit(_WA,'Равенство неверное: '+q);
  end;

begin
n:=0;
c:=inf.readstring;
while not ouf.seekeof do begin
  inc(n);
  if n>nmax then quit(_WA,'Слишком много решений');
  s[n]:=ouf.readstring;
  for i:=length(s[n]) downto 1 do
    if s[n][i]=' ' then delete(s[n],i,1);
  end;

for i:=1 to n do begin
  check(s[i]);
  end;

for i:=1 to n do
  for j:=1 to n-1 do
    if s[j]>s[j+1] then begin
      ss:=s[j];
      s[j]:=s[j+1];
      s[j+1]:=ss;
    end;
for i:=2 to n do
  begin
  if s[i-1]=s[i] then quit(_WA,'Одно решение выведено дважды');
  end;


an:=ans.readinteger;
if an=n then quit(_OK,'');
if an<n then quit(_FAIL,'Найдено больше решений, чем в ответе');
quit(_WA,'Найдены не все решения');



end.