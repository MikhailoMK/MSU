uses testlib;

var s1,s2:string;
    c1,c2:char;

const chars:set of char=['0','1','2','3','4','5','6','7','8','9','-',','];

begin
while not ans.seekeof do begin
  s1:='';
  s2:='';
  while length(s1)<100 do begin
    if ans.seekeof then s1:=s1+'#'
    else begin
         c1:=ans.readchar;
         if c1 in chars then s1:=s1+c1;
         end;
    end;

  while length(s2)<100 do begin
    if ouf.seekeof then s2:=s2+'#'
    else begin
         c2:=ouf.readchar;
         if c2 in chars then s2:=s2+c2;
         end;
    end;

  if s1<>s2 then quit(_WA,'');
  end;
if ouf.seekeof then quit(_OK,'');
quit(_WA,'');
end.

