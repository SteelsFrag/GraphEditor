unit UTools;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  ExtCtrls, LCLIntf, LCLType, Buttons, TypInfo, ActnList, UFigures;

type
  TTools = class
    procedure CreateObject(x,y: integer); Virtual; Abstract;
    //constructor Create;
  //rocedure CreateObj;
  end;

  TLineTool = class(TTools)
   // procedure CreateObject(x,y: integer); override;
   // constructor CreateObj;
  end;

var
  ToolNum: Integer;
  ToolList: array of TTools;

implementation
uses UMain;
///////////////////////////////////////////////////////////////////
{procedure TLineTool.CreateObject(x,y: integer);
begin
  SetLength(CanvasFigures,Length(CanvasFigures)+1);
  CanvasFigures[Length(CanvasFigures)]:= TLine.Create;
  CanvasFigures[Length(CanvasFigures)].Points[0]:= Point(x,y);
  CanvasFigures[Length(CanvasFigures)].Points[1]:= Point(x,y);
end;  }


end.
