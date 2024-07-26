program Checker;
uses
  TestLib;
begin
  If ouf.ReadInteger = ans.ReadInteger Then Quit(_OK, '')
                                       Else Quit(_WA, '');
end.

