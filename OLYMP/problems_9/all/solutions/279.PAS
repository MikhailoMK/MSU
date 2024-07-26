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
  if w>0 then begin
    a[q]:=2;
    gen(q+1,w-1);
    end;
  for i:=4 to 5 do begin
    a[q]:=i;
    gen(q+1,w);
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