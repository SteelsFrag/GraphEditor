unit UFigures;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Graphics;

type

  TFigures = class
    Points: array of TPoint;             // Массив точек
    FColor, BColor: TColor;
    FWidth: integer;
    procedure MouseMove(x, y: integer);
    procedure DrawFigure(ACanvas: TCanvas); virtual; abstract;
    constructor Create;
    //procedure ConsCreate;
  end;

  TPolyLine = class(TFigures)
    procedure DrawFigure(ACanvas: TCanvas); override;
    constructor Create;
  end;

  TRectangle = class(TFigures)
    procedure DrawFigure(ACanvas: TCanvas); override;
    constructor Create;
  end;

  {TRoundRect = class (TFigures)
    procedure DrawFigure(ACanvas: TCanvas); override;
    constructor Create;
  end;  }

  TEllipse = class(TFigures)
    procedure DrawFigure(ACanvas: TCanvas); override;
    constructor Create;
  end;

  TLine = class(TFigures)
    procedure DrawFigure(ACanvas: TCanvas); override;
    constructor Create;
  end;

implementation

constructor TFigures.Create;
begin

end;

constructor TLine.Create;
begin

end;

constructor TRectangle.Create;
begin

end;

constructor TEllipse.Create;
begin

end;

constructor TPolyLine.Create;
begin
 // SetLength(Points, Length(Points)+1);
  //TPolyLine.DrawFigure(ACanvas: TCanvas);
end;

procedure TFigures.MouseMove(x, y: integer);
begin
  SetLength(Points,Length(Points)+1);
  Points[Length(Points)-1]:= TPoint.Create(x,y);
end;

procedure TPolyLine.DrawFigure(ACanvas: TCanvas);
begin
  ACanvas.Pen.Width  := FWidth;
  ACanvas.Pen.Color  := FColor;
  ACanvas.Brush.Color:= BColor;
  ACanvas.PolyLine(Points);
end;

procedure TLine.DrawFigure(ACanvas: TCanvas);     //выдетает при повторном нажатии
begin                                             //на последнюю точку!!!!
  ACanvas.Pen.Width  := FWidth;
  ACanvas.Pen.Color  := FColor;
  ACanvas.Brush.Color:= BColor;
  ACanvas.Line(Points[0],Points[Length(Points)-1]);
end;

procedure TRectangle.DrawFigure(ACanvas: TCanvas);
begin
  //if флаг заливки = true then
  //  ACanvas.FillRect(points[0].x, points[0].y, points[Length(Points)-1].x, points[Length(Points)-1].y);
  ACanvas.Pen.Width  := FWidth;  //поставить флажек заливки!!
  ACanvas.Pen.Color  := FColor;
  ACanvas.Brush.Color:= BColor;
  ACanvas.Line(Points[0].x, Points[0].y, Points[Length(Points)-1].x, Points[0].y);
  ACanvas.Line(Points[0].x, Points[0].y, Points[0].x, Points[Length(Points)-1].y);
  ACanvas.Line(Points[0].x, Points[Length(Points)-1].y, Points[Length(Points)-1].x, Points[Length(Points)-1].y);
  ACanvas.Line(Points[Length(Points)-1].x, Points[Length(Points)-1].y, Points[Length(Points)-1].x, points[0].y);
end;

procedure TEllipse.DrawFigure(ACanvas: TCanvas);   //поработать с заливкой!!!
begin
 // if флфг заливки = true then
  //esle
  ACanvas.Pen.Width  := FWidth;
  ACanvas.Pen.Color  := FColor;
  ACanvas.Brush.Color:= clWhite;
  ACanvas.Ellipse(Points[0].x, Points[0].y, Points[Length(Points)-1].x, Points[Length(Points)-1].y);
end;

end.

