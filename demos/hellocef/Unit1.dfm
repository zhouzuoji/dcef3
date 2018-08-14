object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 532
  ClientWidth = 863
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 863
    Height = 432
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object Cef3Chromium1: TCef3Chromium
        Left = 0
        Top = 0
        Width = 855
        Height = 404
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        DefaultUrl = 'https://www.baidu.com'
        TabOrder = 0
        OnJsdialog = Cef3Chromium1Jsdialog
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 504
    Width = 863
    Height = 28
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      863
      28)
    object SpeedButton1: TSpeedButton
      Left = 800
      Top = 0
      Width = 63
      Height = 28
      Align = alRight
      Caption = 'load'
      OnClick = SpeedButton1Click
      ExplicitLeft = 0
      ExplicitTop = -35
      ExplicitHeight = 863
    end
    object LabeledEdit1: TLabeledEdit
      Left = 34
      Top = 4
      Width = 760
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      EditLabel.Width = 26
      EditLabel.Height = 13
      EditLabel.Caption = 'URL: '
      ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
      LabelPosition = lpLeft
      TabOrder = 0
      Text = 'https://www.taobao.com'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 432
    Width = 863
    Height = 72
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object SpeedButton2: TSpeedButton
      Left = 737
      Top = 0
      Width = 63
      Height = 72
      Align = alRight
      Caption = 'eval'
      OnClick = SpeedButton2Click
      ExplicitLeft = 674
      ExplicitTop = 2
    end
    object SpeedButton3: TSpeedButton
      Left = 800
      Top = 0
      Width = 63
      Height = 72
      Align = alRight
      Caption = 'cookies'
      OnClick = SpeedButton3Click
      ExplicitLeft = 704
      ExplicitTop = -1
    end
    object SpeedButton4: TSpeedButton
      Left = 674
      Top = 0
      Width = 63
      Height = 72
      Align = alRight
      Caption = 'DevTool'
      OnClick = SpeedButton4Click
      ExplicitTop = 2
    end
    object Memo1: TMemo
      Left = 0
      Top = 0
      Width = 674
      Height = 72
      Align = alClient
      ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
      Lines.Strings = (
        'alert(document.location.href);')
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
end
