unit fmconversaoruas;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DB, Grids, DBGrids, Mask, DBCtrls, ComCtrls, {Qete,} ExtCtrls,
  //Repositorio
  fmajuda, dmconversaocep, cptexto, fmajudabt, Buttons, Windows, ToolWin;

type
   TDBFBuffer = packed Record
      Case Byte of
      1: (DBFHeader: Record
             DBFNumeroTres:  Byte;
             DBFAnoArquivo:  Byte;
             DBFMesArquivo:  Byte;
             DBFDiaArquivo:  Byte;
             DBFNrRegistros: LongInt;
             DBFHeaderSize:  Word;
             DBFRecordSize:  Word;
             DBFFiller:      Array[1..246] of Char;
          End);
      2: (DBFLogradouro: Record
             DBFDeletado:    Array[1..01] of Char;
             DBFNomeRua:     Array[1..50] of Char;
             DBFCidade:      Array[1..60] of Char;
             DBFBairro:      Array[1..30] of Char;
             DBFCEP_8Dig:    Array[1..08] of Char;
             DBFEstado:      Array[1..02] of Char;
             DBFRuaAV:       Array[1..05] of Char;
             DBFComplemento: Array[1..45] of Char;
          End);
   End;

type
  TfrmConversaoRuas = class(TfrmAjudaBt)
    sbnConverter: TSpeedButton;
    sbnCancelar: TSpeedButton;
    pnlFundoJanela: TPanel;
    gbxConversao: TGroupBox;
    lblArquivo: TLabel;
    edtArquivo: TEdit;
    sbnArquivo: TSpeedButton;
    odlArquivo: TOpenDialog;
    edtCidade: TEdit;
    lblCidade: TLabel;
    edtEstado: TEdit;
    lblEstado: TLabel;
    ckbEliminarRuas: TCheckBox;
    ckbEliminarBairros: TCheckBox;
    ProConversao: TProgressBar;
    procedure FormActivate(Sender: TObject);
    function  VerificarArquivo: Boolean;
    procedure ckbEliminarBairrosClick(Sender: TObject);
    procedure sbnConverterClick(Sender: TObject);
    procedure sbnCancelarClick(Sender: TObject);
    procedure sbnArquivoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtArquivoChange(Sender: TObject);
  private
    dtmConversaoCEP: TdtmConversaoCEP;
    procedure DoNotifyNewValue(Value: Integer);
    procedure DoBeforeStart(Value: Integer);
  public
    constructor Create(AOnwer: TComponent); override;
    destructor  Destroy; override;
  end;

var
  frmConversaoRuas: TfrmConversaoRuas;

implementation
uses ctconstantes, biblio;

{$R *.dfm}

procedure TfrmConversaoRuas.FormActivate(Sender: TObject);
begin
//    EdtArquivo.Text := '/mnt/netware/apps/div/projetok/dcepsc.dbf';
    EdtArquivo.Text := '';
    EdtEstado.Text  := '';
    EdtCidade.Text  := '';
end;

constructor TfrmConversaoRuas.Create(AOnwer: TComponent);
begin
  inherited;
  dtmConversaoCEP := TdtmConversaoCEP.Create(Self);
  dtmConversaoCEP.OnNotifyNewValue := DoNotifyNewValue;
  dtmConversaoCEP.OnBeforeStart    := DoBeforeStart;
end;

procedure TfrmConversaoRuas.DoBeforeStart(Value: Integer);
begin
  ProConversao.Max      := Value;
  ProConversao.Position := 0;
end;

procedure TfrmConversaoRuas.DoNotifyNewValue(Value: Integer);
begin
  ProConversao.Position := Value;
end;

destructor TfrmConversaoRuas.Destroy;
begin
  dtmConversaoCEP:=nil;
  inherited;
  frmConversaoRuas := nil
end;

procedure TfrmConversaoRuas.ckbEliminarBairrosClick(Sender: TObject);
begin
  inherited;
  If CkbEliminarBairros.Checked Then Begin
     CkbEliminarRuas.Checked := True;
     CkbEliminarRuas.Enabled := False;
     CkbEliminarRuas.Refresh;
  End
  Else CkbEliminarRuas.Enabled := True;

end;

procedure TfrmConversaoRuas.sbnConverterClick(Sender: TObject);
begin
  inherited;
  If MensagemConfirmacao(ctCONFIRMACONVERSAO) = smbOk Then
    if VerificarArquivo then begin
      frmConversaoRuas.Refresh;

      sbnConverter.Enabled       := False;
      EdtArquivo.Enabled         := False;
      EdtEstado.Enabled          := False;
      EdtCidade.Enabled          := False;
      CkbEliminarRuas.Enabled    := False;
      CkbEliminarBairros.Enabled := False;

      If CkbEliminarRuas.Checked Then
        dtmConversaoCEP.ApagarRuas(EdtEstado.Text, EdtCidade.Text);
      If CkbEliminarBairros.Checked Then
        dtmConversaoCEP.ApagarBairros(EdtEstado.Text, EdtCidade.Text);
      If dtmConversaoCEP.ConverterRuas(EdtArquivo.Text, EdtEstado.Text, EdtCidade.Text) Then
         If not dtmConversaoCEP.ConversaoCancelada Then
            MensagemAviso(ctCONVERSAOSUCESSO)
         else
            MensagemAviso(ctCONVERSAOCANCELADA)
      else
         MensagemAviso(ctCONVERSAOERRO);
      ProConversao.Position:= 0;

      sbnConverter.Enabled       := True;
      EdtArquivo.Enabled         := True;
      EdtEstado.Enabled          := True;
      EdtCidade.Enabled          := True;
      CkbEliminarRuas.Enabled    := not CkbEliminarBairros.Checked;
      CkbEliminarBairros.Enabled := True;
   End;
end;

procedure TfrmConversaoRuas.sbnCancelarClick(Sender: TObject);
begin
  inherited;
  If dtmConversaoCep.Convertendo Then
     dtmConversaoCEP.ConversaoCancelada := True
end;

procedure TfrmConversaoRuas.sbnArquivoClick(Sender: TObject);
begin
  inherited;
  If odlArquivo.Execute Then begin
     edtArquivo.Text:= odlArquivo.FileName;
     edtArquivo.SetFocus;
  end;
end;

procedure TfrmConversaoRuas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  Case Key of
   VK_F5: sbnConverter.Click;
  end;
end;

procedure TfrmConversaoRuas.edtArquivoChange(Sender: TObject);
begin
  inherited;
  sbnConverter.Enabled := FileExists(edtArquivo.Text)
end;

function TfrmConversaoRuas.VerificarArquivo: Boolean;
Var DBFFile:     File;
    Erro:        Integer;
    DBFBuffer:   TDBFBuffer;
begin
  Result := False;
  if Trim(edtArquivo.Text) <> '' then
    if FileExists(edtArquivo.Text) then begin
      AssignFile(DBFFile,EdtArquivo.Text);
{$I-}
      Reset(DBFFile,1);
{$I+}
      Erro:= IOResult;
      If Erro <> 0 Then begin
        if Erro <> 02 then begin
          MensagemErro(Format(ctARQUIVOERRO,[IntToStr(Erro)]));
          EdtArquivo.SetFocus;
        end
      end Else
        With DBFBuffer, DBFHeader do Begin
          BlockRead(DBFFile,DBFBuffer,SizeOf(DBFHeader));
          Erro:= IOResult;
          If (Erro <> 0) or (DBFHeaderSize <> SizeOf(DBFHeader)) or
                            (DBFRecordSize <> SizeOf(DBFLogradouro)) Then begin
             MensagemErro(ctLAYOUTERRO);
             EdtArquivo.SetFocus;
          end else
            Result := True
        end
    end else
      MensagemErro(ctARQUIVOINEXISTENTE)
end;

end.
