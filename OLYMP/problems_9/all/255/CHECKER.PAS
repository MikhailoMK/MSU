program Checker;
uses
  Testlib;
begin
  If ouf.ReadInteger = ans.ReadInteger Then Quit(_OK, '')
                                       Else Quit(_WA, '');
end.

