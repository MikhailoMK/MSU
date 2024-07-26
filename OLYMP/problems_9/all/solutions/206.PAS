{Problem Peter's game}

const nmax=100;

var a:array[1..nmax,1..2] of integer;
    b,c:array[0..nmax] of integer;
    n:integer;

procedure init;
  var i,j:integer;
  begin
  assign(input,'input.txt');
  reset(input);
  assign(output,'output.txt');
  rewrite(output);
  read(n);
  for i:=1 to n do
    for j:=1 to 2 do
      read(a[i,j]);
  fillchar(c,sizeof(c),0);
  end;

procedure work;
  var i,j,k:integer;
  begin
  for i:=0 to n-1 do begin
    k:=0;
    for j:=1 to n do
      if (c[j]=0) and (a[j,1]<=i) and (a[j,2]>=i) then begin
        if k=0 then k:=j
        else if a[j,2]<a[k,2] then k:=j;
        end;
    if k=0 then begin
      writeln(0);
      exit;
      end;
    c[k]:=1;
    b[i]:=k;
    end;

  for i:=0 to n-1 do
    write(b[i],' ');

  end;

procedure done;
  begin
  close(input);
  close(output);
  end;


begin
init;
work;
done;
end.

