program hellocef;

uses
  Forms,
  ceflib3,
  Windows,
  Unit1 in 'Unit1.pas' {Form1},
  ceffilescheme in '..\filescheme\ceffilescheme.pas';

{$R *.res}

begin
  Application.Initialize;
  CefLocale := 'zh-CN';
  CefSingleProcess := False;
  CefBrowserSubprocessPath := 'subprocess.exe';
  if CefLoadLibDefault and CefIsMainProcess then
  begin
    Application.MainFormOnTaskbar := True;
    Application.CreateForm(TForm1, Form1);
    Application.Run;
  end
  else
    Windows.MessageBox(0, 'º”‘ÿcef ß∞‹£°', 'error', MB_ICONERROR + MB_OK);
end.
