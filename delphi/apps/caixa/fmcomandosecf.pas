unit fmcomandosecf;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmnavcontroles, clecf, biblio, ctconstantes, clusuario,
  dmbasico, dmgerarmapasecf, fmleituramemoriafiscaldata,
  fmleituramemoriafiscalreducao, dmmenufiscal, ExtCtrls;
type
  TfrmComandosECF = class(TfrmNavControles)
    pnlFundoJanela: TPanel;
    btnReducaoZ: TButton;
    btnLeituraX: TButton;
    btnCancelarCupom: TButton;
    btnFinalizarVinculado: TButton;
    btnLeituraMemoriaFiscalData: TButton;
    btnLeituraMemoriaFiscalReducao: TButton;
    sbnAberturaGaveta: TButton;
    procedure btnReducaoZClick(Sender: TObject);
    procedure btnLeituraXClick(Sender: TObject);
    procedure btnCancelarCupomClick(Sender: TObject);
    procedure btnFinalizarVinculadoClick(Sender: TObject);
    procedure btnLeituraMemoriaFiscalDataClick(Sender: TObject);
    procedure btnLeituraMemoriaFiscalReducaoClick(Sender: TObject);
    procedure sbnAberturaGavetaClick(Sender: TObject);
  private
    fCancelarCupomnaOrigem: ttecprocedure;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor destroy; override;
    property CancelarCupomnaOrigem: ttecprocedure read fCancelarCupomnaOrigem write fCancelarCupomnaOrigem;
    { Public declarations }
  end;

var
  frmComandosECF: TfrmComandosECF;

implementation


{$R *.dfm}

procedure TfrmComandosECF.btnLeituraXClick(Sender: TObject);
begin
  inherited;
  if MensagemConfirmacao(ctCONFIRMALEITURAX) = smbOK then
  begin
    dtmMenuFiscal.LX;
    SetFocus;
    {ECFPadrao.LeituraX;
    if ecfpadrao.erro then
      MensagemErro(ECFPadrao.Mensagem)}
  end;
end;

procedure TfrmComandosECF.btnReducaoZClick(Sender: TObject);
{var
  ctipo : String;}
begin
  inherited;
  if MensagemConfirmacao(ctCONFIRMAREDUCAOZ) = smbOK then
  begin
    dtmMenuFiscal.ReducaoZ;
    SetFocus;
  end;
(*  ctipo := 'c';
  if MensagemConfirmacao(ctCONFIRMAREDUCAOZ) = smbOK then
  begin
    ECFPadrao.ReducaoZ;
    if ecfpadrao.erro then
      MensagemErro(ECFPadrao.Mensagem)
    else
    begin

  {$IFDEF MSWINDOWS}

      if ECFPadrao.ClassName = 'TtecECFBematech' then
        if ECFPadrao.LeituraMemoriaFiscalSerialDataMFD(pchar(datetostr(DataLocal)),
                       pchar(datetostr(DataLocal)), pchar(ctipo)) then
        begin
          dtmGerarMapasECF := tdtmGerarMapasECF.Create(self);
          dtmGerarMapasECF.GravarMapa(ECFPadrao.GerarMapaArquivoRetorno);
          dtmGerarMapasECF := nil
        end;
  {$ENDIF}

    end;
  end*)
end;

procedure TfrmComandosECF.btnCancelarCupomClick(Sender: TObject);
begin
  inherited;
  //IMPLEMENTAR AQUI CANCELAMENTO DE CUPOM NAO FISCAL
  if assigned(CancelarCupomnaOrigem) then
    CancelarCupomnaOrigem
  else
    ECFPadrao.CancelarCupom;

  SetFocus;
end;

procedure TfrmComandosECF.btnFinalizarVinculadoClick(Sender: TObject);
begin
  inherited;
  ECFPadrao.FinalizarVinculado;
  if ecfpadrao.erro then
    MensagemErro(ECFPadrao.Mensagem);
  SetFocus;
end;

procedure TfrmComandosECF.btnLeituraMemoriaFiscalDataClick(
  Sender: TObject);
{var
  ctipo : String;}
begin
  inherited;
//  ctipo := 'c';
  frmLeituraMemoriaFiscalData := TfrmLeituraMemoriaFiscalData.Create(frmLeituraMemoriaFiscalData);

  with frmLeituraMemoriaFiscalData do
  begin
    try
      if ShowModal = mrOk then
      begin
        dtmMenuFiscal.LMFData(DataInicial, DataFinal, False);
(*        ECFPadrao.LeituraMemoriaFiscalData(DataInicial, DataFinal);

  {$IFDEF MSWINDOWS}

        if ECFPadrao.ClassName = 'TtecECFBematech' then
          if UsuarioLogin.Administrador then
          begin
            if strtodate(DataFinal) = DataLocal then
              if MensagemConfirmacao(ctATUALIZARMAPASECF) = smbOK then
                if ECFPadrao.LeituraMemoriaFiscalSerialDataMFD(pchar(DataInicial),
                               pchar(DataFinal), pchar(ctipo)) then
                begin
                  dtmGerarMapasECF := tdtmGerarMapasECF.Create(self);
                  dtmGerarMapasECF.GravarMapa(ECFPadrao.GerarMapaArquivoRetorno);
                  dtmGerarMapasECF := nil
                end;
          end;
  {$ENDIF}
*)
      end;
    finally
      Free;
    end;
  end;
  SetFocus;
end;

procedure TfrmComandosECF.btnLeituraMemoriaFiscalReducaoClick(
  Sender: TObject);
begin
  inherited;
  frmLeituraMemoriaFiscalReducao := TfrmLeituraMemoriaFiscalReducao.Create(frmLeituraMemoriaFiscalReducao);
  with frmLeituraMemoriaFiscalReducao do
    try
//      edtReducaoInicial.SetFocus;
      if ShowModal = mrOk then
        dtmMenuFiscal.LMFReducao(ReducaoInicial, ReducaoFinal, False);
        //ECFPadrao.LeituraMemoriaFiscalReducao(ReducaoInicial, ReducaoFinal);
    finally
      Free;
    end;
  SetFocus;
end;

procedure TfrmComandosECF.sbnAberturaGavetaClick(Sender: TObject);
var
  UsuarioAut: TtecUsuarios;
  OK: Boolean;
begin
  inherited;
  UsuarioAut := TdtmBasico.ObterAutorizacao(taLOGIN, ctABERTURAGAVETA, ctCAIXA, '');
  if Assigned(UsuarioAut) then
  begin
    OK := UsuarioAut.Caixa;
    if Not OK then
      MensagemAviso(ctUSUARIOSEMPERMISSAO);
  end
  else
    OK := False;
  if OK then
    ECFPadrao.AbrirGaveta;
  SetFocus;
end;

constructor TfrmComandosECF.Create(AOwner: TComponent);
begin
  dtmMenuFiscal := TdtmMenuFiscal.Create(Self);
  inherited;
end;

destructor TfrmComandosECF.destroy;
begin
  inherited;
  frmComandosECF := nil;
end;


end.
