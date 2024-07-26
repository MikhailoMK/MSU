var s:string;
    s1:string;
    a,b:longint;
    ss:string;
    e:integer;

procedure readlexem;
  begin
  s1:='';
  while s[1]=' ' do delete(s,1,1);
  if s[1] in ['*','+','-','='] then begin
    s1:=s[1];
    delete(s,1,1);
    exit;
    end;
  while s[1] in ['0'..'9'] do begin
    s1:=s1+s[1];
    delete(s,1,1);
    end;
  end;

begin
assign(input,'input.txt');
reset(input);
assign(output,'output.txt');
rewrite(output);
readln(s);
s:=s+'$';
readlexem;
val(s1,a,e);
readlexem;
ss:=s1;
readlexem;
val(s1,b,e);
if ss='+' then writeln(a+b);
if ss='-' then writeln(a-b);
if ss='*' then writeln(a*b);
close(input);
close(output);
end.
