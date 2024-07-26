Uses TestLib;

Begin
 If ouf.ReadLongint = ans.ReadLongint Then Quit(_OK, '')
                                      Else Quit(_WA, '');
End.