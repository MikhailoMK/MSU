uses testLib;

var ansn, oufn : longint;

begin
  oufn := ouf.readlongInt;
  ansn := ans.readlongInt;

  if ansn <> oufn then
    QUIT(_WA,'')
  else
    QUIT(_Ok,'');
end.
