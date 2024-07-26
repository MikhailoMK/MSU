uses testlib,SysUtils;
var j,i,n:longint;
    w:array[1..100,1..100]of extended;
    ja,ca:string; 
    pl:longint;
    c,p:longint;
    ww:extended;

begin
  n:=inf.readlongint;
  for i:=1 to n do
    for j:=1 to n do
      w[i,j]:=inf.readlongint;
  ja:=ans.readword(blanks,blanks);
  ca:=ouf.readword(blanks,blanks);
  if((ca<>'YES')and(ca<>'NO')) then 
    quit(_pe,'YES or NO expected');
  if(ca='NO') then
  begin
    if(ja<>'NO') then 
      quit(_wa,'Expected YES, find NO')
    else
      quit(_ok,'Answer NO');
  end
  else
  begin
    pl:=ouf.readlongint;
    ww:=0;
    if(pl<2) then
      quit(_pe,'Illegel path length');
    p:=ouf.readlongint;
    if (p<1)or(p>n) then Quit(_pe,'No such vertex: '+inttostr(p));
    for i:=2 to pl do
    begin
      c:=ouf.readlongint;
      if (c<1)or(c>n) then Quit(_pe,'No such vertex: '+inttostr(c));
      if(w[p,c]>100000.0 - 0.000001) then
        quit(_wa,'No edge');
      ww:=ww+w[p,c];
      p:=c;
    end;
    if(ww>-0.000001) then
      quit(_wa,'Path length is not negative')
    else
    begin
      if(ja='NO') then
        quit(_fail,'Students solution is better');
      quit(_ok,'Ok!!!');
    end;
  end;
end.
