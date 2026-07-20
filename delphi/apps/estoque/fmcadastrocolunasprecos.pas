unit fmcadastrocolunasprecos;

interface

uses
  //CLX
  SysUtils, Qtypes, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, Buttons, DBCtrls, Windows, DB,
  //Terceiros
  ZQuery,
  //Componentes
  cpdata, cpdbdata, cptexto, cpnumero, cpdbfindcontrols,
  //Biblio
  ctconstantes, biblio,
  //Projeto
  dmcadastroprodutos,
  //Repositorio
  fmconsultabasica, fmconsultaporcampo, fmcadastropadrao, cpdbtext, ComCtrls,
  ToolWin, frconsulta, frconsultacodigo;

type
  TfrmCadastroColunasPrecos = class(TfrmCadastroPadrao)
    flkColuna: TtecDBFindLookup;
    sbnProcurarColuna: TSpeedButton;
    dtxColuna: TtecDBText;
    edtData: TDBEditData;
    edtValidade: TDBEditData;
    edtValor: TDBEditNumero;
    pnlFundoJanela: TPanel;
    dtxCaracteristica: TtecDBText;
    dtxAlteracao: TtecDBText;
    gbxProduto: TGroupBox;
    gbxColuna: TGroupBox;
    gbxData: TGroupBox;
    gbxValidade: TGroupBox;
    gbxValor: TGroupBox;
    gbxAlterado: TGroupBox;
    procedure sbnProcurarColunaClick(Sender: TObject);
    procedure flkColunaMessage(var Msg: String);
    procedure edtValorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    FProdutoAutomatico: Boolean;
  protected
    FAlterou: Boolean;
    {dtmCadastroProdutos: TdtmCadastroProdutos;}
    function InternoExcluir: Boolean; override;
    function InternoGravar: Boolean; override;
    function InternoIncluir: Boolean; override;
    function InternoPesquisar(Titulo: String): Integer; override;
    function JanelaPesquisa: TfrmConsultaBasica; override;
    function TabelaDePesquisa: TZDataSet; override;
    function TabelaDoParametro(Parametro: Integer): TZDataSet; override;
    function ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
  public
    TipoProcura: TipoProcuraProdutosEstoque;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function  PermitirProcura: Boolean;
//    procedure SetDataModulo(Dtm: TdtmCadastroProdutos);
    property  ProdutoAutomatico: Boolean read FProdutoAutomatico write FProdutoAutomatico;
  end;

var
  frmCadastroColunasPrecos: TfrmCadastroColunasPrecos;

implementation

uses fmnavcontroles;

{$R *.dfm}

constructor TfrmCadastroColunasPrecos.Create(AOwner: TComponent);
begin
  try
    inherited;
    FAlterou:= False;


  except
    on E: Exception do ShowMessage(E.Message);
  end;
end;

destructor TfrmCadastroColunasPrecos.Destroy;
begin
  try
    inherited;
    frmCadastroColunasPrecos := nil;
  except
    on E: Exception do ShowMessage(E.Message);
  end;
end;

function TfrmCadastroColunasPrecos.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  Result := dtmCadastroProdutos.ExisteColuna(NomeCampo, Value);
end;

function TfrmCadastroColunasPrecos.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then
    if not CtrlOn then
      Result:= dtmCadastroProdutos.ExcluirColunaPreco;
end;

function TfrmCadastroColunasPrecos.InternoGravar: Boolean;
begin
  Result:= inherited InternoGravar;
  if ActiveControl is TtecFindCustom and TtecFindCustom(ActiveControl).Modified then
    Result:= TtecFindCustom(ActiveControl).Exist;
  if Result then begin
    Result := dtmCadastroProdutos.GravarColunaPreco;
    FAlterou:= True;
    flkColuna.SetFocus;
  end;
end;

function TfrmCadastroColunasPrecos.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then
    if not CtrlOn then
      Result:= dtmCadastroProdutos.IncluirColunaPreco(False);
end;

function TfrmCadastroColunasPrecos.InternoPesquisar(Titulo: String): Integer;
begin
  Result := mrOK;
  with dtmCadastroProdutos do
    if PermitirProcura then
    begin
      AbreTabelasConsulta(TipoProcura);
      Result := inherited InternoPesquisar('Colunas');
      if Result = mrOK then
        Selecionar(tpCOLUNASCOLUNASPRECOS);
      FechaTabelasConsulta(TipoProcura);
    end;
end;

function TfrmCadastroColunasPrecos.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela := False;
end;

{
procedure TfrmCadastroColunasPrecos.SetDataModulo(Dtm: TdtmCadastroProdutos);
begin
  dtmCadastroProdutos := Dtm;
end;
}

function TfrmCadastroColunasPrecos.TabelaDePesquisa: TZDataSet;
begin
  Result := dtmCadastroProdutos.ConsultarColuna;
end;

function TfrmCadastroColunasPrecos.TabelaDoParametro(Parametro: Integer): TZDataSet;
begin
  Result := dtmCadastroProdutos.ConsultarColuna;
end;

procedure TfrmCadastroColunasPrecos.sbnProcurarColunaClick(Sender: TObject);
begin
  inherited;
  CtrlOn := True;
  flkColuna.SetFocus;
  InternoPesquisar('');
end;

function TfrmCadastroColunasPrecos.PermitirProcura: Boolean;
begin
  Result := False;
  if CtrlOn then
    if ActiveControl.ClassType = TtecDBFindLookup then
    begin
      if flkColuna.Focused then
        TipoProcura := tpColunasColunasPrecos;
      Result := True;
    end;
end;

procedure TfrmCadastroColunasPrecos.flkColunaMessage(var Msg: String);
begin
  inherited;
  Msg:= Format(ctREGISTROINCLUIDO, [flkColuna.Text,'na característica']);
end;

procedure TfrmCadastroColunasPrecos.edtValorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if FProdutoAutomatico and
    ((key = VK_RETURN)  or
     (key = VK_TAB)) then
  begin
    InternoGravar;
    ModalResult := mrOk;
  end;
end;

procedure TfrmCadastroColunasPrecos.FormShow(Sender: TObject);
begin
  inherited;
  ActiveControl.SetFocus;
end;


end.
