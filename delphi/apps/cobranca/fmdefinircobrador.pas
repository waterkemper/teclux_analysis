unit fmdefinircobrador;

interface


uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  ExtCtrls, Buttons, Mask, ComCtrls, Grids, DBCtrls, DBGrids, Windows, DB,
  ActnList,
  // Componentes
  cpdbtext, cpquery, cpdata, cpnumero, cpdbfindcontrols, cppagecontrol, cpdbgrid,
  cpeditioncontrolvalidation, cptexto,
  // Constantes
  ctconstantes, biblio,
  // Terceiros
  ZQuery, ZPgSqlQuery,
  // Repositorio
  fmcadastropadrao, frconsultadadoscliente, fmconsultaporcampo, fmconsultabasica,
  fmajudabt,
  // Projeto
  dmdefinircobrador, cpdbradiogroup, cpdbmemo, ToolWin;

type
  TfrmDefinirCobrador = class(TfrmAjudaBt)
    pnlFundoJanela: TPanel;
    gbxRenegociacao: TGroupBox;
    pgcCobranca: TtecPageControl;
    tstDadosClientes: TTabSheet;
    tstParcelasContratos: TTabSheet;
    gbxDadosContratos: TGroupBox;
    gbxParcelasContrato: TGroupBox;
    sbnProcuraCliente: TSpeedButton;
    dtxNomeCliente: TtecDBText;
    edfCliente: TtecDbEditFind;
    tstProdutos: TTabSheet;
    gbxItensContratos: TGroupBox;
    dbgItensContrato: TtecDBGrid;
    fraConsultaDadosClienteRenegociacao: TfraConsultaDadosCliente;
    tstServicos: TTabSheet;
    gbxServicos: TGroupBox;
    dbgServicos: TtecDBGrid;
    dtxEquipamento: TtecDBText;
    dtxDescricaoEquipamento: TtecDBText;
    mmoComplementoEquipamento: TDBMemo;
    dtxFilialVenda: TtecDBText;
    dtsData: TtecDBText;
    edtFaturamento: TtecDBText;
    dtxSituacao: TtecDBText;
    dtxNomeVendedor: TtecDBText;
    dtxContratoOrigem: TtecDBText;
    dtxRenegociado: TtecDBText;
    dtxValorVista: TtecDBText;
    dtxValorPrazo: TtecDBText;
    gbxCobrancas: TGroupBox;
    dtxVendedor: TtecDBText;
    gbxParcelas: TGroupBox;
    dbgParcelas: TtecDBGrid;
    dbgCobrancas: TtecDBGrid;
    dbgContratosPorCliente: TtecDBGrid;
    mmoObservacoes: TtecDBMemo;
    sbnIncluirCobranca: TSpeedButton;
    dtxDescricaoFilialVenda: TtecDBText;
    dtxDescricaoPlano: TtecDBText;
    sbnImprimir: TSpeedButton;
    sbnExcluirCobranca: TSpeedButton;
    aclHabilitar: TActionList;
    actHabilitar: TAction;
    gbxCliente: TGroupBox;
    gbxEquipto: TGroupBox;
    gbxComplemento: TGroupBox;
    gbxData: TGroupBox;
    gbxRenegociado: TGroupBox;
    gbxOrigem: TGroupBox;
    gbxPlanoPagto: TGroupBox;
    gbxVendedor: TGroupBox;
    gbxFilialVenda: TGroupBox;
    gbxFaturamento: TGroupBox;
    gbxSituacao: TGroupBox;
    gbxValorVista: TGroupBox;
    gbxValorPrazo: TGroupBox;
    procedure edfClienteFound(Found: Boolean);
    procedure sbnProcuraClienteClick(Sender: TObject);
    procedure dbgCobrancasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgCobrancasDblClick(Sender: TObject);
    procedure sbnIncluirCobrancaClick(Sender: TObject);
    procedure sbnExcluirCobrancaClick(Sender: TObject);
    procedure sbnImprimirClick(Sender: TObject);
    procedure actHabilitarUpdate(Sender: TObject);
  private
    procedure AfterScrollLinhaColunaGrade(Sender: TObject);

  protected
    dtmDefinirCobrador: TdtmDefinirCobrador;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  InternoPesquisar(Titulo:String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    function  TabelaDePesquisa: TZDataSet; override;
  public
    procedure AcionaCadastroCobranca(Editando: Boolean);
    constructor Create(AOwner: TComponent); Override;
    destructor  Destroy; override;
  end;

var
  frmDefinirCobrador : TfrmDefinirCobrador;
  TipoProcura     : TtecCobranca;

implementation

uses
  //Biblio
  clparametrossistema,
  //Repositorio
  dmbasico, fmcadastrocobranca;

{$R *.dfm}

{ TfrmRenegociacao }

procedure TfrmDefinirCobrador.actHabilitarUpdate(Sender: TObject);
begin
  inherited;
  sbnImprimir.Enabled:= dtmDefinirCobrador.PodeImprimir;
end;

procedure TfrmDefinirCobrador.AcionaCadastroCobranca(Editando: Boolean);
begin
  frmCadastroCobranca:= TfrmCadastroCobranca.Create(frmCadastroCobranca);
  with frmCadastroCobranca do begin
    SetDataModulo(dtmDefinirCobrador);
    DataSet:= dtmDefinirCobrador.TabelaCobranca;
    dtmDefinirCobrador.IncluirCobranca(Editando);
    ShowModal;
    Free;
  end;
  dbgCobrancas.SetFocus;
end;

constructor TfrmDefinirCobrador.Create(AOwner: TComponent);
begin
  dtmDefinirCobrador:= TdtmDefinirCobrador.Create(Self);
  inherited;
  pgcCobranca.ActivePageIndex:= 0;
  dbgItensContrato.Columns[2].Visible := ParSistema.UsarGradesProdutos;
  dbgItensContrato.Columns[3].Visible := ParSistema.UsarGradesProdutos;
  dtmDefinirCobrador.OnScrollLinhaColunaGrade := AfterScrollLinhaColunaGrade;
  dbgItensContrato.Columns[5].Width := length(ParSistema.MascaraQuantidade)*7;  
end;

destructor TfrmDefinirCobrador.Destroy;
begin
  dtmDefinirCobrador:=nil;
  inherited;
  frmDefinirCobrador:= nil;
end;

procedure TfrmDefinirCobrador.edfClienteFound(Found: Boolean);
begin
  inherited;
  if Found then begin
    if not dtmDefinirCobrador.ReFazConsultaContratosPorCliente then begin
      fraConsultaDadosClienteRenegociacao.BuscarDadosCliente(StrToInt(edfCliente.Text),
                                                             dtmDefinirCobrador.TipoCliente);
      dbgContratosPorCliente.SetFocus;
    end;
  end;
end;

function TfrmDefinirCobrador.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  with dtmDefinirCobrador do begin
    case TipoProcura of
      cobCLIENTES: Result:= ExisteCliente(nomecampo, value);
      else        Result:= False;
    end;
  end;
end;

function TfrmDefinirCobrador.InternoPesquisar(Titulo: String): Integer;
begin
  Result := mrNone;
  with dtmDefinirCobrador do begin
    if CtrlOn and (ActiveControl is TtecFindCustom) then begin
      Titulo     := 'Clientes';
      TipoProcura:= cobCLIENTES;

      AbrirTabelas(TipoProcura);
      Result := inherited InternoPesquisar(Titulo);
      if Result = mrOK then
        Selecionar(TipoProcura);
      FecharTabelas(TipoProcura);
    end;
  end
end;

function TfrmDefinirCobrador.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa     := False;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela := False;
end;

procedure TfrmDefinirCobrador.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  case key of
        VK_F7: if not CtrlOn and sbnImprimir.Enabled then
                  sbnImprimir.Click;
    VK_ESCAPE: begin
                  dtmDefinirCobrador.ReFazConsultaContratos;
                  fraConsultaDadosClienteRenegociacao.BuscarDadosCliente(0,'');
                end;
  end;
end;

procedure TfrmDefinirCobrador.sbnProcuraClienteClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfCliente.SetFocus;
  InternoPesquisar('');
end;

function TfrmDefinirCobrador.TabelaDePesquisa: TZDataSet;
begin
  with dtmDefinirCobrador do begin
    case TipoProcura of
      cobCLIENTES : Result := ConsultaCliente;
      else          Result := Nil;
    end;
  end;
end;

procedure TfrmDefinirCobrador.dbgCobrancasKeyDown(Sender: TObject;
           var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    TeclaInserirRegistro : AcionaCadastroCobranca(False);
    TeclaEditarRegistro  : AcionaCadastroCobranca(True);
  end;
end;

procedure TfrmDefinirCobrador.dbgCobrancasDblClick(Sender: TObject);
begin
  inherited;
  AcionaCadastroCobranca(True);
end;

procedure TfrmDefinirCobrador.sbnIncluirCobrancaClick(Sender: TObject);
begin
  inherited;
  AcionaCadastroCobranca(False);
end;

procedure TfrmDefinirCobrador.sbnExcluirCobrancaClick(Sender: TObject);
begin
  inherited;
  dtmDefinirCobrador.ExcluirCobranca;
end;

procedure TfrmDefinirCobrador.sbnImprimirClick(Sender: TObject);
begin
  inherited;
  dtmDefinirCobrador.ImprimirFichaCobranca;
end;

procedure TfrmDefinirCobrador.AfterScrollLinhaColunaGrade(Sender: TObject);
begin
  dbgItensContrato.Columns[2].Title.Caption := dtmDefinirCobrador.LinhadaGrade;
  dbgItensContrato.Columns[3].Title.Caption := dtmDefinirCobrador.colunadaGrade;
end;

end.
