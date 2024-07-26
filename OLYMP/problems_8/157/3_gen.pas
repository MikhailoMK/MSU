var num         : char;
    i, j, n, k  : longint;
    a           : array [1..100, 1..100] of byte;
    b           : array [1..100] of integer;
    f           : text;
begin
  for num := '1' to '9' do begin
    assign(f, 'x_' + num + '.tst');
    rewrite(f);
    write('test #', num, ': ');
    readln(n);
    writeln(f, n);
    fillchar(b, sizeof(b), 0);
    fillchar(a, sizeof(a), 0);
    for i := 1 to n do begin
      for j := 1 to i-1 do begin
        a[j, i] := random(2);
        a[i, j] := a[j, i];
      end;
      b[i] := random(3) + 1;
    end;
    for i := 1 to n do begin
      for j := 1 to n do
        write(f, a[j, i], ' ');
      writeln(f);
    end;
    writeln(f);
    for i := 1 to n do
      write(f, b[i], ' ');
    writeln(f);
    close(f);

    assign(f, 'x_' + num + '.ans');
    rewrite(f);
    k := 0;
    for i := 1 to n do
      for j := 1 to i-1 do
        if (b[i]<>b[j]) and (a[i, j]=1) then
          inc(k);
    writeln(f, k);
    close(f);
  end;
end.