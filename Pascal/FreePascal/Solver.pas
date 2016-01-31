unit Solver;
{$mode objfpc}

interface

function Solve(Input: String): String;

implementation

uses
  Classes, SysUtils;

function Solve(Input: String): String;
var
  StringList: TStringList;
begin
  StringList := TStringList.Create;
  try
    StringList.Delimiter := '+';
    Stringlist.DelimitedText := Input;
    result := IntToStr(StrToInt(Stringlist[0]) + StrToInt(Stringlist[1]))
  finally
    StringList.Free
  end
end;

end.
