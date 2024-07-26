(*

Contest: X St. Petersburg - V Kirov shcool olympiad
Problem A: Home by trains
Solution`s author: Cherepanov E.

*)
const
  maxn = 100;
  maxt = 100;
  inf = maxlongint div 2;
type
  station = record
      ns:byte;
      time:longint;
  end;
  train = record
        n:byte;
        st:array[1..maxn]of station;
        end;

var
   m,n,b,e:byte;
   tr:array[1..maxt]of train;
   time:array[0..maxn]of longint;
   ok:array[0..maxn]of boolean;

procedure readdata;
var
 i,j:integer;
begin
  assign(input,'b.in');
  reset(input);
  read(n,e,m);
  b:=1;
  for i:=1 to m do
    begin
      read(tr[i].n);
      for j:=1 to tr[i].n do
        read(tr[i].st[j].ns, tr[i].st[j].time);
    end;
  close(input);
end;

procedure writedata;
begin
  assign(output,'b.out');
  rewrite(output);
  writeln(time[e]);
  close(output);
end;

procedure update(st:byte);
var
 i,j,k:byte;
begin
  ok[st]:=true;
  for i:=1 to m do
    for j:=1 to tr[i].n do
       if (tr[i].st[j].ns = st) and (tr[i].st[j].time >= time[st]) then
         for k:= j+1 to tr[i].n do
           if tr[i].st[k].time < time[tr[i].st[k].ns] then
              time[tr[i].st[k].ns] := tr[i].st[k].time;

end;

procedure solve;
var
 i,min:byte;
begin
  for i:=0 to n do
    begin
      time[i] := inf;
      ok[i] := false;
    end;
  time[b] := 0;
  while not ok[e] do
     begin
       min :=0;
       for i:=1 to n do
         if not ok[i] then
            if time[i] < time[min] then min := i;
       if min < 1 then break;
       update(min);
     end;
  if not ok[e] then time[e] := -1;

end;

begin
  readdata;
  solve;
  writedata;
end.
