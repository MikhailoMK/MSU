object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 620
  ClientWidth = 1449
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -18
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 25
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1449
    Height = 51
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 1447
    object Label2: TLabel
      Left = 1293
      Top = 1
      Width = 5
      Height = 49
      Align = alRight
      ExplicitHeight = 25
    end
    object Label1: TLabel
      Left = 685
      Top = 27
      Width = 5
      Height = 25
    end
    object MediaPlayer1: TMediaPlayer
      Left = 597
      Top = 1
      Width = 85
      Height = 49
      Align = alLeft
      VisibleButtons = [btPlay, btPause, btStop]
      DoubleBuffered = True
      FileName = 
        'C:\Users\krasa\OneDrive\Pictures\'#1055#1083#1077#1085#1082#1072'\WIN_20230912_18_32_34_Pr' +
        'o.jpg'
      ParentDoubleBuffered = False
      TabOrder = 0
    end
    object Button3: TButton
      Left = 1293
      Top = 1
      Width = 0
      Height = 49
      Align = alRight
      Caption = '<<'
      TabOrder = 1
      OnClick = Button3Click
      ExplicitLeft = 1291
    end
    object Button4: TButton
      Left = 1293
      Top = 1
      Width = 0
      Height = 49
      Align = alRight
      Caption = '>>'
      TabOrder = 2
      OnClick = Button4Click
      ExplicitLeft = 1291
    end
    object TrackBar1: TTrackBar
      Left = 1298
      Top = 1
      Width = 150
      Height = 49
      Align = alRight
      DoubleBuffered = False
      LineSize = 300
      Max = 65535
      ParentDoubleBuffered = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 3
      OnChange = TrackBar1Change
      ExplicitLeft = 1296
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 300
      Height = 49
      Align = alLeft
      TabOrder = 4
      object RadioButton1: TRadioButton
        Left = 6
        Top = 10
        Width = 107
        Height = 25
        Caption = #1057#1083#1091#1095#1072#1081#1085#1099#1081
        TabOrder = 0
      end
      object RadioButton2: TRadioButton
        Left = 159
        Top = 9
        Width = 191
        Height = 27
        Caption = #1057#1083#1072#1081#1076#1096#1086#1091
        TabOrder = 1
      end
    end
    object Button2: TButton
      Left = 301
      Top = 1
      Width = 146
      Height = 49
      Align = alLeft
      Caption = #1057#1090#1072#1088#1090
      TabOrder = 5
      OnClick = Button2Click
    end
    object Button6: TButton
      Left = 447
      Top = 1
      Width = 75
      Height = 49
      Align = alLeft
      Caption = '<<'
      TabOrder = 6
      OnClick = Button3Click
    end
    object Button7: TButton
      Left = 522
      Top = 1
      Width = 75
      Height = 49
      Align = alLeft
      Caption = '>>'
      TabOrder = 7
      OnClick = Button4Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 51
    Width = 1149
    Height = 545
    Align = alClient
    TabOrder = 1
    OnResize = Panel2Resize
    ExplicitWidth = 1147
    ExplicitHeight = 537
    object Image1: TImage
      Left = 1
      Top = 1
      Width = 1147
      Height = 543
      Align = alClient
      Center = True
      Visible = False
      ExplicitWidth = 1150
      ExplicitHeight = 553
    end
  end
  object ScrollBar1: TScrollBar
    Left = 0
    Top = 596
    Width = 1449
    Height = 24
    Align = alBottom
    PageSize = 0
    TabOrder = 2
    OnScroll = ScrollBar1Scroll
    ExplicitTop = 588
    ExplicitWidth = 1447
  end
  object Panel3: TPanel
    Left = 1149
    Top = 51
    Width = 300
    Height = 545
    Align = alRight
    Caption = 'Panel3'
    TabOrder = 3
    ExplicitLeft = 1147
    ExplicitHeight = 537
    object ListBox1: TListBox
      Left = 1
      Top = 61
      Width = 298
      Height = 483
      Align = alClient
      ItemHeight = 25
      TabOrder = 0
      ExplicitHeight = 475
    end
    object Button5: TButton
      Left = 1
      Top = 31
      Width = 298
      Height = 30
      Align = alTop
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 1
      OnClick = Button5Click
    end
    object Button1: TButton
      Left = 1
      Top = 1
      Width = 298
      Height = 30
      Align = alTop
      Caption = #1054#1090#1082#1088#1099#1090#1100
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Media|*.mp3;*.mp4;*.vma;*.avi;*.WMV;*.jpg;*.JPG;*.png;'
    Left = 8
    Top = 88
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 30
    OnTimer = Timer1Timer
    Left = 40
    Top = 88
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Timer2Timer
    Left = 88
    Top = 88
  end
end