uses testlib;
var
  i,j,n,m:longint;
  ja,ca:longint;
begin
  n:=inf.ReadLongint;
  m:=inf.ReadLongint;
  for i:=1 to n do begin
    for j:=1 to m do begin
      ca:=ouf.ReadLongint;
      ja:=ans.ReadLongint;
      if ca<>ja then Quit(_WA,'Incorrect distance');
    end;
  end;
  Quit(_OK,'Ok!!!');
end.