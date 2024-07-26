uses testlib;
begin
while not ans.seekeof do
  if ouf.readinteger<>ans.readinteger then quit(_WA,'');
quit(_OK,'');
end.