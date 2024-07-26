{$A+,B-,D+,E-,F-,G-,I+,L+,N+,O-,P-,Q+,R+,S+,T-,V+,X+,Y+}
{$M 65520,0,655360}

const
  nMax = 80;

var
  s1, s2, s3 : string;
  l1, l2, l3 : integer;

procedure init;
var
  s, temp : string;
begin
  assign(input, 'input.txt');
  reSet(input);
  assign(output, 'output.txt');
  reWrite(output);

  readLn(s);
  s1 := copy(s, 1, pos('+', s)-1);
  s2 := copy(s, pos('+',s)+1, pos('=',s)-pos('+',s)-1);
  s3 := copy(s, pos('=',s)+1, length(s)-pos('=',s));

  l1 := length(s1); l2 := length(s2); l3 := length(s3);

  while length(s1) < length(s2) do
    s1 := '0' + s1;
  while length(s2) < length(s1) do
    s2 := '0' + s2;
  if length(s3) - length(s1) > 1 then begin
    writeLn('No solution');
    halt;
  end;
  if length(s3)-length(s1) = 1 then begin
    s1 := '0'+s1;
    s2 := '0'+s2;
  end;
  while length(s3)<length(s1) do
    s3 := '0'+s3;
end;

type
  tNumber = array[1..nMax] of integer;
  tNums = array[0..1,1..3] of tNumber;
  tCan = array[0..1] of boolean;

var
  nums :  tNums;
  can : tCan;

function toNum(ch : char) : integer;
begin
  toNum := ord(ch)-ord('0');
end;

procedure check(var n : integer; var def : boolean; number : char);
begin
  if number = '?' then
    def := false
  else
    n := n + toNum(number);
end;

function Sum(d1, d2 : char; d3 : integer; ans1 : char; ans2 : integer;
             var a, b, c : integer) : boolean;
var
  leftn, rightn : integer;
  leftdef, rightdef : boolean;
begin
  leftdef := true; rightdef := true; leftn := 0; rightn := 0;
  check(leftn, leftdef, d1);
  check(leftn, leftdef, d2);
  inc(leftn, d3);
  check(rightn, rightdef, ans1);
  inc(rightn, ans2);

  if leftdef and rightdef then
    if leftn=rightn then begin
      a := toNum(d1);
      b := toNum(d2);
      c := toNum(ans1);
      Sum := true;
    end
    else
      Sum := false;

  if not leftdef and rightdef then begin
    rightn := rightn-leftn;
    if (d1 = '?') and (d2 = '?') then
      if (rightn >= 0) and (rightn < 19) then begin
        a := rightn div 10+rightn mod 10;
        b := rightn-a;
        c := toNum(ans1);
        Sum := true;
      end
      else
        Sum := false
    else
      if (rightn >= 0) and (rightn < 10) then begin
        if d1 = '?' then a := rightn
        else a := toNum(d1);
        if d2 = '?' then b := rightn
        else b := toNum(d2);
        c := toNum(ans1);
        Sum := true;
      end
      else
        Sum := false;
  end;

  if leftdef and not rightdef then begin
    leftn := leftn-rightn;
    if (leftn >= 0) and (leftn < 10) then begin
      a := toNum(d1);
      b := toNum(d2);
      c := leftn mod 10;
      Sum := true;
    end
    else
      Sum := false;
  end;

  if not leftdef and not rightdef then begin
    leftn := leftn - rightn;
    if (d1='?') and (d2 = '?') then
      if (leftn > -19) and (leftn < 10) then begin
        a := abs(leftn) mod 10 + abs(leftn) div 10;
        b := abs(leftn)-a;
        c := (a+b+leftn) mod 10;
        Sum := true;
      end
      else
        Sum := false
    else
      if (leftn > -10) and (leftn < 10) then begin
        if d1 = '?' then a := (abs(leftn)-leftn) div 2
        else a := toNum(d1);
        if d2 = '?' then b := (abs(leftn)-leftn) div 2
        else b := toNum(d2);
        if d1 = '?' then
          c := (a+leftn) mod 10
        else
          c := (b+leftn) mod 10;
        Sum := true;
      end
      else
        Sum := false;
  end;
end;

procedure solve;
var
  i, a, b, c : integer;
  old : tNums;
  oldCan : tCan;
begin
  can[0] := true; can[1] := false;
  for i := length(s1) downto 1 do begin
    old := nums;
    oldCan := can;
    can[0] := false; can[1] := false;

    if oldCan[0] and Sum(s1[i], s2[i], 0, s3[i], 0, a, b, c) then begin
      can[0] := true;
      nums[0] := old[0];
      nums[0, 1, i] := a; nums[0, 2, i] := b; nums[0, 3, i] := c;
    end
    else
      if oldCan[1] and Sum(s1[i], s2[i], 1, s3[i], 0, a, b, c) then begin
        can[0] := true;
        nums[0] := old[1];
        nums[0, 1, i] := a; nums[0, 2, i] := b; nums[0, 3, i] := c;
      end
      else
        can[0] := false;

    if oldCan[0] and Sum(s1[i], s2[i], 0, s3[i], 10, a, b, c) then begin
      can[1] := true;
      nums[1] := old[0];
      nums[1, 1, i] := a; nums[1, 2, i] := b; nums[1, 3, i] := c;
    end
    else
      if oldCan[1] and Sum(s1[i], s2[i], 1, s3[i], 10, a, b, c) then begin
        can[1] := true;
        nums[1] := old[1];
        nums[1, 1, i] := a; nums[1, 2, i] := b; nums[1, 3, i] := c;
      end
      else
        can[1] := false;
  end;
end;

procedure print;
var
  i : integer;
begin
  if can[0] then begin
    for i := length(s1)-l1+1 to length(s1) do
      write(nums[0,1,i]);
    write('+');
    for i := length(s2)-l2+1 to length(s2) do
      write(nums[0, 2, i]);
    write('=');
    for i := length(s3)-l3+1 to length(s3) do
      write(nums[0, 3, i]{,' ',i,' '});
    writeLn;
  end
  else
    writeLn('No solution');
end;

Begin
  init;
  solve;
  print;
End.
