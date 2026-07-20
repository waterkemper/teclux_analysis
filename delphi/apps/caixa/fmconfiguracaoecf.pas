unit fmconfiguracaoecf;

interface

uses
  //CLX
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, ComCtrls,
  //Biblio
  ctconstantes,
  //componetes
  cppagecontrol,
  //Repositorio
  fmnavcontroles, cptexto;

type
  TfrmConfiguracoesECF = class(TfrmNavControles)
    pnlFundoJanela: TPanel;
    gbxFundoJanela: TGroupBox;
    tecPageControl1: TtecPageControl;
    tstECF: TTabSheet;
    lblSerieECF: TLabel;
    lblNumeroECF: TLabel;
    sbnProcurarECF: TSpeedButton;
    sbnSalvar: TSpeedButton;
    sbnApagar: TSpeedButton;
    lblSerieECF1: TLabel;
    lblNumeroECF1: TLabel;
    lblMarca: TLabel;
    lblMarca1: TLabel;
    lblProcurando: TLabel;
    procedure sbnProcurarECFClick(Sender: TObject);
    procedure sbnSalvarClick(Sender: TObject);
    procedure sbnApagarClick(Sender: TObject);
    procedure edtTerminalSiTEFChange(Sender: TObject);
  protected
    ECFLocalizada: Integer;
    Comm: String;
    procedure ApagarECF;
    procedure LerArquivoECF;
    procedure ProcurarECF;
    procedure SalvarArquivo;
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  frmConfiguracoesECF: TfrmConfiguracoesECF;

implementation

Uses
  //CLX
  inifiles,
  //Biblio
  biblio,
  //Componentes
  clecf, clecf_mecaf, clecf_bematech;


{$R *.dfm}

procedure TfrmConfiguracoesECF.ApagarECF;
var
  ArquivoCFG: TIniFile;
  NomeArquivoCliente: String;
begin
  NomeArquivoCliente := ExtractFilePath(Application.ExeName)+ NomeArquivoCFG;
  if FileExists(NomeArquivoCliente) then begin
    ArquivoCFG := TIniFile.Create(NomeArquivoCliente);
    try
{$IFDEF LINUX}
      ArquivoCFG.CaseSensitive := False;
{$ENDIF}
      ArquivoCFG.EraseSection(ECFSection);
      ArquivoCFG.UpdateFile;
      ECFLocalizada          := 0;
      lblMarca1.Caption      := '';
      lblSerieECF1.Caption   := '';
      lblNumeroECF1.Caption  := '';
      Comm                   := '';
      sbnApagar.Enabled      := False;
      sbnSalvar.Enabled      := False;
      sbnProcurarECF.Enabled := True;
    finally
      ArquivoCFG.Free
    end
  end
end;

constructor TfrmConfiguracoesECF.Create(AOwner: TComponent);
begin
  inherited;
  LerArquivoECF;
end;

procedure TfrmConfiguracoesECF.edtTerminalSiTEFChange(Sender: TObject);
begin
  inherited;
//  sbnSalvar.Enabled := sbnSalvar.Enabled or (TtecSitef.Terminal <> Trim(edtTerminalSiTEF.Text))
end;

procedure TfrmConfiguracoesECF.LerArquivoECF;
var
  ArquivoCFG: TIniFile;
  NomeArquivoCliente,
  SerieNumero : String;
  PosSeparador: Integer;
begin
  NomeArquivoCliente := ExtractFilePath(Application.ExeName)+ NomeArquivoCFG;
  if FileExists(NomeArquivoCliente) then begin
    ArquivoCFG := TIniFile.Create(NomeArquivoCliente);
    try
{$IFDEF LINUX}
      ArquivoCFG.CaseSensitive := False;
{$ENDIF}
      lblMarca1.Caption     := ArquivoCFG.ReadString(ECFSection, 'marca', '');
      SerieNumero           := ArquivoCFG.ReadString(ECFSection, 'controle', '');
      PosSeparador          := Pos(';', SerieNumero);
      if PosSeparador > 0 then begin
        lblSerieECF1.Caption  := Copy(SerieNumero, 1, PosSeparador-1);
        Delete(SerieNumero, 1, Length(SerieNumero) - PosSeparador);
        PosSeparador           := Pos(';', SerieNumero);
        lblNumeroECF1.Caption := Copy(SerieNumero, 1, PosSeparador-1);
        if PosSeparador > 0 then
          Comm := Copy(SerieNumero, PosSeparador+1, Length(SerieNumero) - PosSeparador);
      end;
      sbnApagar.Enabled := (SerieNumero <> '') and (PosSeparador > 0) and (Comm <> '');
      sbnProcurarECF.Enabled := Not sbnApagar.Enabled;
      sbnSalvar.Enabled := False;
    finally
      ArquivoCFG.Free
    end
  end
end;

procedure TfrmConfiguracoesECF.ProcurarECF;
var
  ecfClass: TtecECFClass;
  ecf: TtecECF;
  Serie: String;
  a, b: Integer;
begin
  ecf := nil;
  lblProcurando.Visible := True;
  try
    for a := 1 to 2 do begin
      ecfClass := TtecECFClass(GetClass('TtecECF'+ ECFS[a]));
      if Assigned(ecfClass) then begin
        ecf := ecfClass.Create(self);
        for b := 1 to 2 do begin
          ecf.IniciarImpressora('COM'+IntToStr(b));
          if ecf.Erro then
            MensagemErro(ecf.Mensagem)
          else begin
            Serie  := ecf.SerieMaquina;
            if ecf.Erro then
              ecf.FinalizarImpressora
            else begin
              lblSerieECF1.Caption  := Serie;
              lblMarca1.Caption     := ECFS[a];
              lblNumeroECF1.Caption := ecf.NumeroMaquina;
              Comm                  := ecf.PortaSerial;
              Break
            end
          end
        end;
        if ecf.Erro then
          FreeAndNil(ecf)
        else begin
          ECFLocalizada := a;
          break
        end
      end
    end;
  finally
    lblProcurando.Visible := False
  end;
  sbnSalvar.Enabled := Assigned(ecf);
  if Not Assigned(ecf) then
    MensagemAviso('Nenhuma ECF foi encontrada')
end;

procedure TfrmConfiguracoesECF.SalvarArquivo;
var
  ArquivoCFG: TIniFile;
  NomeArquivoCliente: String;
  ecfClass: TtecECFClass;
//  CodErroSiTEF: Integer;
begin
  NomeArquivoCliente := ExtractFilePath(Application.ExeName)+ NomeArquivoCFG;
  if FileExists(NomeArquivoCliente) then begin
    ArquivoCFG := TIniFile.Create(NomeArquivoCliente);
    try
{$IFDEF LINUX}
      ArquivoCFG.CaseSensitive := False;
{$ENDIF}
      if ECFLocalizada > 0 then begin
        ArquivoCFG.WriteString(ECFSection, 'marca', lblMarca1.Caption);
        ArquivoCFG.WriteString(ECFSection, 'controle', lblSerieECF1.Caption+';'+
                                                       lblNumeroECF1.Caption+';'+
                                                       Comm[4]);
      end;
{      CodErroSiTEF := TtecSitef.Terminal(Trim(edtTerminalSiTEF.Text));
      if CodErroSiTEF <> ctCODOK then
        if Trim(edtTerminalSiTEF.Text) = '' then begin
          ArquivoCFG.EraseSection(TEFSection);
        end else
          MensagemErro(TtecSitef.MsgErro(CodErroSiTEF))
      else
        ArquivoCFG.WriteString(TEFSection, 'terminal', TtecSitef.Terminal);}
      ArquivoCFG.UpdateFile;
      if ECFLocalizada > 0 then begin
        ecfClass := TtecECFClass(GetClass('TtecECF'+ ECFS[ECFLocalizada]));
        if Assigned(ecfClass) then begin
          ECFPadrao := ecfClass.Create(self);
          ECFPadrao.IniciarImpressora(Comm);
          ECFPadrao.SerieConfigurada  := lblSerieECF1.Caption;
          ECFPadrao.NumeroConfigurado := lblNumeroECF1.Caption;
          ECFPadrao.LerAliquotasDaECF;
          if ECFPadrao.Erro then
            MensagemErro(ECFPadrao.Mensagem)
          else begin
            ECFPadrao.LerFormasPagamento;
            if ECFPadrao.Erro then
              MensagemErro(ECFPadrao.Mensagem)
          end
        end
      end;
      sbnSalvar.Enabled      := False;
      sbnProcurarECF.Enabled := False;
      sbnApagar.Enabled      := True;
    finally
      ArquivoCFG.Free
    end
  end
end;

procedure TfrmConfiguracoesECF.sbnApagarClick(Sender: TObject);
begin
  inherited;
  ApagarECF
end;

procedure TfrmConfiguracoesECF.sbnProcurarECFClick(Sender: TObject);
begin
  inherited;
  ProcurarECF
end;

procedure TfrmConfiguracoesECF.sbnSalvarClick(Sender: TObject);
begin
  inherited;
  SalvarArquivo;
end;

end.
