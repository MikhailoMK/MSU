(* Летние сборы по информатике. 27 июня 1999 *)
(* Задача 1 "Сжатие текста"                  *)
(* Решение Виктора Матюхина                  *)

{$A+,B-,D+,E+,F-,G-,I-,L+,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 65520,0,655360}

const rmax=52;

var n,r:integer;
    p:array[1..rmax] of record
      c:char;
      s:string;
      end;
    a:array[0..255] of byte;
    b:array[0..255] of byte;
    tnum:integer;
    s:string;

procedure init;
  var i:integer;
      c:char;
  begin
  assign(input,'input.txt');
  reset(input);
  assign(output,'output.txt');
  rewrite(output);
  readln(r,n);
  for i:=1 to r do begin
    readln(p[i].s);
    readln(p[i].c);
    end;
  end;

procedure work;
  var i,j:byte;
      q:string;
      w:byte;
  begin
  fillchar(a,sizeof(a),0);
  a[0]:=1;
  b[0]:=0;
  for i:=1 to length(s) do begin
    a[i]:=a[i-1]+1;
    b[i]:=0;
    for j:=1 to r do begin
      w:=length(p[j].s);
      if w<=i then
        if a[i-w]+1<a[i] then
          if copy(s,i-w+1,w)=p[j].s then begin
             a[i]:=a[i-w]+1;
             b[i]:=j;
             end;
      end;
    end;
  q:='';
  i:=length(s);
  while i<>0 do
    if b[i]=0 then begin
       q:=s[i]+q;
       dec(i);
       end
    else begin
       q:=p[b[i]].c+q;
       i:=i-length(p[b[i]].s);
       end;
  writeln(q);
  end;





begin
init;
for tnum:=1 to n do begin
  readln(s);
  work;
  end;
close(input);
close(output);
end.
