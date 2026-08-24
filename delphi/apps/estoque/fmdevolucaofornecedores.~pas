
unit fmdevolucaofornecedores;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, dmbasico, dmtecsoft, fmcadastropadrao, DB, ZQuery,
  ZPgSqlQuery, cpquery, ComCtrls, Buttons, ExtCtrls, frconsulta,
  frconsultacodigo, cpdbdata, cpdbradiogroup, Grids, DBGrids, cpdbgrid,
  cpdatasource, ctconstantes, Mask, cpdbfindcontrols, Windows, dmdevolucaofornecedores,
  biblio, clparametrossistema, DBCtrls, cpdbtext, cppagecontrol,
  frlistagrupoprodutos, cpdbmemo, cptexto, frlistaclasseprodutos,
  frlistamarcasprodutos, frlistagrupofornecedores, cpdata, dateutils,
  cpmemo, ToolWin;

type
  TfrmDevolucaoFornecedores = class(TfrmCadastroPadrao)
    sbnGerar: TSpeedButton;
    sbnImprimir: TSpeedButton;
    gbxProdutos: TGroupBox;
    Bevel1: TBevel;
    dbgProdutosInventario: TtecDBGrid;
    fraListaGrupoProdutos: TfraListaGrupoProdutos;
    fraListaclasseProdutos: TfraListaclasseProdutos;
    fraListamarcasProdutos: TfraListamarcasProdutos;
    fraListaGrupoFornecedores: TfraListaGrupoFornecedores;
    pnlTop: TPanel;
    gbxFornecedor: TGroupBox;
    fraConsultaFornecedor: TfraConsultaCodigo;
    gbxLocalizacao: TGroupBox;
    pnlTopLeft: TPanel;
    pnlFornecedor: TPanel;
    edtLocalizacao: TEditTexto;
    tstParametros: TTabSheet;
    tstSelecao: TTabSheet;
    pnlBottom: TPanel;
    pgcProdutos: TPageControl;
    gbxFilial: TGroupBox;
    fraConsultaFilial: TfraConsultaCodigo;
    gbxData: TGroupBox;
    edtData: TEditData;
    GroupBox1: TGroupBox;
    edtNFAcimaDe: TEditData;
    gbxCodigoFiscal: TGroupBox;
    fraConsultaNatureza: TfraConsultaCodigo;
    dtxNatureza: TtecDBText;
    GroupBox2: TGroupBox;
    ckbSelecionarTodos: TCheckBox;
    gbxDataNF: TGroupBox;
    edtIncluirNFEm: TEditData;
    gbxObservacoesNF: TGroupBox;
    mmoObservacoes: TtecMemo;
    procedure sbnGerarClick(Sender: TObject);
    procedure dbgProdutosInventarioDblClick(Sender: TObject);
    procedure dbgProdutosInventarioDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgProdutosInventarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ckbSelecionarTodosClick(Sender: TObject);
    procedure sbnImprimirClick(Sender: TObject);
  private
    { Private declarations }
    function ValidarSelecao: Boolean;
  protected
    function InternoGravar: Boolean; override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;

  end;

var
  frmDevolucaoFornecedores: TfrmDevolucaoFornecedores;

implementation

uses fmnavcontroles, fmajudabt, fmcadastroprodutosinventario;

{$R *.dfm}

{ TfrmDevolucaoFornecedores }

constructor TfrmDevolucaoFornecedores.Create(AOwner: TComponent);
begin
  dtmDevolucaoFornecedores := TdtmDevolucaoFornecedores.Create(Self);
  inherited;
  DataSet := dtmDevolucaoFornecedores.qryProdutosMovimentados;

  fraConsultaFilial.SomenteFiliaisUsuario := ParSistema.RelatorioSomenteFiliaisAutorizadas;
  fraConsultaFilial.TipoPesquisa := pesFILIAIS;
  fraConsultaFilial.edfCodigo.Text := inttostr(filialbase);
  fraConsultaFilial.edfCodigo.Exist;

  fraConsultaFornecedor.TipoCliente := 'F';
  fraConsultaFornecedor.Tipovfornecedor := 'F';
  fraConsultaFornecedor.TipoPesquisa := pesFORNECEDORES;

  edtData.Text := '26/11/2009';
  edtIncluirNFEm.Text := '26/11/2009';
  edtNFAcimaDe.Text := '31/12/2008';

  fraConsultaNatureza.TipoPesquisa := pesNATUREZASCFOP;
  sbnSalvar.Enabled := false;
  sbnImprimir.Enabled := false;
  fraListaclasseProdutos.MarcarListaclasses('MA,MF,MG,MM,MR,MS,MT');

  dtmDevolucaoFornecedores.qryProcuraNaturezasCFOP := fraConsultaNatureza.qryProcuraNaturezasCFOP;

  mmoObservacoes.Text := 'Nota Fiscal emitida nos termos do artigo 2° do decreto 7.016 de 26 de novembro de 2009, referente à Nota Fisca de Devolução n° ';
end;

destructor TfrmDevolucaoFornecedores.Destroy;
begin
  inherited;
  frmDevolucaoFornecedores := nil;
end;

function TfrmDevolucaoFornecedores.InternoGravar: Boolean;
begin
{  pgcProdutos.ActivePage := tstSelecao;
  Result:= inherited InternoGravar;
  if Result then
  begin
    dtmDevolucaoFornecedores.GravarDevolucaoFornecedor;
  end;
}
  Result := False;
  try
    if fraConsultaNatureza.edfCodigo.Text <> '' then
    begin
      if edtIncluirNFEm.Text<>'' then
      begin
        dtmDevolucaoFornecedores.DataInclusaoNF := StrToDate(edtIncluirNFEm.Text);
        dtmDevolucaoFornecedores.Observacoes := mmoObservacoes.Text;
        ShowProcessando('Imprimindo Notas Fiscais de devolução!');
        Result := dtmDevolucaoFornecedores.ImprimirNotasFiscais;
        if Result then
          MensagemAviso(ctOPERACAOREALIZADACOMSUCESSO);
        ShowProcessando;
      end
      else
      begin
        MensagemAviso('Informe a data para inclusão da Nota Fiscal');
        edtIncluirNFEm.SetFocus;
      end;
    end
    else
    begin
      MensagemAviso('Informe a natureza da operação');
      fraConsultaNatureza.edfCodigo.SetFocus;
    end;
  finally
    ShowProcessando;
  end;
end;

procedure TfrmDevolucaoFornecedores.sbnGerarClick(Sender: TObject);
begin
  inherited;
  if ValidarSelecao then
    if not dtmDevolucaoFornecedores.AbrirConsulta(edtData.Text,
                       edtNFAcimaDe.Text,
                       fraConsultaFilial.edfCodigo.Text,
                       fraConsultaFornecedor.edfCodigo.Text,
                       fraListaGrupoProdutos.listaselecionada,
                       fraListaclasseProdutos.ListaSelecionada,
                       fraListamarcasProdutos.ListaSelecionada,
                       edtLocalizacao.Text,
                       fraListaGrupoFornecedores.ListaGruposSelecionadosB
                       ) then
      MensagemAviso(format(ctNENHUMREGISTROENCONTRADO,['registro']))
    else
    begin
      pgcProdutos.ActivePage := tstSelecao;
      dtmDevolucaoFornecedores.MarcarSelecionados(ckbSelecionarTodos.Checked,true);
      sbnSalvar.Enabled   := dtmDevolucaoFornecedores.QtdeMarcados<>0;
      sbnImprimir.Enabled := sbnSalvar.Enabled;
    end
end;

function TfrmDevolucaoFornecedores.ValidarSelecao: Boolean;
begin
  result := fraConsultaFilial.edfCodigo.Text<>'';
  if result then
  begin
    result := not DataEmBranco(edtData.Text);
    if not result then
      MensagemAviso('Data do estoque não informada.')
    else
    begin
      result := not DataEmBranco(edtNFAcimaDe.Text);
      if not result then
        MensagemAviso('Data limite para Nota Fiscal não informada.')
    end;
  end
  else
    MensagemAviso('Filial de emissão não informada.');
end;

procedure TfrmDevolucaoFornecedores.dbgProdutosInventarioDblClick(
  Sender: TObject);
begin
  inherited;
  dtmDevolucaoFornecedores.MarcarSelecionados(false, False);
  sbnSalvar.Enabled := dtmDevolucaoFornecedores.QtdeMarcados<>0;
  sbnImprimir.Enabled := sbnSalvar.Enabled;
end;

procedure TfrmDevolucaoFornecedores.dbgProdutosInventarioDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if dbgProdutosInventario.DataSource.DataSet.FieldByName('marcar').AsBoolean then
  begin
    TDBGrid(Sender).Canvas.Brush.Color := clInfoBk;
    TDBGrid(Sender).Canvas.Font.Color := clBlack;
    TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfrmDevolucaoFornecedores.dbgProdutosInventarioKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    if CtrlOn then
    begin
      dtmDevolucaoFornecedores.MarcarSelecionados(false, False);
      sbnSalvar.Enabled := dtmDevolucaoFornecedores.QtdeMarcados<>0;
      sbnImprimir.Enabled := sbnSalvar.Enabled;
    end;
end;

procedure TfrmDevolucaoFornecedores.ckbSelecionarTodosClick(
  Sender: TObject);
begin
  inherited;
  dtmDevolucaoFornecedores.MarcarSelecionados(ckbSelecionarTodos.Checked,true);
  sbnSalvar.Enabled := dtmDevolucaoFornecedores.QtdeMarcados<>0;
  sbnImprimir.Enabled := sbnSalvar.Enabled;
end;

procedure TfrmDevolucaoFornecedores.sbnImprimirClick(Sender: TObject);
begin
  inherited;
  dtmDevolucaoFornecedores.ImprimirListagem;
end;


procedure TfrmDevolucaoFornecedores.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
      VK_F5: InternoGravar;
  end;


end;

end.

