const
   MaxN = 5000;
var
   n : word; {число человек в очереди}
   a, b, c : array [0 .. MaxN] of integer;
   d : array [0 .. MaxN] of longint;
   i : integer;

function min(a,b : longint) : longint;
begin
     if a<b then min:=a else min:=b;
end;

begin
     assign(input, 'b.in');
     reset(input);
     assign(output, 'b.out');
     rewrite(output);

     readln(n);
     for i := 1 to n do
         read(a[i], b[i], c[i]);

     d[0] := 0;
     d[1] := a[1];
     d[2] := min(a[1]+a[2], b[1]);

     for i := 3 to n do
         d[i] := min( d[i-1] + a[i], min( d[i-2] + b[i-1], d[i-3] + c[i-2] ) );

     writeln(d[n]);
     close(input);
     close(output);
end.
