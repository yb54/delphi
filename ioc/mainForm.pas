unit mainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;



type
  TCan = reference to procedure;

  THuman = class
  private
    FCan : TCan;
    procedure SetFCan(const Value: TCan);
  public
    constructor Create;
    procedure DoSomting;
    property ICan : TCan write SetFCan;
  end;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  Human : THuman;
  CanWCode : TCan;
  CleanRoom : TCan;
begin

  CanWCode := procedure
  begin
    ShowMessage('I Can write code');
  end;

  CleanRoom := procedure
  begin
    ShowMessage('I Can Clean Room');
  end;

  Human := THuman.Create;
  Human.ICan := CanWCode;
  Human.DoSomting;
  Human.Free;
end;

{ THuman }

constructor THuman.Create;
begin
  FCan := nil;
end;

procedure THuman.DoSomting;
begin

  if Assigned(FCan) then
    try
      FCan();
    except
      raise Exception.Create('Error not assigned ICan');
    end
      else raise Exception.Create('Fatal Error');
end;

procedure THuman.SetFCan(const Value: TCan);
begin

  if Assigned(Value) then
  begin
    FCan := Value;
  end;

end;

end.
