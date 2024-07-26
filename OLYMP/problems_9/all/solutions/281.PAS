var n:integer;
    m:longint;
    a:array[1..100,1..100] of byte;
    b:array[1..100] of byte;
    i,j,k:integer;
    an:integer;

procedure rec(v:integer);
  var i:integer;
  begin
  b[v]:=1;
  for i:=1 to n do
    if (b[i]=0) and (a[v,i]=1) then rec(i);
  end;

begin
assign(input,'input.txt');
reset(input);
assign(output,'output.txt');
rewrite(output);
read(n,m);
for k:=1 to m do begin
  read(i,j);
  a[i,j]:=1;
  a[j,i]:=1;
  end;
an:=0;
for k:=1 to n do
  if b[k]=0 then begin
    inc(an);
    rec(k);
    end;
writeln(an);
close(input);
close(output);
end.
