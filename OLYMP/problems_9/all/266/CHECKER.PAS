uses testlib;
var
  ca,ja:longint;
begin
  ja:=ans.ReadLongint;
  ca:=ouf.ReadLongint;
  if ja<>ca then Quit(_WA,'Wrong answer');
  Quit(_OK,'Ok!!!');
end.