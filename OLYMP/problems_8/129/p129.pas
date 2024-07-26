const nmax=100;

var a:array[1..nmax] of integer;
    n:integer;
    i:integer;
    b,c:integer;
    fi,fo:text;

begin
assign(fi,'input.txt');
reset(fi);
assign(fo,'output.txt');
rewrite(fo);

read(fi,n);
for i:=1 to n do read(fi,a[i]);
read(fi,b,c);

{Вы должны писать здесь}

for i:=1 to n+1 do write(fo,a[i],' ');
close(fi);
close(fo);
end.
