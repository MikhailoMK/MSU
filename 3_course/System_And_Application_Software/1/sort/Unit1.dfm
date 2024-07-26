object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 578
  ClientWidth = 548
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  object Memo1: TMemo
    Left = 47
    Top = 93
    Width = 210
    Height = 465
    TabOrder = 0
  end
  object Memo2: TMemo
    Left = 279
    Top = 93
    Width = 210
    Height = 465
    TabOrder = 1
  end
  object Button1: TButton
    Left = 47
    Top = 16
    Width = 162
    Height = 26
    Caption = #1057#1090#1072#1090#1080#1095#1085#1072#1103' '#1089#1086#1088#1090#1080#1088#1086#1074#1082#1072
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 47
    Top = 48
    Width = 162
    Height = 25
    Caption = #1044#1080#1085#1072#1084#1080#1095#1085#1072#1103' '#1089#1086#1088#1090#1080#1088#1086#1074#1082#1072
    TabOrder = 3
    OnClick = Button2Click
  end
  object ComboBox1: TComboBox
    Left = 270
    Top = 17
    Width = 219
    Height = 23
    TabOrder = 4
    Text = #1062#1077#1083#1086#1077' '#1095#1080#1089#1083#1086
    Items.Strings = (
      #1062#1077#1083#1086#1077' '#1095#1080#1089#1083#1086
      #1042#1077#1097#1077#1089#1090#1074#1077#1085#1085#1086#1077' '#1095#1080#1089#1083#1086
      #1057#1090#1088#1086#1082#1072
      #1057#1080#1084#1074#1086#1083)
  end
  object ComboBox2: TComboBox
    Left = 270
    Top = 46
    Width = 219
    Height = 23
    ItemIndex = 0
    TabOrder = 5
    Text = #1055#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
    Items.Strings = (
      #1055#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
      #1055#1086' '#1091#1073#1099#1074#1072#1085#1080#1102)
  end
end
