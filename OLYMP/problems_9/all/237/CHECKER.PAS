uses testlib;
begin
  if ans.readstring<>ouf.readstring then quit(_wa,'');
  quit(_ok,'');
end.
