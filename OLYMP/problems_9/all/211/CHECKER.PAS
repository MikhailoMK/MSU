uses testlib;

begin
while not inf.eof do begin
  if ouf.eof then quit(_WA,'');
  if inf.readchar<>ouf.readchar then quit(_WA,'');
  end;
if ouf.eof then quit(_OK,'Wow!');
quit(_WA,'');
end.