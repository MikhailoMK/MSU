const nmax=10;

var n:integer;
    a:array[1..nmax] of integer;

procedure gen(q,w:integer);
  var i:integer;
  begin
  if q=n+1 then begin
    for i:=1 to n do write(a[i],' ');
    writeln;
    exit;
    end;
  for i:=5 downto 4 do begin
    a[q]:=i;
    gen(q+1,w);
    end;
  if w>0 then begin
    a[q]:=3;
    gen(q+1,w-1);
    end;
  end;


begin
assign(input,'input.txt');
reset(input);
assign(output,'output.txt');
rewrite(output);
read(n);
gen(1,2);
close(input);
close(output);
end.