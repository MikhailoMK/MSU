uses testlib;
begin
if ans.readlongint=ouf.readlongint then quit(_OK,'');
quit(_WA,'');
end.