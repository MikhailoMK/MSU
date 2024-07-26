{$A+,B-,D+,E+,F-,G-,I+,L+,N-,O-,P-,Q+,R+,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
const ABTOP='Don ALximik!';
      test01='1 1 2 3 2 0';
      test02='4 3 2 1 1 0';
      test03='1 1 0';
      test04='1 0 0';
      test05='1 1 0';
      test06='1 1 0';
      test07='1 1 0';
      test08='1 1 0';
      test09='1 1 0';
      test01_out='2 1 32';
      test02_out='1 3211';
      test03_out='1 1';
      test04_out='1 0';
      test05_out='1 1';
      test06_out='1 1';
      test07_out='1 1';
      test08_out='1 1';
      test09_out='1 1';
      Fin='input';
      Fout='output';
      txt='.txt';
var w,www,N:integer;
    s:string;
    T:text;
procedure Buildtest(j,k:integer);
var T1,t2:text;
    N,z,d,www,w:Longint;
Begin
N:=random(1000)+1;
assign (T1,Fin+chr(j+48)+chr(k+48)+txt);
writeln ('test'+chr(j+48)+chr(k+48));
rewrite(T1);
assign (T2,Fout+chr(j+48)+chr(k+48)+txt);
rewrite(T2);
writeln(T2,N);
for www:=1 to N do
Begin
  z:=random(4)+1;
  write (T1,z,' ');
  d:=random(9)+1;
  write(T1,d,' ');
  write (t2,d);
  for w:=2 to z do
  Begin
    d:=random (10);
    write (t2,d);
    write(T1,d,' ');
  end;
  writeln (T2,' ');
  writeln(T1);
End;
write(t1,' 0');
close(T1);
close(t2);

End;
Begin
for www:=1 to 9 do
  for w:=0 to 9 do
    buildtest(www,w);
assign(T,'input01.txt');
rewrite(T);
write (T,test01);
close(T);
assign(T,'output01.txt');
rewrite(T);
write (T,test01_out);
close(T);
assign(T,'input02.txt');
rewrite(T);
write (T,test02);
close(T);
assign(T,'output02.txt');
rewrite(T);
write (T,test02_out);
close(T);
assign(T,'input03.txt');
rewrite(T);
write (T,test03);
close(T);
assign(T,'output03.txt');
rewrite(T);
write (T,test03_out);
close(T);
assign(T,'input04.txt');
rewrite(T);
write (T,test04);
close(T);
assign(T,'output04.txt');
rewrite(T);
write (T,test04_out);
close(T);
assign(T,'input05.txt');
rewrite(T);
write (T,test05);
close(T);
assign(T,'output05.txt');
rewrite(T);
write (T,test05_out);
close(T);
assign(T,'input06.txt');
rewrite(T);
write (T,test06);
close(T);
assign(T,'output06.txt');
rewrite(T);
write (T,test06_out);
close(T);
assign(T,'input07.txt');
rewrite(T);
write (T,test07);
close(T);
assign(T,'output07.txt');
rewrite(T);
write (T,test07_out);
close(T);
assign(T,'input08.txt');
rewrite(T);
write (T,test08);
close(T);
assign(T,'output08.txt');
rewrite(T);
write (T,test08_out);
close(T);
assign(T,'input09.txt');
rewrite(T);
write (T,test09);
close(T);
assign(T,'output09.txt');
rewrite(T);
write (T,test09_out);
close(T);









End.
