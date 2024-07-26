
uses testlib;
begin
  if ouf.readlongint <> ans.readlongint then quit(_WA, '') else quit(_OK, '');
end.