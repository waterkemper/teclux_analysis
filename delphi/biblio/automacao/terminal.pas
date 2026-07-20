unit terminal;

interface

uses
  Classes, SysUtils;

  function GetIP: String;

implementation

uses
 {$IFDEF LINUX}
  Libc
 {$ELSE}
  WinSock
 {$ENDIF};

function GetIP: String;
var
{$IFNDEF LINUX}
  wsaData: TWSAData;
  addr: TSockAddrIn;
{$ELSE}
  addr: in_addr;
{$ENDIF}
  Phe: PHostEnt;
  szHostName: array[0..128] of Char;
begin
  Result := '';
{$IFNDEF LINUX}
  if WSAStartup($101, WSAData) <> 0 then
    Exit;
  try
{$ENDIF}
    if GetHostName(szHostName, 128) <> -1 then
    begin
      Phe := GetHostByName(szHostName);
      if Assigned(Phe) then
      begin
      {$IFNDEF LINUX}
        addr.sin_addr.S_addr := longint(plongint(Phe^.h_addr_list^)^);
        Result := inet_ntoa(addr.sin_addr);
      {$ELSE}
        addr.S_addr := longint(plongint(Phe^.h_addr_list^)^);
        Result := inet_ntoa(addr);
      {$ENDIF}
      end;
    end;
{$IFNDEF LINUX}
  finally
    WSACleanup;
  end;
{$ENDIF}
end;

end.
