unit fmcadastroequipamentos;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, Windows,
  StdCtrls, fmcadastropadrao, DBCtrls, cpdbtext, cpnumero, Grids,
  DBGrids, cpdbgrid, cpdbfindcontrols, cptexto, Mask, ComCtrls,
  Buttons, ExtCtrls, dmcadastroequipamentos, ctconstantes, biblio,
  fmconsultabasica, fmconsultaporcampo, ZQuery, clparametrossistema,
  ToolWin, frconsulta, frconsultacodigo, dmDicionarioDados, db{,
  Qt};

type
  TfrmCadastroEquipamentos = class(TfrmCadastroPadrao)
    pnlFundoJanela: TPanel;
    edfCodigo: TtecDbEditFind;
    edtDescricao: TDBEditTexto;
    edtReferencia: TDBEditTexto;
    edtModelo: TDBEditTexto;
    edtOpcionais: TDBEditTexto;
    flkMarca: TtecDBFindLookup;
    gbxProdutos: TGroupBox;
    dbgProdutosEquipamentos: TtecDBGrid;
    edtAno: TDBEditNumero;
    sbnConsultarMarca: TSpeedButton;
    dtxMarca: TtecDBText;
    sbnIncluirProduto: TSpeedButton;
    sbnExcluirProduto: TSpeedButton;
    sbnImprimir: TSpeedButton;
    lblLegenda: TLabel;
    gbxCodigo: TGroupBox;
    gbxDescricao: TGroupBox;
    gbxReferencia: TGroupBox;
    gbxAno: TGroupBox;
    gbxMarca: TGroupBox;
    gbxModelo: TGroupBox;
    gbxOpcionais: TGroupBox;
    fraConsultaQuestionario: TfraConsultaCodigo;
    gbxCheckList: TGroupBox;
    procedure sbnConsultarMarcaClick(Sender: TObject);
    procedure sbnIncluirProdutoClick(Sender: TObject);
    procedure sbnExcluirProdutoClick(Sender: TObject);
    procedure dbgProdutosEquipamentosDblClick(Sender: TObject);
    procedure dbgProdutosEquipamentosKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure sbnImprimirClick(Sender: TObject);
    procedure dbgProdutosEquipamentosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private

    fFecharaoGravar: boolean;
    FOntecClose: TtecProcedure;
    procedure AfterScrollLinhaColunaGrade(Sender: TObject);
    function AcionaCadastroProdutosEquipamentos(Editar: Boolean): Boolean;
    { Private declarations }
  protected
    dtmDicionarioDados: TdtmDicionarioDados;
    function  InternoIncluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoExcluir: Boolean; override;
    function  InternoPesquisar(Titulo:String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  TabelaDePesquisa: TZDataSet; override;
    procedure AlterarEstadoBotoes; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure BeforeOpen(DataSet: TDataSet);
    { Protected declarations }
  public
    dtmCadastroEquipamentos: TdtmCadastroEquipamentos;


    constructor Create(AOwner: TComponent);override;

    destructor  Destroy; override;

    procedure  SetDataModulo(Dtm: TdtmCadastroEquipamentos);
    property FecharaoGravar: boolean read fFecharaoGravar write fFecharaoGravar;
    property  OntecClose: TtecProcedure read FOntecClose write FOntecClose;
    { Public declarations }
  end;

var
  frmCadastroEquipamentos: TfrmCadastroEquipamentos;
  TipoPesquisa: TtecCadastroEquipamentos;
  OrigemEquipamento: String;

implementation

uses fmnavcontroles, fmcadastroprodutosequipamentos;

{$R *.dfm}

procedure TfrmCadastroEquipamentos.AfterScrollLinhaColunaGrade(
  Sender: TObject);
begin
  dbgProdutosEquipamentos.Columns[2].Title.Caption := dtmCadastroEquipamentos.LinhaGrade;
  dbgProdutosEquipamentos.Columns[3].Title.Caption := dtmCadastroEquipamentos.ColunaGrade;
end;

constructor TfrmCadastroEquipamentos.Create(AOwner: TComponent);
begin
  if not Assigned(dtmCadastroEquipamentos) then
    dtmCadastroEquipamentos := TdtmCadastroEquipamentos.Create(Self);

  if not assigned(dtmDicionarioDados) then
  begin
    dtmDicionarioDados := TdtmDicionarioDados.Create(self);
    dtmDicionarioDados.name := 'dtmDicionarioDadosEqpto';

  end;

  inherited;

  dtmCadastroEquipamentos.Abre(ctTabelas);
  DataSet := dtmCadastroEquipamentos.TabelaEquipamentos;
  if OrigemEquipamento = '' then
    SetDataModulo(dtmCadastroEquipamentos);

  TipoPesquisa := ceqNENHUMA;

  dtmCadastroEquipamentos.OnScrollLinhaColunaGrade := AfterScrollLinhaColunaGrade;

  dbgProdutosEquipamentos.Columns[2].Visible := ParSistema.UsarGradesProdutos;
  dbgProdutosEquipamentos.Columns[3].Visible := ParSistema.UsarGradesProdutos;
  if dbgProdutosEquipamentos.Columns[4].Width < parsistema.TamanhoMascaraQuantidade then
    dbgProdutosEquipamentos.Columns[4].Width := parsistema.TamanhoMascaraQuantidade;

  fraConsultaQuestionario.dtmDicionarioDados := dtmDicionarioDados;
  fraConsultaQuestionario.edfcodigo.lookupSource := dtmDicionarioDados.dsrQuestionarios;
  fraConsultaQuestionario.dtxDescricao.datasource := dtmDicionarioDados.dsrQuestionarios;

  fraConsultaQuestionario.TipoPesquisa := pesQuestionarios;
  dtmDicionarioDados.BeforeOpen := self.BeforeOpen;


end;

destructor TfrmCadastroEquipamentos.Destroy;
begin
  dtmCadastroEquipamentos := nil;
  inherited;
  frmCadastroEquipamentos := nil;
end;

function TfrmCadastroEquipamentos.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  case TipoPesquisa of
    ceqEQUIPAMENTO: Result:= dtmCadastroEquipamentos.ExisteEquipamento(NomeCampo, Value);
    ceqMARCA      : Result:= dtmCadastroEquipamentos.ExisteMarca(NomeCampo, Value);
    else            Result:= False;
  end;
end;

function TfrmCadastroEquipamentos.InternoExcluir: Boolean;
begin
  Result:= False;
  if MensagemConfirmacao(Format(ctCONFIRMEEXCLUIR, [ctEQUIPAMENTOS])) = smbOK then begin
    Result := inherited InternoExcluir;
    if Result then
      Result := dtmCadastroEquipamentos.ExcluirEquipamento;
  end
end;

function TfrmCadastroEquipamentos.InternoGravar: Boolean;
begin
  Result := dtmCadastroEquipamentos.GravarEquipamento;
  if FecharaoGravar then
  begin
    if Assigned(OntecClose) then
      OntecClose;

    close;
//    ModalResult := mrok;
  end;
end;

function TfrmCadastroEquipamentos.InternoIncluir: Boolean;
begin
  Result := False;
  if not CtrlOn then
    Result := dtmCadastroEquipamentos.IncluirEquipamento(False);
  edtDescricao.SetFocus;
end;

function TfrmCadastroEquipamentos.InternoPesquisar(
  Titulo: String): Integer;
begin
  Result:= mrNone;
  if CtrlOn then begin
    if (ActiveControl = flkMarca) then begin
      TipoPesquisa := ceqMARCA;
    end
    else
      TipoPesquisa:= ceqNENHUMA;
  end
  else begin
    TipoPesquisa := ceqEQUIPAMENTO;
    Titulo:= 'Equipamentos';
  end;

  if TipoPesquisa <> ceqNENHUMA then begin
    dtmCadastroEquipamentos.AbrirTabelas(TipoPesquisa);
    Result := inherited InternoPesquisar(Titulo);
    if Result = mrOK then
      dtmCadastroEquipamentos.Selecionar(TipoPesquisa);
    dtmCadastroEquipamentos.FecharTabelas(TipoPesquisa);
  end;
end;

function TfrmCadastroEquipamentos.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa    := True;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela:= False;
end;

procedure TfrmCadastroEquipamentos.sbnConsultarMarcaClick(Sender: TObject);
begin
  inherited;
  CtrlOn := True;
  flkMarca.SetFocus;
  InternoPesquisar(ctMARCAS);
end;

procedure TfrmCadastroEquipamentos.SetDataModulo(
  Dtm: TdtmCadastroEquipamentos);
begin
  dtmCadastroEquipamentos := Dtm;

  edfCodigo.dataSetLocked := true;
  edfCodigo.DataSource := dtmCadastroEquipamentos.dsrEquipamentos;
  edfCodigo.QueryParameter := 'codigo';
  edfCodigo.dataSetLocked := false;

  edtDescricao.DataSource := dtmCadastroEquipamentos.dsrEquipamentos;

  flkMarca.dataSetLocked := true;
  flkMarca.DataSource := dtmCadastroEquipamentos.dsrEquipamentos;
  flkMarca.LookupSource := dtmCadastroEquipamentos.dsrProcuraMarca;
  flkMarca.LookupQueryParameter := 'codigo';
  flkMarca.dataSetLocked := false;

  dtxMarca.DataSource := dtmCadastroEquipamentos.dsrProcuraMarca;

  edtModelo.DataSource := dtmCadastroEquipamentos.dsrEquipamentos;
  edtAno.DataSource := dtmCadastroEquipamentos.dsrEquipamentos;
  edtReferencia.DataSource := dtmCadastroEquipamentos.dsrEquipamentos;
  edtOpcionais.DataSource := dtmCadastroEquipamentos.dsrEquipamentos;
  dbgProdutosEquipamentos.DataSource := dtmCadastroEquipamentos.dsrProdutosEquipamentos;

  fraConsultaQuestionario.edfcodigo.dataSetLocked := true;
  fraConsultaQuestionario.edfcodigo.datasource := dtmCadastroEquipamentos.dsrEquipamentos;
  fraConsultaQuestionario.dtxDescricao.datasource := dtmDicionarioDados.dsrQuestionarios;
  fraConsultaQuestionario.edfcodigo.LookupSource := dtmDicionarioDados.dsrQuestionarios;
  fraConsultaQuestionario.edfcodigo.dataSetLocked := false;


end;

function TfrmCadastroEquipamentos.TabelaDePesquisa: TZDataSet;
begin
  case TipoPesquisa of
    ceqEQUIPAMENTO: Result:= dtmCadastroEquipamentos.TabelaConsultaEquipamentos;
    ceqMARCA      : Result:= dtmCadastroEquipamentos.TabelaConsultaMarcas;
    else            Result:= nil;
  end;
end;

procedure TfrmCadastroEquipamentos.sbnIncluirProdutoClick(Sender: TObject);
begin
  inherited;
  dbgProdutosEquipamentos.SetFocus;
  AcionaCadastroProdutosEquipamentos(False);
end;

function TfrmCadastroEquipamentos.AcionaCadastroProdutosEquipamentos(
  Editar: Boolean): Boolean;
begin
  if not Assigned (frmCadastroProdutosEquipamentos) then
      frmCadastroProdutosEquipamentos:= TfrmCadastroProdutosEquipamentos.Create(frmCadastroProdutosEquipamentos);

  with frmCadastroProdutosEquipamentos do
  begin
      SetDataModulo(dtmCadastroEquipamentos);
      DataSet:= dtmCadastroEquipamentos.qryProdutosEquipamentos;
      Result := dtmCadastroEquipamentos.IncluirProdutoEquipamento(Editar);
      ShowModal;
      frmCadastroProdutosEquipamentos.Free;
  end;
  SetFocus;
end;

procedure TfrmCadastroEquipamentos.sbnExcluirProdutoClick(Sender: TObject);
begin
  inherited;
  dtmCadastroEquipamentos.ExcluirProdutoEquipamento;
end;

procedure TfrmCadastroEquipamentos.dbgProdutosEquipamentosDblClick(
  Sender: TObject);
begin
  if sbnIncluirProduto.Enabled then
    AcionaCadastroProdutosEquipamentos(True);
end;

procedure TfrmCadastroEquipamentos.dbgProdutosEquipamentosKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Shift = [ssCtrl] then
    case Key of
      TeclaEditarRegistro : if sbnIncluirProduto.Enabled then
                              AcionaCadastroProdutosEquipamentos(True);
      TeclaInserirRegistro: if sbnExcluirProduto.Enabled then
                              AcionaCadastroProdutosEquipamentos(False);
      VK_SPACE           : begin
                              dtmCadastroEquipamentos.SelecionarRegistroImpressao;
                              setFocus;
                            end;
    end;
end;

procedure TfrmCadastroEquipamentos.sbnImprimirClick(Sender: TObject);
begin
  inherited;
  dtmCadastroEquipamentos.Imprimir;
end;

procedure TfrmCadastroEquipamentos.AlterarEstadoBotoes;
begin
  inherited;
  sbnImprimir.Enabled := not dtmCadastroEquipamentos.TabelaEquipamentos.IsEmpty and
                         not sbnSalvar.Enabled;
end;

procedure TfrmCadastroEquipamentos.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Shift = []) and (key = VK_F7) and sbnImprimir.Enabled then
    dtmCadastroEquipamentos.Imprimir;
end;

procedure TfrmCadastroEquipamentos.dbgProdutosEquipamentosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if not (gdFocused in State) then 
    if dbgProdutosEquipamentos.DataSource.DataSet.FieldByName('imprimir').AsBoolean then
    begin
      TDBGrid(Sender).Canvas.Brush.Color := clInfoBk;
      TDBGrid(Sender).Canvas.Font.Color := clBlack;
      TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
end;

procedure TfrmCadastroEquipamentos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  OrigemEquipamento := '';
  DesbloquearFormularios;

end;

procedure TfrmCadastroEquipamentos.BeforeOpen(DataSet: TDataSet);
begin
  if (DataSet.name = 'qryQuestionarios') or
     (DataSet.name = 'qryConsultaQuestionarios') then
    TZDataSet(DataSet).MacroByName('Condicao').asString := 'and q.tipo = ''CheckList''';

end;

end.
