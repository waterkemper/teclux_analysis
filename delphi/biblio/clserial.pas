{********************************************************}
{                                                        }
{                                                        }
{             Classe para acesso a Serial                }
{                                                        }
{                 Ver 1.0 04/04/2005                     }
{                                                        }
{********************************************************}

unit clserial;

interface

uses Classes, SysUtils{$IFDEF LINUX }, Libc {$ELSE}, Windows{$ENDIF};

type
  TtecSerial = class
  protected
    ComPort: Cardinal;
  public
    function OpenPort(Port: PChar): Integer;
    function WritePort(Informacao: String): Integer;
    function ReadPort(var Buffer: String): Integer;
    function ProcessBuffer(var Value: String; BCD: Boolean = True): Integer;
    function ClosePort: Integer;
  end;

const
  _OK              = 0;
  _ERR_COMUNICACAO = -1;

{$IFDEF LINUX }
  {COM1  = '/dev/ttyS0';
  COM2  = '/dev/ttyS1';
  COM3  = '/dev/ttyS2';
  COM4  = '/dev/ttyS3';
  COM5  = '/dev/ttyS4';
  COM6  = '/dev/ttyS5';
  COM7  = '/dev/ttyS6';
  COM8  = '/dev/ttyS7';
  COM9  = '/dev/ttyS8';
  COM10 = '/dev/ttyS9';
  COM11 = '/dev/ttyS10';
  COM12 = '/dev/ttyS11';
  COM13 = '/dev/ttyS12';
  COM14 = '/dev/ttyS13';
  COM15 = '/dev/ttyS14';}

  COMs: Array[1..15] of Pchar = ('/dev/ttyS0',  '/dev/ttyS1',  '/dev/ttyS2',  '/dev/ttyS3',
                                 '/dev/ttyS4',  '/dev/ttyS5',  '/dev/ttyS6',  '/dev/ttyS7',
                                 '/dev/ttyS8',  '/dev/ttyS9',  '/dev/ttyS10', '/dev/ttyS11',
                                 '/dev/ttyS12', '/dev/ttyS13', '/dev/ttyS14');


{$ELSE}
  {COM1 = 'COM1';
  COM2 = 'COM2';
  COM3 = 'COM3';}
  COMs: Array[1..3] of Pchar = ('COM1','COM2','COM3');
{$ENDIF}
  STX  = #2;
  ETX  = #3;
  ACK  = $06;
  NAK  = $15;
  STATUS = 3;

{$IFDEF LINUX }
var
  ComAttr: termios;
{$ENDIF}

implementation

Uses
  //CLX
  Forms,
  //Biblio
  biblio;

{ TtecSerial }

function TtecSerial.ClosePort: Integer;
begin
{$IFDEF LINUX }
  Result := __close(ComPort);
{$ELSE }
  CloseHandle(ComPort);
  Result := GetLastError;
{$ENDIF}
end;

function TtecSerial.OpenPort(Port: PChar): Integer;
var
  tty : PChar;
  NP: Integer;
  Texto: String;
{$IFDEF MSWINDOWS}
  Buf : PCommConfig;
  size : DWORD;
  TimeoutBuffer: PCOMMTIMEOUTS;
{$ENDIF}
begin
   Texto:=Port;
   NP:= StrToInt(Copy(Texto,4,length(Texto)-3));
   tty:= COMs[NP];
   {$IFDEF LINUX}
   if tty='' then
   tty := PChar('/dev/ttyS0');
   {$ELSE}
   if tty='' then
   tty := PChar('COM1');
   {$ENDIF}

  {if Port = 'COM3' then
    tty := COM3
  else if Port = 'COM2' then
    tty := COM2
  else
    tty := COM1;}
{$IFDEF LINUX }
  ComPort := open(tty, O_RDWR or O_NOCTTY or O_NDELAY);
  tcgetattr(ComPort, ComAttr);
  with ComAttr do begin
    c_cflag := B9600 or CS8 or CREAD;
    c_lflag := NOFLSH;
    c_iflag := IGNBRK;
    c_oflag := 0;
    c_line  := '0';
    c_cc[VMIN] := '0';
    c_cc[VTIME] := '2';
  end;
  tcsetattr(ComPort, TCSANOW, ComAttr);
  Result := ComPort;
{$ELSE }
  ComPort := CreateFile(PChar(tty), GENERIC_READ or GENERIC_WRITE, 0, nil, OPEN_EXISTING, 0, 0);
  if ComPort = INVALID_HANDLE_VALUE then
    Result := GetLastError
  else
    Result := ComPort;
  GetMem(Buf, sizeof(TCommConfig));
  size := 0;
  GetCommConfig(ComPort, Buf^, size);
  Buf^.dcb.Flags    := $1011;
  Buf^.dcb.BaudRate := 9600;
  Buf^.dcb.ByteSize := 8;
  Buf^.dcb.Parity   := 0;
  Buf^.dcb.StopBits := 0;
  SetCommConfig(ComPort, Buf^, size);
  FreeMem(Buf, sizeof(TCommConfig));

  GetMem(TimeoutBuffer, sizeof(COMMTIMEOUTS));

  GetCommTimeouts (ComPort, TimeoutBuffer^);
   TimeoutBuffer.ReadIntervalTimeout        := 500;
   TimeoutBuffer.ReadTotalTimeoutMultiplier := 500;
   TimeoutBuffer.ReadTotalTimeoutConstant   := 500;
  SetCommTimeouts (ComPort, TimeoutBuffer^);

  FreeMem(TimeoutBuffer, sizeof(COMMTIMEOUTS));


{$ENDIF}
end;

function TtecSerial.WritePort(Informacao: String): Integer;
const
  MAX_SIZE = 450;
var
  Buffer: Array[0..MAX_SIZE] of Byte;
{$IFDEF LINUX }
  cnt,
  BufSize: Integer;
  CheckSum: Word;
{$ELSE}
  BufSize, BufWrite: Cardinal;
  Res: Boolean;
{$ENDIF}
begin
{$IFDEF LINUX }
  CheckSum := 0;
  if Informacao <> '' then
    Move(Informacao[1], Buffer[3], Length(Informacao));
  for cnt := 0 to Length(Informacao) - 1 do
    Inc(CheckSum, Buffer[cnt+3]);
  BufSize   := Length(Informacao) + 2;
  Buffer[0] := Ord(STX);
  Buffer[1] := Lo(BufSize);
  Buffer[2] := Hi(BufSize);
  Buffer[BufSize + 1] := Lo(CheckSum);
  Buffer[BufSize + 2] := Hi(CheckSum);
  Buffer[BufSize + 3] := Ord(ETX);
  tcflow(ComPort, TCOON);
  Result := __write(ComPort, Buffer, BufSize);
{$ELSE}
  if Informacao <> '' then
    Move(Informacao[1], Buffer[0], Length(Informacao));
  BufSize := Length(Informacao);
  Res := WriteFile(ComPort, Buffer, BufSize, BufWrite, nil);
  if Not Res then
    Result := GetLastError
  else
    Result := BufSize;
{$ENDIF}
end;

function TtecSerial.ReadPort(var Buffer: String): Integer;
const
  MaxTimeout = 10000;
  MAX_SIZE = 450;
var
  TimeOut, TimeOut1: Comp;
{$IFNDEF LINUX }
  a, Qtdade: Cardinal;
  Res: Boolean;
  Buf: array[0..MAX_SIZE] of Byte;
{$ELSE}
  C: Char;
{$ENDIF}
begin
{$IFDEF LINUX }
  tcflow(ComPort, TCOOFF);
{$ENDIF}
  TimeOut := Clock + MaxTimeout;
  repeat
    Application.ProcessMessages;
{$IFDEF LINUX }
    Result := __read(ComPort, C, 1);
{$ELSE}
    Qtdade := 0;
    Res := ReadFile(ComPort, Buf, sizeof(Buf), Qtdade, nil);
    if Res then
      Result := Qtdade
    else
      Result := GetLastError;
{$ENDIF}
   TimeOut1 := Clock;
{$IFDEF LINUX }
  until (C = #6) or (C = #21) or ((Result = -1) and (TimeOut1 > TimeOut));
  if (C = #21) then
    Buffer := C
  else if C = #6 then begin
    TimeOut := Clock + MaxTimeout;
    TimeOut1 := 0;
    Buffer := C;
    Result := 0;
    while (Result <> -1) and (TimeOut > TimeOut1) do begin
     Result := __read(ComPort, C, 1);
     if Result <> -1 then
       Buffer := Buffer + C;
     TimeOut1 := Clock;
    end;
  end
{$ELSE}
  until ((Res) or (TimeOut1 > TimeOut));
  Buffer := '';
  if Res then
    for a := 0 to Qtdade do
      Buffer := Buffer + char(Buf[a]);

{$ENDIF}
end;

function TtecSerial.ProcessBuffer(var Value: String; BCD: Boolean): Integer;
var
  Buffer: String;
  BufSize, cnt: Integer;
  Flag: Integer;
begin
  Value := '';
  ReadPort(Buffer);
  BufSize := Length(Buffer);
  if BufSize = 0 then
    Result := _ERR_COMUNICACAO
  else begin
    if BufSize > STATUS then begin
      for cnt := 1 to (BufSize - STATUS) do
        if BCD then begin
          Value := Value + Chr( 48 + (Ord(Buffer[cnt + 1]) shr 4) );
          Value := Value + Chr( 48 + (Ord(Buffer[cnt + 1]) and $F) );
        end else if Buffer[cnt + 1] <> #0 then
          Value := Value + Buffer[cnt + 1];
    end;
    Result := 0;
    if Ord(Buffer[1]) = ACK then begin
      Result := _OK;
      if BufSize = 3 then begin
        Flag := (Ord(Buffer[BufSize - 1]) shl 8) + Ord(Buffer[BufSize]);
        if Flag > 0 then
          Result := Flag
      end
    end else if Ord(Buffer[1]) = NAK then
      Result := _ERR_COMUNICACAO
  end;
end;

end.
