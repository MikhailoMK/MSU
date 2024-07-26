uses testlib;

procedure upstr(var s:string);
  var i:byte;
  begin
  for i:=length(s) downto 1 do begin
	if s[i]=' ' then delete(s,i,1)
	else s[i]:=upcase(s[i]);
        end;
  end;


const nmax=100;

var q,w:string;
	n:integer;
	a:array[1..nmax,1..nmax] of byte;
	b:array[1..nmax] of integer;
	i,j:integer;

begin
q:=ans.readstring;
w:=ouf.readstring;
if q<>w then quit(_WA,'');

if q='NO' then quit(_OK,'');
n:=inf.readinteger;
for i:=1 to n do
  begin
  b[i]:=ouf.readinteger;
  if (b[i]<>1) and (b[i]<>2) then quit(_PE,'Unexpected color: must be 1 or 2');
  end;
for i:=1 to n do
  for j:=1 to n do
	if inf.readinteger=1 then
	  if b[i]=b[j] then quit(_WA,'Wrong colors');
quit(_OK,'');
end.

