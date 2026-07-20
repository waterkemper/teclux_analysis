unit fmcadastroreservas;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, DBCtrls, Mask, ExtCtrls, Buttons, {Qete,} DB,
  // Biblio
  ctconstantes, biblio,clparametrossistema, clusuario,
  // Componentes
  cpdbfindcontrols, cpdbgrid, cptexto, cpdata, cpdbtext,
  // Terceiros
  ZQuery,
  //Projeto
  dmcadastroreservas, fmcadastroprodutosreserva,
  // Repositorio
  fmconsultabasica, fmconsultaporcampo, fmcadastropadrao, dmtecsoft,
  ComCtrls, frtelefone, ZPgSqlQuery, cpquery, ToolWin;


type
  TfrmCadastroReservas = class(TfrmCadastroPadrao)
    gbxProdutos: TGroupBox;
    dbgMercadorias: TtecDBGrid;
    sbnIncluirProduto: TSpeedButton;
    sbnExcluirProduto: TSpeedButton;
    gbxCliente: TGroupBox;
    lblCliente: TLabel;
    edtCliente: TDBEditTexto;
    lblEndereco: TLabel;
    edtEndereco: TDBEditTexto;
    gbxReserva: TGroupBox;
    lblNumero: TLabel;
    lblReserva: TLabel;
    lblFilial: TLabel;
    lblVendedor: TLabel;
    edfNumero: TtecDbEditFind;
    dtxUsuario: TtecDBText;
    dtxFilial: TtecDBText;
    dtxVendedor: TtecDBText;
    dtxReserva: TtecDBText;
    lblCancelado: TLabel;
    dtxCancelado: TtecDBText;
    dtxValidade: TtecDBText;
    lblValidade: TLabel;
    pnlFundoJanela: TPanel;
    fraTelefone1: TfraTelefone;
    procedure sbnIncluirProdutoClick(Sender: TObject);
    procedure sbnExcluirProdutoClick(Sender: TObject);
    procedure dbgMercadoriasDblClick(Sender: TObject);
    procedure edfNumeroExit(Sender: TObject);
    procedure dbgMercadoriasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgMercadoriasDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
 private
    FEscolha: Byte;
    procedure AfterScrollLinhaColunaGrade(Sender: TObject);
 protected
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    procedure CriarDataModulo; override;
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoIncluir: Boolean; override;
    function  InternoPesquisar(Titulo:String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
    function  TabelaDoParametro(Parametro: Integer): TZDataSet; override;
    procedure AlterarEstadoBotoes(Valor: Boolean); overload; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    function AcionaCadastroProdutosReservas(Editar: Boolean): Boolean;
  end;

var
  frmCadastroReservas: TfrmCadastroReservas;

implementation

{$R *.dfm}


function TfrmCadastroReservas.AcionaCadastroProdutosReservas(Editar: Boolean): Boolean;
begin
  Result := False;
  if dtmCadastroReservas.TabelaReservas.State in [dsInsert] then
  begin
    if not Assigned (frmCadastroProdutosReservas) then
      frmCadastroProdutosReservas:= TfrmCadastroProdutosReservas.Create(frmCadastroProdutosReservas);
    with frmCadastroProdutosReservas do begin
      SetDataModulo(dtmCadastroReservas);
      DataSet:= dtmCadastroReservas.TabelaProdutosReservas;
      Result := dtmCadastroReservas.IncluirProdutoReserva(Editar);
      ShowModal;
      free;
      dtmCadastroReservas.CancelarProdutoReserva;
    end
  end
end;

procedure TfrmCadastroReservas.AfterScrollLinhaColunaGrade(
  Sender: TObject);
begin
  dbgMercadorias.Columns[2].Title.Caption := dtmCadastroReservas.LinhadaGrade;
  dbgMercadorias.Columns[3].Title.Caption := dtmCadastroReservas.colunadaGrade;
  sbnExcluirProduto.Enabled := not dtmCadastroReservas.ProdutoCancelado;
end;

procedure TfrmCadastroReservas.AlterarEstadoBotoes(Valor: Boolean);
begin
  inherited AlterarEstadoBotoes;
  sbnSalvar.Enabled:= Valor;
  sbnExcluir.Enabled:= (not dtmCadastroReservas.ReservaCancelada)
                       and (dtmCadastroReservas.CancelamentoPermitido);
  sbnIncluirProduto.Enabled:= Valor;
  sbnExcluirProduto.Enabled:= not dtmCadastroReservas.ProdutoCancelado; //valor
  dtmCadastroReservas.TabelaReservas.ReadOnly:= not Valor;
end;

constructor TfrmCadastroReservas.Create(AOwner: TComponent);
begin
  dtmCadastroReservas:= TdtmCadastroReservas.Create(Self);
  inherited;
  DataSet:= dtmCadastroReservas.TabelaReservas;
  FEscolha := 1;
  dtxCancelado.Font.Color := clRed;
  dbgMercadorias.Columns[2].Visible := ParSistema.UsarGradesProdutos;
  dbgMercadorias.Columns[3].Visible := ParSistema.UsarGradesProdutos;
  if dbgMercadorias.Columns[5].Width < parsistema.TamanhoMascaraQuantidade then
    dbgMercadorias.Columns[5].Width := parsistema.TamanhoMascaraQuantidade;
  if dbgMercadorias.Columns[6].Width < parsistema.TamanhoMascaraQuantidade then
    dbgMercadorias.Columns[6].Width := parsistema.TamanhoMascaraQuantidade;
end;

procedure TfrmCadastroReservas.CriarDataModulo;
begin
  inherited;
  dtmCadastroReservas.OnScrollLinhaColunaGrade := AfterScrollLinhaColunaGrade;
end;

procedure TfrmCadastroReservas.dbgMercadoriasDblClick(Sender: TObject);
begin
   AcionaCadastroProdutosReservas(True);
end;

procedure TfrmCadastroReservas.dbgMercadoriasKeyDown(Sender: TObject; var Key: Word; Shift: 
TShiftState);
begin
  if Shift = [ssCtrl] then
  begin
    case Key of
      TeclaEditarRegistro : AcionaCadastroProdutosReservas(True);
      TeclaInserirRegistro: AcionaCadastroProdutosReservas(False);
    end;
  end;
end;

destructor TfrmCadastroReservas.Destroy;
begin
  frmCadastroReservas := nil;
  inherited;
end;

procedure TfrmCadastroReservas.edfNumeroExit(Sender: TObject);
begin
  AlterarEstadoBotoes(dtmCadastroReservas.TabelaReservas.State in [dsInsert]);
end;

function TfrmCadastroReservas.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  Result := dtmCadastroReservas.ExisteReserva(NomeCampo, Value);
end;

function TfrmCadastroReservas.InternoExcluir: Boolean;
begin
  Result:= False;
  if not CtrlOn then
    with dtmCadastroReservas do
      if (TabelaReservas.State in [dsInsert, dsEdit] ) then
        TabelaReservas.Cancel
      else
      if (ConfirmaCancelamento) and (not ReservaCancelada) then begin
       inherited InternoExcluir;
       Result:= CancelarReserva;
      end;
end;

function TfrmCadastroReservas.InternoGravar: Boolean;
begin
  Result := dtmCadastroReservas.GravarReserva;
  if Result then
    ActiveControl := edfNumero;
end;

function TfrmCadastroReservas.InternoIncluir: Boolean;
begin
  if not CtrlOn then begin
     AlterarEstadoBotoes(True);
     inherited InternoIncluir;
     Result := dtmCadastroReservas.IncluirReserva;
     ActiveControl:= edtCliente;
  end
  else Result:= False;
end;

function TfrmCadastroReservas.InternoPesquisar(Titulo:String): Integer;
begin
  if not CtrlOn then
  with dtmCadastroReservas do
  begin
    Abre(ctPesquisaReservas);
    Result:= inherited InternoPesquisar('Reservas');
    if Result = mrOK then
    begin
      PosicionarReserva;
      AlterarEstadoBotoes(False);
    end;
    Fecha(ctPesquisaReservas);
  end
  else
    Result:= 0;
end;

function TfrmCadastroReservas.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela := False;
end;

procedure TfrmCadastroReservas.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
end;

procedure TfrmCadastroReservas.sbnExcluirProdutoClick(Sender: TObject);
begin
  dtmCadastroReservas.ExcluirProdutoReserva;
  AlterarEstadoBotoes;
end;

procedure TfrmCadastroReservas.sbnIncluirProdutoClick(Sender: TObject);
begin
  dbgMercadorias.SetFocus;
  AcionaCadastroProdutosReservas(False);
end;

function TfrmCadastroReservas.TabelaDePesquisa: TZDataSet;
begin
  Result:= dtmCadastroReservas.ConsultarReservas;
end;

function TfrmCadastroReservas.TabelaDoParametro(Parametro: Integer): TZDataSet;
begin
  Result:= nil;
end;

procedure TfrmCadastroReservas.dbgMercadoriasDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if not (gdFocused in State) then begin
    if dtmCadastroReservas.ProdutoCancelado then begin
      TDBGrid(Sender).Canvas.Brush.Color := clYellow;
      TDBGrid(Sender).Canvas.Font.Color := clBlack;
    end;
    TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

end.

