uses testlib;
var s:string;

begin
s:=ouf.readstring;
if ans.readstring=s then quit(_OK,'');
if (s='URA') or (s='NO') then quit(_WA,'');
quit(_PE,'В выходном файле недопустимое сообщение');
end.