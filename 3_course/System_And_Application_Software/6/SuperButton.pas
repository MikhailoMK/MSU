unit SuperButton;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, System.Math, Vcl.ExtCtrls,Vcl.Graphics,System.Types,Winapi.Windows;

type
  TButtonShape = (bsRectangle, bsRoundRect, bsEllipse, bsTriangle, bsFive, bsSix, bsStar, bsTrapesium);
  TAngles = (a0, a90, a180, a270);

  TSuperButton = class(TGraphicControl)
  private
    Rgn, Rgn1, Rgn2: HRgn;
    FDepth3D: Byte;
    BtnHighLight: TColor;
    BtnShadow: TColor;
    DownUp: Boolean;
    FTButtonshape: TButtonShape;
    FCornerRadius: Integer;
    FColor: TColor;
    Handle: HDC;
    FAngles: TAngles;
    FCaption: String;
    Focus: Boolean;
    procedure SetTButtonshape(const value: TButtonShape);
    procedure SetCornerRadius(const value: Integer);
    procedure SetFColor(const value: TColor);
    procedure SetCaption(const value:string);
    procedure SetHeaderRotationAngle(const value:TAngles);
    procedure SetDepth3D(value: byte);
  protected
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    //procedure SetFocus; override;
    procedure Paint; override;
    //procedure PaintWindow(DC: HDC); override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure SetFocus(value: Boolean);
    procedure Make3Angle(width, height, dep, typ: Integer; var points: array of TPoint);
    procedure MakeTrapesium(width, height, dep, typ: Integer; var points: array of TPoint);
    procedure Make5Angle(width, height, dep, typ: Integer; var points: array of TPoint);
    destructor Destroy;override;
  published
    property Buttonshape: TButtonShape read FTButtonshape write SetTButtonshape default bsRectangle;
    property CornerRadius: Integer read FCornerRadius write SetCornerRadius default 0;
    property Color: TColor read FColor write SetFColor default clBtnFace;
    property Caption: string read FCaption write SetCaption;
    property HeaderRotationAngle: TAngles read FAngles write SetHeaderRotationAngle default a0;
    property Depth3D: Byte read FDepth3D write SetDepth3D default 1;

    property OnClick;
    property OnCanResize;
    property OnConstrainedResize;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnGesture;
    property OnGetDeltaStreams;
    property OnMouseActivate;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseWheelDown;
    property OnMouseWheelUp;
    property OnResize;
    property OnStartDock;
    property OnStartDrag;
  end;


procedure Register;

implementation

function GetInverseColor(const AColor: TColor): TColor;
var
  R, G, B: Byte;
begin
  // Разбираем цвет на составляющие
  R := GetRValue(AColor);
  G := GetGValue(AColor);
  B := GetBValue(AColor);

  // Получаем инвертированные значения
  R := 255 - R;
  G := 255 - G;
  B := 255 - B;

  // Собираем новый цвет из инвертированных значений
  Result := RGB(R, G, B);
end;


procedure TSuperButton.MakeTrapesium(width, height, dep, typ: Integer; var points: array of TPoint);
begin
   if HeaderRotationAngle = a0 then
   begin
      if typ = 0 then
      begin
        points[0].X:= 1;
        points[0].Y:= 1;
        points[1].X:= width - 1;
        points[1].Y:= (height div 4) - 2;
        points[2].X:= width - 1;
        points[2].Y:= ((3*height) div 4)- 2;
        points[3].X:= 1;
        points[3].Y:= height - 2;
      end
      else if typ = 1 then
      begin
        points[0].X:= 1 + 2 * dep;
        points[0].Y:= 1 + 2 * dep;
        points[1].X:= (width -1) + 2 * dep;
        points[1].Y:= (height div 4) - 2 + 2 * dep;
        points[2].X:= width - 1 + 2 * dep;
        points[2].Y:= ((3*height) div 4)- 2 + 2 * dep;
        points[3].X:=  1+ 2 * dep;
        points[3].Y:= height - 2 + 2*dep;
      end
      else if typ = 2 then
      begin
        points[0].X:= 1 + dep + 4;
        points[0].Y:= 1 + dep - 3;
        points[1].X:= (width -1) + dep;
        points[1].Y:= (height div 4) - 2 + dep + 3;
        points[2].X:= width - 1 + dep - 4;
        points[2].Y:= ((3*height) div 4)- 2 + dep - 3;
        points[3].X:= 1+ dep;
        points[3].Y:= height - 2 + dep +3;
      end
      else
      begin
        points[0].X:= 1 + dep;
        points[0].Y:= 1 + dep;
        points[1].X:= (width -1) + dep;
        points[1].Y:= (height div 4) - 2 + dep;
        points[2].X:= width - 1 + dep;
        points[2].Y:= ((3*height) div 4)- 2 + dep;
        points[3].X:=1+dep;
        points[3].Y:=height -1 +dep;
      end;
   end else if HeaderRotationAngle = a90 then
   begin
      if typ = 0 then
      begin
        points[0].X:= 1;
        points[0].Y:= height -2;
        points[1].X:= (width div 4) -1;
        points[1].Y:= 1;
        points[2].X:= (3*width div 4) - 1;
        points[2].Y:= 1;
        points[3].X:= width - 1 ;
        points[3].Y:= height - 2;
      end
      else if typ = 1 then
      begin
        points[0].X:= 1 + 2 * dep;
        points[0].Y:= height -2 + 2 * dep;
        points[1].X:= (width div 4) -1 + 2 * dep;
        points[1].Y:= 1 + 2 * dep;
        points[2].X:= (3*width div 4) - 1 + 2 * dep;
        points[2].Y:= 1 + 2 * dep;
        points[3].X:= width - 1+ 2 * dep;
        points[3].Y:= height - 2 + 2*dep;
      end
      else if typ = 2 then
      begin
        points[0].X:= 1 + dep + 4;
        points[0].Y:= height -2 + dep - 3;
        points[1].X:= (width div 4) -1 + dep;
        points[1].Y:= 1 + dep + 3;
        points[2].X:= (3*width div 4) - 1 + dep - 4;
        points[2].Y:= 1 + dep - 3;
        points[3].X:= width - 1 + dep;
        points[3].Y:= height - 2 + dep +3;
      end
      else
      begin
        points[0].X:= 1 + dep;
        points[0].Y:= height -2 + dep;
        points[1].X:= (width div 4) -1 + dep;
        points[1].Y:= 1 + dep;
        points[2].X:= (3*width div 4) - 1 + dep;
        points[2].Y:= 1 + dep;
        points[3].X:=width - 1+dep;
        points[3].Y:=height - 2 +dep;
      end;
   end else if HeaderRotationAngle = a180 then
   begin
      if typ = 0 then
      begin
        points[0].X:= width -1 ;
        points[0].Y:= 1;
        points[1].X:= 1;
        points[1].Y:= (height div 4)-2;
        points[2].X:= 1;
        points[2].Y:= (3*height div 4) - 2;
        points[3].X:= width - 1 ;
        points[3].Y:= height - 2;
      end
      else if typ = 1 then
      begin
        points[0].X:= width-1  + 2 * dep;
        points[0].Y:= 1+ 2 * dep;
        points[1].X:= 1 + 2 * dep;
        points[1].Y:= (height div 4)-2 + 2 * dep;
        points[2].X:= 1 + 2 * dep;
        points[2].Y:= (3*height div 4) - 2 + 2 * dep;
        points[3].X:= width - 1+ 2 * dep;
        points[3].Y:= height - 2 + 2*dep;
      end
      else if typ = 2 then
      begin
        points[0].X:= width - 1 + dep + 4;
        points[0].Y:= 1 + dep - 3;
        points[1].X:= 1 + dep;
        points[1].Y:= (height div 4)-2 + dep + 3;
        points[2].X:= 1 + dep - 4;
        points[2].Y:= (3*height div 4) - 2 + dep - 3;
        points[3].X:= width - 1 + dep;
        points[3].Y:= height - 2 + dep +3;
      end
      else
      begin
        points[0].X:= width - 1 + dep;
        points[0].Y:= 1 + dep;
        points[1].X:= 1 + dep;
        points[1].Y:= (height div 4)-2 + dep;
        points[2].X:= 1 + dep;
        points[2].Y:= (3*height div 4) - 2 + dep;
        points[3].X:=width - 1+dep;
        points[3].Y:=height - 2 +dep;
      end;
   end else if HeaderRotationAngle = a270 then
   begin
      if typ = 0 then
      begin
        points[0].X:= 1 ;
        points[0].Y:= 1;
        points[1].X:= (width div 4)-1;
        points[1].Y:= height -2;
        points[2].X:= (3*width div 4)-1;
        points[2].Y:= height - 2;
        points[3].X:= width - 1 ;
        points[3].Y:= 1;
      end
      else if typ = 1 then
      begin
        points[0].X:= 1  + 2 * dep;
        points[0].Y:= 1+ 2 * dep;
        points[1].X:= (width div 4)-1 + 2 * dep;
        points[1].Y:= height -2 + 2 * dep;
        points[2].X:= (3*width div 4)-1 + 2 * dep;
        points[2].Y:= height - 2 + 2 * dep;
        points[3].X:= width - 1+ 2 * dep;
        points[3].Y:= 1 + 2*dep;
      end
      else if typ = 2 then
      begin
        points[0].X:= 1 + dep + 4;
        points[0].Y:= 1 + dep - 3;
        points[1].X:= (width div 4)-1 + dep;
        points[1].Y:= height -2 + dep + 3;
        points[2].X:= (3*width div 4)-1 + dep - 4;
        points[2].Y:=  height - 2+ dep - 3;
        points[3].X:= width - 1 + dep;
        points[3].Y:= 1+ dep +3;
      end
      else
      begin
        points[0].X:= 1 + dep;
        points[0].Y:= 1 + dep;
        points[1].X:= (width div 4)-1 + dep;
        points[1].Y:= height -2 + dep;
        points[2].X:= (3*width div 4)-1 + dep;
        points[2].Y:= height - 2 + dep;
        points[3].X:= width - 1+dep;
        points[3].Y:= 1 +dep;
      end;
   end;

end;

procedure TSuperButton.Make3Angle(width, height, dep, typ: Integer; var points: array of TPoint);
begin
   if HeaderRotationAngle = a0 then
   begin
      if typ = 0 then
      begin
        points[0].X:= 1;
        points[0].Y:= height-2;
        points[1].X:= width div 2;
        points[1].Y:= 1;
        points[2].X:= width - 1;
        points[2].Y:= height - 2;
      end
      else if typ = 1 then
      begin
        points[0].X:= 1 + 2 * dep;
        points[0].Y:= height - 2 + 2 * dep;
        points[1].X:= width div 2 + 2 * dep;
        points[1].Y:= 1 + 2 * dep;
        points[2].X:= width - 1 + 2 * dep;
        points[2].Y:= height - 2 + 2 * dep;
      end
      else if typ = 2 then
      begin
        points[0].X:= 1 + dep + 4;
        points[0].Y:= height - 2 + dep - 3;
        points[1].X:= width div 2 + dep;
        points[1].Y:= 1 + dep + 3;
        points[2].X:= width - 1 + dep - 4;
        points[2].Y:= height - 2 + dep - 3;
      end
      else
      begin
        points[0].X:= 1 + dep;
        points[0].Y:= height - 2 + dep;
        points[1].X:= width div 2 + dep;
        points[1].Y:= 1 + dep;
        points[2].X:= width - 1 + dep;
        points[2].Y:= height - 2 + dep;
      end;
   end  else if HeaderRotationAngle = a90 then
   begin
      if typ = 0 then
      begin
        points[0].X:= width - 1;
        points[0].Y:= height-2;
        points[1].X:= 1;
        points[1].Y:= (height div 2) - 2;
        points[2].X:= width - 1;
        points[2].Y:= 1;
      end
      else if typ = 1 then
      begin
        points[0].X:= width - 1 + 2 * dep;
        points[0].Y:= height - 2 + 2 * dep;
        points[1].X:= 1 + 2 * dep;
        points[1].Y:= (height div 2) - 2 + 2 * dep;
        points[2].X:= width - 1 + 2 * dep;
        points[2].Y:= 1 + 2 * dep;
      end
      else if typ = 2 then
      begin
        points[0].X:= width - 1 + dep + 4;
        points[0].Y:= height - 2 + dep - 3;
        points[1].X:= 1 + dep;
        points[1].Y:= (height div 2) - 2 + dep + 3;
        points[2].X:= width - 1 + dep - 4;
        points[2].Y:= 1 + dep - 3;
      end
      else
      begin
        points[0].X:= width - 1 + dep;
        points[0].Y:= height - 2 + dep;
        points[1].X:= 1 + dep;
        points[1].Y:= (height div 2) - 2 + dep;
        points[2].X:= width - 1 + dep;
        points[2].Y:= 1 + dep;
      end;
   end  else if HeaderRotationAngle = a180 then
   begin
      if typ = 0 then
      begin
        points[0].X:= 1;
        points[0].Y:= 1;
        points[1].X:= width div 2;
        points[1].Y:= height - 2;
        points[2].X:= width - 1;
        points[2].Y:= 1;
      end
      else if typ = 1 then
      begin
        points[0].X:= 1 + 2 * dep;
        points[0].Y:= 1 + 2 * dep;
        points[1].X:= width div 2 + 2 * dep;
        points[1].Y:= height - 2 + 2 * dep;
        points[2].X:= width - 1 + 2 * dep;
        points[2].Y:= 1 + 2 * dep;
      end
      else if typ = 2 then
      begin
        points[0].X:= 1 + dep + 4;
        points[0].Y:= 1+ dep - 3;
        points[1].X:= width div 2 + dep;
        points[1].Y:= height - 2 + dep + 3;
        points[2].X:= width - 1 + dep - 4;
        points[2].Y:= 1 + dep - 3;
      end
      else
      begin
        points[0].X:= 1 + dep;
        points[0].Y:= 1 + dep;
        points[1].X:= width div 2 + dep;
        points[1].Y:= height - 2 + dep;
        points[2].X:= width - 1 + dep;
        points[2].Y:= 1 + dep;
      end;
   end  else if HeaderRotationAngle = a270 then
   begin
      if typ = 0 then
      begin
        points[0].X:= 1;
        points[0].Y:= height -2;
        points[1].X:= width - 1;
        points[1].Y:= (height div 2) - 2;
        points[2].X:= 1;
        points[2].Y:= 1;
      end
      else if typ = 1 then
      begin
        points[0].X:= 1 + 2 * dep;
        points[0].Y:= height -2 + 2 * dep;
        points[1].X:= width - 1 + 2 * dep;
        points[1].Y:= (height div 2) - 2 + 2 * dep;
        points[2].X:= 1 + 2 * dep;
        points[2].Y:= 1 + 2 * dep;
      end
      else if typ = 2 then
      begin
        points[0].X:= 1 + dep + 4;
        points[0].Y:= height -2+ dep - 3;
        points[1].X:= width - 1 + dep;
        points[1].Y:= (height div 2) - 2 + dep + 3;
        points[2].X:= 1 + dep - 4;
        points[2].Y:= 1 + dep - 3;
      end
      else
      begin
        points[0].X:= 1 + dep;
        points[0].Y:= height -2 + dep;
        points[1].X:= width - 1 + dep;
        points[1].Y:= (height div 2) - 2 + dep;
        points[2].X:= 1 + dep;
        points[2].Y:= 1 + dep;
      end;
   end;

end;

procedure Make6Angle(width, height, dep, typ: Integer; var points: array of TPoint);
begin
   if typ = 0 then
   begin
     points[0].X:= 1;
     points[0].Y:= height div 2;
     points[1].X:= width div 4;
     points[1].Y:= 1;
     points[2].X:= 3 * (width div 4);
     points[2].Y:= 1;
     points[3].X:= width - 1;
     points[3].Y:= height div 2;
     points[4].X:= 3 * (width div 4);
     points[4].Y:= height - 2;
     points[5].X:= width div 4;
     points[5].Y:= height - 2;
   end
   else if typ = 1 then
   begin
     points[0].X:= 1 + 2 * dep;
     points[0].Y:= height div 2 + 2 * dep;
     points[1].X:= width div 4 + 2 * dep;
     points[1].Y:= 1 + 2 * dep;
     points[2].X:= 3 * (width div 4) + 2 * dep;
     points[2].Y:= 1 + 2 * dep;
     points[3].X:= width - 1 + 2 * dep;
     points[3].Y:= height div 2 + 2 * dep;
     points[4].X:= 3 * (width div 4) + 2 * dep;
     points[4].Y:= height - 2 + 2 * dep;
     points[5].X:= width div 4 + 2 * dep;
     points[5].Y:= height - 2 + 2 * dep;
   end
   else if typ = 2 then
   begin
     points[0].X:= 1 + dep + 3;
     points[0].Y:= height div 2 + dep;
     points[1].X:= width div 4 + dep;
     points[1].Y:= 1 + dep + 3;
     points[2].X:= 3 * (width div 4) + dep;
     points[2].Y:= 1 + dep + 3;
     points[3].X:= width - 1 + dep - 3;
     points[3].Y:= height div 2 + dep;
     points[4].X:= 3 * (width div 4) + dep;
     points[4].Y:= height - 2 + dep - 3;
     points[5].X:= width div 4 + dep;
     points[5].Y:= height - 2 + dep - 3;
   end
   else
   begin
     points[0].X:= 1 + dep;
     points[0].Y:= height div 2 + dep;
     points[1].X:= width div 4 + dep;
     points[1].Y:= 1 + dep;
     points[2].X:= 3 * (width div 4) + dep;
     points[2].Y:= 1 + dep;
     points[3].X:= width - 1 + dep;
     points[3].Y:= height div 2 + dep;
     points[4].X:= 3 * (width div 4) + dep;
     points[4].Y:= height - 2 + dep;
     points[5].X:= width div 4 + dep;
     points[5].Y:= height - 2 + dep;
   end;
end;

procedure TSuperButton.Make5Angle(width, height, dep, typ: Integer; var points: array of TPoint);
var a: Integer;
begin
   a:= width div 2;
   if HeaderRotationAngle = a0 then
   begin
       if typ = 0 then
       begin
         points[0].X:= a;
         points[0].Y:= 1;
         points[1].X:= width - 1;
         points[1].Y:= height div 3;
         points[2].X:= 3 * (a div 2);
         points[2].Y:= height - 2;
         points[3].X:= a div 2;
         points[3].Y:= height - 2;
         points[4].X:= 1;
         points[4].Y:= height div 3;
       end
       else if typ = 1 then
       begin
         points[0].X:= a + 2 * dep;
         points[0].Y:= 1 + 2 * dep;
         points[1].X:= width - 1 + 2 * dep;
         points[1].Y:= height div 3 + 2 * dep;
         points[2].X:= 3 * (a div 2) + 2 * dep;
         points[2].Y:= height - 2 + 2 * dep;
         points[3].X:= a div 2 + 2 * dep;
         points[3].Y:= height - 2 + 2 * dep;
         points[4].X:= 1 + 2 * dep;
         points[4].Y:= height div 3 + 2 * dep;
       end
       else if typ = 2 then
       begin
         points[0].X:= a + dep;
         points[0].Y:= 1 + dep + 4;
         points[1].X:= width - 1 + dep - 4;
         points[1].Y:= height div 3 + dep + 3;
         points[2].X:= 3 * (a div 2) + dep - 3;
         points[2].Y:= height - 2 + dep - 4;
         points[3].X:= a div 2 + dep + 3;
         points[3].Y:= height - 2 + dep - 4;
         points[4].X:= 1 + dep + 4;
         points[4].Y:= height div 3 + dep + 3;
       end
       else
       begin
         points[0].X:= a + dep;
         points[0].Y:= 1 + dep;
         points[1].X:= width - 1 + dep;
         points[1].Y:= height div 3 + dep;
         points[2].X:= 3 * (a div 2) + dep;
         points[2].Y:= height - 2 + dep;
         points[3].X:= a div 2 + dep;
         points[3].Y:= height - 2 + dep;
         points[4].X:= 1 + dep;
         points[4].Y:= height div 3 + dep;
       end;
   end else if HeaderRotationAngle = a90 then
   begin
      if typ = 0 then
       begin
         points[0].X:= 1;
         points[0].Y:= height div 2;
         points[1].X:= width div 3;
         points[1].Y:= 1;
         points[2].X:= width -1;
         points[2].Y:= height div 4;
         points[3].X:= width - 1;
         points[3].Y:= 3*height div 4;
         points[4].X:= width div 3;
         points[4].Y:= height -2;
       end
       else if typ = 1 then
       begin
         points[0].X:= 1 + 2 * dep;
         points[0].Y:= height div 2 + 2 * dep;
         points[1].X:= width div 3 + 2 * dep;
         points[1].Y:= 1 + 2 * dep;
         points[2].X:= width -1 + 2 * dep;
         points[2].Y:= height div 4 + 2 * dep;
         points[3].X:= width - 1 + 2 * dep;
         points[3].Y:= 3*height div 4 + 2 * dep;
         points[4].X:= width div 3 + 2 * dep;
         points[4].Y:= height - 2 + 2 * dep;
       end
       else if typ = 2 then
       begin
         points[0].X:= 1 + dep;
         points[0].Y:= height div 2 + dep + 4;
         points[1].X:= width div 3 + dep - 4;
         points[1].Y:= 1 + dep + 3;
         points[2].X:= width -1 + dep - 3;
         points[2].Y:= height div 4 + dep - 4;
         points[3].X:= width - 1 + dep + 3;
         points[3].Y:= 3*height div 4 + dep - 4;
         points[4].X:= width div 3 + dep + 4;
         points[4].Y:= height - 2 + dep + 3;
       end
       else
       begin
         points[0].X:= 1 + dep;
         points[0].Y:= height div 2 + dep;
         points[1].X:= width div 3  + dep;
         points[1].Y:= 1 + dep;
         points[2].X:= width - 1 + dep;
         points[2].Y:= height div 4 + dep;
         points[3].X:= width - 1 + dep;
         points[3].Y:= 3*height div 4 + dep;
         points[4].X:= width div 3 + dep;
         points[4].Y:= height - 2 + dep;
       end;
   end else if HeaderRotationAngle = a180 then
   begin
      if typ = 0 then
       begin
         points[0].X:= width div 2;
         points[0].Y:= height - 1;
         points[1].X:= 1;
         points[1].Y:= 2 * height div 3;
         points[2].X:= width div 4;
         points[2].Y:= 1;
         points[3].X:= 3 * width div 4;
         points[3].Y:= 1;
         points[4].X:= width - 1;
         points[4].Y:= 2 * height div 3;
       end
       else if typ = 1 then
       begin
         points[0].X:= width div 2 + 2 * dep;
         points[0].Y:= height - 1 + 2 * dep;
         points[1].X:= 1 + 2 * dep;
         points[1].Y:= 2 * height div 3 + 2 * dep;
         points[2].X:= width div 4 + 2 * dep;
         points[2].Y:= 1 + 2 * dep;
         points[3].X:= 3 * width div 4 + 2 * dep;
         points[3].Y:= 1 + 2 * dep;
         points[4].X:= width - 1 + 2 * dep;
         points[4].Y:= 2 * height div 3 + 2 * dep;
       end
       else if typ = 2 then
       begin
         points[0].X:= width div 2 + dep;
         points[0].Y:= height - 1 + dep + 4;
         points[1].X:= 1 + dep - 4;
         points[1].Y:= 2 * height div 3 + dep + 3;
         points[2].X:= width div 4 + dep - 3;
         points[2].Y:= 1 + dep - 4;
         points[3].X:= 3 * width div 4 + dep + 3;
         points[3].Y:= 1 + dep - 4;
         points[4].X:= width - 1 + dep + 4;
         points[4].Y:= 2 * height div 3 + dep + 3;
       end
       else
       begin
         points[0].X:= width div 2 + dep;
         points[0].Y:= height - 1 + dep;
         points[1].X:= 1  + dep;
         points[1].Y:= 2 * height div 3 + dep;
         points[2].X:= width div 4 + dep;
         points[2].Y:= 1 + dep;
         points[3].X:= 3 * width div 4 + dep;
         points[3].Y:= 1 + dep;
         points[4].X:= width - 1 + dep;
         points[4].Y:= 2 * height div 3 + dep;
       end;
   end else if HeaderRotationAngle = a270 then
   begin
      if typ = 0 then
       begin
         points[0].X:= width - 1;
         points[0].Y:= height div 2;
         points[1].X:= 2 * width div 3;
         points[1].Y:= height - 1;
         points[2].X:= 1;
         points[2].Y:= 3 * height div 4;
         points[3].X:= 1;
         points[3].Y:= height div 4;
         points[4].X:= 2 * width div 3;
         points[4].Y:= 1;
       end
       else if typ = 1 then
       begin
         points[0].X:= width - 1 + 2 * dep;
         points[0].Y:= height div 2 + 2 * dep;
         points[1].X:= 2 * width div 3 + 2 * dep;
         points[1].Y:= height - 1 + 2 * dep;
         points[2].X:= 1 + 2 * dep;
         points[2].Y:= 3 * height div 4 + 2 * dep;
         points[3].X:= 1 + 2 * dep;
         points[3].Y:= height div 4 + 2 * dep;
         points[4].X:= 2 * width div 3 + 2 * dep;
         points[4].Y:= 1 + 2 * dep;
       end
       else if typ = 2 then
       begin
         points[0].X:= width - 1 + dep;
         points[0].Y:= height div 2 + dep + 4;
         points[1].X:= 2 * width div 3 + dep - 4;
         points[1].Y:= height - 1 + dep + 3;
         points[2].X:= 1 + dep - 3;
         points[2].Y:= 3 * height div 4 + dep - 4;
         points[3].X:= 1 + dep + 3;
         points[3].Y:= height div 4 + dep - 4;
         points[4].X:= 2 * width div 3 + dep + 4;
         points[4].Y:= 1 + dep + 3;
       end
       else
       begin
         points[0].X:= width - 1 + dep;
         points[0].Y:= height div 2 + dep;
         points[1].X:= 2 * width div 3  + dep;
         points[1].Y:= height - 1 + dep;
         points[2].X:= 1 + dep;
         points[2].Y:= 3 * height div 4 + dep;
         points[3].X:= 1 + dep;
         points[3].Y:= height div 4 + dep;
         points[4].X:= 2 * width div 3 + dep;
         points[4].Y:= 1 + dep;
       end;
   end;
end;

procedure Swap(var p1, p2: TPoint);
begin
  var p3: TPoint;
  p3 := p1;
  p1 := p2;
  p2 := p3;
end;

procedure MakeStar2(width, height, dep, typ: Integer; var points: array of TPoint);
var
  raz, raz1: Integer;
  d, d1, d3: Integer;
begin
   raz := (width div 2) div 2;
   raz1 := ((width div 2) div 2) div 2;
   d3 := (width div 2) div 3;
   d := (height div 2) div 2 ;
   d1 := ((height div 2) div 2) div 2;
   if typ = 0 then
   begin
     points[0] := point(width div 2 - 2 , 1);
     points[1] := point(d3 + width div 2 - 2, height  div 2 - d1 - 2);
     points[2] := point(width - 2, height div 2 - d1 - 2);
     points[3] := point(raz + width div 2 - 2,height div 2 + d1 - 2);
     points[4] := point(width div 2 + raz + raz1 - 2,height - 2);
     points[5] := point(width div 2 - 2 ,height div 2 + d - 2);
     points[6] := point(width div 2 - raz - raz1 - 2, height - 2);
     points[7] := point(raz - 2 , height div 2 + d1 - 2);
     points[8] := point(- 2, height div 2 - d1 - 2);
     points[9] := point(- d3 + width div 2 - 2, height  div 2 - d1 - 2);
   end
   else if typ = 1 then
   begin
     points[0] := point(width div 2 - 2 + 2 * dep, 1 + 2 * dep);
     points[1] := point(d3 + width div 2 - 2 + 2 * dep, height  div 2 - d1 - 2 + 2 * dep);
     points[2] := point(width - 2 + 2 * dep, height div 2 - d1 - 2 + 2 * dep);
     points[3] := point(raz + width div 2 - 2 + 2 * dep, height div 2 + d1 - 2 + 2 * dep);
     points[4] := point(width div 2 + raz + raz1 - 2 + 2 * dep, height - 2 + 2 * dep);
     points[5] := point(width div 2 - 2 + 2 * dep, height div 2 + d - 2 + 2 * dep);
     points[6] := point(width div 2 - raz - raz1 - 2 + 2 * dep, height - 2 + 2 * dep);
     points[7] := point(raz - 2 + 2 * dep, height div 2 + d1 - 2 + 2 * dep);
     points[8] := point(- 2 + 2 * dep, height div 2 - d1 - 2 + 2 * dep);
     points[9] := point(- d3 + width div 2 - 2 + 2 * dep, height  div 2 - d1 - 2 + 2 * dep);
   end
   else if typ = 2 then
   begin
     points[0] := point(width div 2 - 2 + dep, 1 + dep + 3);
     points[1] := point(d3 + width div 2 - 2 + dep - 3, height  div 2 - d1 - 2 + dep + 3);
     points[2] := point(width - 2 + dep - 4, height div 2 - d1 - 2 + dep + 3);
     points[3] := point(raz + width div 2 - 2 + dep - 4, height div 2 + d1 - 2 + dep - 3);
     points[4] := point(width div 2 + raz + raz1 - 2 + dep - 3, height - 2 + dep - 3);
     points[5] := point(width div 2 - 2 + dep, height div 2 + d - 2 + dep - 3);
     points[6] := point(width div 2 - raz - raz1 - 2 + dep + 3, height - 2 + dep - 3);
     points[7] := point(raz - 2 + dep + 4, height div 2 + d1 - 2 + dep - 3);
     points[8] := point(- 2 + dep + 4, height div 2 - d1 - 2 + dep + 3);
     points[9] := point(- d3 + width div 2 - 2 + dep + 3, height  div 2 - d1 - 2 + dep + 3);
   end
   else
   begin
     points[0] := point(width div 2 - 2 + dep, 1 + dep);
     points[1] := point(d3 + width div 2 - 2 + dep, height  div 2 - d1 - 2 + dep);
     points[2] := point(width - 2 + dep, height div 2 - d1 - 2 + dep);
     points[3] := point(raz + width div 2 - 2 + dep,height div 2 + d1 - 2 + dep);
     points[4] := point(width div 2 + raz + raz1 - 2 + dep,height - 2 + dep);
     points[5] := point(width div 2 - 2 + dep, height div 2 + d - 2 + dep);
     points[6] := point(width div 2 - raz - raz1 - 2 + dep, height - 2 + dep);
     points[7] := point(raz - 2 + dep, height div 2 + d1 - 2 + dep);
     points[8] := point(- 2 + dep, height div 2 - d1 - 2 + dep);
     points[9] := point(- d3 + width div 2 - 2 + dep, height  div 2 - d1 - 2 + dep);
   end;
end;

procedure Register;
begin
  RegisterComponents('MyComponents', [TSuperButton]);
end;


constructor TSuperButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FTButtonshape := bsRectangle;
  FCornerRadius := 0;
  FColor := clBtnFace;
  FCaption := 'Button';
  FAngles := a0;
  Color := $00B6C4C9;
  Depth3D := 1;
  BtnHighLight := clBtnHighLight;
  BtnShadow := clBtnShadow;
  SetBkMode(Handle, Transparent);
end;

destructor TSuperButton.Destroy;
begin
  inherited Destroy;
end;

procedure TSuperButton.SetFocus(value: Boolean);
begin
  Focus := value;
  Invalidate;
end;

procedure TSuperButton.SetDepth3D(value: Byte);
begin
  if FDepth3D <> Value then
  begin
    FDepth3D := Value;
    Invalidate;
  end;
end;

procedure TSuperButton.SetTButtonshape(const value: TButtonShape);
begin
  if FTButtonshape <> value then
  begin
    FTButtonshape := value;
    Invalidate;
  end;
end;

procedure TSuperButton.SetCornerRadius(const value: Integer);
begin
  if FCornerRadius <> value then
  begin
    FCornerRadius := value;
    Invalidate;
  end;
end;

procedure TSuperButton.SetFColor(const value: TColor);
begin
  if FColor <> value then
  begin
     FColor := value;
     Invalidate;
  end;
end;

procedure TSuperButton.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  DownUp := True;
  BtnHighLight := clBtnShadow;
  BtnShadow := clBtnHighLight;
  Invalidate;
end;

procedure TSuperButton.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  DownUp := False;
  BtnHighLight := clBtnHighLight;
  BtnShadow := clBtnShadow;
  Invalidate;
end;

procedure TSuperButton.SetCaption(const value: string);
begin
  if FCaption <> value then
  begin
    FCaption := value;
    Invalidate;
  end;
end;

procedure TSuperButton.SetHeaderRotationAngle(const value: TAngles);
begin
  if FAngles <> value then
  begin
    FAngles := value;
    Invalidate;
  end;
end;

procedure  TSuperButton.Paint();
var
  Points:array of TPoint;
  RotatedFont:TFont;
  TextWidth,TextHeihgt :Integer;
  RotatedX,RotatedY,X,Y:Integer;
  trRgn1, trRgn2, trRgn3: HRGN;
  fvRgn1, fvRgn2, fvRgn3: HRGN;
  sxRgn1, sxRgn2, sxRgn3: HRGN;
  stRgn1, stRgn2, stRgn3: HRGN;
  temp: Integer;
  begin
    inherited Paint;
    Canvas.Brush.Color:=Self.Color;
    Canvas.Font:=Font;
    Canvas.Brush.Style := bsSolid;
    Canvas.Pen.Width := 2;
    with Canvas do
    begin

        case ButtonShape of
          bsRectangle:
          begin

              if Depth3D>0 then
              begin
              Rgn1:=CreateRectRgn(0,0,Width-2*Depth3D,Height-2*Depth3D);
              Brush.Color:=BtnHighLight;
              FillRgn(Handle, Rgn1, Brush.Handle);

              Rgn2:=CreateRectRgn(2*Depth3D,2*Depth3D,Width,Height);
              Brush.Color:=BtnShadow;
              FillRgn(Handle, Rgn2, Brush.Handle) ;

              Rgn := CreateRectRgn(Depth3D ,Depth3D, Width - Depth3D, Height - Depth3D);
              Brush.Color := Self.Color;
              FillRgn(Handle, Rgn, Brush.Handle);
              end
              else
              begin
              Rgn:=CreateRectRgn(0, 0, Width, Height);
              Brush.Color := Self.Color;
              FillRgn(Handle, Rgn, Brush.Handle);
              end;
              if Focus then
              begin
                Pen.Color := GetInverseColor(Self.Color);
                Pen.Style := psDash;
                Pen.Width := 1;
                Brush.Style := bsClear;
                Rectangle(Depth3D + 3, Depth3D + 3, Width - Depth3D - 3, Height - Depth3D - 3);
              end;


          end;
          bsRoundRect:
          begin
            if Depth3D > 0 then
            begin
              Rgn1 := CreateRoundRectRgn(0, 0, Width - 2 * Depth3D, Height - 2 * Depth3D, Width div 4, Height div 4);
              Brush.Color := BtnHighLight;
              FillRgn(Handle, Rgn1, Brush.Handle);
              Rgn2 := CreateRoundRectRgn(2 * Depth3D, 2 * Depth3D, Width, Height, Width div 4, Height div 4);
              Brush.Color:=BtnShadow;
              FillRgn(Handle, Rgn2, Brush.Handle);
              Rgn := CreateRoundRectRgn(Depth3D, Depth3D, Width - Depth3D, Height - Depth3D, Width div 4, Height div 4);
              Brush.Color := Self.Color;
              FillRgn(Handle, Rgn, Brush.Handle);
            end
            else
            begin
              Rgn := CreateRoundRectRgn(0, 0, Width, Height - Depth3D, Width div 4, Height div 4);
              Brush.Color:=Self.Color;
              FillRgn(Handle, Rgn, Brush.Handle);
            end;
            if Focus then
            begin
              Pen.Color := GetInverseColor(Self.Color);
              Pen.Style := psDash;
              Pen.Width := 1;
              Brush.Style := bsClear;
              RoundRect(Depth3D + 3, Depth3D + 3, Width - Depth3D - 3, Height - Depth3D - 3, Width div 4, Height div 4);
            end;
          end;
          bsEllipse:
          begin
            if (Depth3D > 0) then
            begin
              Rgn1 := CreateEllipticRgn(0, 0, Width - 2 * Depth3D, Height - 2 * Depth3D);
              Brush.Color := BtnHighLight;
              FillRgn(Handle, Rgn1, Brush.Handle);
              Rgn2 := CreateEllipticRgn(2 * Depth3D, 2 * Depth3D, Width, Height);
              Brush.Color := BtnShadow;
              FillRgn(Handle, Rgn2, Brush.Handle);
              Rgn := CreateEllipticRgn(Depth3D, Depth3D, Width - Depth3D, Height - Depth3D);
              Brush.Color := Self.Color;
              FillRgn(Handle, Rgn, Brush.Handle);
            end
            else
            begin
              Rgn := CreateEllipticRgn(0, 0, Width, Height);
              Brush.Color := Self.Color;
              FillRgn(Handle, Rgn, Brush.Handle);
            end;
            if Focus then
            begin
              Pen.Color := GetInverseColor(Self.Color);
              Pen.Style := psDash;
              Pen.Width := 1;
              Brush.Style := bsClear;
              Ellipse(Depth3D + 3, Depth3D + 3, Width - Depth3D - 3, Height - Depth3D - 3);
            end;
          end;
          bsTriangle:
          begin
            SetLength(Points, 3);
            if (Depth3D > 0) then
            begin
              Make3Angle(Width-2*Depth3D, Height-2*Depth3D, Depth3D, 0, Points);
              Brush.Color := btnHighLight;
              Pen.Color := btnHighLight;
              Polygon(Points);
              Make3Angle(Width-2*Depth3D, Height-2*Depth3D, Depth3D, 1, Points);
              Brush.Color := btnShadow;
              Pen.Color := btnShadow;
              Polygon(Points);
              Make3Angle(Width-2*Depth3D, Height-2*Depth3D, Depth3D, 3, Points);
              Brush.Color := Self.Color;
              Pen.Color := Self.Color;
              Polygon(Points);
            end
            else
            begin
              Make3Angle(Width, Height, Depth3D, 3, Points);
              Brush.Color := Self.Color;
              Pen.Color := Self.Color;
              Polygon(Points);
            end;
            if Focus then
            begin
              Pen.Color := GetInverseColor(Self.Color);
              Pen.Style := psDash;
              Pen.Width := 1;
              Brush.Style := bsClear;
              SetLength(Points, 3);
              Make3Angle(Width - 2 * Depth3D, Height - 2 * Depth3D, Depth3D, 2, Points);
              Polygon(Points);
            end;
          end;
          bsFive:
          begin
            SetLength(Points, 5);
            if Depth3D > 0 then
            begin
              Make5Angle(Width-2*Depth3D, Height-2*Depth3D, Depth3D, 0, Points);
              Brush.Color := btnHighLight;
              Pen.Color := btnHighLight;
              Polygon(Points);
              Make5Angle(Width-2*Depth3D, Height-2*Depth3D, Depth3D, 1, Points);
              Brush.Color := btnShadow;
              Pen.Color := btnShadow;
              Polygon(Points);
              Make5Angle(Width-2*Depth3D, Height-2*Depth3D, Depth3D, 3, Points);
              Brush.Color := Self.Color;
              Pen.Color := Self.Color;
              Polygon(Points);
            end
            else
            begin
              Make5Angle(Width, Height, 0, 3, Points);
              Brush.Color := Self.Color;
              Pen.Color := Self.Color;
              Polygon(Points);
            end;
            if Focus then
            begin
              Pen.Color := GetInverseColor(Self.Color);
              Pen.Style := psDash;
              Pen.Width := 1;
              Brush.Style := bsClear;
              SetLength(Points, 5);
              Make5Angle(Width - 2 * Depth3D, Height - 2 * Depth3D, Depth3D, 2, Points);
              Polygon(Points);
            end;
          end;
          bsTrapesium:
          begin
            SetLength(Points, 4);
            if (Depth3D > 0) then
            begin
              MakeTrapesium(Width-2*Depth3D, Height-2*Depth3D, Depth3D, 0, Points);
              Brush.Color := btnHighLight;
              Pen.Color := btnHighLight;
              Polygon(Points);
              MakeTrapesium(Width-2*Depth3D, Height-2*Depth3D, Depth3D, 1, Points);
              Brush.Color := btnShadow;
              Pen.Color := btnShadow;
              Polygon(Points);
              MakeTrapesium(Width-2*Depth3D, Height-2*Depth3D, Depth3D, 3, Points);
              Brush.Color := Self.Color;
              Pen.Color := Self.Color;
              Polygon(Points);
            end
            else
            begin
              MakeTrapesium(Width, Height, Depth3D, 3, Points);
              Brush.Color := Self.Color;
              Pen.Color := Self.Color;
              Polygon(Points);
            end;
            if Focus then
            begin
              Pen.Color := GetInverseColor(Self.Color);
              Pen.Style := psDash;
              Pen.Width := 1;
              Brush.Style := bsClear;
              SetLength(Points, 4);
              MakeTrapesium(Width - 2 * Depth3D, Height - 2 * Depth3D, Depth3D, 2, Points);
              Polygon(Points);
            end;
          end;

          bsSix:
          begin
            SetLength(Points, 6);
            if Depth3D > 0 then
            begin
              Make6Angle(Width-2*Depth3D, Height-2*Depth3D, Depth3D, 0, Points);
              Brush.Color := btnHighLight;
              Pen.Color := btnHighLight;
              Polygon(Points);
              Make6Angle(Width-2*Depth3D, Height-2*Depth3D, Depth3D, 1, Points);
              Brush.Color := btnShadow;
              Pen.Color := btnShadow;
              Polygon(Points);
              Make6Angle(Width-2*Depth3D, Height-2*Depth3D, Depth3D, 3, Points);
              Brush.Color := Self.Color;
              Pen.Color := Self.Color;
              Polygon(Points);
            end
            else
            begin
              Make6Angle(Width, Height, 0, 3, Points);
              Brush.Color := Self.Color;
              Pen.Color := Self.Color;
              Polygon(Points);
            end;
            if Focus then
            begin
              Pen.Color := GetInverseColor(Self.Color);
              Pen.Style := psDash;
              Pen.Width := 1;
              Brush.Style := bsClear;
              SetLength(Points, 6);
              Make6Angle(Width - 2 * Depth3D, Height - 2 * Depth3D, Depth3D, 2, Points);
              Polygon(Points);
            end;
          end;
          bsStar:
          begin
            SetLength(Points, 10);
            if Depth3D > 0 then
            begin
              MakeStar2(Width-2*Depth3D, Height-2*Depth3D, Depth3D, 0, Points);
              Brush.Color := btnHighLight;
              Pen.Color := btnHighLight;
              Polygon(Points);
              MakeStar2(Width-2*Depth3D, Height-2*Depth3D, Depth3D, 1, Points);
              Brush.Color := btnShadow;
              Pen.Color := btnShadow;
              Polygon(Points);
              MakeStar2(Width-2*Depth3D, Height-2*Depth3D, Depth3D, 3, Points);
              Brush.Color := Self.Color;
              Pen.Color := Self.Color;
              Polygon(Points);
            end
            else
            begin
              MakeStar2(Width, Height, 0, 3, Points);
              Brush.Color := Self.Color;
              Pen.Color := Self.Color;
              Polygon(Points);
            end;
            if Focus then
            begin
              Pen.Color := GetInverseColor(Self.Color);
              Pen.Style := psDash;
              Pen.Width := 1;
              Brush.Style := bsClear;
              SetLength(Points, 10);
              MakeStar2(Width - 2 * Depth3D, Height - 2 * Depth3D, Depth3D, 2, Points);
              Polygon(Points);
            end;
          end;
        end;

    end;
    if FCaption <> '' then
    begin
      with Canvas do
      begin
        SetBkMode(Handle, Transparent);
        Font.Color := GetInverseColor(Self.Color);
        if ButtonShape = bsTriangle then
        begin
          x := (Points[0].X + Points[1].X + Points[2].X) div 3;
          y := (Points[0].Y + Points[1].Y + Points[2].Y) div 3;
          if DownUp then
            TextOut(x - TextWidth(Caption) div 2 + 2, y - TextHeight(Caption) div 2 + 2, Caption)
          else
            TextOut(x - TextWidth(Caption) div 2, y - TextHeight(Caption) div 2, Caption);
        end
        else if ButtonShape = bsFive then
        begin
          x := (Points[0].X + Points[1].X + Points[2].X + Points[3].X + Points[4].X) div 5;
          y := (Points[0].Y + Points[1].Y + Points[2].Y + Points[3].Y + Points[4].Y) div 5;
          if DownUp then
            TextOut(x - TextWidth(Caption) div 2 + 2, y - TextHeight(Caption) div 2 + 2, Caption)
          else
            TextOut(x - TextWidth(Caption) div 2, y - TextHeight(Caption) div 2, Caption);
        end
        else if ButtonShape = bsSix then
        begin
          x := (Points[0].X + Points[1].X + Points[2].X + Points[3].X + Points[4].X + Points[5].X) div 6;
          y := (Points[0].Y + Points[1].Y + Points[2].Y + Points[3].Y + Points[4].Y + Points[5].Y) div 6;
          if DownUp then
            TextOut(x - TextWidth(Caption) div 2 + 2, y - TextHeight(Caption) div 2 + 2, Caption)
          else
            TextOut(x - TextWidth(Caption) div 2, y - TextHeight(Caption) div 2, Caption);
        end
        else
        begin


          x := (Width - TextWidth(Caption)) div 2;
          y := (Height - TextHeight(Caption)) div 2;
          if DownUp then
            TextOut(x+2, y+2, Caption)
          else
            TextOut(x, y, Caption);
        end;
      end;
    end;
  end;
end.

