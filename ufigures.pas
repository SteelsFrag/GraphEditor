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
  end;

  TPolyLine = class(TFigures)
    procedure DrawFigure(ACanvas: TCanvas); override;
    constructor Create;
  end;

 { TRectangle = class(TFigures)
    //
  end;

  TRoundRect = class (TFigures)
    //
  end;

  TEllipse = class(TFigures)
    //
  end;}

  TLine = class(TFigures)

  end;

implementation

constructor TPolyLine.Create;
begin
  //SetLength(Points, Length(Points)+1);
end;

procedure TFigures.MouseMove(x, y: integer);
begin
  SetLength(Points,Length(Points)+1);
  Points[Length(Points)-1]:= TPoint.Create(x,y);
 // Points[Length(Points)-1] := Point(x,y);
end;

procedure TPolyLine.DrawFigure(ACanvas: TCanvas);
begin
  ACanvas.Pen.Width  :=1;        //FWidth;
  ACanvas.Pen.Color  := clblack;  //FColor;
  //ACanvas.Brush.Color:= BColor;
  ACanvas.PolyLine(Points);
end;

end.
