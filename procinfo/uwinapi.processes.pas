unit uwinapi.processes;

interface

// https://docs.microsoft.com/ru-ru/windows/desktop/api/psapi/nf-psapi-enumprocesses
// https://docs.microsoft.com/ru-ru/windows/desktop/ToolHelp/tool-help-library
// JclSysInfo.RunningProcessesList in the JCL

function GetMemoryByPid(const pid : Cardinal) : NativeUInt;

implementation

uses
  Winapi.Windows, PSAPI;

function GetMemoryByPid(const pid : Cardinal) : NativeUInt;
var
  pmc : PROCESS_MEMORY_COUNTERS;
  prochandle : THandle;
begin
  Result := 0;
  prochandle := OpenProcess(PROCESS_QUERY_INFORMATION, false, pid);
  if prochandle <> 0 then
  begin
    GetProcessMemoryInfo(prochandle, @pmc, SizeOf(PROCESS_MEMORY_COUNTERS));
    Result := pmc.WorkingSetSize;
  end;
end;

end.
