const nmax=10;
      start=1;
      finish=6;

var a:array[1..nmax] of integer;
    b:array[0..nmax] of integer;
    c:array[1..10] of char;
    cc:array['A'..'Z'] of integer;
    cu:integer;
    s:string;

procedure print;
  var i:integer;
  begin
  for i:=1 to length(s) do
    if not (s[i] in ['+','=','#',' ']) then
      write(a[cc[s[i]]])
    else if (s[i]='+') or (s[i]='=') then write(s[i]);
  writeln;
  end;

procedure check;
  var i:integer;
      cur,sum:longint;
  begin
  sum:=0;
  cur:=0;
  for i:=1 to length(s) do begin
    if not (s[i] in ['+','=','#',' ']) then
      cur:=cur*10+a[cc[s[i]]]
    else
      if (s[i]='+') or (s[i]='=') then begin
        sum:=sum+cur;
        cur:=0;
        end;
    end;
  if sum=cur then print;
  end;

procedure prepare;
  var i,j,fl:integer;
  begin
  cu:=0;
  s:=s+'#';
  for i:=1 to length(s) do
    if not (s[i] in ['+','=','#',' ']) then begin
      fl:=0;
      for j:=1 to cu do
        if c[j]=s[i] then fl:=1;
      if fl=0 then begin
        inc(cu);
        c[cu]:=s[i];
        cc[s[i]]:=cu;
        end;
      end;
  end;


procedure gen(x:integer);
  var i:integer;
  begin
  if x=cu+1 then begin
    check;
    exit;
    end;
  for i:=start to finish do
    if b[i]=0 then begin
      a[x]:=i;
      b[i]:=1;
      gen(x+1);
      b[i]:=0;
      end;

  end;

begin
assign(input,'input.txt');
reset(input);
assign(output,'output.txt');
rewrite(output);
fillchar(b,sizeof(b),0);
readln(s);
prepare;
gen(1);
close(input);
close(output);
end.
