unit fmcadastroprodutosreserva;


interface

uses

  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmcadastropadrao, ExtCtrls, Buttons, StdCtrls, Mask, DBCtrls, DB, {Qete,}
  // Biblio
  ctconstantes, biblio,
  // Terceiros
  ZQuery,
  // Componentes
  cpdbfindcontrols,
  // Repositorio
  fmconsultabasica, fmconsultaporcampo, dmcadastroreservas, cpdbtext,
  ComCtrls, cpnumero, ToolWin;

type
  TfrmCadastroProdutosReservas = class(TfrmCadastroPadrao)
    gbxProdutosReserva: TGroupBox;
    lblProduto: TLabel;
    flkProduto: TtecDBFindLookup;
    sbnPesquisarProduto: TSpeedButton;
    lblFilial: TLabel;
    flkFilial: TtecDBFindLookup;
    sbnPesquisarFilial: TSpeedButton;
    lblQuantidade: TLabel;
    dtxFilial: TtecDBText;
    dtxProduto: TtecDBText;
    pnlFundoJanela: TPanel;
    edtQuantidade: TDBEditNumero;
    procedure sbnPesquisarProdutoClick(Sender: TObject);
    procedure sbnPesquisarFilialClick(Sender: TObject);
    procedure flkProdutoMessage(var Msg: String);
    procedure flkFilialMessage(var Msg: String);
    procedure edtQuantidadeExit(Sender: TObject);
   protected
    dtmCadastroProdutosReservas: TdtmCadastroReservas;
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoIncluir: Boolean; override;
    function  InternoPesquisar(Titulo:String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
  public
    destructor  Destroy; override;
    function ValidarCamposSelecao: Boolean;
    procedure SetDataModulo(Dtm: TdtmCadastroReservas);
  end;

var
  frmCadastroProdutosReservas: TfrmCadastroProdutosReservas;
  TipoPesquisa: TtecPesquisa;

implementation

{$R *.dfm}

destructor TfrmCadastroProdutosReservas.Destroy;
begin
  inherited;
  frmCadastroProdutosReservas:= nil;
end;

function TfrmCadastroProdutosReservas.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  with dtmCadastroReservas do
    case TipoPesquisa of
      pesPRODUTOS: Result:= ExisteProduto(NomeCampo, Value);
      pesFILIAIS : Result:= ExisteFilial(NomeCampo, Value);
      else         Result:= False;
    end;
end;

function TfrmCadastroProdutosReservas.InternoExcluir: Boolean;
begin
  Result:= Inherited InternoExcluir;
  if Result then
    Result:= dtmCadastroReservas.ExcluirProdutoReserva;
end;

function TfrmCadastroProdutosReservas.InternoGravar: Boolean;
begin
  Result:= Inherited InternoGravar;
  if Result then begin
    if ValidarCamposSelecao then
      Result:= dtmCadastroReservas.GravarProdutoReserva;
  end;
end;

function TfrmCadastroProdutosReservas.InternoIncluir: Boolean;
begin
  Result:= Inherited InternoIncluir;
  if Result then begin
    Result:= dtmCadastroReservas.IncluirProdutoReserva(False);
    flkProduto.SetFocus;
  end;  
end;

function TfrmCadastroProdutosReservas.InternoPesquisar(Titulo:String): Integer;
begin
  Result:= mrNone;
  if CtrlOn then begin
    if ActiveControl = flkProduto then begin
      TipoPesquisa:= pesPRODUTOS;
      Titulo:= 'Produtos';
    end
    else if ActiveControl = flkFilial then begin
      TipoPesquisa:= pesFILIAIS;
      Titulo:= 'Filiais';
    end;

    with dtmCadastroReservas do begin
      AbrirTabelaPesquisa(TipoPesquisa);
      Result:= inherited InternoPesquisar(Titulo);
      if Result = mrOK then
        Selecionar(TipoPesquisa);
      FecharTabelaPesquisa(TipoPesquisa);
    end
  end;
end;

function TfrmCadastroProdutosReservas.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result:= TfrmConsultaPorCampo.Create(nil);
  if TipoPesquisa = pesPRODUTOS then
       TfrmConsultaPorCampo(Result).ConsultaInterativa:= False
  else TfrmConsultaPorCampo(Result).ConsultaInterativa:= True;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela:= False;
end;

procedure TfrmCadastroProdutosReservas.sbnPesquisarProdutoClick(Sender: TObject);
begin
  CtrlOn:= True;
  ActiveControl:= flkProduto;
  InternoPesquisar('');
end;

procedure TfrmCadastroProdutosReservas.sbnPesquisarFilialClick(Sender: TObject);
begin
  CtrlOn:= True;
  ActiveControl:= flkFilial;
  InternoPesquisar('');
end;

procedure TfrmCadastroProdutosReservas.SetDataModulo(Dtm: TdtmCadastroReservas);
begin
  dtmCadastroProdutosReservas:= Dtm;
end;

function TfrmCadastroProdutosReservas.TabelaDePesquisa: TZDataSet;
begin
  with dtmCadastroReservas do
    case TipoPesquisa of             
      pesPRODUTOS: Result:= ConsultarProduto;
      pesFILIAIS : Result:= ConsultarFilial;
      else         Result:= nil;
    end;
end;

function TfrmCadastroProdutosReservas.ValidarCamposSelecao: Boolean;
begin
  Result := flkProduto.Exist and flkFilial.Exist and dtmCadastroReservas.ValidarQuantidade(edtQuantidade.ValorSemFormatacao)
end;

procedure TfrmCadastroProdutosReservas.flkProdutoMessage(var Msg: String);
begin
  inherited;
  Msg:= 'O produto ' + flkProduto.Text + ' não contém em estoque ou' + #10#13 +
        'já foi utilizado ou não está cadastrado.'
end;

procedure TfrmCadastroProdutosReservas.flkFilialMessage(var Msg: String);
begin
  inherited;
  Msg:= 'O produto ' + flkProduto.Text + ' não possui estoque na filial ' + flkFilial.Text +
        #10#13 + 'ou a filial não está cadastrada.'
end;

procedure TfrmCadastroProdutosReservas.edtQuantidadeExit(Sender: TObject);
begin
  inherited;
  if edtQuantidade.Text <> '' then
    if not dtmCadastroProdutosReservas.ValidarQuantidade(edtQuantidade.ValorSemFormatacao) then
      edtQuantidade.SetFocus;
end;

end.
