{Проверяющая программа для задачи "Буратино"
в формулировке "Шифровка"}

uses testlib;

const nmax=100;
      lmax=50;

    rm:array[1..32] of char =('й','ц','у','к','е','н','г','ш','щ',
                              'р','о','л','д','ж','э','ъ','х','з',
                              'п','а','в','ы','ф','я','ч','с','м',
                              'и','т','ь','б','ю');
    rb:array[1..32] of char =('Й','Ц','У','К','Е','Н','Г','Ш','Щ',
                              'Р','О','Л','Д','Ж','Э','Ъ','Х','З',
                              'П','А','В','Ы','Ф','Я','Ч','С','М',
                              'И','Т','Ь','Б','Ю');

    sp:set of char = ['!','"','(',')','-',',',' ','?',':',';','.',#13,#10];
            {Разделители между словами}
    ep:set of char = ['!','?','.']; {Конец предложения}


var n:integer;
    a:array[1..nmax] of byte;
    words:array[1..nmax] of string[lmax];
    uk:byte;
    q:array[1..nmax] of byte;
                   {Здесь будет выведенный текст в виденомеров слов}
    dots:array[0..nmax] of boolean;
                   {=true, если после i-го слова есть точка, false - если нет}
    srm:set of char;
    srb:set of char;
    bnp:boolean;  {=true если предложение где-нибудь начинается не с большой буквы}

procedure read_input;
   var i:integer;
   begin
   bnp:=false;
   uk:=0;
   srm:=[];
   srb:=[];
   for i:=1 to 32 do begin
       srm:=srm+[rm[i]];
       srb:=srb+[rb[i]];
       end;
   n:=inf.readinteger;
   for i:=1 to n do
     a[i]:=inf.readinteger;
   end;

function upcase2(c:char):char;
   var i:integer;
   begin
   c:=upcase(c);
   if c in srm then
     for i:=1 to 32 do
       if c=rm[i] then begin
         c:=rb[i];
         break;
         end;
   upcase2:=c;
   end;

function find_nom(w:string):integer;
  var i:integer;
  begin
  for i:=1 to length(w) do w[i]:=upcase2(w[i]);
  for i:=1 to uk do
    if w=words[i] then begin
      find_nom:=i;
      exit;
      end;
  inc(uk);
  words[uk]:=w;
  find_nom:=uk;
  end;

procedure read_output;
   var w:string[lmax];
       bd:boolean;  {Начало нового предложения?}
       i,j:integer;
       nw:integer;  {Номер слова}
       c:char;

   begin
   w:='';
   nw:=0;
   bd:=true;
   c:=' ';
   while nw<n do begin
      while (c in sp) do begin
        if c in ep then bd:=true;
        c:=ouf.readchar;
        end;
      if bd then dots[nw]:=true else dots[nw]:=false;
      inc(nw);
      w:='';
      while (not(c in sp)) and (not ouf.eof) do begin
         w:=w+c;
         c:=ouf.readchar;
         if length(w)=lmax then quit(_Fl,'Слово в выходном файле длиннее lmax');
         end;
      if bd and not(w[1] in srb) then bnp:=true;
      bd:=false;
      q[nw]:=find_nom(w);
      end;
   dots[n]:=true;
   end;

procedure test_length;
  var i:integer;
      s:string;
  begin
  for i:=1 to n do
    if a[i]<>(length(words[q[i]]) mod 2) then begin
      str(i,s);
      quit(_WA,'Длина слова номер '+s+' не соответсвует числу: '+words[q[i]]);
      end;
  end;

procedure test;
  var q1,q2,q3:integer;
      w1,w2,w3:integer;
      i,j:integer;
      s1,s2:string;
      qq:boolean;
  begin
  q1:=0;
  q2:=1;
  q3:=0;
  while q1<>n do begin
    while not dots[q2] do inc(q2);
    inc(q1);
    inc(q3);
    for i:=q1 to q2-1 do
      for j:=i+1 to q2 do
        if q[i]=q[j] then begin
           str(i-q1+1,s1);
           str(j-q1+1,s2);
           s1:=s1+' и '+s2;
           str(q3,s2);
           quit(_Wa,'Совпадают слова номер '+s1+' в предложении '+s2+':'+words[q[i]]);
           end;
    w1:=0;
    w2:=1;
    w3:=0;
    while w3+1<q3 do begin
      while not dots[w2] do inc(w2);
      inc(w1);
      inc(w3);
      if w2-w1=q2-q1 then begin
         qq:=true;
         for i:=0 to w2-w1 do
           if q[i+w1]<>q[i+q1] then qq:=false;
         if qq then begin
           str(w3,s1);
           str(q3,s2);
           quit(_WA,'Совпадают предложения номер '+s1+' и '+s2);
           end;
         end;
      w1:=w2;
      w2:=w2+1;
      end;
    q1:=q2;
    q2:=q1+1;
    end;
  end;


procedure read_spaces;
  var c:char;
  begin
  c:=' ';
  while (not (ouf.eof)) and (c in sp) do
    c:=ouf.readchar;
  end;



begin
read_input;
read_output;
test_length;
test;
read_spaces;
if bnp then quit(_Ok,'Некоторые предложения начинаются не с заглавной буквы');
quit(_ok,'');
end.
