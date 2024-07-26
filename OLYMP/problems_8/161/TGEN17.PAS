{$A+,B-,D+,E+,F-,G-,I+,L+,N-,O-,P-,Q-,R+,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
var n,m,ii,i,j,jj:integer;
    s:string;
    a:array[1..100,1..100] of integer;
begin
for ii:=17 to 25 do begin
  fillchar(a,sizeof(a),0);
  str(ii,s);
  if ii<10 then s:='0'+s;
  assign(output,'input'+s+'.txt');
  rewrite(output);
  n:=random(95)+5;
  m:=random((n*(n-1) div 2)-n);
  for jj:=1 to m do begin
    i:=random(n)+1;
    j:=random(n)+1;
    if i<>j then begin
      a[i,j]:=1;
      a[j,i]:=1;
      end;
    end;
  writeln(n);
  for i:=1 to n do begin
    for j:=1 to n do write(a[i,j],' ');
    writeln;
    end;
  i:=random(n)+1;
  j:=random(n)+1;
  writeln(i,' ',j);
  close(output);
  end;



end.
