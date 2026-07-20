unit fmconversaocidades;

interface

uses
  //CLX
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DB, Mask, DBCtrls, ComCtrls, {Qete,} ExtCtrls, Windows,
  Buttons,
  //Terceiros
  ZQuery, ZPgSqlQuery,
  //Componentes
  cpquery, cpdatasource, cptexto,
  //Repositorio
  fmajuda, fmajudabt,
  //Projeto
  dmconversaocep, ToolWin;

type
  TfrmConversaoCidades = class(TfrmAjudaBt)
    lblEstado: TLabel;
    edtEstado: TEdit;
    proConversao: TProgressBar;
    sbnCancelar: TSpeedButton;
    sbnConverter: TSpeedButton;
    odlArquivo: TOpenDialog;
    pnlFundoJanela: TPanel;
    gbxConversao: TGroupBox;
    lblArquivo: TLabel;
    edtArquivo: TEdit;
    ckbEliminarCidades: TCheckBox;
    ckbEliminarEstados: TCheckBox;
    sbnArquivo: TSpeedButton;
    procedure FormActivate(Sender: TObject);
    procedure ckbEliminarEstadosClick(Sender: TObject);
    procedure sbnConverterClick(Sender: TObject);
    procedure sbnCancelarClick(Sender: TObject);
    procedure sbnArquivoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtArquivoChange(Sender: TObject);
  private
    dtmConversaoCEP: TdtmConversaoCEP;
    procedure DoNotifyNewValue(Value: Integer);
    procedure DoBeforeStart(Value: Integer);
    function  VerificarArquivo: Boolean;
  public
    constructor Create(AOnwer: TComponent); override;
    destructor  Destroy; override;
  end;

var
  frmConversaoCidades: TfrmConversaoCidades;

implementation

uses Biblio, ctconstantes;
{$R *.dfm}

procedure TFrmConversaoCidades.DoNotifyNewValue(Value: Integer);
begin
  ProConversao.Position := Value;
end;

procedure TfrmConversaoCidades.FormActivate(Sender: TObject);
begin
//    EdtArquivo.Text    := '/mnt/netware/apps/div/projetok/cep_loc.dbf';
    EdtArquivo.Text := '';
    EdtEstado.Text  := '';
end;

constructor TfrmConversaoCidades.Create(AOnwer: TComponent);
begin
  inherited;
  dtmConversaoCEP := TdtmConversaoCEP.Create(Self);
  dtmConversaoCEP.OnNotifyNewValue := DoNotifyNewValue;
  dtmConversaoCEP.OnBeforeStart    := DoBeforeStart;
end;

procedure TfrmConversaoCidades.DoBeforeStart(Value: Integer);
begin
  ProConversao.Max      := Value;
  ProConversao.Position := 0;
end;

destructor TfrmConversaoCidades.Destroy;
begin
  dtmConversaoCEP:=nil;
  inherited;
  frmConversaoCidades := nil;
end;

procedure TfrmConversaoCidades.ckbEliminarEstadosClick(Sender: TObject);
begin
  inherited;
  If CkbEliminarEstados.Checked Then Begin
     CkbEliminarCidades.Checked := True;
     CkbEliminarCidades.Enabled := False;
     CkbEliminarCidades.Refresh;
  End
  Else CkbEliminarCidades.Enabled := True;
end;

procedure TfrmConversaoCidades.sbnConverterClick(Sender: TObject);
begin
  inherited;
  If MensagemConfirmacao(ctCONFIRMACONVERSAO) = smbOk Then
    if VerificarArquivo then begin
      FrmConversaoCidades.Refresh;

      sbnConverter.Enabled       := False;
      EdtArquivo.Enabled         := False;
      EdtEstado.Enabled          := False;
      CkbEliminarEstados.Enabled := False;
      CkbEliminarCidades.Enabled := False;

      If CkbEliminarCidades.Checked Then
        dtmConversaoCEP.ApagarCidades(EdtEstado.Text);
      If CkbEliminarEstados.Checked Then
        dtmConversaoCEP.ApagarEstado(EdtEstado.Text);
      ProConversao.Visible := True;
      ProConversao.Position:= 0;
      If dtmConversaoCEP.ConverterCidades(EdtArquivo.Text, EdtEstado.Text) Then
         If not dtmConversaoCEP.ConversaoCancelada Then
            MensagemAviso(ctCONVERSAOSUCESSO)
         Else
            MensagemAviso(ctCONVERSAOCANCELADA)
      Else
         MensagemAviso(ctCONVERSAOERRO);
      ProConversao.Position:= 0;

      sbnConverter.Enabled       := True;
      EdtArquivo.Enabled         := True;
      EdtEstado.Enabled          := True;
      CkbEliminarEstados.Enabled := not CkbEliminarCidades.Checked;
      CkbEliminarCidades.Enabled := True;
    End;
end;

procedure TfrmConversaoCidades.sbnCancelarClick(Sender: TObject);
begin
  inherited;
  If dtmConversaoCep.Convertendo Then
     dtmConversaoCEP.ConversaoCancelada := True
end;

procedure TfrmConversaoCidades.sbnArquivoClick(Sender: TObject);
begin
  inherited;
  If odlArquivo.Execute Then begin
     edtArquivo.Text:= odlArquivo.FileName;
     edtArquivo.SetFocus;
  end;
end;

procedure TfrmConversaoCidades.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  Case Key of
   VK_F5: sbnConverter.Click;
  end;
end;

procedure TfrmConversaoCidades.edtArquivoChange(Sender: TObject);
begin
  inherited;
  sbnConverter.Enabled := FileExists(Trim(edtArquivo.Text))
end;

function TfrmConversaoCidades.VerificarArquivo: Boolean;
Var DBFFile:     File;
    Erro:        Integer;
    DBFBuffer:   TDBFBufferCidades;
begin
  Result := False;
  if Trim(edtArquivo.Text) <> '' then
    if FileExists(edtArquivo.Text) then begin
      AssignFile(DBFFile,EdtArquivo.Text);
{$I-}
      Reset(DBFFile,1);
{$I+}
      Erro:= IOResult;
      If Erro <> 0 then begin
        if Erro <> 02 Then begin
          MensagemErro(Format(ctARQUIVOERRO,[IntToStr(Erro)]));
          EdtArquivo.SetFocus;
        end
      end Else
        With DBFBuffer, DBFHeader do Begin
          BlockRead(DBFFile,DBFBuffer,SizeOf(DBFHeader));
          Erro:= IOResult;
          If (Erro <> 0) or (DBFHeaderSize <> SizeOf(DBFHeader)) or
                            (DBFRecordSize <> SizeOf(DBFLocal)) Then begin
             MensagemErro(ctLAYOUTERRO);
             EdtArquivo.SetFocus
          end else
            Result := True
        End
    end else
      MensagemErro(ctARQUIVOINEXISTENTE)
end;

end.
