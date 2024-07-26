{$A+,B-,D+,E-,F-,G+,I+,L+,N+,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 63384,0,655360}

program FCK;

type TWordArray = array [1..500] of string [80];
     PWordArray = ^TWordArray;
     integer = longint;
var sl: integer;
    n: integer;
   wr: PWordArray;
   wl: array [0..501] of longint;
    r: array [0..501] of longint;
  nxt: array [0..501] of integer;

procedure GetWords (var s: string);
var i: integer;
    w: string;
begin
  i := 1;
  while i <= length (s) do
  begin
    while s[i] = ' ' do inc (i);
    w := '';
    while (i <= length (s)) and (s[i] <> ' ') do
    begin
      w := w + s[i];
      inc (i);
    end;
    if w <> '' then
      begin
        inc (n);
        wr^[n] := w;
        wl[n] := length (w);
      end;
  end;
end;

procedure ReadAll;
var s: string;
begin
  assign (input, 'input.txt'); reset (input);
    readln (sl);
  n := 0;
  while not SeekEof (input) do
  begin
    readln (s);
    GetWords (s);
  end;
  close (input);
end;

function GetIt (x, y: integer; l: longint): longint;
var q: longint;
    a: longint;
   c1, c2: integer;
begin
  a := (sl-l) div (y-x+2);
  c2 := (sl-l) - a * (y-x+2);
  c1 := (y-x+2) - c2;
  q := (a * a * a) * c1 + (a+1) * (a+1) * (a+1) * c2;
  GetIt := q;
end;

procedure ShrinkWord (a: integer);
var zu, f: longint;
    bst: integer;
    Len: longint;
    len1: longint;
    i: integer;
begin
  zu := 2147000000; bst := 0;
  len := -1;
  len1 := 0;
  for i := a + 1 to n + 1 do
  begin
    len := len + 1 + wl [i-1];
    len1 := len1 + wl [i-1];
    if len > sl then break;
    f := GetIt (a, i-1, len1) + r [i];
    if f < zu then
      begin
        zu := f;
        bst := i;
      end;
  end;
  nxt [a] := bst;
  r [a] := zu;
end;

procedure Solve;
var i, j: integer;
begin
  r [n+1] := 0;
  for i := n downto 1 do
    ShrinkWord (i);
end;

procedure PrintLine (x, y: integer);
var l, q: longint;
    i, a: integer;
   c1, c2: integer;
   qq, ps: longint;
begin
  ps := 0;
  l := 0;
  for i := x to y do l := l + wl [i];
  a := (sl-l) div (y-x+2);
  c2 := (sl-l) - a * (y-x+2);
  c1 := (y-x+2) - c2;
  if (a = 0) and (c1 > 1) then begin dec (c1); inc (c2); end;
  if c1 = 0 then inc (a);
  dec (c1);
  if a > 0 then begin write (' ':a); ps := ps + a; end;
  for i := x to y do
  begin
    if c1 = 0 then inc (a);
    dec (c1);
    write (wr^[i]); ps := ps + length (wr^[i]);
    if ps + a > sl then
       begin
         qq := sl - ps;
         if qq > 0 then write (' ':qq);
         ps := sl;
       end else
       begin
         write (' ':a);
         ps := ps + a;
       end;
  end;
writeln;
end;

procedure PrintOut;
var i: integer;
begin
  assign (output, 'output.txt'); rewrite (output);
  writeln (r[1]);
  i := 1;
  while i <= n do
  begin
    PrintLine (i, nxt[i]-1);
    i := nxt [i];
  end;
  close (output);
end;

begin
  new (wr);
  ReadAll;
  Solve;
  PrintOut;
end.