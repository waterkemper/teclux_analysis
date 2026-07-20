unit fmArquivosAnexados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZQuery, ZPgSqlQuery, cpquery, cpdatasource,
  dmtecsoft, Grids, AdvObj, BaseGrid, AdvGrid, DBAdvGrid, ExtCtrls, Buttons,
  dmbasico, biblio, FolderDialog, ctconstantes, clparametrossistema,
  us3thread, uS3Storage, StdCtrls, ComCtrls, frVisualizarImageURL, pngimage;

type
  TfrmArquivosAnexados = class(TForm)
    dsrArquivosAnexados: TtecDataSource;
    qryArquivosAnexados: TtecQuery;
    qryArquivosAnexadostipo: TStringField;
    qryArquivosAnexadoscodigo: TStringField;
    qryArquivosAnexadosnomearquivo: TStringField;
    qryArquivosAnexadosdescricao: TStringField;
    pnlBotoes: TPanel;
    dbgArquivosAnexados: TDBAdvGrid;
    btnIncluirArquivo: TSpeedButton;
    btnExcluirArquivo: TSpeedButton;
    btnVisualizarArquivo: TSpeedButton;
    OpenDialog1: TOpenDialog;
    FolderDialog1: TFolderDialog;
    OpenDialog2: TOpenDialog;
    Timer1: TTimer;
    qryArquivosAnexadosdatahora: TDateTimeField;
    SaveDialog1: TSaveDialog;
    Memo1: TMemo;
    lbMessage: TLabel;
    qryArquivosAnexadossequencia: TIntegerField;
    qryProximoArquivos_Anexados: TtecQuery;
    qryProximoArquivos_Anexadossequencia: TLargeintField;
    fraVisualizarImageURL1: TfraVisualizarImageURL;
    pnlArquivosAnexados: TPanel;
    procedure qryArquivosAnexadosNewRecord(DataSet: TDataSet);
    procedure btnIncluirArquivoClick(Sender: TObject);
    procedure qryArquivosAnexadosAfterPost(DataSet: TDataSet);
    procedure btnExcluirArquivoClick(Sender: TObject);
    procedure btnVisualizarArquivoClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ThreadDone(sender: TObject);
    procedure ButtonEnable(bVal: Boolean);
    procedure dbgArquivosAnexadosDblClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure fraVisualizarImageURL1Panel1Resize(Sender: TObject);
    procedure qryArquivosAnexadosAfterScroll(DataSet: TDataSet);
  private
    sFileName: string;
    ftipo: String;
    fcodigo: String;
    { Private declarations }
    theThread: TS3Thread;
    function GetObjectName: string;

  public
    { Public declarations }
    destructor Destroy; override;

    property tipo: String read ftipo write ftipo;
    property codigo: String read fcodigo write fcodigo;

  end;

var
  frmArquivosAnexados: TfrmArquivosAnexados;
  AcionarTelaArquivosAnexados: procedure (Owner: TComponent; tipo, codigo: String);

implementation

{$R *.dfm}

procedure AcionarTelaArquivosAnexados_(Owner: TComponent; tipo, codigo: String);
begin
  if not assigned(frmArquivosAnexados) or (frmArquivosAnexados.Owner <> Owner) then
  begin
    if assigned(frmArquivosAnexados) then
      frmArquivosAnexados.free;

    frmArquivosAnexados := TfrmArquivosAnexados.create(Owner);
    frmArquivosAnexados.tipo := tipo;
    frmArquivosAnexados.codigo := codigo;

    frmArquivosAnexados.qryArquivosAnexados.parambyname('tipo').asString := tipo;
    frmArquivosAnexados.qryArquivosAnexados.parambyname('codigo').asString := codigo;
    frmArquivosAnexados.qryArquivosAnexados.close;
    frmArquivosAnexados.qryArquivosAnexados.open;

    if frmArquivosAnexados.fraVisualizarImageURL1.visible then
    begin
      frmArquivosAnexados.fraVisualizarImageURL1.tipoS3 := tipo;
      frmArquivosAnexados.fraVisualizarImageURL1.codigoS3 := codigo;
      frmArquivosAnexados.fraVisualizarImageURL1.qryArquivosAnexados :=
        frmArquivosAnexados.qryArquivosAnexados;
//      frmArquivosAnexados.qryArquivosAnexados.AfterScroll := nil;
//      frmArquivosAnexados.fraVisualizarImageURL1.AbrirqryFotosS3;
//      frmArquivosAnexados.qryArquivosAnexados.AfterScroll := frmArquivosAnexados.qryArquivosAnexadosAfterScroll;

    end;

    frmArquivosAnexados.showmodal;

  end;
  frmArquivosAnexados.free;
//  frmVisualizarImageURL.BringToFront;
end;

procedure TfrmArquivosAnexados.qryArquivosAnexadosNewRecord(
  DataSet: TDataSet);
begin
  qryArquivosAnexadostipo.asstring := tipo;
  qryArquivosAnexadoscodigo.asString := codigo;
  qryArquivosAnexadosdatahora.asDateTime := now();

end;

procedure TfrmArquivosAnexados.btnIncluirArquivoClick(Sender: TObject);
var
  theStream: TFileStream;

begin
  if OpenDialog1.Execute then
  begin
    {
    if qryArquivosAnexados.locate('nomearquivo', ExtractFileName(OpenDialog1.FileName), []) then
    begin
      if MensagemConfirmacao('Já existe um arquivo com este nome. Confirma a substituição do arquivo?') = smbOK then
      begin
        qryArquivosAnexados.edit;
        qryArquivosAnexadosdatahora.asDateTime := now();
      end
    end
    else
    }
    qryProximoArquivos_Anexados.close;
    qryProximoArquivos_Anexados.open;

      qryArquivosAnexados.append;

    qryArquivosAnexadosnomearquivo.asstring := ExtractFileName(OpenDialog1.FileName);
    qryArquivosAnexadossequencia.asinteger := qryProximoArquivos_AnexadosSequencia.asinteger;

//    qryArquivosAnexados.post;

    self.ButtonEnable(false);

    lbMessage.Caption := '';

    try
      theStream := TFileStream.Create(OpenDialog1.FileName, fmOpenRead);

      self.theThread := TS3Thread.Create('PUTFILE', parsistema.Bucket_s3, GetObjectName, theStream, FS3Storage, true);
      theThread.OnTerminate := ThreadDone;
      theThread.Resume;
    finally
      theStream := nil;
    end;

    qryArquivosAnexadosdescricao.FocusControl;


  end;




end;

procedure TfrmArquivosAnexados.qryArquivosAnexadosAfterPost(
  DataSet: TDataSet);
begin
  qryArquivosAnexados.ApplyUpdates;
  dtmTecSoft.tstTecSoft.Commit;
  qryArquivosAnexados.CommitUpdates;
//  dtmBasico.Perpetrar([qryArquivosAnexados]);

end;

procedure TfrmArquivosAnexados.btnExcluirArquivoClick(Sender: TObject);
begin
  if MensagemConfirmacao(format('Confirmar a retirado do arquivo %s anexado desta lista?',
  [qryArquivosAnexadosnomearquivo.asString])) = smbOK then
  begin
    // retirar das nuvens

    lbMessage.Caption := '';

//    FS3Storage.UseSSL := self.chkUseSSL.Checked;

    if not FS3Storage.DeleteS3Object(parsistema.Bucket_s3, GetObjectName) then
    begin
      self.Memo1.Text := Fs3Storage.Error.Text;
      lbMessage.Caption := 'Ocorreu um erro ao excluir o arquivo da lista.';
    end
    else
    begin
      qryArquivosAnexados.delete;
      fraVisualizarImageURL1.AbrirqryFotosS3;
    end


  end;
end;

procedure TfrmArquivosAnexados.btnVisualizarArquivoClick(Sender: TObject);
var
  Dir: String;

  theStream: TFileStream;
//  theMemoryStream: TMemoryStream;
  PNG: TPNGObject;


begin
  inherited;
  TRY

    btnVisualizarArquivo.ENABLED := false;

    if qryArquivosAnexados.recordcount <> 0 then
    begin

      self.ButtonEnable(false);

      lbMessage.Caption := '';

      sFileName := ExtractFilePath(Application.ExeName) + 'Saidas';

      if not DirectoryExists(sFileName) then
        if not CreateDir(sFileName) then
        raise Exception.Create('Impossível criar o diretório '+sFileName);


      sFileName := ExtractFilePath(Application.ExeName) + 'Saidas\' +
                   ChangeFileExt(ExtractFileName(qryArquivosAnexadosnomearquivo.asString),'') +
                   formatdatetime('_yyyyMMdd_hhmmss_', now()) +
                   qryArquivosAnexadossequencia.asString +
                   ExtractFileExt(qryArquivosAnexadosnomearquivo.asString);

    //    self.SaveDialog1.FileName := qryArquivosAnexadosnomearquivo.asString+formatdatetime('yyyy-MM-dd-hh-mm-ss', now());

      {if FolderDialog1.Execute then
      begin}
    {      dir := FolderDialog1.Directory;}
    //      SaveDialog1.initialdir := dir;
    //      if SaveDialog1.Execute then
    //      begin
    //        sFileName := self.SaveDialog1.FileName;
          try
            theStream := TFileStream.Create(sFileName, fmCreate);
    //          theMemoryStream := TMemoryStream.create;
            self.theThread := TS3Thread.Create('GETFILE', parsistema.Bucket_s3, GetObjectName, theStream, FS3Storage, true);
    //          self.theThread.WaitFor;
            self.theThread.OnTerminate := ThreadDone;
            self.theThread.Resume;

    //          theMemoryStream := TMemoryStream.create;
    //          FS3Storage.gets3object(parsistema.Bucket_s3, GetObjectName, theMemoryStream)


          finally
    //          PNG := TPNGObject.Create;
    //          theMemoryStream.position := 0;
    //          PNG.LoadFromStream(theMemoryStream);
    //          fraVisualizarImageURL1.imgVisualFormURL.Picture.Assign(png);
    //          theMemoryStream := nil;
            theStream := nil;
          
          end;

    //        Sleep(3000);

    //      end;
      {end;}

    end;
  finally
    btnVisualizarArquivo.enabled := true;
  end;

end;

procedure TfrmArquivosAnexados.Timer1Timer(Sender: TObject);
begin
  btnExcluirArquivo.enabled := (qryArquivosAnexados.recordcount <> 0);
  btnVisualizarArquivo.enabled := (qryArquivosAnexados.recordcount <> 0);
end;

destructor TfrmArquivosAnexados.Destroy;
begin
  FrmArquivosAnexados := nil;
  inherited;
end;

function TfrmArquivosAnexados.GetObjectName: string;
begin
  result := tipo+'/'+codigo+'/'+qryArquivosAnexadossequencia.asString+ExtractFileExt(qryArquivosAnexadosnomearquivo.asString);
end;

procedure TfrmArquivosAnexados.FormCreate(Sender: TObject);
begin
  FS3Storage := TS3Storage.create(parsistema.Publickey_s3, parsistema.PrivateKey_s3);
  self.theThread := nil;
end;

procedure TfrmArquivosAnexados.ThreadDone(sender: TObject);
//var
//thisThread: TS3Thread; //could alternatively directly address theThread variable
var
  vAbrirArquivo, vAbrirFotos: Boolean;
begin

//   thisThread := TS3Thread(Sender);

    try
      vAbrirArquivo := false;
      vAbrirFotos := false;

    lbMessage.Caption := theThread.theMessage;

    {
    if thisThread.op = 'GET' then begin

      if thisThread.success then
      begin
        thisThread.ResultStream.Position := 0;
        self.RichEdit1.Lines.LoadFromStream(thisThread.ResultStream);
        self.PageControl1.ActivePage := self.DocumentTab;
      end
      else begin
        self.Memo1.Text := Fs3Storage.Error.Text;
        self.PageControl1.ActivePage := self.ErrorTab;
      end;

    end;

    if thisThread.op = 'PUT' then begin
      if not thisThread.success then
        self.Memo1.Text := Fs3Storage.Error.Text;
    end;
    }

    if theThread.Op = 'PUTFILE' then
    begin
      if not theThread.success then
      begin
        self.Memo1.Text := Fs3Storage.Error.Text;
        if (qryArquivosAnexados.state in [dsedit, dsinsert]) then
          qryArquivosAnexados.cancel;
      end
      else
      begin
        if (qryArquivosAnexados.state in [dsedit, dsinsert]) then
          qryArquivosAnexados.post;
        vAbrirFotos := true;
      end;
      qryProximoArquivos_Anexados.close;
    end;

    if theThread.Op = 'GETFILE' then
    begin
     if not theThread.success then
        self.Memo1.Text := Fs3Storage.Error.Text
     else
     begin
       if fileexists(sFileName) then
         vAbrirArquivo := true;
     end;
    end;

  finally
    theThread.ResultStream.Free;
    self.theThread := nil;
    self.ButtonEnable(true);

    if vAbrirArquivo then
      ExecFile(sFileName);

    if vAbrirFotos then
      fraVisualizarImageURL1.AbrirqryFotosS3;

  end;

end;

procedure TfrmArquivosAnexados.ButtonEnable(bVal: Boolean);
begin
  self.btnExcluirArquivo.Enabled := bVal;
  self.btnIncluirArquivo.Enabled := bVal;
  self.btnVisualizarArquivo.Enabled := bVal;

end;

procedure TfrmArquivosAnexados.dbgArquivosAnexadosDblClick(
  Sender: TObject);
begin
  if btnVisualizarArquivo.enabled then
    btnVisualizarArquivoClick(dbgArquivosAnexados);
end;

procedure TfrmArquivosAnexados.SpeedButton1Click(Sender: TObject);
begin
  fraVisualizarImageURL1.AbrirqryFotosS3;
end;

procedure TfrmArquivosAnexados.fraVisualizarImageURL1Panel1Resize(
  Sender: TObject);
begin
  pnlArquivosAnexados.width := fraVisualizarImageURL1.Panel1.width;
  pnlArquivosAnexados.height := fraVisualizarImageURL1.Panel1.height;
end;

procedure TfrmArquivosAnexados.qryArquivosAnexadosAfterScroll(
  DataSet: TDataSet);
begin
{
   with fraVisualizarImageURL1 do
     DownloadImagemS3(URLNomeFotoS3, imgVisualFormURL, false);
}     
end;

initialization
   AcionarTelaArquivosAnexados :=  AcionarTelaArquivosAnexados_;



end.
