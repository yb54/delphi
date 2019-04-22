unit frmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, TLHelp32,
  Vcl.ComCtrls, Vcl.Menus;

type
  TForm1 = class(TForm)
    ListView1: TListView;
    procedure FormShow(Sender: TObject);
  private

  public
    procedure LoadProcessInfo;
  end;

var
  Form1: TForm1;


implementation

{$R *.dfm}

uses
  uwinapi.processes;

procedure TForm1.FormShow(Sender: TObject);
begin
  LoadProcessInfo;
end;

procedure TForm1.LoadProcessInfo;
var
  snapshot: THandle;
  ProcEntry: TProcessEntry32;
  s: String;
  LI : TListItem;
  ProcMem : Double;

begin
  snapshot := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);

  if (snapshot <> INVALID_HANDLE_VALUE) then
  begin
    ProcEntry.dwSize := SizeOf(ProcessEntry32);
    if (Process32First(snapshot, ProcEntry)) then
    begin
      s := ProcEntry.szExeFile;
      // s contains image name of the first process
      while Process32Next(snapshot, ProcEntry) do
      begin
        s := ProcEntry.szExeFile;
        ProcMem := GetMemoryByPid(ProcEntry.th32ProcessID) / 1048576 ;
        LI := Form1.ListView1.Items.Add;
        LI.Caption := s;
        LI.SubItems.Add(ProcEntry.th32ProcessID.ToString);
        LI.SubItems.Add(FormatFloat('###0.##', ProcMem)+' MB');
      end;
    end;
  end;

  CloseHandle(snapshot);
end;

end.
