unit map;

interface
const up=1;
      right=2;
      down=3;
      left=4;

procedure whereami(var xx,yy,u,r,d,l:byte);
function move(q:byte):byte;

implementation
uses crt;


const nmax=30;
var
  n,m:integer;
  a:array[1..nmax,1..nmax] of byte;
  x,y:integer;
  mode:longint;

  mc:longint;

  f:text;

procedure quitfile(s:string);
  begin
  close(f);
  writeln('Ошибка в файле map.txt: ',s);
  halt(43);
  end;

procedure readfile;
  var i,j:integer;
  begin
  assign(f,'map.txt');
  reset(f);
  read(f,mode);
  read(f,n,m);
  if (n<1) or (n>nmax) or (m<1) or (m>nmax) then quitfile('Недопустимое значение одного из размеров карты');
  for i:=1 to n do
    for j:=1 to m do
      begin
      read(f,a[j,i]);
      if not (a[j,i] in [0,1,2]) then quitfile('Странное число на карте');
      end;
  read(f,x,y);
  if (x<1) or (x>m) or (y<1) or (y>n) then quitfile('Начальные координаты не попали на карту');
  close(f);
  end;

procedure showmap;
  var i,j:integer;
  begin
  if mode=0 then exit;
  clrscr;
  for i:=1 to n do begin
    for j:=1 to m do
      case a[j,i] of
      0:write(' ');
      1:write('#');
      2:write('$');
      end;
    writeln;
    end;
  end;

procedure gameend;
  begin
  if mode>0 then begin
    gotoxy(x,y);
    write('@');
    gotoxy(1,n+2);
    writeln('КЛАД НАЙДЕН! Сделано ',mc,' ходов');
    end;
  assign(f,'output.txt');
  rewrite(f);
  writeln(f,'1543 ',mc);
  close(f);
  halt;
  end;


function setgamer(nx,ny:integer):byte;
  begin
  if (nx<1) or (nx>m) or (ny<1) or (ny>n) then begin
    setgamer:=1;
    exit;
    end;
  if a[nx,ny]=1 then begin
    setgamer:=1;
    exit;
    end;
  x:=nx;
  y:=ny;
  if a[nx,ny]=2 then gameend;
  setgamer:=0;
  if mode=0 then exit;
  gotoxy(x,y);
  write('@');
  delay(mode*100);
  end;

procedure getgamer;
  begin
  if mode=0 then exit;
  gotoxy(x,y);
  write(' ');
  end;

function whatis(x,y:integer):byte;
  begin
  if (x<1) or (x>m) or (y<1) or (y>n) then begin
    whatis:=1;
    exit;
    end;
  whatis:=a[x,y];
  end;

procedure whereami(var xx,yy,u,r,d,l:byte);
  begin
  xx:=x;
  yy:=y;
  u:=whatis(x,y-1);
  r:=whatis(x+1,y);
  d:=whatis(x,y+1);
  l:=whatis(x-1,y);
  end;

function move(q:byte):byte;
  begin
  inc(mc);
  getgamer;
  case q of
    up:move:=setgamer(x,y-1);
    right:move:=setgamer(x+1,y);
    down:move:=setgamer(x,y+1);
    left:move:=setgamer(x-1,y);
    end;
  end;



begin
mc:=0;
readfile;
showmap;
if setgamer(x,y)<>0 then begin
  writeln('Не удалось поставить человека в указанные координаты');
  runerror(43);
  end;
end.


