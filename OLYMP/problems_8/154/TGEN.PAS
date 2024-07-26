{$A+,B-,D+,E+,F-,G-,I+,L+,N-,O-,P-,Q-,R+,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
var i,ii,n,m,j,k:integer;
    s:string;
    a:array[1..100,1..100] of integer;
begin
for ii:=3 to 8 do begin
  fillchar(a,sizeof(a),0);
  str(ii,s);
  if ii<10 then s:='0'+s;
  assign(output,'input'+s+'.txt');
  rewrite(output);
  n:=random(20)+1;
  m:=random(20)+1;
  writeln(n,' ',m);
  for i:=1 to n do begin
    for j:=1 to m do
      write(random(100),' ');
    writeln;
    end;
  close(output);

  end;
end.
