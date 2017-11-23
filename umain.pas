unit UMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, UFigures;//, UTools;

const
  CBColor = clBlack;
  WBWidth = 1;

type

  { TMainForm }

  TMainForm = class(TForm)
    PB: TPaintBox;
    Panel: TPanel;
    ToolsPanel: TPanel;
    PolyLineBut: TSpeedButton;
    RectBut: TSpeedButton;
    EllipseBut: TSpeedButton;
    LineBut: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    procedure PBMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure PBMouseMove(Sender: TObject; Shift: TShiftState; X, Y: integer);
    procedure PBMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure PBPaint(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  MainForm: TMainForm;
  CanvasFigures: array of TFigures;
  isDrawing: boolean;
  i: integer;

implementation

{$R *.lfm}

{ TMainForm }

procedure TMainForm.PBPaint(Sender: TObject);
begin
  for i := 0 to Length(CanvasFigures) - 1 do
    begin
      CanvasFigures[i].DrawFigure(PB.Canvas);
    end;
end;

procedure TMainForm.PBMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: integer);
begin
  if (ssLeft in Shift) and (isDrawing) then
  begin
    CanvasFigures[Length(CanvasFigures)-1].MouseMove(x, y);
  end;
  PB.Invalidate;
end;

procedure TMainForm.PBMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
begin
  isDrawing := False;
end;

procedure TMainForm.PBMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
begin
  isDrawing:= True;
  SetLength(CanvasFigures, Length(CanvasFigures) + 1);
  CanvasFigures[Length(CanvasFigures)-1]:=TPolyLine.Create;
 // CanvasFigures[Length(CanvasFigures)-1].FColor := clBlack;//   Заменить на кнопки
 // CanvasFigures[Length(CanvasFigures)-1].BColor := clBlack;//        цветов
  //CanvasFigures[Length(CanvasFigures)-1].FWidth:= 1;
end;

{procedure (ASender: TObject);
begin

end;}

end.



