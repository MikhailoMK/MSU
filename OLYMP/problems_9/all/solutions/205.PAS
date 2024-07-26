{Problem "Metro"}

var r1,k1,r2,k2:longint;
    ans:longint;

procedure init;
  var k:longint;
  begin
  assign(input,'input.txt');
  reset(input);
  assign(output,'output.txt');
  rewrite(output);
  read(r1,k1,r2,k2);
  r1:=r1 mod 6;
  r2:=r2 mod 6;
  if k1>k2 then begin
    k:=k1;
    k1:=k2;
    k2:=k;
    end;

  end;

function dist(r1,r2:longint):integer;
  begin
  if r1=r2 then begin
    dist:=0;
    exit;
    end;
  if abs(r1-r2)=3 then begin
    dist:=3;
    exit;
    end;
  if (r1=(r2+1) mod 6) or (r2=(r1+1) mod 6) then begin
    dist:=1;
    exit;
    end;
  dist:=2;
  end;

procedure solve;
  begin
  case dist(r1,r2) of
    0:ans:=k2-k1;
    1:ans:=k2-k1+k1;
    2:ans:=k2-k1+k1*2;
    3:ans:=k1+k2;
    end;
  end;

procedure done;
  begin
  writeln(ans);
  close(input);
  close(output);
  end;

begin
init;
solve;
done;
end.