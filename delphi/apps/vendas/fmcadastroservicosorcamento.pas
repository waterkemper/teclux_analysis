unit fmcadastroservicosorcamento;

interface

uses
  //CLX
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, DBCtrls, Mask, ComCtrls,
  //Biblio
  ctconstantes,
  //Componentes
  cpdbtext, cpnumero, cpdbfindcontrols, cpdbradiogroup,
  //Terceiros
  ZQuery,
  //Repositorio
  fmcadastropadrao, fmconsultabasica, cptexto, ActnList, cpdbmemo, ToolWin;

type
  TfrmCadastroServicosorcamento = class(TfrmCadastroPadrao)
    lblServico: TLabel;
    lblISSQN: TLabel;
    flkServico: TtecDBFindLookup;
    dtxDescricaoServico: TtecDBText;
    sbnProcuraServicos: TSpeedButton;
    pnlFundoJanela: TPanel;
    gbxFundoJanela: TGroupBox;
    lblComplemento: TLabel;
    edtISSQN: TDBEditNumero;
    Label1: TLabel;
    edtValor: TDBEditNumero;
    lblValorServico: TLabel;
    mmoComplemento: TtecDBMemo;
    lblQuantidade: TLabel;
    edtQuantidade: TDBEditNumero;
    procedure flkServicoMessage(var Msg: String);
    procedure sbnProcuraServicosClick(Sender: TObject);
  protected
    TipoConsulta: TtecOrcamentosTipoConsulta;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoIncluir: Boolean; override;
    function  InternoPesquisar(Titulo:String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
  end;

var
  frmCadastroServicosorcamento: TfrmCadastroServicosorcamento;

implementation

uses
  //Biblio
  biblio, clusuario, clparametrossistema,
  //Repositorio
  fmconsultaporcampo,
  //Projeto
  dmorcamentos;

{$R *.dfm}

{ TfrmCadastroServicosorcamento }

constructor TfrmCadastroServicosorcamento.Create(AOwner: TComponent);
begin
  inherited;
  DataSet := dtmOrcamentos.TabelaServicosOrcamento;
  TipoConsulta := vocNENHUM;
end;

destructor TfrmCadastroServicosorcamento.Destroy;
begin
  inherited;
  frmCadastroServicosorcamento := nil;
end;

function TfrmCadastroServicosorcamento.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  if TipoConsulta = vocSERVICO then
    Result := dtmorcamentos.ExisteServico(NomeCampo, Value)
  else
    Result := False;
end;

procedure TfrmCadastroServicosorcamento.flkServicoMessage(var Msg: String);
begin
  inherited;
  Msg:= Format(ctREGISTROINCLUIDO, [flkServico.Text,'na OS']);
end;

function TfrmCadastroServicosorcamento.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then
  begin
    Result := dtmOrcamentos.ExcluirServicoOrcamento;
    flkServico.SetFocus;
  end;
end;

function TfrmCadastroServicosorcamento.InternoGravar: Boolean;
begin
  Result:= inherited InternoGravar;
  if Result then
  begin
    Result := dtmOrcamentos.GravarServicoOrcamento;
    if Result then
    begin
     // dtmCadastroContratos.CalcularValorTotalServicos;     //  dtmCadastroContratos.CalcularValorAVista;   end;    flkServico.SetFocus;
  end;
end;
end;

function TfrmCadastroServicosorcamento.InternoIncluir: Boolean;
begin
  Result:= inherited InternoGravar;
  if Result then
  begin
    Result := dtmOrcamentos.IncluirServicosOrcamento(False);
    flkServico.SetFocus;
  end;
end;

function TfrmCadastroServicosorcamento.InternoPesquisar(Titulo: String): Integer;
begin
  Result := mrNONE;
  if CtrlOn then
  begin
    if ActiveControl = flkServico then
    begin
      Titulo := 'Serviços';
      TipoConsulta:= vocSERVICO;
    end
    else
    begin
      TipoConsulta:= vocNENHUM;
    end;

    if TipoConsulta <> vocNENHUM then
    begin
      dtmOrcamentos.AbreTabelasOrcamento(TipoConsulta);
      Result := inherited InternoPesquisar(Titulo);
      if Result = mrOK then
      begin
        dtmorcamentos.SelecionaTabelasOrcamento(TipoConsulta);
      end;
      dtmorcamentos.FechaTabelasConsulta(TipoConsulta);
    end;
  end;
end;

function TfrmCadastroServicosorcamento.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa     := True;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela := False;
end;

function TfrmCadastroServicosorcamento.TabelaDePesquisa: TZDataSet;
begin
  if TipoConsulta = vocSERVICO then
  begin
    Result := dtmorcamentos.TabelaConsultaServicos;
  end
  else
  begin
    Result := nil
  end;
end;

procedure TfrmCadastroServicosorcamento.sbnProcuraServicosClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  flkServico.SetFocus;
  InternoPesquisar('');
end;
end.
