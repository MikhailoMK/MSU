uses testlib;

var a,b,c:array[1..3] of integer;

    n,i,k:longint;
    d:integer;
    s:string;
    o,p:longint;

procedure readoutput;
  var j:integer;
  begin
  for j:=1 to 3 do begin
    a[j]:=ouf.readinteger;
    c[j]:=0;
    end;
  end;

procedure readanswer;
  var j:integer;
  begin
  for j:=1 to 3 do
    b[j]:=ans.readinteger;
  end;


begin
readoutput;
readanswer;
n:=inf.readlongint;
for i:=1 to n do begin
  d:=inf.readinteger;
  for k:=1 to 3 do
    if (a[k]=d) and (c[k]=0) then
      begin
      c[k]:=1;
      break;
      end;
  end;

d:=0;
for k:=1 to 3 do
  if c[k]=0 then d:=k;

if d<>0 then begin
  str(a[d],s);
  quit(_WA,'Number '+s+' is not a member of sequence');
  end;

o:=1;
p:=1;
for k:=1 to 3 do begin
  o:=o*a[k];
  p:=p*b[k];
  end;

if o<p then quit(_WA,'Product is not maximal');
if p>o then quit(_Fail,'Solution better, then jury');
quit(_OK,'');
end.



