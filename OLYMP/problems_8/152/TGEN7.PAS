const n=18;
      m=18;
      s=1700;

var f1,f2:text;
    x,y,c,ss:integer;
    flag:boolean;

begin
assign(f1,'input07.txt');
rewrite(f1);
assign(f2,'input07.tx2');
rewrite(f2);
writeln(f1,n,' ',m);
writeln(f2,n,' ',m);
for x:=1 to n do begin
  for y:=1 to m do begin
    write(f1,random(50)+1,' ');
    write(f2,random(50)+1,' ');
    end;
  writeln(f1);
  writeln(f2);
  end;
writeln(f1,s);
writeln(f2,s);
x:=1;
y:=1;
writeln(f2,'1 1');
for ss:=2 to s do begin
  repeat
    c:=random(4)+1;
    flag:=true;
    if (x=n) and (c=4) then flag:=false;
    if (x=1) and (c=2) then flag:=false;
    if (y=m) and (c=1) then flag:=false;
    if (y=1) and (c=3) then flag:=false;
  until flag;
  case c of
  1:y:=y+1;
  2:x:=x-1;
  3:y:=y-1;
  4:x:=x+1;
  end;
  write(f1,c,' ');
  writeln(f2,x,' ',y);
  end;
close(f1);
close(f2);
end.



