unit cefreg3;

{$I ..\src\cef3.inc}
{$R chromium3.dcr}
interface

procedure Register;

implementation
uses
  Classes, cefvcl3
{$ifdef DELPHI16_UP}
{$ifndef DELPHI17_UP}
  ,ceffmx3
{$endif}
{$endif}
  ;

procedure Register;
begin
  RegisterComponents('Chromium', [
    TCef3ChromiumDevTools, TCef3Chromium, TCef3ChromiumOSR
{$ifdef DELPHI16_UP}
{$ifndef DELPHI17_UP}
    ,TCef3ChromiumFMX
{$endif}
{$endif}
    ]);
end;

end.
