uses testlib;

begin
if ouf.readlongint=ans.readlongint then quit(_OK,'')
else quit(_WA,'');
end.