object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'GetMemroyInfo Example'
  ClientHeight = 440
  ClientWidth = 987
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ListView1: TListView
    Left = 0
    Top = 0
    Width = 987
    Height = 440
    Align = alClient
    Columns = <
      item
        Caption = 'ProcessName'
        Width = 150
      end
      item
        Caption = 'ProcessID'
        Width = 150
      end
      item
        Caption = 'Memory'
        Width = 150
      end>
    DoubleBuffered = True
    GridLines = True
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    ParentDoubleBuffered = False
    TabOrder = 0
    ViewStyle = vsReport
    ExplicitWidth = 545
  end
end
