{$A+,B-,D+,E+,F-,G-,I+,L+,N+,O-,P+,Q+,R+,S+,T-,V+,X+,Y+}
{$M 50000,0,65536}

{Task for children}

Const MaxN=100;

var p,v:Array[1..MaxN] of Longint;
    N:Longint;
    i,j,T:Longint;
    InputFile,OutputFile:String;

Procedure FRead;
begin
Assign(Input,INPUTFILE);
Reset(Input);
Read(N);
for i:=1 to N do
  Read(v[i]);
for i:=1 to N do
  Read(p[i]);
Close(Input);
end;

Procedure FWrite(Answer:Longint);
begin
Assign(Output,OUTPUTFILE);
Rewrite(Output);
Writeln(Answer);
Close(Output);
end;

Procedure Solve;
begin
j:=1;
for i:=1 to N do
  if p[i]*v[i]>p[j]*v[j] then j:=i;
FWrite(j);
end;

var k:Longint;
    s:String;
begin
Assign(Input,'TestNum');
Reset(Input);
Read(T);
Close(Input);

for k:=1 to T do
begin
  Str(k,s);
  if k<10 then s:='0'+s;
  InputFile:='input'+s+'.txt';
  OutputFile:='answer'+s+'.txt';
  FRead;
  Solve;
end;
end.