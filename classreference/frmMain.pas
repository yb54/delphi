(* lnk1: http://www.delphisources.ru/pages/faq/base/rtti_assign_event.html *)
unit frmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    GenerateButton: TButton;
    Panel1: TPanel;
    procedure GenerateButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  uclassreference;


procedure TForm1.GenerateButtonClick(Sender: TObject);
const
  PADDING_TOP   = 55;
  PADDING_LEFT  = 25;
  BTN_WIDTH = 140;

var
  Button : TControl;
  Cls : TControlClass;
  Btn : TButton absolute Button;
  evhandler: TNotifyEvent;



begin
  (Sender as TButton).Enabled := False;

  Button := ACreateControl(TButton, Self, 'CoolBtn', PADDING_LEFT, PADDING_TOP,BTN_WIDTH,30);
  (Button as TButton).Caption := 'Push Me';
  Btn.OnClick := TDummy.ButtonClick;

  Cls := TButton;
  Button := ACreateControl(Cls, Form1, 'CoolBtn1', PADDING_LEFT, PADDING_TOP * 2,BTN_WIDTH,30);
  (Button as Cls).Hint := 'Hint';
  (Button as Cls).ShowHint := True;
  Btn.Caption := 'Push Me';
  @Btn.OnClick := @Click1;

  Button := ACreateControlEx(TButton,'RunButton',Self,PADDING_LEFT, PADDING_TOP * 3,BTN_WIDTH,30);
  (Button as TButton).Caption := 'Push Me';
  TMethod(evhandler).Code := @Click2;
  TMethod(evhandler).Data := nil;
  Btn.OnClick := evhandler;
end;

end.
