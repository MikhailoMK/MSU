{$A+,B-,D+,E-,F-,G-,I-,L+,N+,O-,P-,Q+,R+,S+,T-,V+,X+,Y+}
{$M 65520,0,655360}
Uses testLib;

const kmax=500;
      blanks=[#09,' '];

var k:integer;
    n:longint;
    a:array[0..kmax-1] of longint;
    b,c:longint;

procedure init;
    var i,j:longint;
    begin
    fillchar(a,sizeof(a),0);
    k:=inf.readlongint;
    n:=inf.readlongint;
    for i:=1 to n do begin
      j:=inf.readlongint;
      inc(a[j mod k]);
      end;
    b:=maxlongint;
    c:=maxlongint;
    end;

function sum_time(t:longint):longint;
    var s,i:longint;
    begin
    s:=0;
    for i:=0 to k-1 do
      s:=s+a[(k+t-i) mod k]*i;
    sum_time:=s;
    end;

function max_time(t:longint):longint;
    var i:longint;
    begin
    i:=k-1;
    while (i>0) and (a[(k+t-i) mod k]=0) do dec(i);
    max_time:=i;
    end;


procedure work;
    var i,q:longint;
        ok1,ok2:boolean;
        err:integer;
        s:string;
    begin
    for i:=0 to k-1 do begin
      if sum_time(i)<b then b:=sum_time(i);
      if max_time(i)<c then c:=max_time(i);
      end;

    ok1 := false;
    ok2 := false;
    s:=ouf.readstring;
    while (s[1] in blanks) and (length(s)>0) do delete(s,1,1);
    while (s[length(s)] in blanks) and (length(s)>0) do dec(s[0]);
    if s='' then q:=-1 else begin
      val(s,q,err);
      if err<>0 then quit(_PE,'Unknown first line');
      end;
    if (q>=0) and (sum_time(q)=b) then
       ok1 := true;
    if ouf.seekeof then q:=-1 else q:=ouf.readlongint;
    if (q>=0) and (max_time(q) = c) then
      ok2 := true;
    if ok1 and ok2 then quit(_ok,'');
    if ok1 then quit(_pc,'Ошибка во 2-м пункте');
    if ok2 then quit(_pc,'Ошибка в 1-м пункте');
    quit(_wa,'');
    end;




begin
init;
work;
end.
