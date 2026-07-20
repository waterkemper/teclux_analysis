unit fmpresenteslistacasamento;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,  ComCtrls, Buttons, ExtCtrls, DBCtrls, Mask,
  ActnList, DB,
  // Terceiros
  ZQuery,
  // Constantes
   ctconstantes, biblio,
  // Repositorio
  fmconsultabasica, fmconsultaporcampo, fmcadastropadrao,  dmlistacasamento,
  cpnumero, cpdbfindcontrols, cpdbtext;

type
  TfrmPresentesListaCasamento = class(TfrmCadastroPadrao)
    pnlFundoJanela: TPanel;
    sbnProcurarProduto: TSpeedButton;
    dtxProduto: TtecDBText;
    lblProduto: TLabel;
    flkProduto: TtecDBFindLookup;
    lblMaximo: TLabel;
    edtDesejado: TDBEditNumero;
    edtComprado1: TDBEditNumero;
    edtComprado2: TDBEditNumero;
    lblComprado1: TLabel;
    lblComprado2: TLabel;
    aclValores: TActionList;
    actComprados: TAction;
    procedure edtComprado1Exit(Sender: TObject);
    procedure actCompradosUpdate(Sender: TObject);
    procedure sbnProcurarProdutoClick(Sender: TObject);
    procedure edtComprado2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDesejadoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure flkProdutoMessage(var Msg: String);
    procedure actCompradosExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FListaCasamento: TdtmListaCasamento;
  protected
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoIncluir: Boolean; override;
    function  InternoPesquisar(Titulo:String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
  public
    destructor  Destroy; override;
    procedure SetDataModulo(Dtm: TdtmListaCasamento);
    procedure AtualizarFind;
    function PesquisaHabilitada: Boolean;
    property ListaCasamento: TdtmListaCasamento read FListaCasamento;
  end;

var
  frmPresentesListaCasamento: TfrmPresentesListaCasamento;
  TipoPesquisa: TtecProcuraListaCasamento;

implementation

uses fmnavcontroles;

{$R *.dfm}

destructor TfrmPresentesListaCasamento.Destroy;
begin
  inherited;
  frmPresentesListaCasamento := nil;
end;

procedure TfrmPresentesListaCasamento.actCompradosUpdate(Sender: TObject);
const
  Cor: Array[Boolean] of TColor = (clBtnFace, clWindow);
var
  E: Boolean;
begin
  with ListaCasamento.TabelaPresentes do
    E := not((FieldByName('compradonoivo1').AsInteger = 0) and (FieldByName('compradonoivo2').AsInteger = 0));
  edtComprado1.Enabled := E;
  edtComprado2.Enabled := E;
  edtComprado1.Color := Cor[E];
  edtComprado2.Color := Cor[E];
end;

procedure TfrmPresentesListaCasamento.SetDataModulo(Dtm: TdtmListaCasamento);
begin
  FListaCasamento := Dtm;
end;

function TfrmPresentesListaCasamento.ExisteInformacao(Parametro: Integer;NomeCampo: String; Value: Variant): Boolean;
begin
  Result := dtmListaCasamento.ExistePresente(NomeCampo, Value);
end;

function TfrmPresentesListaCasamento.InternoExcluir: Boolean;
begin
  Result := inherited InternoExcluir;
  if Result then
    if not CtrlOn then
      Result := ListaCasamento.ExcluirPresenteLista;
end;

function TfrmPresentesListaCasamento.InternoGravar: Boolean;
var
  EditandoPresente: Boolean;
begin
  Result:= True;
  with ListaCasamento do
  begin
    if ActiveControl is TtecFindCustom then
      Result := TtecFindCustom(ActiveControl).Exist;
    if Result then
    begin
      EditandoPresente := TabelaPresentes.State = dsEdit;
      Result := GravarPresenteLista;
      if Result then
      begin
        if EditandoPresente then
          Close
        else
          InternoIncluir;
      end;
    end
    else
      Result := False;
  end;
end;

function TfrmPresentesListaCasamento.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then
    if not CtrlOn then
      Result:= ListaCasamento.IncluirPresenteLista(False);
end;

function TfrmPresentesListaCasamento.InternoPesquisar(Titulo: String): Integer;
begin
  if PesquisaHabilitada then
    with dtmListaCasamento do
    begin
      AbreTabelaPesquisa(TipoPesquisa);
      Result:= inherited InternoPesquisar(Titulo);
      if Result = mrOK then
      begin
        Selecionar(TipoPesquisa);
        AtualizarFind;
      end;
      FechaTabelaPesquisa(TipoPesquisa);
    end
  else
    Result:= 0;
end;

function TfrmPresentesListaCasamento.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
end;

function TfrmPresentesListaCasamento.TabelaDePesquisa: TZDataSet;
begin
  Result := ListaCasamento.ConsultarPresentes;
end;

function TfrmPresentesListaCasamento.PesquisaHabilitada: Boolean;
begin
  Result := (CtrlOn) and (ActiveControl = flkProduto);
  if Result then
     TipoPesquisa := tpPRESENTES;
end;

procedure TfrmPresentesListaCasamento.edtComprado1Exit(Sender: TObject);
begin
  if Trim(edtComprado1.Text) = '' then
    edtComprado1.Text := '0';
  if Trim(edtComprado2.Text) = '' then
    edtComprado2.Text := '0';
  if (StrToInt(edtComprado1.Text) + StrToInt(edtComprado1.Text))
   > (StrToInt(edtDesejado.Text)) then
  begin
    MensagemAviso(ctCOMPRASLISTACASAMENTO);
    ListaCasamento.TabelaPresentes.Cancel;
  end;
end;

procedure TfrmPresentesListaCasamento.AtualizarFind;
begin
  flkProduto.Text := IntToStr(ListaCasamento.CodigoPresente);
end;

procedure TfrmPresentesListaCasamento.sbnProcurarProdutoClick(Sender: TObject);
begin
  InternoPesquisar(flkProduto, 'Presentes');
end;

procedure TfrmPresentesListaCasamento.edtComprado2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if TeclaEnterOuReturn(Key) then
    InternoGravar;
end;

procedure TfrmPresentesListaCasamento.edtDesejadoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if not(edtComprado1.Enabled) and (TeclaEnterOuReturn(Key)) then
    InternoGravar;
end;

procedure TfrmPresentesListaCasamento.flkProdutoMessage(var Msg: String);
begin
  Msg := Format(ctREGISTROINCLUIDO,['Produto','na Lista']);
end;

procedure TfrmPresentesListaCasamento.actCompradosExecute(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmPresentesListaCasamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  aclValores.Free;
end;

end.
