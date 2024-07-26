const nmax=100;

var a:array[1..nmax] of integer;
    n:integer;
    i,j,g:integer;

    f1,f2:text;

begin
assign(f1,'input.txt');
reset(f1);
assign(f2,'output.txt');
rewrite(f2);
                                  {Чтение входных данных}
read(f1,n);
for i:=1 to n do read(f1,a[i]);
                                  {Сортировка массива}

for i:=1 to n do begin            {Подбираем число на i-ое место}

  g:=i;                           {Считаем, что самое маленькое число,
                                   которое нам встретилось, стоит на месте i}

  for j:=i+1 to n do              {Перебираем все числа с i+1 до конца массива}
    if a[j]<a[g] then g:=j;       {Если нашли число, которое меньше,
                                   чем то, что уже найдено, запоминаем его}

                                  {Меняем местами числа, стоящие на i-ом и
                                   на g-ом местах }
                                  {Если a[i]=x, a[g]=y, то после выполнения
                                   команды: }
  if i<>g then begin
    a[i]:=a[i]+a[g];                {a[i]=x+y, a[g]=y}
    a[g]:=a[i]-a[g];                {a[i]=x+y, a[g]=(x+y)-y=x}
    a[i]:=a[i]-a[g];                {a[i]=(x+y)-x=y}
                                  {То есть после этого a[i]=y, a[g]=x
                                   обмен значений произошел}
    end;

  end;

                                  {Выводим результат}
for i:=1 to n do
  write(f2,a[i],' ');
close(f1);
close(f2);
end.

