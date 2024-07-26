program macro;
{$G+,F-,B-,O-,S-,R-,N-,E-}

const
  infile        = 'input.txt';
  outfile       = 'output.txt';
  MaxN          = 20;
  L             = 100;
var
  N, R          : integer;
  V             : array [0..MaxN] of integer;
  A, OA         : array [0..L, 0..L] of boolean;
  B, E          : boolean;

function step : boolean;
var i, j, k  : integer;
procedure test (x, y : integer);
begin
  if (x>=0) and (y>=0) and (x+y<=100) then
    if not A[x,y] then
      begin
        A[x,y] := true;
        if x+y=L-1 then E:=true;
        B := false
      end
end;

begin
  B := true;
  E := false;
  OA := A;
  for i:=0 to L do
    for j:=0 to L-i do
      if OA[i,j] then
        begin
          test (i, 100-i);
          test (100-j, j);
          for k:=0 to N do
            begin
              test (i, V[k]);
              test (V[k], j);
              test (i+j-V[k], V[k]);
              test (V[k], i+j-V[k])
            end
        end;
  step := B or E
end;


var i, j : integer;
begin
  assign (input, infile); reset (input);
  read (N);  V[0] := 0;
  for i:=1 to N do read (V[i]);

  for i:=0 to L do for j:=0 to L-i do A[i,j]:=false;
  A[L,0] := true;
  R := 0;

  repeat inc(R) until step;

  assign (output, outfile); rewrite (output);
  if not E then writeln ('NO') else
    begin
      writeln ('YES');
      writeln (R)
    end
end.