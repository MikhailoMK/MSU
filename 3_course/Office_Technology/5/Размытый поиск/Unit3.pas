unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls,
  VclTee.TeeGDIPlus, VCLTee.TeEngine, Vcl.ExtCtrls, VCLTee.TeeProcs,
  VCLTee.Chart, StrUtils;

type
  TForm3 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    StringGrid1: TStringGrid;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit3: TEdit;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
var
  i, j, k, m, max_, iMax: Integer;
  x, y, s: string;
begin
  m := 0;
  s := '';
  while m < Form1.Memo1.Lines.Count do
  begin
    k := 0;
    s := '';
    for j := 1 to Length(Edit1.Text) do
    begin
      x := UpperCase(Edit1.Text);
      y := UpperCase(StringGrid1.Cells[1, m]);
      s := s + '#';
      for i := 1 to Length(x) - j + 1 do
      begin
        if Pos(MidStr(x, i, j), y) > 0 then
        begin
          k := k + 1;
          y := StringReplace(y, MidStr(x, i, j), s, [rfReplaceAll]);
          StringGrid1.Cells[2, m] := IntToStr(k);
        end;
      end;
    end;
    m := m + 1;
  end;
  max_ := -1;
  iMax := 0;
  i := 1;
  while not VarIsEmpty(StringGrid1.Cells[0, i]) do
  begin
    if max_ < StrToInt(StringGrid1.Cells[2, i]) then
    begin
      max_ := StrToInt(StringGrid1.Cells[2, i]);
      iMax := i;
    end;
    i := i + 1;
  end;
  Edit2.Text := StringGrid1.Cells[0, iMax];
  Edit3.Text := StringGrid1.Cells[1, iMax];
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  Form1.Show;
  Form3.Visible := false;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  StringGrid1.ColWidths[0] := 65;
  StringGrid1.ColWidths[1] := 305;
  StringGrid1.ColWidths[2] := 65;
end;

procedure TForm3.FormShow(Sender: TObject);
var
  i: Integer;
begin
  StringGrid1.RowCount := Form1.Memo1.Lines.Count;
  for i := 0 to Form1.Memo1.Lines.Count - 1 do
  begin
    StringGrid1.Cells[0, i] := IntToStr(i + 1);
    StringGrid1.Cells[1, i] := Form1.Memo1.Lines.Strings[i];
  end;
end;

end.
