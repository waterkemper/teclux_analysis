unit fmprodutosvendavista;

interface

uses
  //CLX
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, DBCtrls, Mask, ComCtrls,
  //Biblio
  ctconstantes,
  //Componentes
  cpdbtext, cpnumero, cpdbfindcontrols, cpdbradiogroup,
  //Terceiros
  ZQuery,
  //Repositorio
  fmcadastropadrao, fmconsultabasica,
  cptexto, ActnList, Grids, DBGrids, cpdbgrid, ToolWin;

type
  TfrmProdutosVendaVista = class(TfrmCadastroPadrao)
    flkCodigoProduto: TtecDBFindLookup;
    edtQuantidade: TDBEditNumero;
    dtxUnidade: TtecDBText;
    dtxDescricaoProduto: TtecDBText;
    edtPreco: TDBEditNumero;
    flkFilial: TtecDBFindLookup;
    dtxNomeFilial: TtecDBText;
    flkReserva: TtecDBFindLookup;
    dtxReserva: TtecDBText;
    sbnConsultaProduto: TSpeedButton;
    sbnConsultaFilial: TSpeedButton;
    sbnConsultaReserva: TSpeedButton;
    pnlFundoJanela: TPanel;
    gbxFundoJanela: TGroupBox;
    dtxPrecoProduto: TtecDBText;
    sbnAlterarPreco: TSpeedButton;
    edtDescricaoPrecoVenda: TDBEditTexto;
    rgpMontagem: TtecDBRadioGroup;
    rbnMontagemSIM: TtecRadioButton;
    rbnMontagemNAO: TtecRadioButton;
    flkVendedor: TtecDBFindLookup;
    dtxNomeVendedor: TtecDBText;
    sbnProcurarVendedor: TSpeedButton;
    aclHabilitar: TActionList;
    actHabilitarControles: TAction;
    dtxEmEstoque: TtecDBText;
    rgbEntrega: TtecDBRadioGroup;
    rbnEntregaSim: TtecRadioButton;
    rbnEntregaNao: TtecRadioButton;
    lblPromocao: TLabel;
    gbxListaCasamento: TGroupBox;
    gbxListadeCasamento: TGroupBox;
    sbnProcurarListaCasamento: TSpeedButton;
    flkListaCasamento: TtecDBFindLookup;
    dtxNomeNoivo2: TtecDBText;
    dtxNomeNoivo1: TtecDBText;
    ckbProdutoLista: TDBCheckBox;
    pnlProduto: TPanel;
    gbxItemProduto: TGroupBox;
    SpeedButton1: TSpeedButton;
    gbxFILIAL: TGroupBox;
    SpeedButton2: TSpeedButton;
    gbxEmEstoque: TGroupBox;
    gbxDepositos: TGroupBox;
    Bevel1: TBevel;
    dbgDepositos: TtecDBGrid;
    gbxQuantidade: TGroupBox;
    gbxPreco: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    gbxVendedor: TGroupBox;
    gbxReserva: TGroupBox;
    procedure edtDescricaoPrecoVendaExit(Sender: TObject);
    procedure edtPrecoExit(Sender: TObject);
    procedure flkCodigoProdutoExit(Sender: TObject);
    procedure flkCodigoProdutoMessage(var Msg: String);
    procedure flkReservaMessage(var Msg: String);
    procedure sbnAlterarPrecoClick(Sender: TObject);
    procedure sbnConsultaFilialClick(Sender: TObject);
    procedure sbnConsultaProdutoClick(Sender: TObject);
    procedure sbnConsultaReservaClick(Sender: TObject);
    procedure sbnProcurarVendedorClick(Sender: TObject);
    procedure ckbProdutoListaClick(Sender: TObject);
    procedure actHabilitarControlesUpdate(Sender: TObject);
    procedure flkFilialMessage(var Msg: String);
    procedure flkCodigoProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbnProcurarListaCasamentoClick(Sender: TObject);
  protected
    TipoConsulta: TtecVendasTipoConsulta;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoIncluir: Boolean; override;
    function  InternoPesquisar(Titulo:String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure GravarLinhas;
  end;

var
  frmProdutosVendaVista: TfrmProdutosVendaVista;

implementation

uses
  //Biblio
  biblio, clusuario, clparametrossistema,
  //Repositorio
  fmconsultaporcampo, dmvendasavista;
                      

{$R *.dfm}

{ TfrmProdutosVendaVista }

procedure TfrmProdutosVendaVista.actHabilitarControlesUpdate(Sender: TObject);
begin
  inherited;
  ckbProdutoLista.Enabled         := dtmVendasAVista.ComLista;
//  ckbIncluirListaCasamento.Enabled:= dtmVendasAVista.ComLista and not ckbProdutoLista.Checked;
  lblPromocao.Visible             := dtmVendasAVista.ProdutoEmPromocao;
end;

constructor TfrmProdutosVendaVista.Create(AOwner: TComponent);
begin
  inherited;
  DataSet := dtmVendasAVista.TabelaProdutosVendaVista;
  sbnAlterarPreco.Visible := ParSistema.PermiteAlterarPreco;
  rgpMontagem.Enabled     := dtmVendasAVista.ProdutoMontavel;
  flkVendedor.Enabled     := not UsuarioLogin.Vendedor;
  if UsuarioLogin.Vendedor then begin
    dtxNomeVendedor.Width := dtxNomeVendedor.Width + dtxNomeVendedor.Left - flkVendedor.Left;

    dtxNomeVendedor.Left  := flkVendedor.Left;

    dtxNomeVendedor.BringToFront;

  end;

  dbgDepositos.Visible      := Not (ParSistema.FiliaisIndependentes);


  flkFilial.Visible         := Not (ParSistema.FiliaisIndependentes);

  sbnConsultaFilial.Visible := Not (ParSistema.FiliaisIndependentes);

  dtxNomeFilial.Visible     := Not (ParSistema.FiliaisIndependentes);

  {
  if parsistema.PesquisaPadraoProdutoCodigoBarras then
  begin
    flkCodigoProduto.LookupQueryParameter := 'codigobarras';
    flkCodigoProduto.LocateQueryParameter := 'codigobarras';
  end
  else
  begin
  }
    flkCodigoProduto.LookupQueryParameter := 'codigo';
    flkCodigoProduto.LocateQueryParameter := 'produto';
{  end;}
end;


destructor TfrmProdutosVendaVista.Destroy;
begin
  inherited;
  frmProdutosVendaVista := nil;
end;

procedure TfrmProdutosVendaVista.edtDescricaoPrecoVendaExit(Sender: TObject);
begin
  inherited;
  edtDescricaoPrecoVenda.Enabled := False;
end;

procedure TfrmProdutosVendaVista.edtPrecoExit(Sender: TObject);
begin
  inherited;
  edtPreco.SendToBack;
end;

function TfrmProdutosVendaVista.ExisteInformacao(Parametro: Integer;
         NomeCampo: String; Value: Variant): Boolean;
begin
  case TipoConsulta of
         vtcPRODUTO: Result := dtmVendasAVista.ExisteProduto(NomeCampo, Value);
          vtcFILIAL: Result := dtmVendasAVista.ExisteFilialProduto(NomeCampo, Value);
         vtcRESERVA: Result := dtmVendasAVista.ExisteReserva(NomeCampo, Value);
 vtcVENDEDORPRODUTO: Result := dtmVendasAVista.ExisteVendedor(NomeCampo, Value);
  vtcLISTACASAMENTO: Result := dtmVendasAVista.ExisteListaCasamento(NomeCampo, Value); 
               else  Result := False
  end;
end;

procedure TfrmProdutosVendaVista.flkCodigoProdutoExit(Sender: TObject);
begin
  inherited;
  rgpMontagem.Enabled := dtmVendasAVista.ProdutoMontavel;
end;

procedure TfrmProdutosVendaVista.flkCodigoProdutoMessage(var Msg: String);
begin
  inherited;
  Msg := 'Produto não foi encontrado. Verifique se:'        + #13#10 +
         '- está cadastrado no estoque desta filial ou'     + #13#10 +
         '- está com o preço de venda diferente de zero ou' + #13#10 +
         '- já está incluído no contrato.'
end;

procedure TfrmProdutosVendaVista.flkReservaMessage(var Msg: String);
begin
  inherited;
  Msg := 'A reserva não foi encontrada. Verifique se: ' + #13#10 +
         '- a reserva existe ou' + #13#10 +

         '- já foi finalizada ou' + #13#10 +

         '- item/filial pertencem a reserva ou' + #13#10 +

         '- vendedor que fez a reserva é o mesmo que está vendendo.'

end;

function TfrmProdutosVendaVista.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then
    Result := dtmVendasAVista.ExcluirProdutoVendaVista;
end;

function TfrmProdutosVendaVista.InternoGravar: Boolean;
begin
  Result := inherited InternoGravar;
  if Result then
     if edtQuantidade.Text = '0' then begin
        MensagemAviso(ctQUANTIDADEPRODUTOSMAIORZERO);
        edtQuantidade.SetFocus;
        result := false;
     end;

     if result then
        Result := dtmVendasAVista.GravarProdutoVendaVista;
end;

function TfrmProdutosVendaVista.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then begin
    Result := dtmVendasAVista.IncluirProdutosVendaVista;
    flkCodigoProduto.SetFocus
  end
end;

function TfrmProdutosVendaVista.InternoPesquisar(Titulo: String): Integer;
var
  parametroAnterior, locateanterior: String;
begin
  Result := mrNONE;
  if CtrlOn then begin
    if ActiveControl = flkFilial then
    begin
      TipoConsulta := vtcFILIAL;
      Titulo:= 'Filiais';
    end
    else if ActiveControl = flkCodigoProduto then begin
      TipoConsulta := vtcPRODUTO;
      Titulo:= 'Produtos';
    end
    else if ActiveControl = flkReserva then begin
      TipoConsulta := vtcRESERVA;
      Titulo:= 'Reservas';
    end
    else if ActiveControl = flkVendedor then begin
      Tipoconsulta := vtcVENDEDORPRODUTO;
      Titulo:= 'Vendedores';
    end
    else if ActiveControl = flkListaCasamento then
    begin
      Tipoconsulta := vtcLISTACASAMENTO;
      Titulo := ctLISTACASAMENTO;
    end;
  end
  else
    TipoConsulta:= vtcNENHUM;

  if TipoConsulta <> vtcNENHUM then begin
    dtmVendasAVista.AbreTabelasVendaVista(TipoConsulta);
    Result := inherited InternoPesquisar(Titulo);
    if Result = mrOK then
    begin
      if tipoconsulta = vtcPRODUTO then
      begin
        if ParSistema.GravarProdutoContratoAutomaticamente then
        begin
          gbxItemProduto.Caption := flkCodigoProduto.FParameterLabel;
          parametroAnterior := flkCodigoProduto.LookupQueryParameter;
          locateanterior := flkCodigoProduto.LocateQueryParameter;
          flkCodigoProduto.LookupQueryParameter := 'codigo';
          flkCodigoProduto.LocateQueryParameter := 'produto';
          flkCodigoProduto.Text := dtmVendasAVista.ProdutoConsulta;
          flkCodigoProduto.Exist;
          flkcodigoproduto.Modified := true;
          flkCodigoProduto.DoExit;
          flkCodigoProduto.LookupQueryParameter := parametroAnterior;
          flkCodigoProduto.LocateQueryParameter := locateanterior;
        end;
      end;
      dtmVendasAVista.SelecionaTabelasVendaVista(TipoConsulta);
    end;
    dtmVendasAVista.FechaTabelasConsulta(TipoConsulta);
  end
end;

function TfrmProdutosVendaVista.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa     := TipoConsulta <> vtcPRODUTO;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela := False;
end;

procedure TfrmProdutosVendaVista.sbnAlterarPrecoClick(Sender: TObject);
var
  UsuarioAut: TtecUsuarios;
  AlterarPreco: Boolean;
begin
  inherited;
  if UsuarioLogin.AlterarPrecoContrato then
    AlterarPreco := True
  else begin
    try
      UsuarioAut := dtmVendasAVista.ObterAutorizacao(taLOGIN, ctALTERARPRECOVENDA, ctAUTORIZADO);
      try
        if Assigned(UsuarioAut) then
          AlterarPreco := UsuarioAut.AlterarPrecoContrato
        else begin
          AlterarPreco := False;
          MensagemAviso(Format(ctUSUARIOSEMCADASTRO, ['']))
        end
      finally
        if Assigned(UsuarioAut) then
          UsuarioAut.Free;
      end
    except
      AlterarPreco := False
    end
  end;
  if AlterarPreco then begin
    edtPreco.BringToFront;
    edtPreco.SetFocus;
    edtDescricaoPrecoVenda.Enabled := True;
  end else begin
    MensagemAviso(Format(ctUSUARIONAOAUTORIZADO, [ctMODIFICAPRECO]));
    if Assigned(ActiveControl) then
         ActiveControl.SetFocus
    else edtQuantidade.SetFocus
  end
end;

procedure TfrmProdutosVendaVista.sbnConsultaFilialClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  flkFilial.SetFocus;
  InternoPesquisar('')
end;

procedure TfrmProdutosVendaVista.sbnConsultaProdutoClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  flkCodigoProduto.SetFocus;
  InternoPesquisar('')
end;

procedure TfrmProdutosVendaVista.sbnConsultaReservaClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  flkReserva.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmProdutosVendaVista.sbnProcurarVendedorClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  flkVendedor.SetFocus;
  InternoPesquisar('');
end;

function TfrmProdutosVendaVista.TabelaDePesquisa: TZDataSet;
begin
  case TipoConsulta of
         vtcPRODUTO: Result := dtmVendasAVista.TabelaConsultaProdutos;
          vtcFILIAL: Result := dtmVendasAVista.TabelaConsultaFilialProduto;
         vtcRESERVA: Result := dtmVendasAVista.TabelaConsultaReservas;
 vtcVENDEDORPRODUTO: Result := dtmVendasAVista.TabelaConsultaVendedores;
  vtcLISTACASAMENTO: Result := dtmVendasAVista.TabelaConsultaListaCasamento;
               else  Result := nil;
  end;
end;

procedure TfrmProdutosVendaVista.ckbProdutoListaClick(Sender: TObject);
begin
  inherited;
  dtmVendasAVista.SelecionarProdutosListaCasamento(ckbProdutoLista.Checked, ckbProdutoLista.Checked);
end;


procedure TfrmProdutosVendaVista.flkFilialMessage(var Msg: String);
begin
  inherited;
  Msg := 'Filial inválida. Verifique se:'        + #13#10 +
         '- está cadastrada ou'     + #13#10 +
         '- está inativa ou' + #13#10 +
         '- se o produto já está incluído no contrato com a mesma filial.'
end;

procedure TfrmProdutosVendaVista.flkCodigoProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  gbxItemProduto.Caption := flkCodigoProduto.FParameterLabel;
end;

procedure TfrmProdutosVendaVista.GravarLinhas;
var Contador: Integer;
begin
 with dtmVendasAVista do begin
    qryProdutosContratos.DisableControls;
    Contador:= 1;
    qryProdutosContratos.First;
    while Not qryProdutosContratos.Eof do begin
      qryProdutosContratos.Edit;
      qryProdutosContratosNumero.AsInteger := Contador;
      qryProdutosContratos.Post;
      Inc(Contador);
      qryProdutosContratos.Next;
    end;
    qryProdutosContratos.EnableControls;
  end;
end;

procedure TfrmProdutosVendaVista.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  GravarLinhas;
end;

procedure TfrmProdutosVendaVista.sbnProcurarListaCasamentoClick(
  Sender: TObject);
begin
  inherited;
  TipoConsulta := vtcLISTACASAMENTO;
  InternoPesquisar(flkListaCasamento, ctLISTACASAMENTO)

end;

end.
