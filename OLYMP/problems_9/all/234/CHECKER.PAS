uses testlib;
begin
if ans.readlongint<>ouf.readlongint then quit(_WA,'')
else quit(_OK,'');
end.