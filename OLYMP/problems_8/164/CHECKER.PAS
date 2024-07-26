uses testlib;

begin
 if ans.readlongint<>ouf.readlongint then quit(_wa,'');
 quit(_ok,'');
end.