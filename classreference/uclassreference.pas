unit uclassreference;

interface

uses
  System.Classes, vcl.Forms, vcl.Controls, vcl.Dialogs;

type
  TDummy = class
    class procedure ButtonClick(Sender : TObject);
  end;

function ACreateControl (ControlClass: TControlClass; const Form : TForm; const ControlName: string;
  X, Y, W, H: Integer) : TControl;

function ACreateControlEx(const ControlClass: TControlClass; const ControlName: string;
  const ParentClass : TObject; X, Y, W, H: Integer): TControl;

procedure Click1(Self: TObject; Sender: TObject);
procedure Click2(Self: TObject; Sender: TObject);

implementation

procedure Click1(Self: TObject; Sender: TObject);
begin
  ShowMessage('Hi');
end;

procedure Click2(Self: TObject; Sender: TObject);
begin
  ShowMessage('Knock... Knock... Knock...');
end;

function ACreateControl (ControlClass: TControlClass; const Form : TForm; const ControlName: string;
  X, Y, W, H: Integer) : TControl;
begin
  Result := ControlClass.Create(Form);
  Result.Parent := Form;
  Result.Name := ControlName;
  Result.SetBounds(X, Y, W, H);
  Result.Visible := True;
end;

function ACreateControlEx(const ControlClass: TControlClass; const ControlName: string;
  const ParentClass : TObject; X, Y, W, H: Integer): TControl;
begin
  Result := ControlClass.Create(ParentClass as TComponent);
  Result.Parent := ParentClass as TWinControl;
  Result.Name := ControlName;
  Result.SetBounds(X, Y, W, H);
  Result.Visible := True;
end;


{ TDummy }

class procedure TDummy.ButtonClick(Sender: TObject);
begin
  ShowMessage('Hello');
end;

end.
