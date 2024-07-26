{Problem "List"}

var n,m:longint;

procedure init;
  begin
  assign(input,'input.txt');
  reset(input);
  assign(output,'output.txt');
  rewrite(output);
  read(n,m);
  end;

procedure out(fir,last,flag:longint);
  begin
  if fir<last then write(fir,'-',last)
  else write(fir);
  if flag=1 then write(',');
  end;

procedure work;
  var i:longint;
      pr,fir:longint;
      cur:longint;
  begin
  pr:=-1;
  fir:=-1;
  for i:=1 to m do begin
    read(cur);
    if cur=pr+1 then pr:=cur
    else begin
      if fir>0 then out(fir,pr,1);
      fir:=cur;
      pr:=cur;
      end;
    end;
  out(fir,pr,0);
  end;

procedure done;
  begin
  if not(seekeof(input)) then writeln('NOT END!!!');
  close(input);
  close(output);
  end;

begin
init;
work;
done;
end.


