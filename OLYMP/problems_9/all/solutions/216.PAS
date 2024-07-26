var a:array['A'..'Z'] of longint;
    c:char;

begin
assign(input,'input.txt');
reset(input);
assign(output,'output.txt');
rewrite(output);
fillchar(a,sizeof(a),0);
while not eof(input) do begin
  read(c);
  c:=upcase(c);
  if (c>='A') and (c<='Z') then inc(a[c]);
  end;
for c:='A' to 'Z' do
  writeln(c,' - ',a[c]);
close(input);
close(output);
end.

