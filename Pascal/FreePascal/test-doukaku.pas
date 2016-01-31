{
  $ fpc test-doukaku.pas
  $ ./test-doukaku sample-data.txt
}

Program TestDoukaku;
{$mode objfpc}

uses
  Classes, SysUtils, Solver;

procedure Test(Input: String; Expected: String);
var
  Actual: String;
begin
  Actual := Solve(Input);
  if Actual = Expected then
    Write('.')
  else begin
    WriteLn;
    WriteLn('input:    ', input);
    WriteLn('expected: ', expected);
    WriteLn('actual:   ', actual)
  end
end;

var
 DataFile: TextFile;
 Line: String;
 StringList: TStringList;
begin
  StringList := TStringList.Create;
  try
    StringList.Delimiter := ' ';
    AssignFile(DataFile, ParamStr(1));
    try
      Reset(DataFile);
      while not eof(DataFile) do begin
        ReadLn(DataFile, Line);
        Stringlist.DelimitedText := Line;
        Test(Stringlist[0], Stringlist[1])
      end
    finally
      CloseFile(DataFile)
    end
  finally
    StringList.Free
  end;
  WriteLn
end.
