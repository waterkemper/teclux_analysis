unit fmcadastroestoque;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  DBCtrls, Mask, ComCtrls, ExtCtrls, Buttons, Windows, DB,
  // Biblio
  biblio, ctconstantes,
  // Componentes
  cpdata, cpnumero, cptexto, cpdbfindcontrols, cpdbdata, cpdbtext,
  // Terceiros
  ZQuery,
  // Repositorio
  fmconsultabasica, fmconsultaporcampo, fmcadastropadrao,
  // Projeto
  dmcadastroprodutos, ToolWin;

type

  TfrmCadastroEstoque = class(TfrmCadastroPadrao)
    sbnProcuraFilial: TSpeedButton;
    dtxProduto: TtecDBText;
    dtxFilial: TtecDBText;
    pnlFundoJanela: TPanel;
    dtxCodigoProduto: TtecDBText;
    flkFilial: TtecDBFindLookup;
    edtLocalizacao: TDBEditTexto;
    edtMaximo: TDBEditNumero;
    edtMinimo: TDBEditNumero;
    gbxItemProduto: TGroupBox;
    gbxFilial: TGroupBox;
    gbxLocalizacao: TGroupBox;
    gbxMinimo: TGroupBox;
    gbxMaximo: TGroupBox;
    gbxSubLocalizacao: TGroupBox;
    edtSubLocalizacao: TDBEditTexto;
    procedure sbnProcuraFilialClick(Sender: TObject);
    procedure flkFilialMessage(var Msg: String);
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
    destructor  Destroy; override;
  end;

var
  frmCadastroEstoque: TfrmCadastroEstoque;
implementation

{$R *.dfm}

destructor TfrmCadastroEstoque.Destroy;
begin
  inherited;
  frmCadastroEstoque := nil;
end;

function TfrmCadastroEstoque.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  Result := dtmCadastroProdutos.ExisteFilial(NomeCampo, Value);
end;

function TfrmCadastroEstoque.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then begin
    if not CtrlOn then
      Result := dtmCadastroProdutos.ExcluirEstoque;
  end;
end;

function TfrmCadastroEstoque.InternoGravar: Boolean;
begin
  Result := True;
  if ActiveControl is TtecFindCustom then
    Result:= TtecFindCustom(ActiveControl).Exist;
  if Result then begin
    Result := dtmCadastroProdutos.GravarEstoque;
    flkFilial.SetFocus;
  end;
end;

function TfrmCadastroEstoque.InternoPesquisar(Titulo:String): Integer;
begin
  Result := mrNone;
  with dtmCadastroProdutos do begin
    if PesquisaHabilitada then begin
      AbreTabelasConsulta(TipoPesquisa);
      Result := inherited InternoPesquisar('Filiais');
      if Result = mrOK then
        Selecionar(TipoPesquisa);
      FechaTabelasConsulta(TipoPesquisa);
    end;
  end;
end;

function TfrmCadastroEstoque.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela := False;
end;

function TfrmCadastroEstoque.PesquisaHabilitada: Boolean;
begin
  Result := False;
  if CtrlOn then begin
    if flkFilial.Focused then begin
       TipoPesquisa:= tpESTOQUES;
       Result:= True;
    end
  end
end;

procedure TfrmCadastroEstoque.sbnProcuraFilialClick(Sender: TObject);
begin
  CtrlOn:= True;
  flkFilial.SetFocus;
  InternoPesquisar('');
end;

function TfrmCadastroEstoque.TabelaDePesquisa: TZDataSet;
begin
  Result := dtmCadastroProdutos.ConsultarFilial;
end;

{
procedure TfrmCadastroEstoque.SetDataModulo(Dtm: TdtmCadastroProdutos);
begin
  dtmCadastroProdutos := Dtm;
end;
}

function TfrmCadastroEstoque.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then begin
    if not CtrlOn then
      Result := dtmCadastroProdutos.IncluirEstoque(False);
  end;
end;

procedure TfrmCadastroEstoque.flkFilialMessage(var Msg: String);
begin
  inherited;
  Msg:= Format(ctREGISTROINCLUIDO, [flkFilial.Text,'no estoque']);
end;

end.
