uses
  testlib;

var
  a, o: string;

begin
  a := ans.readstring;
  o := ouf.readstring;

  if ((a = 'YES') and (o='yes')) or (a=o) then
    quit(_ok, '');
  if ((a = 'NO') and (o='no')) or (a=o) then
    quit(_ok, '');
  quit(_wa, '');
end.
