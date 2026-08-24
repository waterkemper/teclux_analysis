unit fmcadastroprodutoscontratotroca;

interface

uses
  //CLX
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, DBCtrls, Mask, ComCtrls, {Qete,} Windows,
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
  dmtrocamercadorias, ToolWin;

type
  TfrmCadastroProdutosContratoTroca = class(TfrmCadastroPadrao)
    lblCodigoProduto: TLabel;
    lblQuantidade: TLabel;
    lblPrecoProduto: TLabel;
    lblFilialSaida: TLabel;
    lblReserva: TLabel;
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
    lblDecricaoAlteracaoPreco: TLabel;
    edtDescricaoPrecoVenda: TDBEditTexto;
    rgpMontagem: TtecDBRadioGroup;
    rbnMontagemSIM: TtecRadioButton;
    rbnMontagemNAO: TtecRadioButton;
    flkVendedor: TtecDBFindLookup;
    lblVendedor: TLabel;
    dtxNomeVendedor: TtecDBText;
    sbnProcurarVendedor: TSpeedButton;
    aclHabilitar: TActionList;
    actHabilitarControles: TAction;
    lblEmEstoque: TLabel;
    dtxEmEstoque: TtecDBText;
    lblQtdeCopiar: TLabel;
    edtQtdeCopiar: TDBEditNumero;
    lblFilialDeposito: TLabel;
    dbgDepositos: TtecDBGrid;
    lblPromocao: TLabel;
    gbxSimilares: TGroupBox;
    dbgSimilares: TtecDBGrid;
    rgbEntrega: TtecDBRadioGroup;
    rbnEntregaSIM: TtecRadioButton;
    rbnEntregaNAO: TtecRadioButton;
    procedure edtDescricaoPrecoVendaExit(Sender: TObject);
    procedure edtPrecoExit(Sender: TObject);
    procedure flkCodigoProdutoEnter(Sender: TObject);
    procedure flkCodigoProdutoExit(Sender: TObject);
    procedure flkCodigoProdutoMessage(var Msg: String);
    procedure flkExit(Sender: TObject);
    procedure flkFilialEnter(Sender: TObject);
    procedure flkReservaEnter(Sender: TObject);
    procedure flkReservaMessage(var Msg: String);
    procedure sbnAlterarPrecoClick(Sender: TObject);
    procedure sbnConsultaFilialClick(Sender: TObject);
    procedure sbnConsultaProdutoClick(Sender: TObject);
    procedure sbnConsultaReservaClick(Sender: TObject);
    procedure sbnProcurarVendedorClick(Sender: TObject);
    procedure actHabilitarControlesUpdate(Sender: TObject);
    procedure edtQtdeCopiarExit(Sender: TObject);
    procedure flkVendedorEnter(Sender: TObject);
    procedure flkFilialMessage(var Msg: String);
    procedure dbgSimilaresDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure flkCodigoProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure AfterScrollLinhaColunaGradeSimilares(Sender: TObject);
  protected
    TipoConsulta: TtecConsultaProdutosContratos;
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoIncluir: Boolean; override;
    function  InternoPesquisar(Titulo:String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;

  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
  end;

var
  frmCadastroProdutosContratoTroca: TfrmCadastroProdutosContratoTroca;

implementation

uses
  //Biblio
  biblio, clusuario, clparametrossistema,
  //Repositorio
  fmconsultaporcampo;

{$R *.dfm}

{ TfrmCadastroProdutosContrato }

procedure TfrmCadastroProdutosContratoTroca.actHabilitarControlesUpdate(Sender: TObject);
begin
  inherited;
  lblPromocao.Visible             := dtmTrocaMercadorias.ProdutoEmPromocao;
end;

constructor TfrmCadastroProdutosContratoTroca.Create(AOwner: TComponent);
begin
  inherited;
//  DataSet := dtmTrocaMercadorias.TabelaProdutoContratos;
  DataSet := TZDataset(dtmTrocaMercadorias.dsrprodutoscontratos.dataset);

  if parsistema.IncluirOrcamentonosItensdaTroca then
  begin
    lblReserva.visible := false;
    sbnConsultaReserva.visible := false;
    flkReserva.dataSource := nil;
    flkReserva.visible := false;
    dtxReserva.visible := false;
    self.caption := 'Cadastro de Produtos do orçamento';

  end
  else
  begin
    lblReserva.visible := true;
    sbnConsultaReserva.visible := true;
    flkReserva.dataSource := dtmTrocaMercadorias.dsrProdutosContratos;
    flkReserva.visible := true;
    dtxReserva.visible := true;

    self.caption := 'Cadastro de Produtos do Contrato';
  end;


  sbnAlterarPreco.Visible := ParSistema.PermiteAlterarPreco;
  rgpMontagem.Enabled     := dtmTrocaMercadorias.ProdutoMontavel;
  flkVendedor.Enabled     := not UsuarioLogin.Vendedor;
  if UsuarioLogin.Vendedor then begin
    dtxNomeVendedor.Width := dtxNomeVendedor.Width + dtxNomeVendedor.Left - flkVendedor.Left;
    dtxNomeVendedor.Left  := flkVendedor.Left;
    dtxNomeVendedor.BringToFront;
  end;

  if ParSistema.SoVisualizarEstoqueDeposito then
    lblFilialDeposito.Caption := ctDEPOSITOS
  else lblFilialDeposito.Caption := ctFILIAIS;

  lblFilialDeposito.Visible := Not ParSistema.FiliaisIndependentes;
  dbgDepositos.Visible      := Not ParSistema.FiliaisIndependentes;
  lblFilialSaida.Visible    := Not ParSistema.FiliaisIndependentes;
  flkFilial.Visible         := Not ParSistema.FiliaisIndependentes;
  sbnConsultaFilial.Visible := Not ParSistema.FiliaisIndependentes;
  dtxNomeFilial.Visible     := Not ParSistema.FiliaisIndependentes;
  dbgSimilares.Columns[2].Visible := ParSistema.UsarGradesProdutos;
  dbgSimilares.Columns[3].Visible := ParSistema.UsarGradesProdutos;
  if not ParSistema.UsarGradesProdutos then
    dbgsimilares.Columns[1].Width := dbgsimilares.Columns[1].Width+
                                     dbgsimilares.Columns[2].Width+
                                     dbgsimilares.Columns[3].Width;
  dtmTrocaMercadorias.OnScrollLinhaColunaGradeSimilares := AfterScrollLinhaColunaGradeSimilares;

  if dbgSimilares.Columns[4].Width < ParSistema.tamanhomascaraquantidade then
    dbgSimilares.Columns[4].Width := ParSistema.tamanhomascaraquantidade;
  if dbgSimilares.Columns[5].Width < ParSistema.tamanhomascaraquantidade then
    dbgSimilares.Columns[5].Width := ParSistema.tamanhomascaraquantidade;

  dtmTrocaMercadorias.Operacao := 'S';
  dtmTrocaMercadorias.DefinirParametrosFiliais;

end;


destructor TfrmCadastroProdutosContratoTroca.Destroy;
begin
  inherited;
  frmCadastroProdutosContratotroca := nil;
end;

procedure TfrmCadastroProdutosContratoTroca.edtDescricaoPrecoVendaExit(Sender: TObject);
begin
  inherited;
  edtDescricaoPrecoVenda.Enabled := False;
end;

procedure TfrmCadastroProdutosContratoTroca.edtPrecoExit(Sender: TObject);
begin
  inherited;
  edtPreco.SendToBack;
end;

function TfrmCadastroProdutosContratoTroca.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  if TipoConsulta = cpcPRODUTOSTROCA then
    Result := dtmTrocaMercadorias.ExisteProduto(NomeCampo, Value)
  else if TipoConsulta = cpcPRODUTOS then
    Result := dtmTrocaMercadorias.ExisteProduto(NomeCampo, Value)
  else if TipoConsulta = cpcFILIAIS then
    Result := dtmTrocaMercadorias.ExisteFilialProduto(NomeCampo, Value)
  else if TipoConsulta = cpcRESERVAS then
    Result := dtmTrocaMercadorias.ExisteReserva(NomeCampo, Value)
  else if TipoConsulta = cpcVENDEDOR then
    Result := dtmTrocaMercadorias.ExisteVendedores(NomeCampo, Value)
  else
    Result := False
end;

procedure TfrmCadastroProdutosContratoTroca.flkCodigoProdutoEnter(Sender: TObject);
begin
  inherited;
  TipoConsulta := cpcPRODUTOS;
end;

procedure TfrmCadastroProdutosContratoTroca.flkCodigoProdutoExit(Sender: TObject);
begin
  inherited;
  rgpMontagem.Enabled := dtmTrocaMercadorias.ProdutoMontavel;
end;

procedure TfrmCadastroProdutosContratoTroca.flkCodigoProdutoMessage(var Msg: String);
begin
  inherited;
  Msg := 'Produto não foi encontrado. Verifique se:'        + #13#10 +
         '- está cadastrado no estoque desta filial ou'     + #13#10 +
         '- está com o preço de venda diferente de zero ou' + #13#10 +
         '- já está incluído no contrato.'
end;

procedure TfrmCadastroProdutosContratoTroca.flkExit(Sender: TObject);
begin
  inherited;
  TipoConsulta := cpcNENHUM
end;

procedure TfrmCadastroProdutosContratoTroca.flkFilialEnter(Sender: TObject);
begin
  inherited;
  TipoConsulta := cpcFILIAIS
end;

procedure TfrmCadastroProdutosContratoTroca.flkReservaEnter(Sender: TObject);
begin
  inherited;
  TipoConsulta := cpcRESERVAS
end;

procedure TfrmCadastroProdutosContratoTroca.flkReservaMessage(var Msg: String);
begin
  inherited;
  Msg := 'A reserva não foi encontrada. Verifique se: ' + #13#10 +
         '- a reserva existe ou' + #13#10 +

         '- já foi finalizada ou' + #13#10 +

         '- item/filial pertencem a reserva ou' + #13#10 +

         '- vendedor que fez a reserva é o mesmo que está vendendo.'

end;

procedure TfrmCadastroProdutosContratoTroca.flkVendedorEnter(Sender: TObject);
begin
  inherited;
  TipoConsulta := cpcVENDEDOR;
end;

function TfrmCadastroProdutosContratoTroca.InternoExcluir: Boolean;
begin
  Result := dtmTrocaMercadorias.ExcluirProduto
end;

function TfrmCadastroProdutosContratoTroca.InternoGravar: Boolean;
var
  Copia,
  Qtdade: Real;
  Editando: Boolean;
begin

  editando := dtmTrocaMercadorias.EditandoProdutosContratos;

  try
    Qtdade := StrToFloat(edtQuantidade.Text);
  except
    Qtdade := 0;
  end;

  try
    Copia  := StrToFloat(edtQtdeCopiar.Text);
  except
    Copia  := 0;
  end;

  Result := False;
  if Qtdade > 0 then
  begin
    if Copia > Qtdade then begin
      MensagemAviso('A quantidade à ser copiada não pode ser maior' + #10#13 +
                    'que a quantidade do produto.');
      edtQtdeCopiar.SetFocus;
    end
    else
    begin
      Result := dtmTrocaMercadorias.GravarProdutoContrato;
      if Result and not Editando then begin
        if ParSistema.AbrirConsultaAutomaticamente then begin
          InternoIncluir;
          CtrlOn:= True;
          TipoConsulta:= cpcPRODUTOS;
          InternoPesquisar('Produtos');
        end;
      end;
    end;
  end
  else begin
    MensagemAviso(ctQUANTIDADEPRODUTOSMAIORZERO);
    edtQuantidade.SetFocus;
  end

end;

function TfrmCadastroProdutosContratoTroca.InternoIncluir: Boolean;
begin
  Result := dtmTrocaMercadorias.IncluirProdutosContrato;
  flkCodigoProduto.SetFocus
end;

function TfrmCadastroProdutosContratoTroca.InternoPesquisar(Titulo: String): Integer;
var
  Tabela: Integer;
{  parametroAnterior, locateanterior: String;}
begin
  if CtrlOn then begin
    if TipoConsulta = cpcFILIAIS then begin
      Titulo := ctFILIAL;
      Tabela := ctVendaTabelaConsultaFilialProduto;
    end else if TipoConsulta = cpcRESERVAS then begin
      Titulo := ctRESERVAS;
      Tabela := ctVendaTabelaConsultaReservas;
    end else if Tipoconsulta = cpcVENDEDOR then begin
      Titulo := ctVENDEDORES;
      Tabela := ctVendaTabelaConsultaVendedores;
    end else
      Tabela := 0;
    if TipoConsulta = cpcPRODUTOS then begin
      Titulo := ctPRODUTO;
      dtmTrocaMercadorias.AbreConsultaProdutos(false, TipoConsulta);
      Tabela := ctVendaTabelaConsultaProdutos;
    end else
      dtmTrocaMercadorias.Abre(Tabela);
    try
      Result := inherited InternoPesquisar(Titulo);
      if Result = mrOK then begin
        if TipoConsulta = cpcPRODUTOS then
        begin
        {
          lblCodigoProduto.Caption := flkCodigoProduto.FParameterLabel;
          parametroAnterior := flkCodigoProduto.LookupQueryParameter;
          locateanterior := flkCodigoProduto.LocateQueryParameter;
          flkCodigoProduto.LookupQueryParameter := 'codigo';
          flkCodigoProduto.LocateQueryParameter := 'produto';
          }
          dtmTrocaMercadorias.SelecionarProdutoContrato;
          flkCodigoProduto.Exist;
          flkcodigoproduto.Modified := true;
          //flkCodigoProduto.DoExit; {estava trocando a filial}
//          flkCodigoProduto.LookupQueryParameter := parametroAnterior;
//          flkCodigoProduto.LocateQueryParameter := locateanterior;

        end
        else if TipoConsulta = cpcFILIAIS then
          dtmTrocaMercadorias.SelecionarFilial
        else if TipoConsulta = cpcRESERVAS then
          dtmTrocaMercadorias.SelecionarReserva
        else if TipoConsulta = cpcVENDEDOR then
          dtmTrocaMercadorias.SelecionarVendedoresProduto;
        dtmTrocaMercadorias.Fecha(Tabela);
      end;
    finally
      dtmTrocaMercadorias.Fecha(Tabela);
    end
  end else
    Result := mrNONE
end;

function TfrmCadastroProdutosContratoTroca.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := (TipoConsulta <> cpcPRODUTOS) or
                                                      ((TipoConsulta = cpcPRODUTOS) and
                                                         ((dtmTrocaMercadorias.ComLista and false) or
                                                          ParSistema.UsarConsultaInterativa));
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela := False;
end;

procedure TfrmCadastroProdutosContratoTroca.sbnAlterarPrecoClick(Sender: TObject);
var
  UsuarioAut: TtecUsuarios;
  AlterarPreco: Boolean;
begin
  inherited;
  if UsuarioLogin.AlterarPrecoContrato then
    AlterarPreco := True
  else begin
    try
      UsuarioAut := dtmTrocaMercadorias.ObterAutorizacao(taLOGIN, ctALTERARPRECOVENDA, ctAUTORIZADO);
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
    else
      edtQuantidade.SetFocus
  end
end;

procedure TfrmCadastroProdutosContratoTroca.sbnConsultaFilialClick(Sender: TObject);
begin
  inherited;
  TipoConsulta := cpcFILIAIS;
  InternoPesquisar(flkFilial, ctFILIAL)
end;

procedure TfrmCadastroProdutosContratoTroca.sbnConsultaProdutoClick(Sender: TObject);
begin
  inherited;
  TipoConsulta := cpcPRODUTOS;
  InternoPesquisar(flkCodigoProduto, ctPRODUTO)
end;

procedure TfrmCadastroProdutosContratoTroca.sbnConsultaReservaClick(Sender: TObject);
begin
  inherited;
  TipoConsulta := cpcRESERVAS;
  InternoPesquisar(flkReserva, ctRESERVAS);
end;

procedure TfrmCadastroProdutosContratoTroca.sbnProcurarVendedorClick(Sender: TObject);
begin
  inherited;
  TipoConsulta := cpcVENDEDOR;
  InternoPesquisar(flkVendedor, ctVENDEDORES);
end;

function TfrmCadastroProdutosContratoTroca.TabelaDePesquisa: TZDataSet;
begin
  if TipoConsulta = cpcPRODUTOS then
    Result := dtmTrocaMercadorias.TabelaConsultaProdutos
  else if TipoConsulta = cpcFILIAIS then
    Result := dtmTrocaMercadorias.TabelaConsultaFilialProduto
  else if TipoConsulta = cpcRESERVAS then
    Result := dtmTrocaMercadorias.TabelaConsultaReservas
  else if TipoConsulta = cpcVENDEDOR then
    Result := dtmTrocaMercadorias.TabelaConsultaVendedores
  else
    Result := nil
end;

procedure TfrmCadastroProdutosContratoTroca.edtQtdeCopiarExit(Sender: TObject);
begin
  inherited;
  if StrToFloat(edtQtdeCopiar.Text) > StrToFloat(edtQuantidade.Text) then begin
    MensagemAviso('A quantidade à ser copiada não pode ser maior' + #10#13 +
                  'que a quantidade do produto.');
    edtQtdeCopiar.SetFocus;
  end;
end;

procedure TfrmCadastroProdutosContratoTroca.flkFilialMessage(var Msg: String);
begin
  inherited;
  Msg := 'Filial inválida. Verifique se:'        + #13#10 +
         '- está cadastrada ou'     + #13#10 +
         '- está inativa ou' + #13#10 +
         '- se o produto já está incluído no contrato com a mesma filial.'
end;

procedure TfrmCadastroProdutosContratoTroca.AfterScrollLinhaColunaGradeSimilares(
  Sender: TObject);
begin
  dbgSimilares.Columns[2].Title.Caption := dtmTrocaMercadorias.LinhadaGradeSimilares;
  dbgSimilares.Columns[3].Title.Caption := dtmTrocaMercadorias.ColunadaGradeSimilares;
end;

procedure TfrmCadastroProdutosContratoTroca.dbgSimilaresDblClick(
  Sender: TObject);
begin
  inherited;
  dtmTrocaMercadorias.TrocaProdutoContratoporSimilar;
end;

procedure TfrmCadastroProdutosContratoTroca.FormShow(Sender: TObject);
begin
  inherited;
  if (dtmTrocaMercadorias.IncluindoProdutosContratos) and
      ParSistema.AbrirConsultaAutomaticamente then
    sbnConsultaProdutoClick(self);
end;

procedure TfrmCadastroProdutosContratoTroca.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_Return: if Shift = [] then begin
                 if ActiveControl = flkCodigoProduto then
                   edtQuantidade.SetFocus
                 else if ActiveControl.Parent = rgbEntrega then begin
                   if sbnSalvar.Enabled then
                     InternoGravar;
                 end
                 else inherited;
               end;
    else inherited;
  end
end;

procedure TfrmCadastroProdutosContratoTroca.flkCodigoProdutoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
//  lblCodigoProduto.Caption := flkCodigoProduto.FParameterLabel;
end;

end.

