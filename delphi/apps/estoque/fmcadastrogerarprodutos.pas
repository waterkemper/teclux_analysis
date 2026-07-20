unit fmcadastrogerarprodutos;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmnavcontroles, StdCtrls, Buttons, DBCtrls, cpdbtext,
  cpdbfindcontrols, Mask, cptexto, biblio,
  //Terceiros
  ZQuery,
  //Biblio
  ctconstantes,
  //Projeto
  dmcadastroprodutos,
  //Repositorio
  fmconsultabasica, fmconsultaporcampo, fmcadastropadrao,
  cpeditioncontrolvalidation;


type
  TfrmCadastroGerarProdutos = class(TfrmNavControles)
    bbnOK: TBitBtn;
    bbnCancelar: TBitBtn;
    gbxInformacoes: TGroupBox;
    sbnProcurarPreco: TSpeedButton;
    lblDescricao: TLabel;
    lblPreco: TLabel;
    dtxPreco: TtecDBText;
    edtDescricao: TEditTexto;
    edfPreco: TtecDbEditFind;
    ecvValida: TtecEditionControlValidation;
    procedure bbnOKClick(Sender: TObject);
    procedure bbnCancelarClick(Sender: TObject);
    procedure sbnProcurarPrecoClick(Sender: TObject);

  private
    { Private declarations }
  protected
    {dtmCadastroProdutos: TdtmCadastroProdutos;}
    function InternoPesquisar(Titulo: String): Integer; override;
    function JanelaPesquisa: TfrmConsultaBasica; override;
    function TabelaDePesquisa: TZDataSet; override;
    function ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
  public
    { Public declarations }
    TipoPesquisa: TipoProcuraProdutosEstoque;
    destructor Destroy; override;

    function PesquisaHabilitada: Boolean;
    procedure SetDataModulo(Dtm: TdtmCadastroProdutos);
    function GetTitulo: String;

  end;

var
  frmCadastroGerarProdutos: TfrmCadastroGerarProdutos;
  ControleValido          : TWinControl;

implementation

{$R *.dfm}

destructor TfrmCadastroGerarProdutos.Destroy;
begin
  inherited;
  frmCadastroGerarProdutos := nil;
end;


procedure TfrmCadastroGerarProdutos.bbnOKClick(Sender: TObject);
begin
  inherited;
    ModalResult := mrNone;
    if ecvValida.Verify(gbxInformacoes, ControleValido) then
    begin
      if edfPreco.Exist then
      begin
       dtmCadastroProdutos.DescricaoCaracteristicaGerar := edtDescricao.Text;
       dtmCadastroProdutos.CodigoPrecoGerar := edfPreco.Text;
       ModalResult := mrOk;
      end;
    end;
end;

procedure TfrmCadastroGerarProdutos.bbnCancelarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TfrmCadastroGerarProdutos.sbnProcurarPrecoClick(Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfPreco, ctPRECO)
end;

function TfrmCadastroGerarProdutos.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  with dtmCadastroProdutos do
     case TipoPesquisa of
        tpConsultaPrecosProdutos : Result := ExistePreco(NomeCampo, Value);
      else
        Result := False;
    end;
end;

function TfrmCadastroGerarProdutos.InternoPesquisar(
  Titulo: String): Integer;
begin
 if PesquisaHabilitada then
  begin
   with dtmCadastroProdutos do
   begin
    AbreTabelasConsulta(TipoPesquisa);
    Result := inherited InternoPesquisar(GetTitulo);
    if Result = mrOK then
      Selecionar(TipoPesquisa);
    FechaTabelasConsulta(TipoPesquisa);
   end;
  end
  else
   Result := mrNone
end;

function TfrmCadastroGerarProdutos.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := true;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela := False;
end;

function TfrmCadastroGerarProdutos.TabelaDePesquisa: TZDataSet;
begin
  case TipoPesquisa of
   tpConsultaPrecosProdutos :  Result := dtmCadastroProdutos.ConsultarPreco;
  else
        Result := nil;
  end;
end;

function TfrmCadastroGerarProdutos.PesquisaHabilitada: Boolean;
begin
  Result := False;
  if CtrlOn then
  begin
    if ActiveControl.ClassType = TtecDbEditFind then
    begin
      if edfPreco.Focused then
        TipoPesquisa := tpConsultaPrecosProdutos;
      Result := True;
    end;
  end;
end;

function TfrmCadastroGerarProdutos.GetTitulo: String;
begin
  case TipoPesquisa of
      tpConsultaPrecosProdutos  : Result := 'Preços';
         else           Result := '';
  end;

end;


procedure TfrmCadastroGerarProdutos.SetDataModulo(
  Dtm: TdtmCadastroProdutos);
begin
  dtmCadastroProdutos := Dtm;
end;

end.
