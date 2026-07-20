unit fmcadastropedidossaidas;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, Windows,
  StdCtrls, fmcadastropadrao, ComCtrls, Buttons, ExtCtrls, cpdbdata,
  Mask, cpdbfindcontrols, frconsulta, frconsultacodigo, cpdbspinedit,
  Grids, DBGrids, cpdbgrid, dmcadastropedidossaidas, DBCtrls, cptexto, ctconstantes,
  cpdbtext, cpnumero, {Qete,} biblio, db, fmcadastroprodutosclientespedidossaidas,
  ToolWin;

type
  Tfrmcadastropedidossaidas = class(TfrmCadastroPadrao)
    gbxNumero: TGroupBox;
    edfPedido: TtecDBFindLookup;
    gbxData: TGroupBox;
    edtDataPedido: TDBEditData;
    gbxNrNoCliente: TGroupBox;
    gbxNrClientes: TGroupBox;
    fraConsultaCliente: TfraConsultaCodigo;
    gbxProdutos: TGroupBox;
    dbgProdutosPedidos: TtecDBGrid;
    Bevel1: TBevel;
    pnlTop: TPanel;
    edtNrNoCliente: TDBEditTexto;
    pnlLegenda: TPanel;
    shIncluirNaNota: TShape;
    lblInventarioProdutosGerados: TLabel;
    procedure dbgProdutosPedidosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgProdutosPedidosDblClick(Sender: TObject);
    procedure dbgProdutosPedidosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgProdutosPedidosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbnProcurarClick(Sender: TObject);
  private
    { Private declarations }
    procedure ProdutosPedidosSaidaNewRecord(Sender: TObject);
    procedure ProdutosPedidosSaidaAfterPost(Sender: TObject);
    procedure SetCodigoProdutosDigitado;
    procedure CondicoesItemProduto;

  protected
    ConsultaPedidoSaida : TfraConsultaCodigo;
    ConsultaProduto : TfraConsultaCodigo;
    CadastrarProdutosCliente : TfrmCadastroProdutosClientesPedidosSaidas;
    procedure AbrirPedido(Found: Boolean);
    procedure AtribuirDadosProdutos(Found: Boolean);
    procedure AtribuirDadosClientes(Found: Boolean);
    function InternoExcluir: Boolean; override;
    function InternoGravar: Boolean; override;
    function InternoIncluir: Boolean; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure AcionarPesquisaGrade;
    procedure VerificarProdutosClientes;
    procedure AcionarTelaCadastroProdutoCliente;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmcadastropedidossaidas: Tfrmcadastropedidossaidas;

implementation

{$R *.dfm}

{ TfrmCadastoOSP }

procedure Tfrmcadastropedidossaidas.AbrirPedido(Found: Boolean);
begin
  edfPedido.Text := ConsultaPedidoSaida.ValorSelecionado;
  dtmcadastropedidossaidas.
        refazconsulta(dtmcadastropedidossaidas.qryPedidosSaida,[0],
             [ConsultaPedidoSaida.ValorSelecionado]);
//  AlterarEstadoBotoes;
end;

constructor Tfrmcadastropedidossaidas.Create(AOwner: TComponent);
begin
  dtmcadastropedidossaidas := Tdtmcadastropedidossaidas.Create(Self);

  inherited;
  DataSet := dtmcadastropedidossaidas.qryPedidosSaida;

  ConsultaPedidoSaida := TfraConsultaCodigo.Create(self);
  ConsultaPedidoSaida.edfCodigo.DataSource := dtmcadastropedidossaidas.dsrProdutosPedidosSaida;
  ConsultaPedidoSaida.edfCodigo.DataField := 'numero';
  ConsultaPedidoSaida.edfCodigo.Operacao := opATRIBUICAO;
  ConsultaPedidoSaida.AbrirTabelaProcura := false;
  ConsultaPedidoSaida.TipoPesquisa := pesPEDIDOSSAIDA;
  ConsultaPedidoSaida.OnFound := AbrirPedido;
  ConsultaPedidoSaida.Name := 'fraConsultaPedidoSaida';

  ConsultaProduto := TfraConsultaCodigo.Create(self);
  ConsultaProduto.Name := 'fraConsultaProduto';
  ConsultaProduto.edfCodigo.MaxLength := 30;
  ConsultaProduto.edfCodigo.DataSource := dtmcadastropedidossaidas.dsrProdutosPedidosSaida;
  ConsultaProduto.edfCodigo.DataField := 'produtovisual';
  ConsultaProduto.edfCodigo.Operacao := opATRIBUICAO;
  ConsultaProduto.edfCodigo.LookupSource := ConsultaProduto.dsrProcuraItemProdutos;
  ConsultaProduto.edfCodigo.LookupQueryParameter := 'ProdutoVisual';
  ConsultaProduto.edfCodigo.LookupField := 'ProdutoVisual';
//  ConsultaProduto.edfCodigo.LocateParameters := 'produtovisual';
  ConsultaProduto.AbrirTabelaProcura := false;
  ConsultaProduto.CondicoesdaConsulta := CondicoesItemProduto;
  ConsultaProduto.TipoPesquisa := pesITEMPRODUTOS;
  ConsultaProduto.OnFound := AtribuirDadosProdutos;

  fraConsultaCliente.TipoCliente := 'C';
  fraConsultaCliente.Tipovfornecedor := 'C';
  fraConsultaCliente.OnFound := AtribuirDadosClientes;
  fraConsultaCliente.TipoPesquisa := pesCLIENTES;

  dbgProdutosPedidos.SelectedIndex := 2;
  dtmcadastropedidossaidas.onProdutosPedidosSaidaNewRecord := ProdutosPedidosSaidaNewRecord;
  dtmcadastropedidossaidas.ProdutosPedidosSaidaAfterPost := ProdutosPedidosSaidaAfterPost;

  dbgProdutosPedidos.OnDelete := dtmcadastropedidossaidas.ExcluirProdutosPedidosSaida;

{
  dtmCadastroInventario.OnScrollLinhaColunaGrade := AfterScrollLinhaColunaGrade;
  dtmCadastroInventario.OnScrollInventario := AfterScrollInventario;
  dbgProdutosInventario.Columns[3].Visible := ParSistema.UsarGradesProdutos;
  dbgProdutosInventario.Columns[4].Visible := ParSistema.UsarGradesProdutos;

  if dbgProdutosInventario.Columns[5].Width < ParSistema.tamanhoMascaraQuantidade then
    dbgProdutosInventario.Columns[5].Width := ParSistema.tamanhoMascaraQuantidade;

  if dbgProdutosInventario.Columns[6].Width < ParSistema.tamanhoMascaraQuantidade then
    dbgProdutosInventario.Columns[6].Width := ParSistema.tamanhoMascaraQuantidade;

  if dbgProdutosInventario.Columns[7].Width < ParSistema.tamanhoMascaraQuantidade then
    dbgProdutosInventario.Columns[7].Width := ParSistema.tamanhoMascaraQuantidade;

  if dbgProdutosInventario.Columns[8].Width < ParSistema.tamanhoMascaraQuantidade then
    dbgProdutosInventario.Columns[8].Width := ParSistema.tamanhoMascaraQuantidade;

  if dbgProdutosInventario.Columns[9].Width < ParSistema.tamanhoMascaraQuantidade then
    dbgProdutosInventario.Columns[9].Width := ParSistema.tamanhoMascaraQuantidade;

  if dbgProdutosInventario.Columns[10].Width < ParSistema.tamanhoMascaraQuantidade then
    dbgProdutosInventario.Columns[10].Width := ParSistema.tamanhoMascaraQuantidade;

  if dbgProdutosInventario.Columns[11].Width < ParSistema.tamanhoMascaraQuantidade then
    dbgProdutosInventario.Columns[11].Width := ParSistema.tamanhoMascaraQuantidade;

  if dbgProdutosInventario.Columns[12].Width < ParSistema.tamanhoMascaraQuantidade then
    dbgProdutosInventario.Columns[12].Width := ParSistema.tamanhoMascaraQuantidade;

  if dbgProdutosInventario.Columns[13].Width < ParSistema.tamanhoMascaraQuantidade then
    dbgProdutosInventario.Columns[13].Width := ParSistema.tamanhoMascaraQuantidade;

  dbgProdutosInventario.OnDelete := ExcluirProduto;

  fraConsultaFornecedor.TipoCliente := 'F';
  fraConsultaFornecedor.Tipovfornecedor := 'F';
  fraConsultaFornecedor.TipoPesquisa := pesFORNECEDORES;
  }

  edfPedido.setfocus;
end;

destructor Tfrmcadastropedidossaidas.Destroy;
begin
  dtmcadastropedidossaidas.qryPedidosSaida.close;
  dtmcadastropedidossaidas.qryProdutosPedidosSaida.close;
  dtmcadastropedidossaidas := nil;
  inherited;
  frmcadastropedidossaidas := nil;
end;

function Tfrmcadastropedidossaidas.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then begin
    if not CtrlOn then
      dtmcadastropedidossaidas.ExcluirOSP;
  end;
end;

function Tfrmcadastropedidossaidas.InternoGravar: Boolean;
begin
  Result:= inherited InternoGravar;
  if Result then
    dtmcadastropedidossaidas.GravarOSP;
end;

function Tfrmcadastropedidossaidas.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then begin
    if not CtrlOn then
    begin
      dtmcadastropedidossaidas.IncluirPedidoSaida;
      edtNrNoCliente.SetFocus;
    end;
  end;
end;

procedure Tfrmcadastropedidossaidas.KeyDown(var Key: Word; Shift: TShiftState);
  var tecla_escape: word;
begin
  if not CtrlOn then
  begin
    if (key = VK_F9) then
    begin
      if sbnProcurar.Enabled then
      begin
        ConsultaPedidoSaida.InternoPesquisar(ctPEDIDOS);
        self.SetFocus;
      end
    end;
  end;

  tecla_escape := VK_ESCAPE;
  if key = VK_ESCAPE then
  begin
    {mesmo o foco estando no grid activecontrol fica nulo}
    if ActiveControl = edfPedido then
      dtmcadastropedidossaidas.Fecha(cttabelas);
    if (dtmcadastropedidossaidas.qryProdutosPedidosSaida.State in [dsedit, dsinsert]) then
    begin
      ActiveControl := dbgProdutosPedidos;
      dbgProdutosPedidosKeyDown(dbgProdutosPedidos,tecla_escape,[ssShift]);
    end
    else
     inherited;
  end
  else
   inherited;
end;

procedure Tfrmcadastropedidossaidas.dbgProdutosPedidosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
{  case column.Index of
      9: begin
           TDBGrid(Sender).Canvas.Font.Color:= clRed;
           TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
         end;
  else
    begin}

      if not (gdSelected in State) then
      begin
        if (dtmcadastropedidossaidas.qryProdutosPedidosSaidaosp.AsInteger<>0) then
        begin
          TDBGrid(Sender).Canvas.Font.Color := clBlue;
          TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
        end
      end;

{    end;
  end;   }
end;

procedure Tfrmcadastropedidossaidas.dbgProdutosPedidosDblClick(Sender: TObject);
begin
  inherited;
  acionarPesquisaGrade;
end;

procedure Tfrmcadastropedidossaidas.dbgProdutosPedidosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  digitado: String;

  Procedure VerificarProduto;
  begin
    if (dtmcadastropedidossaidas.qryProdutosPedidosSaida.State in [dsedit,dsinsert]) or
       not (dtmcadastropedidossaidas.qryProdutosPedidosSaida.IsEmpty) then
    case dbgProdutosPedidos.SelectedIndex of
    2: begin
          dtmcadastropedidossaidas.SalvarProdutoProdutosPedidos;
          ConsultaProduto.edfCodigo.DoExit;
          if ConsultaProduto.qryProcuraItemProdutos.IsEmpty then
          begin
            dtmcadastropedidossaidas.LimparProdutosPedidosSaida;
            dbgProdutosPedidos.SetFocus;
            dbgProdutosPedidos.SelectedIndex := 2;
          end
          else
          begin
            dtmcadastropedidossaidas.qryProdutosPedidosSaidaprodutovalidado.AsBoolean := true;
            AtribuirDadosProdutos(true);
            VerificarProdutosClientes;
            dbgProdutosPedidos.SetFocus;
            dbgProdutosPedidos.SelectedIndex := 5;
          end;
       end;
    5: dbgProdutosPedidos.SelectedIndex := 8;
    8: begin
          if dtmcadastropedidossaidas.RegistrodeProdutosInCompletos then
          begin
            if dtmcadastropedidossaidas.qryProdutosPedidosSaida.CheckRequiredFields then
              dtmcadastropedidossaidas.SalvarProdutosPedidos;
          end
          else
            dtmcadastropedidossaidas.SalvarProdutosPedidos;
       end;
    end;
  end;

begin
  inherited;
  if Shift = [ssCtrl] then
  begin
    case Key of
      VK_F9     : begin
                     ConsultaProduto.CtrlOn := Shift = [ssCtrl];
                     if (Shift = []) or ConsultaProduto.CtrlOn then
                       AcionarPesquisaGrade
                   end;
    end;
  end
  else
  case Key of
    VK_Return: VerificarProduto;

    VK_UP,
    VK_DOWN,
    VK_PRIOR,
    VK_NEXT: begin
                    if dtmcadastropedidossaidas.RegistrodeProdutosInCompletos then
                    begin
                      dtmcadastropedidossaidas.EditarProdutosPedidos;
                      dtmcadastropedidossaidas.qryProdutosPedidosSaida.CheckRequiredFields;
                      key := 0;
                    end;
                  end;

    VK_ESCAPE : begin
                   dtmcadastropedidossaidas.CancelarProdutosPedidos;
                   if dbgProdutosPedidos.Focused then
                   begin
                     dbgProdutosPedidos.SetFocus;
                     dbgProdutosPedidos.SelectedIndex := 2;
                   end;
                 end;
  end;


end;

procedure Tfrmcadastropedidossaidas.AcionarPesquisaGrade;
begin
  if not dtmcadastropedidossaidas.qryProdutosPedidosSaida.ReadOnly then
  begin
    ConsultaProduto.CtrlOn := True;
    dbgProdutosPedidos.SetFocus;
    case dbgProdutosPedidos.SelectedIndex of
      2: begin
           case ConsultaProduto.InternoPesquisar(ctPRODUTO) of
           mrOk   : begin
//                      AtribuirDadosProdutos;
                      {
                      dtmcadastropedidossaidas.CodigoProduto := ConsultaProduto.qryConsultaItemProdutoscodigovisual.AsString;
                      dtmcadastropedidossaidas.qryProdutosPedidosSaidadescricao.AsString := ConsultaProduto.qryConsultaItemProdutosdescricao.AsString;
                      dtmcadastropedidossaidas.qryProdutosPedidosSaidadescricao.AsString := ConsultaProduto.qryConsultaItemProdutosdescricao.AsString;
                      }
                      dbgProdutosPedidos.SetFocus;
                      dbgProdutosPedidos.SelectedIndex :=  2;
                    end;
           mrCancel: begin
                      dbgProdutosPedidos.SetFocus;
                      dbgProdutosPedidos.SelectedIndex :=  2;
                    end;
           end
         end;
    end;
  end;
end;

procedure Tfrmcadastropedidossaidas.AtribuirDadosProdutos(Found: Boolean);
begin
  with dtmcadastropedidossaidas do
  begin
    qryProdutosPedidosSaidadescricao.AsString := ConsultaProduto.qryProcuraItemProdutos.fieldbyname('descricaolc').AsString;
    qryProdutosPedidosSaidaunidade.AsString := consultaproduto.qryProcuraItemProdutos.fieldbyname('unidade').AsString;
    qryProdutosPedidosSaidaproduto.AsString := ConsultaProduto.qryProcuraItemProdutos.fieldbyname('produto').AsString;
    qryProdutosPedidosSaidaprodutovisual.AsString := ConsultaProduto.qryProcuraItemProdutos.fieldbyname('produtovisual').AsString;
  end;
end;

procedure Tfrmcadastropedidossaidas.ProdutosPedidosSaidaNewRecord(Sender: TObject);
begin
  dbgProdutosPedidos.SelectedIndex := 2;
end;

procedure Tfrmcadastropedidossaidas.AtribuirDadosClientes(Found: Boolean);
begin
  dtmcadastropedidossaidas.qryPedidosSaidanome.AsString := fraConsultaCliente.qryProcuraClientenome.AsString;
end;

procedure Tfrmcadastropedidossaidas.VerificarProdutosClientes;
begin
  if not dtmcadastropedidossaidas.ExisteProdutonoCliente then
  begin
    case MensagemSimNaoOpcaoCancelar(ctITEMNAOVINCULADOCLIENTE,'&Vincular', false) of
      mrYes: begin
               dtmcadastropedidossaidas.IncluirProdutoCliente;
               dtmcadastropedidossaidas.qryClientesProdutos.Post;
             end;
      mrNo: begin
              dbgProdutosPedidos.SetFocus;
              dbgProdutosPedidos.SelectedIndex := 2;
            end;
      mrCancel: dtmcadastropedidossaidas.LimparProdutosPedidosSaida;
      mrOk: begin
              AcionarTelaCadastroProdutoCliente;
              dbgProdutosPedidos.SetFocus;
            end;
    end;
  end;
end;

procedure Tfrmcadastropedidossaidas.AcionarTelaCadastroProdutoCliente;
begin
  dtmcadastropedidossaidas.IncluirProdutoCliente;
  CadastrarProdutosCliente:= TfrmCadastroProdutosClientesPedidosSaidas.Create(Self);

  with CadastrarProdutosCliente do
  begin
    dtxCodigoCliente.DataSource := dtmcadastropedidossaidas.dsrClientesProdutos;
    dtxNomeCliente.DataSource := dtmcadastropedidossaidas.dsrPedidosSaida;
    dtxCodigoProduto.DataSource := dtmcadastropedidossaidas.dsrProdutosPedidosSaida;
    dtxDescricaoProduto.DataSource := dtmcadastropedidossaidas.dsrProdutosPedidosSaida;
    edtProdutoCliente.DataSource := dtmcadastropedidossaidas.dsrClientesProdutos;
    edtFinalidade.DataSource := dtmcadastropedidossaidas.dsrClientesProdutos;
    edtOrigem.DataSource := dtmcadastropedidossaidas.dsrClientesProdutos;
    edtPN.DataSource := dtmcadastropedidossaidas.dsrClientesProdutos;
  end;

  CadastrarProdutosCliente.DataSet := dtmcadastropedidossaidas.qryClientesProdutos;
  CadastrarProdutosCliente.dsrProdutosClientes.DataSet := dtmcadastropedidossaidas.qryClientesProdutos;

  CadastrarProdutosCliente.ShowModal;
  if (CadastrarProdutosCliente.ModalResult <> mrOK) then
    dtmcadastropedidossaidas.qryClientesProdutos.Cancel;
  CadastrarProdutosCliente.Free;
end;

procedure Tfrmcadastropedidossaidas.ProdutosPedidosSaidaAfterPost(Sender: TObject);
begin
  VerificarProdutosClientes;
end;


procedure Tfrmcadastropedidossaidas.SetCodigoProdutosDigitado;
var
 b: integer;
begin
{
  if (dbgProdutosPedidos.SelectedIndex = 2) then
  begin
//    if PrimeiraVez then
    begin
      for B := 0 to dbgProdutosPedidos.ControlCount - 1 do
        if dbgProdutosPedidos.Controls[B] is TInPlaceEdit then
          with dbgProdutosPedidos.Controls[B] as TInPlaceEdit do
{            text := dtmcadastropedidossaidas.CodigoProduto;
      PrimeiraVez := false;
    end;

    if (dtmcadastropedidossaidas.qryProdutosPedidosSaida.State in [dsedit,dsinsert]) then
      for B := 0 to dbgProdutosPedidos.ControlCount - 1 do
        if dbgProdutosPedidos.Controls[B] is TInPlaceEdit then
          with dbgProdutosPedidos.Controls[B] as TInPlaceEdit do
              dtmcadastropedidossaidas.CodigoProduto := Text;
  end
  else
//    PrimeiraVez := True;                         }
end;

procedure Tfrmcadastropedidossaidas.dbgProdutosPedidosKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  SetCodigoProdutosDigitado;
end;

procedure Tfrmcadastropedidossaidas.sbnProcurarClick(Sender: TObject);
begin
  inherited;
  ConsultaPedidoSaida.InternoPesquisar(ctPEDIDOS);
  self.SetFocus;
end;

procedure Tfrmcadastropedidossaidas.CondicoesItemProduto;
const
  SQL = 'and (p.codigo not in (%s) or p.codigo = %s)';
begin
  ConsultaProduto.qryProcuraItemProdutos.MacroByName('SQLProdutosJaSelecionados').AsString :=
    format(SQL,[dtmcadastropedidossaidas.ListaProdutosSelecionados,
                inttostr(dtmcadastropedidossaidas.qryProdutosPedidosSaidaproduto.asinteger)]);

  ConsultaProduto.qryConsultaItemProdutos.MacroByName('SQLProdutosJaSelecionados').AsString :=
    format(SQL,[dtmcadastropedidossaidas.ListaProdutosSelecionados,
                inttostr(dtmcadastropedidossaidas.qryProdutosPedidosSaidaproduto.asinteger)]);
end;

end.
