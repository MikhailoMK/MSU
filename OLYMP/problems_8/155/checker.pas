uses
  testlib;

begin
  if ans.readinteger <> ouf.readinteger then
    quit(_wa, '')
  else
    quit(_ok, '');
end.
