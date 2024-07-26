const max=10000;

var rr,m,n,i,j,out:longint;
    w,r:array[1..max]of int64;
    a,b:array[1..max]of longint;
    inf:int64;
    q:integer;

begin
  inf:=int64(1000000000)*int64(1000000);
  assign(input,'input.txt');
  reset(input);
  assign(output,'output.txt');
  rewrite(output);

  read(n,m);
  for i:=1 to m do
    begin
      read(a[i],b[i],q);
      w[i]:=-q;
    end;

  for i:=1 to n do
    r[i]:=inf;
  r[1]:=0;
  for i:=1 to n do
    for j:=1 to m do
      if (r[b[j]]>r[a[j]]+w[j])and(r[a[j]]<inf) then
        r[b[j]]:=r[a[j]]+w[j];
  if r[n]=inf then
    out:=0
  else
    begin
      out:=2;
      rr:=r[n];
      for i:=1 to n do
        for j:=1 to m do
          if (r[b[j]]>r[a[j]]+w[j])and(r[a[j]]<inf) then
            r[b[j]]:=r[a[j]]+w[j];
      if r[n]<rr then
        out:=1;
    end;
  case out of
  0:write(':(');
  1:write(':)');
  2:write(-r[n]);
  end;

  close(input);
  close(output);
end.
