unit fmcadastroclientesprodutos;
interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Buttons, Mask, ComCtrls, ExtCtrls, windows,
  // Componentes
  cptexto,  cpdbfindcontrols, cpdbtext,
  // Biblio
  ctconstantes, clparametrossistema,
  // Terceiros
  ZQuery, biblio,
  // Repositorio
  fmconsultabasica, fmconsultaporcampo, fmcadastropadrao,
  // Projeto
  dmcadastroprodutos, cpnumero, cpdbdata, frconsulta, frconsultacodigo,
  cpdbmemo, ToolWin, cpdbradiogroup;

type
  TfrmCadastroClientesProdutos = class(TfrmCadastroPadrao)
    gbxConsulta: TGroupBox;
    sbnProcuraCliente: TSpeedButton;
    dtxProduto: TtecDBText;
    dtxCliente: TtecDBText;
    dtxCodigoProduto: TtecDBText;
    flkCliente: TtecDBFindLookup;
    edtProduto: TDBEditTexto;
    edtFinalidade: TDBEditTexto;
    edtPN: TDBEditTexto;
    edtOrigem: TDBEditTexto;
    gbxItemProduto: TGroupBox;
    gbxCliente: TGroupBox;
    gbxProdCliente: TGroupBox;
    gbxFinalidade: TGroupBox;
    gbxPartNumber: TGroupBox;
    gbxOrigem: TGroupBox;
    gbxPrecoCliente: TGroupBox;
    edtCustoAdicionalProduto: TDBEditNumero;
    gbxAlteracaoCliente: TGroupBox;
    edtInativo: TDBEditData;
    gbxPrecodoCliente: TGroupBox;
    gbxValorUltimaVenda: TGroupBox;
    dtxValorUltimaVenda: TtecDBText;
    gbxUltimaVenda: TGroupBox;
    gbxDataUltimaVenda: TGroupBox;
    dtxDataUltimaVenda: TtecDBText;
    gbxUltimoOrcamento: TGroupBox;
    gbxDataUltimoOrcamento: TGroupBox;
    dtxDataUltimoOrcamento: TtecDBText;
    gbxValorUltimoOrcamento: TGroupBox;
    dtxValorUltimoOrcamento: TtecDBText;
    gbxFluxograma: TGroupBox;
    fraConsultaFluxograma: TfraConsultaCodigo;
    gbxLotePadrao: TGroupBox;
    edtLoteProducao: TDBEditNumero;
    gbxRevisao: TGroupBox;
    DBEditTexto1: TDBEditTexto;
    gbxObservacoes: TGroupBox;
    mmoObservacoes: TtecDBMemo;
    gbxQtdeExcedente: TGroupBox;
    edtExcedentePermitido: TDBEditNumero;
    gbxTipoExcedente: TtecDBRadioGroup;
    rbnPercentual: TtecRadioButton;
    rbnUnidade: TtecRadioButton;
    gbxReguaCarimbo: TGroupBox;
    pgcClientesProdutos: TPageControl;
    tstProducao: TTabSheet;
    tstEmbalagens: TTabSheet;
    gbxCaixa: TGroupBox;
    lblPrimaria: TStaticText;
    gbxSecundaria1: TGroupBox;
    lblSecundaria1: TStaticText;
    gbxTerciaria: TGroupBox;
    lblPallet: TStaticText;
    gbxEmbalagem_pri: TGroupBox;
    gbxEmbalagem_sec: TGroupBox;
    gbxEmbalagem_ter: TGroupBox;
    gbxqttabuleiro_pri: TGroupBox;
    gbxqttabuleiro_sec: TGroupBox;
    gbxqttabuleiro_ter: TGroupBox;
    gbxTabuleiro: TGroupBox;
    gbxtabuleiro_sec: TGroupBox;
    gbxtabuleiro_ter: TGroupBox;
    gbxNrPecas: TGroupBox;
    gbxqtcaixa_sec: TGroupBox;
    gbxqtcaixa_ter: TGroupBox;
    fraEmbalagem_pri: TfraConsultaCodigo;
    fraEmbalagem_sec: TfraConsultaCodigo;
    fraEmbalagem_ter: TfraConsultaCodigo;
    edtqttabuleiro_pri: TDBEditNumero;
    edtqttabuleiro_sec: TDBEditNumero;
    edtqttabuleiro_ter: TDBEditNumero;
    edtNrPecasPrimaria: TDBEditNumero;
    edtNrPecasSegundaria1: TDBEditNumero;
    edtNrPecasPallet: TDBEditNumero;
    fratabuleiro_pri: TfraConsultaCodigo;
    fratabuleiro_sec: TfraConsultaCodigo;
    fratabuleiro_ter: TfraConsultaCodigo;
    gbxqtcaixa_sec2: TGroupBox;
    edtNrPecasSegundaria2: TDBEditNumero;
    GroupBox4: TGroupBox;
    fratabuleiro_sec2: TfraConsultaCodigo;
    GroupBox5: TGroupBox;
    DBEditNumero5: TDBEditNumero;
    GroupBox6: TGroupBox;
    fraEmbalagem_sec2: TfraConsultaCodigo;
    gbxSecundaria2: TGroupBox;
    lblSecundaria2: TStaticText;
    gbxqtcaixa_sec3: TGroupBox;
    edtNrPecasSegundaria3: TDBEditNumero;
    GroupBox9: TGroupBox;
    fratabuleiro_sec3: TfraConsultaCodigo;
    GroupBox10: TGroupBox;
    DBEditNumero7: TDBEditNumero;
    GroupBox11: TGroupBox;
    fraEmbalagem_sec3: TfraConsultaCodigo;
    gbxSecundaria3: TGroupBox;
    lblSecundaria3: TStaticText;
    gbxCustoCaixa: TGroupBox;
    gbxCustodoCliente_sec: TGroupBox;
    ckbCustodocliente_pri: TDBCheckBox;
    ckbCustodocliente_sec: TDBCheckBox;
    GroupBox13: TGroupBox;
    DBCheckBox1: TDBCheckBox;
    GroupBox14: TGroupBox;
    DBCheckBox2: TDBCheckBox;
    GroupBox15: TGroupBox;
    DBCheckBox3: TDBCheckBox;
    gbxCustoTabuleiro: TGroupBox;
    DBCheckBox4: TDBCheckBox;
    gbxtabuleiro_custodocliente_sec: TGroupBox;
    DBCheckBox5: TDBCheckBox;
    gbxtabuleiro_custodocliente_sec2: TGroupBox;
    DBCheckBox6: TDBCheckBox;
    gbxtabuleiro_custodocliente_sec3: TGroupBox;
    DBCheckBox7: TDBCheckBox;
    gbxtabuleiro_custodocliente_ter: TGroupBox;
    DBCheckBox8: TDBCheckBox;
    lblNrTabuleiros: TLabel;
    lblCustoCaixa: TLabel;
    lblCustoTabuleiro: TLabel;
    lblNrPecas: TLabel;
    gbxFCI: TGroupBox;
    edtFCI: TDBEditTexto;
    procedure sbnProcuraClienteClick(Sender: TObject);
    procedure fraEmbalagem_priedfCodigoFound(Found: Boolean);
    procedure fraEmbalagem_secedfCodigoFound(Found: Boolean);
    procedure fraEmbalagem_teredfCodigoFound(Found: Boolean);
    procedure fratabuleiro_priedfCodigoFound(Found: Boolean);
    procedure fratabuleiro_secedfCodigoFound(Found: Boolean);
    procedure fratabuleiro_teredfCodigoFound(Found: Boolean);
    procedure fraEmbalagem_sec2edfCodigoFound(Found: Boolean);
    procedure fraEmbalagem_sec3edfCodigoFound(Found: Boolean);
    procedure fratabuleiro_sec2edfCodigoFound(Found: Boolean);
    procedure fratabuleiro_sec3edfCodigoFound(Found: Boolean);
  protected
    {dtmCadastroProdutos: TdtmCadastroProdutos;}
    function  InternoIncluir: Boolean; override;
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoPesquisar(Titulo:String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  PesquisaHabilitada: Boolean;
  public
    TipoPesquisa: TipoProcuraProdutosEstoque;
//    procedure SetDataModulo(Dtm: TdtmCadastroProdutos);
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;

    procedure AtribuirDadosEmbalagem_pri(Found: Boolean);
    procedure AtribuirDadosEmbalagem_sec(Found: Boolean);
    procedure AtribuirDadosEmbalagem_sec2(Found: Boolean);
    procedure AtribuirDadosEmbalagem_sec3(Found: Boolean);
    procedure AtribuirDadosEmbalagem_ter(Found: Boolean);

    procedure AtribuirDadostabuleiro_pri(Found: Boolean);
    procedure AtribuirDadostabuleiro_sec(Found: Boolean);
    procedure AtribuirDadostabuleiro_sec2(Found: Boolean);
    procedure AtribuirDadostabuleiro_sec3(Found: Boolean);
    procedure AtribuirDadostabuleiro_ter(Found: Boolean);

    procedure CondicoesdaConsultaEmbalagens;


    { Public declarations }
  end;

var
  frmCadastroClientesProdutos: TfrmCadastroClientesProdutos;

implementation

{$R *.dfm}

{ TfrmCadastroClientesProdutos }

destructor TfrmCadastroClientesProdutos.Destroy;
begin
  inherited;
  frmCadastroClientesProdutos := nil;
end;

function TfrmCadastroClientesProdutos.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  Result := dtmCadastroProdutos.ExisteClienteProduto(NomeCampo, Value);
end;

function TfrmCadastroClientesProdutos.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then begin
    if not CtrlOn then
      Result := dtmCadastroProdutos.ExcluirClienteProduto;
  end;
end;

function TfrmCadastroClientesProdutos.InternoGravar: Boolean;
begin
  Result := True;
  if ActiveControl is TtecFindCustom then
    Result:= TtecFindCustom(ActiveControl).Exist;
  if Result then begin
    Result := dtmCadastroProdutos.GravarClienteProduto;
    flkCliente.SetFocus;
  end;
end;

function TfrmCadastroClientesProdutos.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then begin
    if not CtrlOn then
      Result := dtmCadastroProdutos.IncluirClienteProduto(False);
  end;
end;

function TfrmCadastroClientesProdutos.InternoPesquisar(
  Titulo: String): Integer;
begin
  Result := mrNone;
  with dtmCadastroProdutos do begin
    if PesquisaHabilitada then begin
      AbreTabelasConsulta(TipoPesquisa);
      Result := inherited InternoPesquisar('Clientes');
      if Result = mrOK then
        Selecionar(TipoPesquisa);
      FechaTabelasConsulta(TipoPesquisa);
    end;
  end;
end;

function TfrmCadastroClientesProdutos.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := False;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela := True;
end;

function TfrmCadastroClientesProdutos.PesquisaHabilitada: Boolean;
begin
  Result := False;
  if CtrlOn then begin
    if flkCliente.Focused then
    begin
       TipoPesquisa:= tpCLIENTE;
       Result:= True;
    end
  end
end;

{
procedure TfrmCadastroClientesProdutos.SetDataModulo(
  Dtm: TdtmCadastroProdutos);
begin
  dtmCadastroProdutos := Dtm;
end;
}

function TfrmCadastroClientesProdutos.TabelaDePesquisa: TZDataSet;
begin
  Result := dtmCadastroProdutos.ConsultarClientes;
end;

procedure TfrmCadastroClientesProdutos.sbnProcuraClienteClick(
  Sender: TObject);
begin
  CtrlOn:= True;
  flkCliente.SetFocus;
  InternoPesquisar('');
end;

constructor TfrmCadastroClientesProdutos.Create(AOwner: TComponent);
begin
  inherited;
  gbxUltimaVenda.Visible := ParSistema.PrecoParaCliente;
  gbxUltimoOrcamento.Visible := ParSistema.PrecoParaCliente;

  fraConsultaFluxograma.TipoPesquisa := pesFLUXOGRAMA;

  fraEmbalagem_pri.TipoPesquisa := pesITEMPRODUTOS;
  fraEmbalagem_pri.OnFound := AtribuirDadosEmbalagem_pri;
  fraEmbalagem_pri.CondicoesdaConsulta := CondicoesdaConsultaEmbalagens;

  fraEmbalagem_sec.TipoPesquisa := pesITEMPRODUTOS;
  fraEmbalagem_sec.OnFound := AtribuirDadosEmbalagem_sec;
  fraEmbalagem_sec.CondicoesdaConsulta := CondicoesdaConsultaEmbalagens;
  fraEmbalagem_sec.edfCodigo.MaxLength := 30;

  fraEmbalagem_sec2.TipoPesquisa := pesITEMPRODUTOS;
  fraEmbalagem_sec2.OnFound := AtribuirDadosEmbalagem_sec2;
  fraEmbalagem_sec2.CondicoesdaConsulta := CondicoesdaConsultaEmbalagens;

  fraEmbalagem_sec3.TipoPesquisa := pesITEMPRODUTOS;
  fraEmbalagem_sec3.OnFound := AtribuirDadosEmbalagem_sec3;
  fraEmbalagem_sec3.CondicoesdaConsulta := CondicoesdaConsultaEmbalagens;

  fraEmbalagem_ter.TipoPesquisa := pesITEMPRODUTOS;
  fraEmbalagem_ter.OnFound := AtribuirDadosEmbalagem_ter;
  fraEmbalagem_ter.CondicoesdaConsulta := CondicoesdaConsultaEmbalagens;

  fratabuleiro_pri.TipoPesquisa := pesITEMPRODUTOS;
  fratabuleiro_pri.OnFound := AtribuirDadostabuleiro_pri;
  fratabuleiro_pri.CondicoesdaConsulta := CondicoesdaConsultaEmbalagens;

  fratabuleiro_sec.TipoPesquisa := pesITEMPRODUTOS;
  fratabuleiro_sec.OnFound := AtribuirDadostabuleiro_sec;
  fratabuleiro_sec.CondicoesdaConsulta := CondicoesdaConsultaEmbalagens;

  fratabuleiro_sec2.TipoPesquisa := pesITEMPRODUTOS;
  fratabuleiro_sec2.OnFound := AtribuirDadostabuleiro_sec2;
  fratabuleiro_sec2.CondicoesdaConsulta := CondicoesdaConsultaEmbalagens;

  fratabuleiro_sec3.TipoPesquisa := pesITEMPRODUTOS;
  fratabuleiro_sec3.OnFound := AtribuirDadostabuleiro_sec3;
  fratabuleiro_sec3.CondicoesdaConsulta := CondicoesdaConsultaEmbalagens;

  fratabuleiro_ter.TipoPesquisa := pesITEMPRODUTOS;
  fratabuleiro_ter.OnFound := AtribuirDadostabuleiro_ter;
  fratabuleiro_ter.CondicoesdaConsulta := CondicoesdaConsultaEmbalagens;

  pgcClientesProdutos.ActivePage := tstProducao;

end;

procedure TfrmCadastroClientesProdutos.AtribuirDadosEmbalagem_pri(Found: Boolean);
begin
  if fraEmbalagem_pri.qryProcuraItemProdutos.FieldByName('produto').AsString<>'' then
    dtmCadastroProdutos.qryClientesProdutosembalagem_pri.AsString := fraEmbalagem_pri.qryProcuraItemProdutos.FieldByName('produto').AsString
  else
    dtmCadastroProdutos.qryClientesProdutosembalagem_pri.clear;
end;

procedure TfrmCadastroClientesProdutos.AtribuirDadosEmbalagem_sec(Found: Boolean);
begin
  if fraEmbalagem_sec.qryProcuraItemProdutos.FieldByName('produto').AsString<>'' then
    dtmCadastroProdutos.qryClientesProdutosembalagem_sec.AsString := fraEmbalagem_sec.qryProcuraItemProdutos.FieldByName('produto').AsString
  else
    dtmCadastroProdutos.qryClientesProdutosembalagem_sec.clear;
end;

procedure TfrmCadastroClientesProdutos.AtribuirDadosEmbalagem_ter(Found: Boolean);
begin
  if fraEmbalagem_ter.qryProcuraItemProdutos.FieldByName('produto').AsString<>'' then
    dtmCadastroProdutos.qryClientesProdutosembalagem_ter.AsString := fraEmbalagem_ter.qryProcuraItemProdutos.FieldByName('produto').AsString
  else
    dtmCadastroProdutos.qryClientesProdutosembalagem_ter.clear;
end;

procedure TfrmCadastroClientesProdutos.AtribuirDadostabuleiro_pri(Found: Boolean);
begin
  if fratabuleiro_pri.qryProcuraItemProdutos.FieldByName('Produto').AsString<>'' then
    dtmCadastroProdutos.qryClientesProdutostabuleiro_pri.AsString := fratabuleiro_pri.qryProcuraItemProdutos.FieldByName('produto').AsString
  else
    dtmCadastroProdutos.qryClientesProdutostabuleiro_pri.clear;
end;

procedure TfrmCadastroClientesProdutos.AtribuirDadostabuleiro_sec(Found: Boolean);
begin
  if fratabuleiro_sec.qryProcuraItemProdutos.FieldByName('produto').AsString<>'' then
    dtmCadastroProdutos.qryClientesProdutostabuleiro_sec.AsString := fratabuleiro_sec.qryProcuraItemProdutos.FieldByName('produto').AsString
  else
    dtmCadastroProdutos.qryClientesProdutostabuleiro_sec.clear;
end;

procedure TfrmCadastroClientesProdutos.AtribuirDadostabuleiro_ter(Found: Boolean);
begin
  if fratabuleiro_ter.qryProcuraItemProdutos.FieldByName('produto').AsString<>'' then
    dtmCadastroProdutos.qryClientesProdutostabuleiro_ter.AsString := fratabuleiro_ter.qryProcuraItemProdutos.FieldByName('produto').AsString
  else
    dtmCadastroProdutos.qryClientesProdutostabuleiro_ter.clear;
end;

procedure TfrmCadastroClientesProdutos.CondicoesdaConsultaEmbalagens;
begin
  fraEmbalagem_pri.qryProcuraItemProdutos.MacroByName('SQLFiltroTipoProduto').AsString := 'and c.tipoproduto = ''02''';
  fraEmbalagem_pri.qryConsultaItemProdutos.MacroByName('SQLFiltroTipoProduto').AsString := 'and c.tipoproduto = ''02''';

  fraEmbalagem_sec.qryProcuraItemProdutos.MacroByName('SQLFiltroTipoProduto').AsString := 'and c.tipoproduto = ''02''';
  fraEmbalagem_sec.qryConsultaItemProdutos.MacroByName('SQLFiltroTipoProduto').AsString := 'and c.tipoproduto = ''02''';

  fraEmbalagem_ter.qryProcuraItemProdutos.MacroByName('SQLFiltroTipoProduto').AsString := 'and c.tipoproduto = ''02''';
  fraEmbalagem_ter.qryConsultaItemProdutos.MacroByName('SQLFiltroTipoProduto').AsString := 'and c.tipoproduto = ''02''';

  fratabuleiro_pri.qryProcuraItemProdutos.MacroByName('SQLFiltroTipoProduto').AsString := 'and c.tipoproduto = ''02''';
  fratabuleiro_pri.qryConsultaItemProdutos.MacroByName('SQLFiltroTipoProduto').AsString := 'and c.tipoproduto = ''02''';

  fratabuleiro_sec.qryProcuraItemProdutos.MacroByName('SQLFiltroTipoProduto').AsString := 'and c.tipoproduto = ''02''';
  fratabuleiro_sec.qryConsultaItemProdutos.MacroByName('SQLFiltroTipoProduto').AsString := 'and c.tipoproduto = ''02''';

  fratabuleiro_ter.qryProcuraItemProdutos.MacroByName('SQLFiltroTipoProduto').AsString := 'and c.tipoproduto = ''02''';
  fratabuleiro_ter.qryConsultaItemProdutos.MacroByName('SQLFiltroTipoProduto').AsString := 'and c.tipoproduto = ''02''';
end;

procedure TfrmCadastroClientesProdutos.fraEmbalagem_priedfCodigoFound(
  Found: Boolean);
begin
  inherited;
  AtribuirDadosEmbalagem_pri(Found);
end;

procedure TfrmCadastroClientesProdutos.fraEmbalagem_secedfCodigoFound(
  Found: Boolean);
begin
  inherited;
  AtribuirDadosEmbalagem_sec(found)
end;

procedure TfrmCadastroClientesProdutos.fraEmbalagem_teredfCodigoFound(
  Found: Boolean);
begin
  inherited;
  AtribuirDadosEmbalagem_ter(found)
end;

procedure TfrmCadastroClientesProdutos.fratabuleiro_priedfCodigoFound(
  Found: Boolean);
begin
  inherited;
  AtribuirDadostabuleiro_pri(found)
end;

procedure TfrmCadastroClientesProdutos.fratabuleiro_secedfCodigoFound(
  Found: Boolean);
begin
  inherited;
  AtribuirDadostabuleiro_sec(found)
end;

procedure TfrmCadastroClientesProdutos.fratabuleiro_teredfCodigoFound(
  Found: Boolean);
begin
  inherited;
  AtribuirDadostabuleiro_ter(found)
end;

procedure TfrmCadastroClientesProdutos.AtribuirDadosEmbalagem_sec2;
begin
  if fraEmbalagem_sec2.qryProcuraItemProdutos.FieldByName('produto').AsString<>'' then
    dtmCadastroProdutos.qryClientesProdutosembalagem_sec2.AsString := fraEmbalagem_sec2.qryProcuraItemProdutos.FieldByName('produto').AsString
  else
    dtmCadastroProdutos.qryClientesProdutosembalagem_sec2.clear;

end;

procedure TfrmCadastroClientesProdutos.AtribuirDadosEmbalagem_sec3;
begin
  if fraEmbalagem_sec3.qryProcuraItemProdutos.FieldByName('produto').AsString<>'' then
    dtmCadastroProdutos.qryClientesProdutosembalagem_sec3.AsString := fraEmbalagem_sec3.qryProcuraItemProdutos.FieldByName('produto').AsString
  else
    dtmCadastroProdutos.qryClientesProdutosembalagem_sec3.clear;

end;

procedure TfrmCadastroClientesProdutos.AtribuirDadostabuleiro_sec2;
begin
  if fratabuleiro_sec2.qryProcuraItemProdutos.FieldByName('produto').AsString<>'' then
    dtmCadastroProdutos.qryClientesProdutostabuleiro_sec2.AsString := fratabuleiro_sec2.qryProcuraItemProdutos.FieldByName('produto').AsString
  else
    dtmCadastroProdutos.qryClientesProdutostabuleiro_sec2.clear;
end;

procedure TfrmCadastroClientesProdutos.AtribuirDadostabuleiro_sec3;
begin
  if fratabuleiro_sec3.qryProcuraItemProdutos.FieldByName('produto').AsString<>'' then
    dtmCadastroProdutos.qryClientesProdutostabuleiro_sec3.AsString := fratabuleiro_sec3.qryProcuraItemProdutos.FieldByName('produto').AsString
  else
    dtmCadastroProdutos.qryClientesProdutostabuleiro_sec3.clear;

end;

procedure TfrmCadastroClientesProdutos.fraEmbalagem_sec2edfCodigoFound(
  Found: Boolean);
begin
  inherited;
  AtribuirDadosEmbalagem_sec2(found)
end;

procedure TfrmCadastroClientesProdutos.fraEmbalagem_sec3edfCodigoFound(
  Found: Boolean);
begin
  inherited;
  AtribuirDadosEmbalagem_sec3(found)
end;

procedure TfrmCadastroClientesProdutos.fratabuleiro_sec2edfCodigoFound(
  Found: Boolean);
begin
  inherited;
  AtribuirDadostabuleiro_sec2(found)

end;

procedure TfrmCadastroClientesProdutos.fratabuleiro_sec3edfCodigoFound(
  Found: Boolean);
begin
  inherited;
  AtribuirDadostabuleiro_sec3(found)

end;

end.
