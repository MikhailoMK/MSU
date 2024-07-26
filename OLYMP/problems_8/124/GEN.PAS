{$A+,B-,D+,E+,F-,G-,I+,L+,N+,O-,P-,Q+,R+,S+,T-,V+,X+,Y+}
{$M 50000,0,655360}

Const MaxN=100;
      MaxV=154;
      MaxP=100;

var p,v:Array[1..MaxN] of Longint;
    N:Longint;
    i,j,k,T:Longint;
    s:String;
begin
Assign(Input,'TestNum');
Reset(Input);
Read(T);
Close(Input);

for k:=1 to T do
begin
  if k=1 then
  begin
    N:=1; p[1]:=1; v[1]:=1;
  end
  else if k=2 then
  begin
    N:=2; v[1]:=1; v[2]:=2; p[1]:=3; p[2]:=2;
  end
  else if k=3 then
  begin
    N:=3; v[1]:=100; v[2]:=1; v[3]:=50; p[1]:=0; p[2]:=100; p[3]:=3;
  end
  else if k=4 then
  begin
    N:=3; v[1]:=4; v[2]:=4; v[3]:=4; p[1]:=80; p[2]:=60; p[3]:=80;
  end
  else if (k=5) OR (k=21) then
  begin
    N:=5;
    for i:=1 to N do
    begin
      v[i]:=i;
      p[i]:=N+1-i;
    end;
  end
  else if k=6 then
  begin
    N:=5; v[1]:=0; v[2]:=154; v[3]:=153; v[4]:=120; v[5]:=40; p[1]:=100; p[2]:=20; p[3]:=30; p[4]:=40; p[5]:=100;
  end
  else
  begin
    N:=Random(MaxN)+1;
    for i:=1 to N do
    begin
      v[i]:=Random(MaxV)+1;
      p[i]:=Random(MaxP+1);
    end;
  end;

  Str(k,s);
  if k<10 then s:='0'+s;
  Assign(Output,'input'+s+'.txt');
  Rewrite(Output);
  Writeln(N);
  for i:=1 to N do
    Write(v[i],' ');
  Writeln;
  for i:=1 to N do
    Write(p[i],' ');
  Close(Output);

end;
end.