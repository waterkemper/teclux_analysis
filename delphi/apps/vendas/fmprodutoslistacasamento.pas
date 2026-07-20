unit fmprodutoslistacasamento;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, Windows,
  StdCtrls,  ComCtrls, Buttons, ExtCtrls, DBCtrls, Mask,
  ActnList, DB, {Qete,}
  // Terceiros
  ZQuery,
  // Constantes
   ctconstantes, biblio,
  // Repositorio
  fmconsultabasica, fmconsultaporcampo, fmcadastropadrao,  dmlistacasamento,
  cpnumero, cpdbfindcontrols, cpdbtext, clparametrossistema, ToolWin;

type
  TfrmProdutosListaCasamento = class(TfrmCadastroPadrao)
    pnlFundoJanela: TPanel;
    gbxProdutosListaCasamento: TGroupBox;
    gbxQuantidade: TGroupBox;
    edtDesejado: TDBEditNumero;
    gbxProdutos: TGroupBox;
    flkProduto: TtecDBFindLookup;
    sbnProcurarProduto: TSpeedButton;
    dtxProduto: TtecDBText;
    gbxPreco: TGroupBox;
    dtxPreco: TtecDBText;
    ckbDisponivelSite: TDBCheckBox;
    GroupBox1: TGroupBox;
    dtxFotos: TtecDBText;
    GroupBox2: TGroupBox;
    DBEditNumero1: TDBEditNumero;
    GroupBox3: TGroupBox;
    DBEditNumero2: TDBEditNumero;
    procedure sbnProcurarProdutoClick(Sender: TObject);
    procedure flkProdutoMessage(var Msg: String);
    procedure edtDesejadoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure flkProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  protected
    dtmListaCasamento: TdtmListaCasamento;
    function InternoIncluir: Boolean; override;
    function InternoExcluir: Boolean; override;
    function InternoGravar: Boolean; override;
    function InternoPesquisar(Titulo:String): Integer; override;
    function JanelaPesquisa: TfrmConsultaBasica; override;
    function TabelaDePesquisa: TZDataSet; override;
    function ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure AlterarEstadoBotoes; override;


  public
    destructor Destroy; override;
    procedure SetDataModulo(Dtm: TdtmListaCasamento);
  end;

var
  frmProdutosListaCasamento: TfrmProdutosListaCasamento;
  TipoPesquisa: TtecListaCasamento;

implementation

uses fmnavcontroles;

{$R *.dfm}

destructor TfrmProdutosListaCasamento.Destroy;
begin
  inherited;
  frmProdutosListaCasamento := nil;
end;

procedure TfrmProdutosListaCasamento.SetDataModulo(Dtm: TdtmListaCasamento);
begin
  dtmListaCasamento := Dtm;
end;

function TfrmProdutosListaCasamento.ExisteInformacao(Parametro: Integer;NomeCampo: String; Value: Variant): Boolean;
begin
  Result := dtmListaCasamento.ExisteProduto(NomeCampo, Value);
end;

function TfrmProdutosListaCasamento.InternoExcluir: Boolean;
begin
  Result := inherited InternoExcluir;
  if Result then
    if not CtrlOn then
      Result := dtmListaCasamento.ExcluirProdutosLista;
end;

function TfrmProdutosListaCasamento.InternoGravar: Boolean;
begin
  Result:= inherited InternoGravar;
  if edtDesejado.Text <> '' then begin
    if StrTofloat(edtDesejado.ValorSemFormatacao) = 0 then begin
      MensagemAviso('Zero não é uma quantidade válida.');
      edtDesejado.SetFocus;
      Result:= False;
    end;
  end;
  if Result then
    with dtmListaCasamento do begin
      if Result then
        Result := GravarProdutosLista;
    end;
end;

function TfrmProdutosListaCasamento.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then
    if not CtrlOn then
    begin
      Result:= dtmListaCasamento.IncluirProdutosLista(False);
      edtDesejado.SetFocus;
    end;
end;

function TfrmProdutosListaCasamento.InternoPesquisar(Titulo: String): Integer;
begin
  Result:= mrNone;
  if CtrlOn and (ActiveControl = flkProduto) then begin
    with dtmListaCasamento do begin
      AbreTabelaPesquisa(tlcPRODUTOS);
      Result:= inherited InternoPesquisar('Produtos');
      if Result = mrOK then
        Selecionar(tlcPRODUTOS);
      FechaTabelaPesquisa(tlcPRODUTOS);
    end
  end;
end;

function TfrmProdutosListaCasamento.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa    := False;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela:= False;
end;

function TfrmProdutosListaCasamento.TabelaDePesquisa: TZDataSet;
begin
  Result := dtmListaCasamento.ConsultarProdutos;
end;

procedure TfrmProdutosListaCasamento.sbnProcurarProdutoClick(Sender: TObject);
begin
  CtrlOn:= True;
  flkProduto.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmProdutosListaCasamento.flkProdutoMessage(var Msg: String);
begin
  Msg := Format(ctREGISTROINCLUIDO,['Produto','na Lista']);
end;

procedure TfrmProdutosListaCasamento.edtDesejadoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  case key of
    VK_Return :
//      if (dtmListaCasamento.qryProdutosListaCasamento.State = dsinsert) then
         flkProduto.ConfirmarQuantidade := true;
  end;
end;

procedure TfrmProdutosListaCasamento.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_Return: if Shift = [] then
               begin
                 if ((ActiveControl = flkProduto) and
                     (ParSistema.GravarProdutoContratoAutomaticamente)) then
                 begin
                   inherited;
                   if flkProduto.Text <> '' then
                     if sbnSalvar.Enabled then
                       if InternoGravar then
                       begin
                         flkProduto.Clear;
                         flkProduto.setfocus;
                         flkProduto.selectall;
                       end;
                 end
                 else inherited;
               end;
    else inherited;
  end
end;

procedure TfrmProdutosListaCasamento.flkProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not ParSistema.GravarProdutoContratoAutomaticamente then
    if TeclaEnterOuReturn(Key) and (Shift = []) then
       if sbnSalvar.Enabled then
         if InternoGravar then
         begin
           flkProduto.Clear;
           flkProduto.setfocus;
           flkProduto.selectall;
         end;
end;

procedure TfrmProdutosListaCasamento.AlterarEstadoBotoes;
begin
  inherited;
  if flkProduto.confirmarquantidade then
    if dataset.State = dsbrowse then
      flkProduto.confirmarquantidade := false;

end;

end.
