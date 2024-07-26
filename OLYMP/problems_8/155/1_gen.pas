var n, i, j, k : longint;
    a          : array [1..100, 1..100] of integer;
    num        : char;
    t          : integer;
    f          : text;
begin
  for num := '1' to '9' do begin
    randomize;
    writeln('Test #', num, ', n = ');
    readln(n);
    fillchar(a, sizeof(a), 0);

    k:=0;
    for i := 1 to n do
      for j := 1 to i - 1 do begin
        if random(MaxInt) > MaxInt div 2 then begin
          t := 1;
          inc(k);
        end else
          t := 0;
        a[j, i] := t;
        a[i, j] := t;
      end;


    assign(f, 'x_' + num + '.tst');
    rewrite(f);
    writeln(f, n);
    for i := 1 to n do begin
      for j := 1 to n do
        write(f, a[j, i], ' ');
      writeln(f);
    end;
    close(f);

    assign(f, 'x_' + num + '.ans');
    rewrite(f);
    writeln(f, k);
    close(f);
  end;
end.