{Task N. Solution}
{Copyright(r) CMC MSU}

program NSolve;
var Symbol:array[1..100] of char;
    RepeatsCount:array[1..100] of integer;
    N:integer;                {
    S:string;                }
procedure Init;
var ch:char;
    C:integer;
begin                 {
  if paramcount=0 then
    begin              }
      assign(input,'input.txt'); {
    end
  else
    begin
      s:=paramstr(1);
      assign(input,s);
    end;                     }
  reset(input);
  N:=0;
  while not seekeoln(input) do
    begin
      inc(N);
      read(ch);
      if ch in ['0'..'9'] then
        begin
          C:=0;
          while ch in ['0'..'9'] do
            begin
              C:=C*10+ord(ch)-48;
              read(ch);
            end;
        end
      else
        C:=1;
      Symbol[N]:=ch;
      RepeatsCount[N]:=C;
    end;
  close(input);
end;
procedure Run;
var i,j:integer;
begin
  j:=0;
  for i:=1 to N do
    While RepeatsCount[i]>0 do
      begin
        inc(j);
        if j>40 then
          begin
            writeln;
            j:=1;
          end;
        write(Symbol[i]);
        dec(RepeatsCount[i]);
      end;
  writeln;
end;
begin
  Init;                       {
  if paramcount=0 then
    begin                    }
      assign(output,'output.txt');  {
    end
  else
    begin
      delete(s,length(s)-2,3);
      s:=s+'res';
      assign(output,s)
    end;                        }
  rewrite(output);
  Run;
  close(output);
end.
