 Uses Testlib;  {����� ��� ����� ������}

BEGIN
  If ans.ReadString <> ouf.ReadString Then Quit(_WA,'') Else Quit(_ok,'');
END.