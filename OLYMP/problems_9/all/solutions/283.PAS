const nmax=100;

var n:integer;
	 a:array[1..nmax,1..nmax] of integer;
	 b:array[1..nmax] of byte;
	 q:integer;

procedure rec(w,e:integer);
  var i:integer;
  begin
  b[w]:=e;
  for i:=1 to n do
	if a[w,i]=1 then
	  if b[i]=0 then rec(i,3-e)
	  else if b[i]=e then begin
			  writeln('NO');
			  close(output);
			  halt;
			  end;
  end;


procedure readdata;
  var i,j:integer;
  begin
  assign(input,'input.txt');
  reset(input);
  assign(output,'output.txt');
  rewrite(output);
  read(n);
  for i:=1 to n do
	for j:=1 to n do
	  read(a[i,j]);
  close(input);
  end;

begin
fillchar(b,sizeof(b),0);
readdata;
for q:=1 to n do
  if b[q]=0 then rec(q,1);
writeln('YES');
for q:=1 to n do
  write(b[q],' ');
close(output);



end.