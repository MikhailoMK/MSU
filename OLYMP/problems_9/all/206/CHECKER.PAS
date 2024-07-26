uses testlib;

const nmax=100;

var n:integer;
    a:array[1..nmax,1..2] of integer;
    b:array[0..nmax-1] of integer;
    c:array[1..nmax] of integer;
    nofl:integer;

procedure readinput;
  var i,j:integer;
  begin
  n:=inf.readinteger;
  for i:=1 to n do
    for j:=1 to 2 do
      a[i,j]:=inf.readinteger;
  end;

procedure readoutput;
  var i,q:integer;
      s:string;
  begin
  fillchar(c,sizeof(c),0);
  q:=ouf.readinteger;
  if q=0 then begin
    nofl:=1;
    exit;
    end;
  nofl:=0;
  b[0]:=q;
  for i:=1 to n-1 do
    b[i]:=ouf.readinteger;

  for i:=0 to n-1 do begin
    str(b[i],s);
    if (b[i]<1) or (b[i]>n) then quit(_PE,'Wrong number of guest: '+s);
    if c[b[i]]=1 then quit(_WA,'Guest number '+s+' included to game more then once');
    if not ((i>=a[b[i],1]) and (i<=a[b[i],2])) then quit(_WA,'Guest number '+s+' cannot be included to game at this time');
    c[b[i]]:=1;
    end;
  end;


procedure check;
  var an:integer;
  begin
  an:=ans.readinteger;
  if (an=0) and (nofl=1) then quit(_OK,'No solution');
  if (an=0) and (nofl=0) then quit(_FL,'Jury answer NO SOLUTION when solution is exists');
  if (an=1) and (nofl=1) then quit(_WA,'Answer NO SOLUTION when solution is exists');
  if (an=1) and (nofl=0) then quit(_OK,'Solution is exists');
  quit(_FL,'Bug in checker');
  end;






begin
readinput;
readoutput;
check;
end.
