var i,j,k:integer;
    a:array[1..100,1..100] of integer;
    b:array[1..100] of integer;


function findfirst:integer;
  var j:integer;
  begin
  j:=random(100)+1;
  while b[j]=0 do begin
    j:=j+1;
    if j=101 then j:=1;
    end;
  findfirst:=j;
  end;

function findsecond:integer;
  var j:integer;
  begin
  j:=random(100)+1;
  while b[j]=1 do begin
    j:=j+1;
    if j=101 then j:=1;
    end;
  findsecond:=j
  end;





begin
assign(output,'input09.txt');
rewrite(output);
writeln(100);
fillchar(a,sizeof(a),0);
b[1]:=1;
for i:=1 to 99 do begin
  j:=findfirst;
  k:=findsecond;
  a[j,k]:=1;
  a[k,j]:=1;
  b[k]:=1;
  end;

for i:=1 to 3 do begin
  repeat
    j:=random(100)+1;
    k:=random(100)+1;
  until (j<>k) and (a[j,k]=0);
  a[j,k]:=1;
  a[k,j]:=1;
  end;

for i:=1 to 100 do begin
  for j:=1 to 100 do write(a[i,j],' ');
  writeln;
  end;
close(output);
end.
