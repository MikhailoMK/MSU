{$A+,B-,D+,E+,F-,G-,I+,L+,N-,O-,P-,Q-,R+,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
var n,m,ii,i,j,jj:integer;
    s:string;
    a:array[1..100,1..100] of integer;
begin
for ii:=16 to 16 do begin
  fillchar(a,sizeof(a),0);
  str(ii,s);
  if ii<10 then s:='0'+s;
  assign(output,'input'+s+'.txt');
  rewrite(output);
  n:=100;
  for jj:=1 to n-1 do begin
    i:=jj;
    j:=jj+1;
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
  repeat
  i:=1;
  j:=97;
  until i<>j;
  writeln(i,' ',j);
  close(output);
  end;



end.
