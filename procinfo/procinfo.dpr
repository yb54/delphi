program procinfo;

uses
  Vcl.Forms,
  frmMain in 'frmMain.pas' {Form1},
  uwinapi.processes in 'uwinapi.processes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
