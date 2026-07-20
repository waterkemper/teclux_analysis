unit fmlistaspadrao;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs, Windows,
  fmcadastropadrao, ComCtrls, Buttons, ExtCtrls, StdCtrls, DBCtrls,
  cptexto, Mask, cpdbfindcontrols, fmconsultabasica, fmconsultaporcampo, dmlistaspadrao,
  ZQuery, Grids, DBGrids, cpdbgrid, ctconstantes, {Qete,} ActnList, biblio,
  ToolWin, frconsulta, frconsultacodigo, fmConferenciaProdutos, cpdbtext;

type
  TfrmListasPadrao = class(TfrmCadastroPadrao)
    pnlFundoJanela: TPanel;
    edfCodigo: TtecDbEditFind;
    edtDescricao: TDBEditTexto;
    gbxProdutos: TGroupBox;
    dbgProdutos: TtecDBGrid;
    sbnIncluirProduto: TSpeedButton;
    sbnExcluirProduto: TSpeedButton;
    sbnImprimirListaPadrao: TSpeedButton;
    aclHabilitar: TActionList;
    actHabilitar: TAction;
    gbxCodigo: TGroupBox;
    gbxDescricao: TGroupBox;
    pnlTop: TPanel;
    gbxFiliail: TGroupBox;
    pnlRighProdutos: TPanel;
    fraConsultaFilial: TfraConsultaCodigo;
    sbnConferir: TSpeedButton;
    gbxDataHora: TGroupBox;
    dtxDatahora: TtecDBText;
    gbxOpcoes: TGroupBox;
    ckbImprimirPrecos: TCheckBox;
    ckbImprimirCodigoDeBarras: TCheckBox;
    gbxVendedor: TGroupBox;
    fraConsultaVendedor: TfraConsultaCodigo;
    procedure sbnIncluirProdutoClick(Sender: TObject);
    procedure sbnExcluirProdutoClick(Sender: TObject);
    procedure dbgProdutosDblClick(Sender: TObject);
    procedure dbgProdutosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbnImprimirListaPadraoClick(Sender: TObject);
    procedure actHabilitarUpdate(Sender: TObject);
    procedure sbnConferirClick(Sender: TObject);
  protected
    function InternoExcluir: Boolean; override;
    function InternoGravar: Boolean; override;
    function InternoIncluir: Boolean; override;
    function InternoPesquisar(Titulo:String): Integer; override;
    function JanelaPesquisa: TfrmConsultaBasica; override;
    function TabelaDePesquisa: TZDataSet; override;
    function ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  public
    function AcionaCadastroProdutosLista(Editar: Boolean): Boolean;
    procedure OperacaoPadrao(Value: Array of Variant); override;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;


  end;

var
  frmListasPadrao: TfrmListasPadrao;

implementation

uses fmprodutoslistapadrao;

//uses fmprodutoslistaspadrao;

{$R *.dfm}

{ TfrmListasPadrao }

function TfrmListasPadrao.AcionaCadastroProdutosLista(Editar: Boolean): Boolean;
begin
  if not Assigned (frmProdutosListaPadrao) then
    frmProdutosListaPadrao:= TfrmProdutosListaPadrao.Create(frmProdutosListaPadrao);

  with frmProdutosListaPadrao do
  begin
    SetDataModulo(dtmListasPadrao);
    DataSet:= dtmListasPadrao.TabelaProdutosLista;
    Result := dtmListasPadrao.IncluirProdutosLista(Editar);
    ShowModal;
    free;
    dbgProdutos.SetFocus;
    CtrlOn := False;
  end;
end;

constructor TfrmListasPadrao.Create(AOwner: TComponent);
begin
  dtmListasPadrao:= TdtmListasPadrao.Create(Self);
  inherited;
  DataSet:= dtmListasPadrao.TabelaListasPadrao;

  fraConsultaFilial.TipoPesquisa := pesFiliais;

  self.activecontrol := edfcodigo;

  fraConsultaVendedor.TipoPesquisa := pesUSUARIOS;

end;

destructor TfrmListasPadrao.Destroy;
begin
  dtmListasPadrao:=nil;
  inherited;
  frmListasPadrao:= Nil;
end;

function TfrmListasPadrao.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  Result:= dtmListasPadrao.ExisteListaPadrao(NomeCampo, Value);
end;

function TfrmListasPadrao.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result and not CtrlOn then
    dtmListasPadrao.ExcluirListasPadrao;
end;

function TfrmListasPadrao.InternoGravar: Boolean;
begin
  Result:= inherited InternoGravar;
  if Result and not CtrlOn then
    dtmListasPadrao.GravarListasPadrao;
end;

function TfrmListasPadrao.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result and not CtrlOn then
    dtmListasPadrao.IncluirListasPadrao;
end;

function TfrmListasPadrao.InternoPesquisar(Titulo: String): Integer;
begin
  if not ctrlon then
  begin
    with dtmListasPadrao do
    begin
      AbreTabelaPesquisa(tlpLISTAS);
      Result:= inherited InternoPesquisar(Titulo);
      if Result = mrOK then
        SelecionaTabelaPesquisa(tlpLISTAS);
      FechaTabelaPesquisa(tlpLISTAS);
    end;
  end;  
end;

function TfrmListasPadrao.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result:= TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
end;

function TfrmListasPadrao.TabelaDePesquisa: TZDataSet;
begin
  Result := dtmListasPadrao.TabelaConsultaListas;
end;

procedure TfrmListasPadrao.sbnIncluirProdutoClick(Sender: TObject);
begin
  inherited;
  AcionaCadastroProdutosLista(False);
end;

procedure TfrmListasPadrao.sbnExcluirProdutoClick(Sender: TObject);
begin
  inherited;
  dtmListasPadrao.ExcluirProdutosListas;
end;

procedure TfrmListasPadrao.dbgProdutosDblClick(Sender: TObject);
begin
  inherited;
  AcionaCadastroProdutosLista(True);
end;

procedure TfrmListasPadrao.dbgProdutosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Shift = [ssCtrl] then
    case Key of
      TeclaEditarRegistro : AcionaCadastroProdutosLista(True);
      TeclaInserirRegistro: AcionaCadastroProdutosLista(False);
    end;
end;

procedure TfrmListasPadrao.sbnImprimirListaPadraoClick(Sender: TObject);
begin
  inherited;

  dtmListasPadrao.ImprimirListaPadrao(ckbImprimirPrecos.checked, ckbImprimirCodigoDeBarras.checked);
end;

procedure TfrmListasPadrao.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_F7: if (Shift = []) and sbnImprimirListaPadrao.Enabled then
              sbnImprimirListaPadrao.Click;
  end;
end;

procedure TfrmListasPadrao.actHabilitarUpdate(Sender: TObject);
begin
  inherited;
  sbnImprimirListaPadrao.Enabled:= dtmListasPadrao.QuantidadeProdutos > 0;
  sbnConferir.enabled := not sbnSalvar.Enabled and (dtmListasPadrao.qryProdutosListasPadrao.RecordCount <> 0)
end;

procedure TfrmListasPadrao.sbnConferirClick(Sender: TObject);
begin
  inherited;
  with dtmListasPadrao do
  begin

    try
      qryProdutosListasPadrao.AfterDelete := nil;

      ConferirProdutos(qryProdutosListasPadrao, qryProdutosListasPadraoproduto.fieldname,
       qryProdutosListasPadraoprodutovisual.FieldName, qryProdutosListasPadraodescricao.FieldName,
       qryProdutosListasPadraoquantidade.FieldName, 'LPA', qryListasPadraocodigo.asSTring,
       qryProdutosListasPadraovalorgrade1.FieldName,
       qryProdutosListasPadraovalorgrade2.FieldName,
       qryProdutosListasPadraolinha.FieldName,
       qryProdutosListasPadraocoluna.FieldName);

    finally
       qryProdutosListasPadrao.AfterDelete := qryProdutosListasPadraoAfterDelete;
       ReFazConsulta(qryProdutosListasPadrao,[0],[qryListasPadraocodigo.AsInteger]);
    end;

  end;

end;

procedure TfrmListasPadrao.OperacaoPadrao(Value: array of Variant);
begin
  inherited;
  edfCodigo.SetFocus;
  edfCodigo.Text := Value[0];
  edfCodigo.exist;
end;

end.
