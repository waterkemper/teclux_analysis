unit fmtefdedicado;

interface

uses
  //CLX
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, ExtCtrls,
  //Componentes
  cltefdedicado, cppagecontrol,
  //Repositorio
  dmBasico, fmajuda, fmnavcontroles;

type
  TfrmTEFDedicado = class(TfrmNavControles)
    pnlFundoJanela: TPanel;
    pgcSiTEF: TPageControl;
    tstVendas: TTabSheet;
    bbnCancelar: TBitBtn;
    bbnPreAutoriazacao: TBitBtn;
    bbnVenda: TBitBtn;
    edtTerminal: TEdit;
    edtCupom: TEdit;
    edtValor: TEdit;
    lblValor: TLabel;
    lblCupom: TLabel;
    lblTerminal: TLabel;
    mmoMsg: TMemo;
    bbnTeleMarketing: TBitBtn;
    procedure bbnCancelarClick(Sender: TObject);
    procedure bbnCancelarVendaClick(Sender: TObject);
    procedure bbnPreAutoriazacaoClick(Sender: TObject);
    procedure bbnVendaClick(Sender: TObject);
    procedure bbnTeleMarketingClick(Sender: TObject);
  private
    function  getDataFiscal: String;
    function  getHorario: String;
    function  getNSU: String;
    function  getNumeroCupom: String;
    function  getOperador: String;
    function  getValor: String;
    procedure setDataFiscal(const Value: String);
    procedure setHorario(const Value: String);
    procedure setNumeroCupom(const Value: String);
    procedure setOperador(const Value: String);
    procedure setValor(const Value: String);
  protected
    tecTEF: TtecTEFDedicado;
    Cancelado: Boolean;
    EmTransacao: Boolean;
    procedure Cabecalho(str: String);
    procedure Mensagem(str: String);
    function  Cancelamento: Boolean;
    function  Confirmacao(var Str: String; Min, Max: Integer): Boolean;
    function  OpcoesMenu(Str: Array of String; var Int: Integer): Boolean;
    procedure PosOperacao(Ok: Boolean);
    procedure PreencheDadosSitef;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    property DataFiscal: String read getDataFiscal write setDataFiscal;
    property Horario: String read getHorario write setHorario;
    property NumeroCupom: String read getNumeroCupom write setNumeroCupom;
    property Operador: String read getOperador write setOperador;
    property Valor: String read getValor write setValor;
    property NSU: String read getNSU;
  end;

var
  frmTEFDedicado: TfrmTEFDedicado;

implementation

{$R *.dfm}

Uses
  //Projeto
  fminformacoestef,
  //Biblio
  biblio,
  //Componenntes
  clecf, clparametrossistema;

procedure TfrmTEFDedicado.bbnCancelarClick(Sender: TObject);
begin
  if EmTransacao then
    Cancelado := True
  else
    ModalResult := mrCancel
end;

procedure TfrmTEFDedicado.bbnCancelarVendaClick(Sender: TObject);
var
  Ok: Boolean;
begin
  PreencheDadosSitef;
  ok := tecTEF.ExecutarOperacao(200);
  PosOperacao(ok);
end;

procedure TfrmTEFDedicado.bbnPreAutoriazacaoClick(Sender: TObject);
var
  Ok: Boolean;
begin
  EmTransacao := True;
  PreencheDadosSitef;
  ok := tecTEF.ExecutarOperacao(ctFIPreAutorizacao);
  PosOperacao(ok);
  EmTransacao := False;
end;

procedure TfrmTEFDedicado.bbnTeleMarketingClick(Sender: TObject);
var
  Ok: Boolean;
begin
  inherited;
  EmTransacao := True;
  PreencheDadosSitef;
  ok := tecTEF.ExecutarOperacao(ctFITelemarketing);
  PosOperacao(ok);
  EmTransacao := False;
end;

procedure TfrmTEFDedicado.bbnVendaClick(Sender: TObject);
var
  Ok: Boolean;
begin
  EmTransacao := True;
  PreencheDadosSitef;
  ok := tecTEF.ExecutarOperacao(ctFIFormaPagamento);
  PosOperacao(ok);
  EmTransacao := False;
end;

procedure TfrmTEFDedicado.Cabecalho(str: String);
begin
  frmInformacoesTEF := TfrmInformacoesTEF.Create(Self);
  frmInformacoesTEF.Cabecalho(Str);
end;

function TfrmTEFDedicado.Cancelamento: Boolean;
begin
  Result := Cancelado;
end;

function TfrmTEFDedicado.Confirmacao(var Str: String; Min, Max: Integer): Boolean;
begin
  frmInformacoesTEF := TfrmInformacoesTEF.Create(frmInformacoesTEF);
  frmInformacoesTEF.Confirmacao(Str, Min, Max);
  Result := frmInformacoesTEF.ShowModal = mrOK;
  Str := frmInformacoesTEF.Texto;
  frmInformacoesTEF.free;
  if Not Result then begin
    tecTEF.FinalizaTransacaoInterativo(0);
    if tecTEF.CodigoErro <> 0 then
      mmoMsg.Lines.Add(tecTEF.MensagemErro);
  end
end;

constructor TfrmTEFDedicado.Create(AOwner: TComponent);
begin 
  inherited;
  if ParSistema.TipoTEF = tsDEDICADO then begin
    tecTEF := TtecTEFDedicado.Create;
    tecTEF.Loja := ParSistema.LojaTEF;
    if tecTEF.Erro then
      MensagemErro(tecTEF.MensagemErro)
    else begin
      tecTEF.ServerIP := ParSistema.IPTEF;
      tecTEF.ConfigurarTef;
      if tecTEF.Erro then
        MensagemErro(tecTEF.MensagemErro)
      else
        tecTEF.MensagemPermanentePinPad := ParSistema.MensagemTEF;
    end;
    tecTEF.OnCabecalhoMenu    := Cabecalho;
    tecTEF.OnConfirmacao      := Confirmacao;
    tecTEF.OnOpcoesMenu       := OpcoesMenu;
    tecTEF.OnMensagemOperador := Mensagem;
    tecTEF.OnCancelamento     := Cancelamento;
    edtTerminal.Text          := TtecTEFDedicado.Terminal
  end
end;

destructor TfrmTEFDedicado.Destroy;
begin
  tecTEF.Free;
  inherited;
  frmTEFDedicado := nil;
end;

function TfrmTEFDedicado.getDataFiscal: String;
begin
  Result := tecTEF.DataFiscal
end;

function TfrmTEFDedicado.getHorario: String;
begin
  Result := tecTEF.Horario
end;

function TfrmTEFDedicado.getNSU: String;
begin
  Result := tecTEF.NSU
end;

function TfrmTEFDedicado.getNumeroCupom: String;
begin
  Result := tecTEF.CupomFiscal
end;

function TfrmTEFDedicado.getOperador: String;
begin
  Result := tecTEF.Operador
end;

function TfrmTEFDedicado.getValor: String;
begin
  Result := tecTEF.Valor
end;

procedure TfrmTEFDedicado.Mensagem(str: String);
begin
  mmoMsg.Lines.Add(Str);
end;

function TfrmTEFDedicado.OpcoesMenu(Str: array of String; var Int: Integer): Boolean;
begin
  frmInformacoesTEF.Opcoes(Str);
  Result := frmInformacoesTEF.ShowModal = mrok;
  Int := frmInformacoesTEF.Opcao;
  if Not Result then begin
    tecTEF.FinalizaTransacaoInterativo(0);
    if tecTEF.CodigoErro <> 0 then
      mmoMsg.Lines.Add(tecTEF.MensagemErro);
  end
end;

procedure TfrmTEFDedicado.PosOperacao(Ok: Boolean);
begin
  if Ok then
    ModalResult := mrOk
  else if Cancelado then
    ModalResult := mrCancel
  else if tecTEF.CodigoErro <> 0 then
    mmoMsg.Lines.Add(tecTEF.MensagemErro);
end;

procedure TfrmTEFDedicado.PreencheDadosSitef;
begin
  Cancelado            := False;
//  tecTEF.Valor       := edtValor.Text;
  tecTEF.DataFiscal  := DateToStr(Date);
  tecTEF.Horario     := TimeToStr(Time);
  tecTEF.Operador    := '1';
end;

procedure TfrmTEFDedicado.setDataFiscal(const Value: String);
begin
  tecTEF.DataFiscal := Value
end;

procedure TfrmTEFDedicado.setHorario(const Value: String);
begin
  tecTEF.Horario := Value
end;

procedure TfrmTEFDedicado.setNumeroCupom(const Value: String);
begin
  tecTEF.CupomFiscal := Value;
  edtCupom.Text        := Value;
end;

procedure TfrmTEFDedicado.setOperador(const Value: String);
begin
  tecTEF.Operador := Value
end;

procedure TfrmTEFDedicado.setValor(const Value: String);
begin
  tecTEF.Valor := Value;
  edtValor.Text  := Value;
end;

end.
