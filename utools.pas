unit UTools;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Graphics;

type
  TTools = class        //создание массива свойств?
    procedure CreateObject(x,y: integer); Virtual; Abstract;
    constructor Create;
  end;

  TWidth = class(TTools)
    procedure CreateObject(x,y: integer); override;
    constructor Create;
  end;

  TPenColor = class(TTools)
    procedure CreateObject(x,y: integer); override;
    constructor Create;
  end;

  TBrushColor = class(TTools)
    procedure CreateObject(x,y: integer); override;
    constructor Create;
  end;

  TRoundCoef = class(TTools)
    procedure CreateObject(x,y: integer); override;
    constructor Create;
  end;

var
  ToolNum: Integer;
  ToolList: array of TTools;   // нужно ли?

implementation

constructor TTools.Create;
begin
  case ToolNum of
    1,2:
       begin
         TPenColor.Create;
         TWidth.Create;
       end;
    3:
      begin
        TPenColor.Create;
        TWidth.Create;
       // TBrushColor;
      //  TRoundCoef; //Коэфицент скругления
      end;
    4,5:
       begin
         TPenColor.Create;
         TWidth.Create;
      //8   TBrushColor;
       end;

   end;
  end;

constructor TPenColor.Create;
begin

end;

constructor TWidth.Create;
begin

end;

constructor TBrushColor.Create;
begin

end;

constructor TRoundCoef.Create;
begin

end;

procedure TPenColor.CreateObject(x,y: integer);
begin

end;

procedure TWidth.CreateObject(x,y: integer);
begin

end;

procedure TBrushColor.CreateObject(x,y: integer);
begin

end;

procedure TRoundCoef.CreateObject(x,y: integer);
begin

end;

end.

