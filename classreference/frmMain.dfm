object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Class Reference Example'
  ClientHeight = 215
  ClientWidth = 195
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 195
    Height = 41
    Align = alTop
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 0
    object GenerateButton: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 187
      Height = 33
      Align = alClient
      Caption = 'Create Buttons'
      TabOrder = 0
      OnClick = GenerateButtonClick
      ExplicitLeft = 8
      ExplicitTop = 9
      ExplicitWidth = 97
      ExplicitHeight = 25
    end
  end
end
