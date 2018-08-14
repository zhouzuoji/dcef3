unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, ceflib3, cefvcl3, Buttons, StdCtrls, cefgui, cefvcl;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    Panel1: TPanel;
    LabeledEdit1: TLabeledEdit;
    SpeedButton1: TSpeedButton;
    TabSheet1: TTabSheet;
    Cef3Chromium1: TCef3Chromium;
    Panel2: TPanel;
    Memo1: TMemo;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Cef3Chromium1Jsdialog(Sender: TObject; const browser: ICefBrowser; const originUrl, acceptLang: ustring;
      dialogType: TCefJsDialogType; const messageText, defaultPromptText: ustring; callback: ICefJsDialogCallback;
      out suppressMessage, Result: Boolean);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Cef3ChromiumOSR1BeforeBrowse(Sender: TObject; const browser: ICefBrowser; const frame: ICefFrame;
      const request: ICefRequest; isRedirect: Boolean; out Result: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function showCookie(context: Pointer; const name, value, domain, path: ustring; secure, httponly,
    hasExpires: Boolean; const creation, lastAccess, expires: TDateTime;
    count, total: Integer; out deleteCookie: Boolean): Boolean;
var
  s, dbgmsg: string;
begin
  s := IntToStr(count) + '/' + IntToStr(total) + ': ' + name + '=' + value + '; domain=' + domain + '; path=' + path;

  if httponly then
    s := s + ' HttpOnly';

  dbgmsg := Format('VisitAllCookiesProc in process %x, thread %x: %p, %s', [GetCurrentProcessId, GetCurrentThreadId, context, s]);

  OutputDebugString(PChar(dbgmsg));
  Result := True;
end;

{ TForm1 }

procedure TForm1.Cef3Chromium1Jsdialog(Sender: TObject; const browser: ICefBrowser; const originUrl,
  acceptLang: ustring; dialogType: TCefJsDialogType; const messageText, defaultPromptText: ustring;
  callback: ICefJsDialogCallback; out suppressMessage, Result: Boolean);
var
  s: string;
begin
  s := Format('Jsdialog "%s" in process %x, thread %x', [messageText, GetCurrentProcessId, GetCurrentThreadId]);
  OutputDebugString(PChar(s));
end;

procedure TForm1.Cef3ChromiumOSR1BeforeBrowse(Sender: TObject; const browser: ICefBrowser; const frame: ICefFrame;
  const request: ICefRequest; isRedirect: Boolean; out Result: Boolean);
begin
  OutputDebugString(PChar(request.Url));
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Cef3Chromium1.Load('about:blank');
  CanClose := True;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Self.Caption := Format('process %x, main thread %x', [GetCurrentProcessId, GetCurrentThreadId]);
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  Cef3Chromium1.Load(Trim(LabeledEdit1.Text));
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
var
  retval: ICefv8Value;
  exception: ICefV8Exception;
  v8: ICefv8Context;
begin
  v8 := Cef3Chromium1.Browser.MainFrame.GetV8Context;

  if Assigned(v8) and v8.Eval(Memo1.Text, retval, exception) then
    ShowMessage(retval.GetStringValue)
  else
    Cef3Chromium1.Browser.MainFrame.ExecuteJavaScript(Memo1.Text, '', 0);
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
  TCefCookieManagerRef.Global.VisitAllCookiesProc(showCookie, nil);
  OutputDebugString('call VisitAllCookiesProc end');
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
  Cef3Chromium1.ShowDevTools;
end;

end.
