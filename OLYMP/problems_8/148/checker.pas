uses
  testlib;

begin
  while (not ans.seekeof) and (not ouf.seekeof) do begin
    if ouf.readlongint <> ans.readlongint then
      quit(_wa, '');
  end;
  if ans.seekeof <> ouf.seekeof then
    quit(_wa, '');

  quit(_ok, '');
end.
