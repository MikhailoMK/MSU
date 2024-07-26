const nmax=20;

var a:array[1..nmax,1..nmax] of integer;
    n:integer;
    min:integer;
    ans:integer;
    answ,c:array[1..nmax] of integer;
    cur:integer;
    b:array[1..nmax] of integer;

procedure init;
  var i,j:integer;
  begin
  assign(input,'input.txt');
  reset(input);
  assign(output,'output.txt');
  rewrite(output);
  read(n);
  min:=maxint;
  for i:=1 to n do
    for j:=1 to n do begin
      read(a[i,j]);
      if (a[i,j]<>0) and (a[i,j]<min) then min:=a[i,j];
      end;
  ans:=maxint;
  cur:=0;
  fillchar(b,sizeof(b),0);
  end;

procedure check;
  begin
  if a[c[n],c[1]]=0 then exit;
  cur:=cur+a[c[n],c[1]];
  if cur<ans then begin
    ans:=cur;
    answ:=c;
    end;
  cur:=cur-a[c[n],c[1]];
  end;


procedure rec(q:integer);
  var i:integer;
  begin
  if q=n+1 then begin check;exit; end;
  if cur+min*(n-q+1)>ans then exit;
  for i:=2 to n do
    if (b[i]=0) and (a[c[q-1],i]>0) then begin
      c[q]:=i;
      b[i]:=1;
      cur:=cur+a[c[q-1],i];
      rec(q+1);
      b[i]:=0;
      cur:=cur-a[c[q-1],i];
      end;
  end;

procedure done;
  var i:integer;
  begin
{  for i:=1 to n do
    write(answ[i],' ');
  writeln(answ[1]);    }
  write(ans);
  close(input);
  close(output);
  end;



begin
init;
c[1]:=1;
b[1]:=1;
rec(2);
done;
end.

