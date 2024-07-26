uses map;

const nmax=30;

var a:array[1..nmax,1..nmax] of byte;
    x,y:byte;
    u,r,d,l:byte;

procedure rec;
  begin
  if a[x,y]=1 then exit;
  a[x,y]:=1;

  if move(up)=0 then begin
    y:=y-1;
    rec;
    y:=y+1;
    move(down);
    end;
  if move(right)=0 then begin
    x:=x+1;
    rec;
    x:=x-1;
    move(left);
    end;
  if move(down)=0 then begin
    y:=y+1;
    rec;
    y:=y-1;
    move(up);
    end;
  if move(left)=0 then begin
    x:=x-1;
    rec;
    x:=x+1;
    move(right);
    end;
  end;



begin
fillchar(a,sizeof(a),0);
whereami(x,y,u,r,d,l);
rec;


end.