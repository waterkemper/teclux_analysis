unit us3thread;

interface

uses
  Classes{$IFDEF MSWINDOWS}, Windows{$ENDIF}, Sysutils, blcksock, us3storage;

type
  TS3Thread = class(TThread)
  private
    bucket: string;
    objectname: string;
    mStream: TStream;
    S3: TS3Storage;
    mBytesWritten: integer;
    mBytesRead: integer;
    mSuccess: boolean;
    mMessage: string;
    mStatusMessage: string;
    mOp: string;
    mBinary: boolean;
    procedure SetName;
  protected
    procedure Execute; override;
  public
    procedure StatusUpdate(Sender: TObject; Reason: THookSocketReason; const Value: string);
    procedure UpdateStatus; //updates UI
    property Op: string read mOp;
    property Success: boolean read mSuccess;
    property ResultStream: TStream read mstream;
    property theMessage: String read mMessage;

    constructor Create(op: string; bucket: string; objectname: string; stream: TStream; S3: TS3Storage; isBinary: boolean);
    destructor Destroy; override;
  end;

implementation


{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure TS3Thread.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{$IFDEF MSWINDOWS}
type
  TThreadNameInfo = record
    FType: LongWord; // must be 0x1000
    FName: PChar; // pointer to name (in user address space)
    FThreadID: LongWord; // thread ID (-1 indicates caller thread)
    FFlags: LongWord; // reserved for future use, must be zero
  end;
{$ENDIF}

{ TS3Thread }

constructor TS3Thread.Create(op: string; bucket: string; objectname: string; stream: TStream; S3: TS3Storage; isBinary: boolean);
begin
  inherited create(true); //initially suspended

      //check for 2nd instance
      {
  if not frmMain.isThreadNil then begin
    raise Exception.Create('Multiple thread instances not allowed');
  end;
  }

  self.mOp := op;
  self.bucket := bucket;
  self.objectname := objectname;
  self.mstream := stream;
  self.S3 := S3;
  self.mBinary := isBinary;
  self.FreeOnTerminate := true;
  mBytesWritten := 0;
  mBytesRead := 0;
end;

destructor TS3Thread.Destroy;
begin
  S3.OnStatusChange := nil;
  inherited Destroy;
end;

procedure TS3Thread.SetName;
{$IFDEF MSWINDOWS}
var
  ThreadNameInfo: TThreadNameInfo;
{$ENDIF}
begin
{$IFDEF MSWINDOWS}
  ThreadNameInfo.FType := $1000;
  ThreadNameInfo.FName := 'S3Thread';
  ThreadNameInfo.FThreadID := $FFFFFFFF;
  ThreadNameInfo.FFlags := 0;

  try
    RaiseException($406D1388, 0, sizeof(ThreadNameInfo) div sizeof(LongWord), @ThreadNameInfo);
  except
  end;
{$ENDIF}
end;

procedure TS3Thread.StatusUpdate(Sender: TObject; Reason: THookSocketReason; const Value: string);
begin

case Reason of
      {:Resolving is begin. Resolved IP and port is in parameter in format like:
     'localhost.somewhere.com:25'.}
    HR_ResolvingBegin:
    mStatusMessage := 'Resolving...';
    {:Resolving is done. Resolved IP and port is in parameter in format like:
     'localhost.somewhere.com:25'. It is always same as in HR_ResolvingBegin!}
    HR_ResolvingEnd:
     mStatusMessage := 'Resolved';
    {:Socket created by CreateSocket method. It reporting Family of created
     socket too!}
    HR_SocketCreate:
     mStatusMessage := 'Socket created';
    {:Socket closed by CloseSocket method.}
    HR_SocketClose:
     mStatusMessage := 'Socket closed';
    {:Socket binded to IP and Port. Binded IP and Port is in parameter in format
     like: 'localhost.somewhere.com:25'.}
    HR_Bind: mStatusMessage := 'Socket bound';
    {:Socket connected to IP and Port. Connected IP and Port is in parameter in
     format like: 'localhost.somewhere.com:25'.}
    HR_Connect:  mStatusMessage := 'Socket connected';
    {:Called when CanRead method is used with @True result.}
    HR_CanRead: mStatusMessage := 'Read OK';
    {:Called when CanWrite method is used with @True result.}
    HR_CanWrite: mStatusMessage := 'Write OK';
    {:Socket is swithed to Listen mode. (TCP socket only)}
    HR_Listen: mStatusMessage := 'Listening';
    {:Socket Accepting client connection. (TCP socket only)}
    HR_Accept:  mStatusMessage := 'Accepting connection';
    {:report count of bytes readed from socket. Number is in parameter string.
     If you need is in integer, you must use StrToInt function!}
    HR_ReadCount:
    begin
    self.mBytesRead := self.mBytesRead + strtoInt(Value);
    mStatusMessage := 'Bytes read: ' + IntToStr(self.mBytesRead);
    end;
    {:report count of bytes writed to socket. Number is in parameter string. If
     you need is in integer, you must use StrToInt function!}
    HR_WriteCount:  begin
    self.mBytesWritten := self.mBytesWritten + strToInt(Value);
    mStatusMessage := 'Bytes written: ' + IntToStr(self.mBytesWritten);
    end;
    {:If is limiting of bandwidth on, then this reason is called when sending or
     receiving is stopped for satisfy bandwidth limit. Parameter is count of
     waiting milliseconds.}
    HR_Wait:  mStatusMessage := 'Waiting: ' + Value;
    {:report situation where communication error occured. When raiseexcept is
     @true, then exception is called after this Hook reason.}
    HR_Error:  mStatusMessage := 'Error';
    else mStatusMessage := 'Unknown status';

end;

Synchronize(UpdateStatus);


end;

procedure TS3Thread.UpdateStatus;
begin

// frmMain.lbMessage.Caption := mStatusMessage;

end;

procedure TS3Thread.Execute;
begin
  SetName;
  { Place thread code here }

  S3.OnStatusChange := self.StatusUpdate;

//  S3.UseSSL := frmMain.chkUseSSL.Checked;

  if (self.mOp = 'GET') or (self.mOp = 'GETFILE') then begin
    if S3.gets3object(self.bucket, self.objectname, self.mstream) then begin
      mMessage := 'Download do arquivo efetuado corretamente';
      mSuccess := true;
    end
    else begin
      mMessage := 'Erro no download do arquivo';
      msuccess := false;
    end
  end;

  if (self.mOp = 'PUT') or (self.mOp = 'PUTFILE') then begin
    if S3.PutS3Object(self.bucket, self.objectname, self.mstream, self.mBinary) then begin
      mMessage := 'Arquivo gravado corretamente';
      mSuccess := true;
    end
    else begin
      mMessage := 'Erro na gravação do arquivo';
      msuccess := false;
    end
  end;

  if self.Terminated then
   mMessage := 'Cancelado';

end;

end.
