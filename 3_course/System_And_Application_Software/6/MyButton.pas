unit MyButton;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, System.Math, Vcl.ExtCtrls,Vcl.Graphics,System.Types,Winapi.Windows;

type
  TButtonShape = (bsRectangle, bsRoundRect, bsEllipse, bsTriangle, bsFive, bsSix, bsStar);
  TAngles = (a0, a90, a180, a270);

  TMyButton = class(TGraphicControl)
  private
    Rgn, Rgn1, Rgn2: HRgn;
    FDepth3D: Byte;
    BtnHighLight: TColor;
    BtnShadow: TColor;
    DownUp: Boolean;
    FTButtonshape: TButtonShape;
    FCornerRadius: Integer;
    FBackColor: TColor;
    Handle: HDC;
    FAngles: TAngles;
    FCaption: String;
    procedure SetTButtonshape(const value: TButtonShape);
    procedure SetCornerRadius(const value: Integer);
    procedure SetBackColor(const value: TColor);
    procedure SetCaption(const value:string);
    procedure SetHeaderRotationAngle(const value:TAngles);
    procedure SetDepth3D(value: byte);
  protected
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure Paint;override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy;override;
  published
    property Buttonshape: TButtonShape read FTButtonshape write SetTButtonshape default bsRectangle;
    property CornerRadius: Integer read FCornerRadius write SetCornerRadius default 0;
    property BackgroundColor: TColor read FBackColor write SetBackColor default clBtnFace;
    property Caption: string read FCaption write SetCaption;
    property HeaderRotationAngle: TAngles read FAngles write SetHeaderRotationAngle default a0;
    property Depth3D: Byte read FDepth3D write SetDepth3D default 1;

    property OnClick;
  end;


procedure Register;

implementation

procedure Make3Angle(width, height, dep, typ: Integer; var points: array of TPoint);
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
    points[0].X:= 1;
    points[0].Y:= height - 2 + 2 * dep;
    points[1].X:= width div 2;
    points[1].Y:= 1 + 2 * dep;
    points[2].X:= width - 1;
    points[2].Y:= height - 2 + 2 * dep;
  end
  else
  begin
    points[0].X:= 1;
    points[0].Y:= height - 2 + dep;
    points[1].X:= width div 2;
    points[1].Y:= 1 + dep;
    points[2].X:= width - 1;
    points[2].Y:= height - 2 + dep;
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
     points[0].X:= 1;
     points[0].Y:= height div 2 + 2 * dep;
     points[1].X:= width div 4;
     points[1].Y:= 1 + 2 * dep;
     points[2].X:= 3 * (width div 4);
     points[2].Y:= 1 + 2 * dep;
     points[3].X:= width - 1;
     points[3].Y:= height div 2 + 2 * dep;
     points[4].X:= 3 * (width div 4);
     points[4].Y:= height - 2 + 2 * dep;
     points[5].X:= width div 4;
     points[5].Y:= height - 2 + 2 * dep;
   end
   else
   begin
     points[0].X:= 1;
     points[0].Y:= height div 2 + dep;
     points[1].X:= width div 4;
     points[1].Y:= 1 + dep;
     points[2].X:= 3 * (width div 4);
     points[2].Y:= 1 + dep;
     points[3].X:= width - 1;
     points[3].Y:= height div 2 + dep;
     points[4].X:= 3 * (width div 4);
     points[4].Y:= height - 2 + dep;
     points[5].X:= width div 4;
     points[5].Y:= height - 2 + dep;
   end;
end;

procedure Make5Angle(width, height, dep, typ: Integer; var points: array of TPoint);
var a: Integer; //Сторона пятиугольника
begin
   a:= width div 2;
   if typ = 0 then
   begin
     points[0].X:= a;
     points[0].Y:= 1;
     points[1].X:= width - 1;
     points[1].Y:= a * 2 div 3;
     points[2].X:= 3 * (a div 2);
     points[2].Y:= height - 2;
     points[3].X:= a div 2;
     points[3].Y:= height - 2;
     points[4].X:= 0;
     points[4].Y:= a * 2 div 3;
   end
   else if typ = 1 then
   begin
     points[0].X:= a;
     points[0].Y:= 1 + 2 * dep;
     points[1].X:= width - 1;
     points[1].Y:= a * 2 div 3 + 2 * dep;
     points[2].X:= 3 * (a div 2);
     points[2].Y:= height - 2 + 2 * dep;
     points[3].X:= a div 2;
     points[3].Y:= height - 2 + 2 * dep;
     points[4].X:= 0;
     points[4].Y:= a * 2 div 3 + 2 * dep;
   end
   else
   begin
     points[0].X:= a;
     points[0].Y:= 1 + dep;
     points[1].X:= width - 1;
     points[1].Y:= a * 2 div 3 + dep;
     points[2].X:= 3 * (a div 2);
     points[2].Y:= height - 2 + dep;
     points[3].X:= a div 2;
     points[3].Y:= height - 2 + dep;
     points[4].X:= 0;
     points[4].Y:= a * 2 div 3 + dep;
   end;
end;

procedure Swap(var p1, p2: TPoint);
begin
  var p3: TPoint;
  p3 := p1;
  p1 := p2;
  p2 := p3;
end;

procedure MakeStar(width, height, dep, typ: Integer; var points: array of TPoint);
begin
   Make5Angle(width, height, dep, typ, points);
   //При построении звезды точки пятиугольника обводятся не по
   //порядку,а через одну
   Swap(points[1], points[2]);
   Swap(points[2], points[4]);
   Swap(points[3], points[4]);
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
     points[0] := point(width div 2 - 2 , 1 + 2 * dep);
     points[1] := point(d3 + width div 2 - 2, height  div 2 - d1 - 2 + 2 * dep);
     points[2] := point(width - 2, height div 2 - d1 - 2 + 2 * dep);
     points[3] := point(raz + width div 2 - 2,height div 2 + d1 - 2 + 2 * dep);
     points[4] := point(width div 2 + raz + raz1 - 2,height - 2 + 2 * dep);
     points[5] := point(width div 2 - 2 ,height div 2 + d - 2 + 2 * dep);
     points[6] := point(width div 2 - raz - raz1 - 2, height - 2 + 2 * dep);
     points[7] := point(raz - 2 , height div 2 + d1 - 2 + 2 * dep);
     points[8] := point(- 2, height div 2 - d1 - 2 + 2 * dep);
     points[9] := point(- d3 + width div 2 - 2, height  div 2 - d1 - 2 + 2 * dep);
   end
   else
   begin
     points[0] := point(width div 2 - 2 , 1 + dep);
     points[1] := point(d3 + width div 2 - 2, height  div 2 - d1 - 2 + dep);
     points[2] := point(width - 2, height div 2 - d1 - 2 + dep);
     points[3] := point(raz + width div 2 - 2,height div 2 + d1 - 2 + dep);
     points[4] := point(width div 2 + raz + raz1 - 2,height - 2 + dep);
     points[5] := point(width div 2 - 2 ,height div 2 + d - 2 + dep);
     points[6] := point(width div 2 - raz - raz1 - 2, height - 2 + dep);
     points[7] := point(raz - 2 , height div 2 + d1 - 2 + dep);
     points[8] := point(- 2, height div 2 - d1 - 2 + dep);
     points[9] := point(- d3 + width div 2 - 2, height  div 2 - d1 - 2 + dep);
   end;
end;

procedure Register;
begin
  RegisterComponents('MyComponents', [TMyButton]);
end;


constructor TMyButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FTButtonshape := bsRectangle;
  FCornerRadius := 0;
  FBackColor := clBtnFace;
  FCaption := 'Button';
  FAngles := a0;
  Color := $00B6C4C9;
  Depth3D := 1;
  BtnHighLight := clBtnHighLight;
  BtnShadow := clBtnShadow;
  SetBkMode(Handle, Transparent);
end;

destructor TMyButton.Destroy;
begin
  inherited Destroy;
end;

procedure TMyButton.SetDepth3D(value: Byte);
begin
  if FDepth3D <> Value then
  begin
    FDepth3D := Value;
    Invalidate;
  end;
end;

procedure TMyButton.SetTButtonshape(const value: TButtonShape);
begin
  if FTButtonshape <> value then
  begin
    FTButtonshape := value;
    Invalidate;
  end;
end;

procedure TMyButton.SetCornerRadius(const value: Integer);
begin
  if FCornerRadius <> value then
  begin
    FCornerRadius := value;
    Invalidate;
  end;
end;



procedure TMyButton.SetBackColor(const value: TColor);
begin
  if FBackColor <> value then
  begin
     FBackColor := value;
     Invalidate;
  end;
end;

procedure TMyButton.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  DownUp := True;
  BtnHighLight := clBtnShadow;
  BtnShadow := clBtnHighLight;
  Invalidate;
end;

procedure TMyButton.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  DownUp := False;
  BtnHighLight := clBtnHighLight;
  BtnShadow := clBtnShadow;
  Invalidate;
end;

procedure TMyButton.SetCaption(const value: string);
begin
  if FCaption <> value then
  begin
    FCaption := value;
    Invalidate;
  end;
end;

procedure TMyButton.SetHeaderRotationAngle(const value: TAngles);
begin
  if FAngles <> value then
  begin
    FAngles := value;
    Invalidate;
  end;
end;

procedure  TMyButton.Paint();
var
  Points:array of TPoint;
  RotatedFont:TFont;
  TextWidth,TextHeihgt :Integer;
  RotatedX,RotatedY,X,Y:Integer;
  trRgn1, trRgn2, trRgn3: HRGN;
  fvRgn1, fvRgn2, fvRgn3: HRGN;
  sxRgn1, sxRgn2, sxRgn3: HRGN;
  stRgn1, stRgn2, stRgn3: HRGN;
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
        end;
        bsTriangle:
        begin
          SetLength(Points, 3);
          if (Depth3D > 0) then
          begin
            Make3Angle(Width, Height, Depth3D, 0, Points);
            //trRgn1 := CreatePolygonRgn(Points, 3, WINDING);
            Brush.Color := btnHighLight;
            Pen.Color := btnHighLight;
            Polygon(Points);
            //SetWindowRgn(Self.Handle, trRgn1, True);
            Make3Angle(Width, Height, Depth3D, 1, Points);
            //trRgn2 := CreatePolygonRgn(Points, 3, WINDING);
            Brush.Color := btnShadow;
            Pen.Color := btnShadow;
            Polygon(Points);
            //SetWindowRgn(Handle, trRgn2, True);
            Make3Angle(Width, Height, Depth3D, 2, Points);
            //trRgn3 := CreatePolygonRgn(Points, 3, WINDING);
            Brush.Color := Self.Color;
            Pen.Color := Self.Color;
            Polygon(Points);
            //SetWindowRgn(Self.Handle, trRgn3, True);
          end
          else
          begin
            Make3Angle(Width, Height, Depth3D, 2, Points);
            //trRgn3 := CreatePolygonRgn(Points, 3, WINDING);
            Brush.Color := Self.Color;
            Pen.Color := Self.Color;
            Polygon(Points);
            //SetWindowRgn(Self.Handle, trRgn3, True);
          end;
        end;
        bsFive:
        begin
          SetLength(Points, 5);
          if Depth3D > 0 then
          begin
            Make5Angle(Width, Height, Depth3D, 0, Points);
            //fvRgn1 := CreatePolygonRgn(Points, 5, WINDING);
            Brush.Color := btnHighLight;
            Pen.Color := btnHighLight;
            Polygon(Points);
            //SetWindowRgn(Handle, fvRgn1, True);
            Make5Angle(Width, Height, Depth3D, 1, Points);
            //fvRgn2 := CreatePolygonRgn(Points, 5, WINDING);
            Brush.Color := btnShadow;
            Pen.Color := btnShadow;
            Polygon(Points);
            //SetWindowRgn(Handle, fvRgn2, True);
            Make5Angle(Width, Height, Depth3D, 2, Points);
            //fvRgn3 := CreatePolygonRgn(Points, 5, WINDING);
            Brush.Color := Self.Color;
            Pen.Color := Self.Color;
            Polygon(Points);
            //SetWindowRgn(Handle, fvRgn3, True);
          end
          else
          begin
            Make5Angle(Width, Height, 0, 2, Points);
            //fvRgn3 := CreatePolygonRgn(Points, 5, WINDING);
            Brush.Color := Self.Color;
            Pen.Color := Self.Color;
            Polygon(Points);
            //SetWindowRgn(Handle, fvRgn3, False);
          end;
        end;
        bsSix:
        begin
          SetLength(Points, 6);
          if Depth3D > 0 then
          begin
            Make6Angle(Width, Height, Depth3D, 0, Points);
            //sxRgn1 := CreatePolygonRgn(Points, 6, WINDING);
            Brush.Color := btnHighLight;
            Pen.Color := btnHighLight;
            Polygon(Points);
            //SetWindowRgn(Handle, sxRgn1, False);
            Make6Angle(Width, Height, Depth3D, 1, Points);
            //sxRgn2 := CreatePolygonRgn(Points, 6, WINDING);
            Brush.Color := btnShadow;
            Pen.Color := btnShadow;
            Polygon(Points);
            //SetWindowRgn(Handle, sxRgn2, False);
            Make6Angle(Width, Height, Depth3D, 2, Points);
            //sxRgn3 := CreatePolygonRgn(Points, 6, WINDING);
            Brush.Color := Self.Color;
            Pen.Color := Self.Color;
            Polygon(Points);
            //SetWindowRgn(Handle, sxRgn3, False);
          end
          else
          begin
            Make6Angle(Width, Height, 0, 2, Points);
            //sxRgn3 := CreatePolygonRgn(Points, 6, WINDING);
            Brush.Color := Self.Color;
            Pen.Color := Self.Color;
            Polygon(Points);
            //SetWindowRgn(Handle, sxRgn3, False);
          end;
        end;
        bsStar:
        begin
          SetLength(Points, 10);
          if Depth3D > 0 then
          begin
            MakeStar2(Width, Height, Depth3D, 0, Points);
            //stRgn1 := CreatePolygonRgn(Points, 5, WINDING);
            Brush.Color := btnHighLight;
            Pen.Color := btnHighLight;
            Polygon(Points);
            //SetWindowRgn(Handle, stRgn1, False);
            MakeStar2(Width, Height, Depth3D, 1, Points);
            //stRgn2 := CreatePolygonRgn(Points, 5, WINDING);
            Brush.Color := btnShadow;
            Pen.Color := btnShadow;
            Polygon(Points);
            //SetWindowRgn(Handle, stRgn2, False);
            MakeStar2(Width, Height, Depth3D, 2, Points);
            //stRgn3 := CreatePolygonRgn(Points, 5, WINDING);
            Brush.Color := Self.Color;
            Pen.Color := Self.Color;
            Polygon(Points);
            //SetWindowRgn(Handle, stRgn3, False);
          end
          else
          begin
            MakeStar2(Width, Height, 0, 2, Points);
            //stRgn3 := CreatePolygonRgn(Points, 5, WINDING);
            Brush.Color := Self.Color;
            Pen.Color := Self.Color;
            Polygon(Points);
            //SetWindowRgn(Handle, stRgn3, False);
          end;
        end;
      end;
    end;
    if FCaption <> '' then
    begin
      with Canvas do
      begin
        SetBkMode(Handle, Transparent);
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

