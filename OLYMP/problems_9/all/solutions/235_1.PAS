program macro;

var
  p, c     : array [0..9] of string;
  res      : string;
type
  fenya  = array [0..9] of string[15];
const
  BUG       = 0;
  G : fenya =
{     0123456789 }
   ('|    4 6   |0',
    '|      6 8 |1',
    '|       7 9|2',
    '|    4   8 |3',
    '|0  3     9|4',
    '|          |5',
    '|01     7  |6',
    '|  2   6   |7',
    '| 1 3      |8',
    '|  2 4     |9');

function getcyf (var s : string; i: integer) : integer;
begin
  if i>=length(s) then getcyf := 0
                  else getcyf := ord(s[length(s)-i]) - 48
end;

procedure Ladd (var s, t, u : string);
var i, sum, carry, l : integer;
begin
 if BUG=1 then write (t,' + ', u, ' = ');
  l := length (t);
  i := length (u);
  if l<i then l:=i;
  carry := 0;
  for i:=0 to l do
    begin
      sum := carry + getcyf(t,i) + getcyf(u,i);
      carry := ord (sum > 9);
      if sum > 9 then sum := sum-10;
      s[l-i+1] := chr(48+sum)
    end;
  s[0] := chr(l+1);
  while (s[0]>#1) and (s[1]='0') do delete (s, 1, 1);
 if BUG=1 then writeln (s);
end;

procedure init;
var i : integer;
begin
  for i:=0 to 9 do c[i] := '1'
end;

procedure next;
var
  i, j : integer;
  s    : string;
begin
  for i:=0 to 9 do p[i] := c[i];
  for i:=0 to 9 do
    begin
      s := '0';
      for j:=0 to 9 do
        if G[i,j+2]>' ' then Ladd (s, s, p[j]);
      c[i] := s
    end
end;

procedure getres;
var i : integer;
begin
  res := '0';
  for i:=1 to 9 do if i<>8 then Ladd(res, res, c[i]);
end;

var i, N : integer;
begin
  assign (input, 'input.txt');
  reset (input);
  read (N);

  init;
  for i:=2 to N do next;
  getres;

  assign (output, 'output.txt');
  rewrite (output);

  writeln (res);

end.
