unit UMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, UFigures, UTools;

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
    procedure SpeedButtonClick(ASender: TObject);
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
  if ToolNum <> -1 then
  for i := 0 to Length(CanvasFigures) - 1 do
    begin
      CanvasFigures[i].DrawFigure(PB.Canvas);
    end;
end;

procedure TMainForm.SpeedButtonClick(ASender: TObject);
begin
  ToolNum:= (ASender as TSpeedButton).Tag;
  TTools.Create;



  {setlength(ToolList,length(ToolList)+1)
 SetLength(CanvasFigures, Length(CanvasFigures) + 1);
   case ToolNum of
   1:
     CanvasFigures[Length(CanvasFigures)-1]:= TLine.Create;
     2:
     CanvasFigures[Length(CanvasFigures)-1]:= TPolyLine.Create;
   end; }
end;

procedure TMainForm.PBMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: integer);
begin
  if (ssLeft in Shift) and (isDrawing) and(ToolNum <> 0) then
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
   { if (isDrawing = False) then
  begin
  // ToolList[ToolNum].CreateObject(x,y);
   //CanvasFigures[length(CanvasFigures)-1].FColor:=PenColor.ButtonColor;
   //CanvasFigures[length(CanvasFigures)-1].BColor:=BrushColor.ButtonColor;
   //CanvasFigures[length(CanvasFigures)-1].FWidth:=WidthSize.Value;
  end; }                               // Создать эти кнопки
  isDrawing:= True;
  case ToolNum of
  1: begin
       SetLength(CanvasFigures, Length(CanvasFigures) + 1);
       CanvasFigures[Length(CanvasFigures)-1]:= TLine.Create;
     end;
  2: begin
       SetLength(CanvasFigures, Length(CanvasFigures) + 1);
       CanvasFigures[Length(CanvasFigures)-1]:= TPolyLine.Create;
     end;
  3: begin
       //SetLength(CanvasFigures, Length(CanvasFigures) + 1);
       //CanvasFigures[Length(CanvasFigures)-1]:= TRoundRect.Create;
     end;
  4:
    begin
        SetLength(CanvasFigures, Length(CanvasFigures) + 1);
        CanvasFigures[Length(CanvasFigures)-1]:= TRectangle.Create;;
    end;
  5:
    begin
      SetLength(CanvasFigures, Length(CanvasFigures) + 1);
       CanvasFigures[Length(CanvasFigures)-1]:= TEllipse.Create;
    end;
  end;
 // isDrawing:= True;
 // SetLength(CanvasFigures, Length(CanvasFigures) + 1);
 // CanvasFigures[Length(CanvasFigures)-1]:= ToolPanel[ToolNum].Create;
//  CanvasFigures[Length(CanvasFigures)-1].FColor := clBlack;//   Заменить на кнопки
 // CanvasFigures[Length(CanvasFigures)-1].BColor := clBlack;//        цветов
  //CanvasFigures[Length(CanvasFigures)-1].FWidth:= 1;
end;


end.



