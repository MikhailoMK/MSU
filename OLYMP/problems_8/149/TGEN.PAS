{$A+,B-,D+,E+,F-,G-,I+,L+,N-,O-,P-,Q-,R+,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
var i,ii,n,j,k:integer;
    s:string;
    a:array[1..100,1..100] of integer;
begin
for ii:=1 to 13 do begin
  fillchar(a,sizeof(a),0);
  str(ii,s);
  if ii<10 then s:='0'+s;
  assign(output,'input'+s+'.txt');
  rewrite(output);
  if ii<=4 then n:=ii
  else n:=(ii-4)*10+random(5)+1;
  writeln(n);
  for i:=1 to n do begin
    for j:=1 to n do begin
      k:=random(101);
      a[i,j]:=a[i,j]+k;
      write(k,' ');
      end;
    writeln;
    end;
  for i:=1 to n do begin
    for j:=1 to n do begin
      k:=random(101);
      a[i,j]:=a[i,j]+k;
      write(k,' ');
      end;
    writeln;
    end;
  close(output);
  assign(output,'answer'+s+'.txt');
  rewrite(output);
  for i:=1 to n do begin
    for j:=1 to n do begin
      write(a[i,j],' ');
      end;
    writeln;
    end;
  close(output);

  end;
end.
