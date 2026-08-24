unit fmcadastrosaldoclientes;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmcadastropadrao, ComCtrls, Buttons, ExtCtrls, StdCtrls, Mask,
  cpdbfindcontrols, cpdbradiogroup, DBCtrls, cpdbtext, Grids, DBGrids,
  cpdbgrid, cptexto, cpnumero, ctconstantes,fmConsultaBasica,
  fmConsultaporCampo, zquery,
  dmconsultadadoscliente, biblio, ToolWin;

type
  TfrmCadastroSaldoClientes = class(TFrmCadastroPadrao)
    lblNumero: TLabel;
    dtxNumero: TtecDBText;
    rgpTipo: TtecDBRadioGroup;
    rbnEntrada: TtecRadioButton;
    rbnSaida: TtecRadioButton;
    lblDataHora: TLabel;
    dtxDataHora: TtecDBText;
    lblEvento: TLabel;
    flkEvento: TtecDBFindLookup;
    sbnProcuraEventos: TSpeedButton;
    dtxProcuraCliente: TtecDBText;
    gbxValores: TGroupBox;
    edtSaldo: TDBEditNumero;
    lblSaldo: TLabel;
    lblValor: TLabel;
    lblReferencia: TLabel;
    edtReferencia: TDBEditTexto;
    edtValor: TDBEditNumero;
    procedure sbnProcuraEventosClick(Sender: TObject);
    procedure sbnProcurarClientesClick(Sender: TObject);
  private
    { Private declarations }
  protected
    dtmconsultadadoscliente: Tdtmconsultadadoscliente;
    TipoConsulta: TtecSaldoCliente;
    function  InternoIncluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoPesquisar(Titulo:String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  PermitirProcura: Boolean;
    function  ValidarSaldo: Boolean;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; dtm: Tdtmconsultadadoscliente); reintroduce;
    destructor Destroy; override;
  end;

var
  frmCadastroSaldoClientes: TfrmCadastroSaldoClientes;

implementation

{$R *.dfm}

{ TfrmCadastroSaldoClientes }

constructor TfrmCadastroSaldoClientes.Create(AOwner: TComponent; dtm: Tdtmconsultadadoscliente);
begin
  dtmconsultadadoscliente := dtm;
  Inherited Create(AOwner);
  DataSet:= dtmconsultadadoscliente.TabelaProdutosTrocados;
  InternoIncluir;
end;

destructor TfrmCadastroSaldoClientes.Destroy;
begin
  inherited;
  frmCadastroSaldoClientes := nil;
end;

function TfrmCadastroSaldoClientes.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  with dtmconsultadadosCliente do
  if CtrlOn then
    case TipoConsulta of
      ctscEVENTO : Result := ExisteEvento(NomeCampo, Value)
    else
    Result := False
    end
//  else Result := ExisteRequisicoes(NomeCampo, Value);
end;

function TfrmCadastroSaldoClientes.InternoGravar: Boolean;
begin
 Result:= inherited InternoGravar;
 if result then
   result := validarSaldo;

 if Result then
 begin
   with dtmConsultaDadosCliente do
     result := GravarProdutosTrocados;
 end;
 if result then
   close;
end;

function TfrmCadastroSaldoClientes.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if not CtrlOn then
    if Result then
      dtmConsultaDadosCliente.IncluirSaldoCliente;
end;

function TfrmCadastroSaldoClientes.InternoPesquisar(
  Titulo: String): Integer;
begin
  Result := mrNone;
  if PermitirProcura then begin
    with dtmConsultaDadosCliente do begin
      AbreTabelaPesquisa(TipoConsulta);
      Result:= Inherited InternoPesquisar(Titulo);
      if Result = mrOK then
        Selecionar(TipoConsulta);
      FechaTabelaPesquisa(TipoConsulta);
    end;
  end;
end;

function TfrmCadastroSaldoClientes.JanelaPesquisa: TfrmConsultaBasica;
var
  Jan: TfrmConsultaPorCampo;
begin
  Jan := TfrmConsultaPorCampo.Create(nil);
  Jan.ConsultaInterativa := Not (TipoConsulta in [ctscCLIENTES]) and CtrlOn;
  Result := Jan
end;

function TfrmCadastroSaldoClientes.PermitirProcura: Boolean;
begin
  Result := True;
  if CtrlOn then begin
    if flkEvento.Focused then begin
      Result := True;
      tipoConsulta := ctscEVENTO;
    end
{    else if flkCliente.Focused then begin
      Result := True;
      TipoConsulta := ctscCLIENTES;
    end};
  end
  else TipoConsulta := ctscSALDO;
end;

procedure TfrmCadastroSaldoClientes.sbnProcuraEventosClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkEvento, ctEVENTO);
end;

procedure TfrmCadastroSaldoClientes.sbnProcurarClientesClick(
  Sender: TObject);
begin
  inherited;
{  InternoPesquisar(flkCliente, ctCLIENTE);}
end;

function TfrmCadastroSaldoClientes.TabelaDePesquisa: TZDataSet;
begin
  Result := inherited TabelaDePesquisa;
    with dtmConsultaDadosCliente do
      case TipoConsulta of
        ctscEVENTO           : Result := ConsultaEventos;
      end;
end;

function TfrmCadastroSaldoClientes.ValidarSaldo: Boolean;
begin
 if dtmconsultadadoscliente.ProdutosTrocadosValor = 0 then
 begin
   result := false;
   MensagemAviso(ctVALORMAIORQUEZERO);
   edtValor.SetFocus;
 end;
 if dtmconsultadadoscliente.ProdutosTrocadossaldo < 0 then
 begin
   result := false;
   MensagemAviso(format(ctSALDONEGATIVO,[dtmconsultadadoscliente.ProdutosTrocadossaldo]));
   edtValor.SetFocus;
 end;
end;

end.
