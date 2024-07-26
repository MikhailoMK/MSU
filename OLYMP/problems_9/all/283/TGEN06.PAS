const fname='input06.txt';

const n=18;
	  m=140;

const b:array[1..n] of boolean=(true,true,false,true,true,false,true,true,
							  false,true,false,false,false,false,true,true,
							  false,false);


var a:array[1..n,1..n] of integer;
	i,j,k:integer;

begin
assign(output,fname);
rewrite(output);
writeln(n);
for k:=1 to m do begin
  i:=random(n)+1;
  j:=random(n)+1;
  if b[i]<>b[j] then begin
	a[i,j]:=1;
	a[j,i]:=1;
	end;
  end;

for i:=1 to n do begin
  for j:=1 to n do write(a[i,j],' ');
  writeln;
  end;
close(output);
end.


end.