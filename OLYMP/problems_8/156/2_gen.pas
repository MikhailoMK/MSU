var n, i, j, k : longint;
    a          : array [1..100] of integer;
    b          : array [1..5000, 1..2] of integer;
    num        : char;
    t          : integer;
    f          : text;

procedure swap (var a, b : integer);
var t : integer;
begin
  t := a;
  a := b;
  b := t;
end;

begin
  for num := '1' to '9' do begin
    randomize;
    writeln('Test #', num, ', n = ');
    readln(n);
    fillchar(a, sizeof(a), 0);
    k := 0;

    for i := 1 to n do
      for j := 1 to i - 1 do
        if random(MaxInt) > MaxInt div 2 then begin
          inc(a[i]);
          inc(a[j]);
          inc(k);
          b[k, 1] := i;
          b[k, 2] := j;
        end;


    for i := 1 to k do begin
      j := random(k)+1;
      t := random(k)+1;
      swap(b[t, 1], b[j, 1]);
      swap(b[t, 2], b[j, 2]);
    end;

    assign(f, 'y_' + num + '.tst');
    rewrite(f);
    writeln(f, n, ' ', k);
    for i := 1 to k do
      writeln(f, b[i, 1], ' ', b[i, 2]);
    close(f);

    assign(f, 'y_' + num + '.ans');
    rewrite(f);
    for i := 1 to n do
      write(f, a[i], ' ');
    writeln(f);
    close(f);
  end;
end.