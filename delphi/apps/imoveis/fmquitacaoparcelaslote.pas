unit fmquitacaoparcelaslote;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, Variants,
  StdCtrls, fmajudabt, cpnumero, Grids, DBGrids, cpdbgrid, ComCtrls,
  Buttons, ExtCtrls, DB, cpdatasource, dmcontratosimoveis, ZQuery,
  ZPgSqlQuery, cpquery, fmrecebimentos, biblio, ToolWin;

type
  TfrmQuitacaoParcelasLote = class(TFrmAjudaBt)
    pnlSelecao: TPanel;
    pnlDados: TPanel;
    dbgParcelas: TtecDBGrid;
    pnlinformacoes: TPanel;
    gbxValorContratado: TGroupBox;
    edtValorContratado: TEditNumero;
    gbxJurosContratuais: TGroupBox;
    edtJurosContratuais: TEditNumero;
    gbxCorrecao: TGroupBox;
    edtCorrecao: TEditNumero;
    gbxValorDevido: TGroupBox;
    edtValorDevido: TEditNumero;
    ckbSelecionartodas: TCheckBox;
    sbnGerarParcelas: TSpeedButton;
    dsrParcelas: TtecDataSource;
    procedure dbgParcelasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgParcelasDblClick(Sender: TObject);
    procedure ckbSelecionartodasClick(Sender: TObject);
    procedure sbnGerarParcelasClick(Sender: TObject);
  private
    { Private declarations }
    Recebimentos: TRecebimentos;
  protected
    procedure InicializarCampos;
    procedure AtribuirValores;
    procedure PosicionarPrimeiraaPagar;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
  end;

var
  frmQuitacaoParcelasLote: TfrmQuitacaoParcelasLote;

implementation

{$R *.dfm}

{ TfrmQuitacaoParcelasLote }

procedure TfrmQuitacaoParcelasLote.AtribuirValores;
begin
  edtValorContratado.Text  := FloatToStr(Recebimentos.ValorContratado);
  edtJurosContratuais.Text := FloatToStr(Recebimentos.JurosContratuais);
  edtCorrecao.Text         := FloatToStr(Recebimentos.Correcao);
  edtValorDevido.Text      := FloatToStr(Recebimentos.ValorDevido);
end;

constructor TfrmQuitacaoParcelasLote.Create(AOwner: TComponent);
begin
  inherited;
  InicializarCampos;
end;

destructor TfrmQuitacaoParcelasLote.Destroy;
begin
  FreeAndNil(RecebimentosInt);
  inherited;
  frmQuitacaoParcelasLote:= nil;
end;

procedure TfrmQuitacaoParcelasLote.InicializarCampos;
begin
  VarRecebimentos := TRecebimentos.Create(True);
  Recebimentos         := VarRecebimentos;
  dsrParcelas.DataSet  := Recebimentos.qryParcelas;
  AtribuirValores;
end;

procedure TfrmQuitacaoParcelasLote.dbgParcelasDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if TDBGrid(Sender).DataSource.DataSet.FieldByName('selecionado').AsBoolean then
  begin
    TDBGrid(Sender).Canvas.Brush.Color := clInfoBk;
    TDBGrid(Sender).Canvas.Font.Color  := clBlack;
  end;
  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmQuitacaoParcelasLote.dbgParcelasDblClick(Sender: TObject);
begin
  inherited;
  Recebimentos.MarcarSelecionados(ckbSelecionartodas.Checked, False);
  Recebimentos.ValorParcelasSelecionadas;
  AtribuirValores;
end;

procedure TfrmQuitacaoParcelasLote.ckbSelecionartodasClick(Sender: TObject);
begin
  inherited;
  Recebimentos.MarcarSelecionados(ckbSelecionartodas.Checked, True);
  Recebimentos.ValorParcelasSelecionadas;
  AtribuirValores;
end;

procedure TfrmQuitacaoParcelasLote.sbnGerarParcelasClick(Sender: TObject);
begin
  inherited;
  dtmContratosImoveis.QuitarDiversas:= True;
  Recebimentos.DescricaoParcelasPagas;
  PosicionarPrimeiraaPagar;
  frmrecebimentos := Tfrmrecebimentos.Create(frmrecebimentos);
  //frmQuitacaoParcelasLote.Close;
  try
    frmrecebimentos.ShowModal;
  finally
    frmrecebimentos.Free;
  end;
end;

procedure TfrmQuitacaoParcelasLote.PosicionarPrimeiraaPagar;
begin
  with Recebimentos do
  begin
    qryParcelas.First;
    while not qryParcelas.Eof do
    begin
      if qryParcelas.FieldByName('selecionado').AsBoolean then
      begin
        if PosicionarParcelasContratoaPagar then
          break;
      end;
      qryParcelas.Next;
    end;
  end;
end;

end.
