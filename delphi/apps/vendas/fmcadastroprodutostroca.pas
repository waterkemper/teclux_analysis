unit fmcadastroprodutostroca;

interface

uses
  //CLX
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, DBCtrls, Mask, ComCtrls, {Qete,}
  //Biblio
  ctconstantes,
  //Componentes
  cpdbtext, cpnumero, cpdbfindcontrols, cpdbradiogroup,
  //Terceiros
  ZQuery,
  //Repositorio
  fmcadastropadrao, fmconsultabasica, cptexto, ActnList, Grids, DBGrids,
  cpdbgrid,
    //Projeto
  dmtrocamercadorias, cpdbmemo, ToolWin;

type
  TfrmCadastroProdutosTroca = class(TfrmCadastroPadrao)
    lblCodigoProduto: TLabel;
    lblQuantidade: TLabel;
    lblPrecoAvaliado: TLabel;
    flkCodigoProduto: TtecDBFindLookup;
    edtQuantidade: TDBEditNumero;
    dtxUnidade: TtecDBText;
    dtxDescricaoProduto: TtecDBText;
    edtPrecoAvaliado: TDBEditNumero;
    sbnConsultaProduto: TSpeedButton;
    pnlFundoJanela: TPanel;
    gbxFundoJanela: TGroupBox;
    lblPrecoTabela: TLabel;
    edtPrecoTabela: TDBEditNumero;
    lblPrecoVendido: TLabel;
    edtPrecoVendido: TDBEditNumero;
    lblDescontoUnitario: TLabel;
    DBEditNumero1: TDBEditNumero;
    lblFilialSaida: TLabel;
    flkFilial: TtecDBFindLookup;
    sbnConsultaFilial: TSpeedButton;
    dtxNomeFilial: TtecDBText;
    procedure flkCodigoProdutoEnter(Sender: TObject);
    procedure sbnConsultaProdutoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure flkCodigoProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure flkFilialEnter(Sender: TObject);
    procedure sbnConsultaFilialClick(Sender: TObject);
  private
  protected
    TipoConsulta: TtecConsultaProdutosContratos;
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoIncluir: Boolean; override;
    function  InternoPesquisar(Titulo:String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    procedure BloquearCampos;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
  end;

var
  frmCadastroProdutosTroca: TfrmCadastroProdutosTroca;

implementation

uses
  //Biblio
  biblio, clusuario, clparametrossistema,
  //Repositorio
  fmconsultaporcampo;

{$R *.dfm}

{ TfrmCadastroProdutosContrato }

constructor TfrmCadastroProdutosTroca.Create(AOwner: TComponent);
begin
  inherited;
  DataSet := dtmTrocaMercadorias.TabelaProdutosaTrocar;
  {
  if parsistema.PesquisaPadraoProdutoCodigoBarras then
    flkCodigoProduto.LookupQueryParameter := 'codigobarras'
  else
    flkCodigoProduto.LookupQueryParameter := 'codigo';

  lblCodigoProduto.Caption := flkCodigoProduto.FParameterLabel;
  }

  dtmTrocaMercadorias.Operacao := 'E';
  dtmTrocaMercadorias.DefinirParametrosFiliais;

  if Parsistema.NaoPermitirAlterarPrecoAvaliadoTroca then
  begin
    edtPrecoAvaliado.ReadOnly := true;
    edtPrecoAvaliado.TabStop  := false;
    edtPrecoAvaliado.Color    := clBtnFace;
  end
  else
  begin
    edtPrecoAvaliado.ReadOnly := false;
    edtPrecoAvaliado.TabStop  := true;
    edtPrecoAvaliado.Color    := clWindow;
  end;

end;

destructor TfrmCadastroProdutosTroca.Destroy;
begin
  inherited;
  frmCadastroProdutostroca := nil;
end;

function TfrmCadastroProdutosTroca.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  if TipoConsulta = cpcPRODUTOSTROCA then
    Result := dtmTrocaMercadorias.ExisteProduto(NomeCampo, Value)
  else if TipoConsulta = cpcFILIAISTROCA then
    Result := dtmTrocaMercadorias.ExisteFilialProduto(NomeCampo, Value)
  else
    Result := False
end;

procedure TfrmCadastroProdutosTroca.flkCodigoProdutoEnter(Sender: TObject);
begin
  inherited;
  TipoConsulta := cpcPRODUTOSTROCA;
end;

function TfrmCadastroProdutosTroca.InternoExcluir: Boolean;
begin
  Result := dtmTrocaMercadorias.ExcluirProdutoaTrocar;
  BloquearCampos;
end;

function TfrmCadastroProdutosTroca.InternoGravar: Boolean;
var
  Qtdade: Real;
  Editando: Boolean;
begin
  editando := dtmTrocaMercadorias.EditandoProdutosaTrocar;
  try
    Qtdade := StrToFloat(edtQuantidade.Text);
  except
    Qtdade := 0;
  end;

  Result := False;
  if Qtdade > 0 then
  begin
      Result := dtmTrocaMercadorias.GravarProdutoaTrocar;
      if Result and not Editando then begin
        if ParSistema.AbrirConsultaAutomaticamente then begin
          InternoIncluir;
          CtrlOn:= True;
          TipoConsulta:= cpcPRODUTOSTROCA;
          InternoPesquisar('Produtos');
        end;
      end;
  end
  else begin
    MensagemAviso(ctQUANTIDADEPRODUTOSMAIORZERO);
    edtQuantidade.SetFocus;
  end

end;

function TfrmCadastroProdutosTroca.InternoIncluir: Boolean;
begin
  Result := dtmTrocaMercadorias.IncluirProdutosaTrocar;
  flkCodigoProduto.SetFocus;
  BloquearCampos;
end;

function TfrmCadastroProdutosTroca.InternoPesquisar(Titulo: String): Integer;
var
  Tabela: Integer ;
begin
  Tabela := 0;
  if CtrlOn and not flkCodigoProduto.ReadOnly then
  begin
    if TipoConsulta = cpcPRODUTOSTROCA then begin
      Titulo := ctPRODUTO;
      dtmTrocaMercadorias.AbreConsultaProdutos(false, TipoConsulta);
      Tabela := ctVendaTabelaConsultaProdutos;
    end
    else
    if TipoConsulta = cpcFILIAISTROCA then
    begin
      Titulo := ctFILIAL;
      Tabela := ctVendaTabelaConsultaFilialProduto;
    end;

    try
      Result := inherited InternoPesquisar(Titulo);

      if Result = mrOK then begin
        if TipoConsulta = cpcPRODUTOSTROCA then
        begin
//          lblCodigoProduto.Caption := flkCodigoProduto.FParameterLabel;
          dtmTrocaMercadorias.SelecionarProdutoaTrocar;
          dtmTrocaMercadorias.Fecha(Tabela);
        end
        else if TipoConsulta = cpcFILIAISTROCA then
          dtmTrocaMercadorias.SelecionarFilialTroca
      end;
    finally
      dtmTrocaMercadorias.Fecha(Tabela);
    end
  end else
    Result := mrNONE
end;

function TfrmCadastroProdutosTroca.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := ParSistema.UsarConsultaInterativa;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela := False;
end;

procedure TfrmCadastroProdutosTroca.sbnConsultaProdutoClick(Sender: TObject);
begin
  inherited;
  TipoConsulta := cpcPRODUTOSTROCA;
  InternoPesquisar(flkCodigoProduto, ctPRODUTO)
end;

function TfrmCadastroProdutosTroca.TabelaDePesquisa: TZDataSet;
begin
  if TipoConsulta = cpcPRODUTOSTROCA then
    Result := dtmTrocaMercadorias.TabelaConsultaProdutos
  else if TipoConsulta = cpcFILIAIStROCA then
    Result := dtmTrocaMercadorias.TabelaConsultaFilialProduto
  else
    Result := nil
end;

procedure TfrmCadastroProdutosTroca.FormShow(Sender: TObject);
begin
  inherited;
  BloquearCampos;
  if (dtmTrocaMercadorias.IncluindoProdutosaTrocar) and
      ParSistema.AbrirConsultaAutomaticamente then
    sbnConsultaProdutoClick(self);
end;


procedure TfrmCadastroProdutosTroca.BloquearCampos;
begin
  flkCodigoProduto.ReadOnly := (dtmTrocaMercadorias.ProdutosTrocadoscontrato<>'');
  sbnConsultaProduto.Enabled := not flkCodigoProduto.ReadOnly;
  edtQuantidade.ReadOnly := flkCodigoProduto.ReadOnly;
  if flkCodigoProduto.ReadOnly then
  begin
    if edtPrecoAvaliado.ReadOnly then
      flkCodigoProduto.SetFocus
    else
      edtPrecoAvaliado.SetFocus;
  end
  else
   flkCodigoProduto.SetFocus;
end;

procedure TfrmCadastroProdutosTroca.flkCodigoProdutoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
//  lblCodigoProduto.Caption := flkCodigoProduto.FParameterLabel;
end;

procedure TfrmCadastroProdutosTroca.flkFilialEnter(Sender: TObject);
begin
  inherited;
  TipoConsulta := cpcFILIAISTROCA;
end;

procedure TfrmCadastroProdutosTroca.sbnConsultaFilialClick(
  Sender: TObject);
begin
  inherited;
  TipoConsulta := cpcFILIAISTROCA;
  InternoPesquisar(flkFilial, ctFILIAL)

end;

end.
