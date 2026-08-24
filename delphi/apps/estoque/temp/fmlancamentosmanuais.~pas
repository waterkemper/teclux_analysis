unit fmlancamentosmanuais;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmcadastropadrao, Grids, DBGrids, ComCtrls, StdCtrls, Mask,
  DBCtrls, ExtCtrls, Buttons, Windows, DB, ActnList,
  // Biblio
  ctconstantes, biblio,
  // Terceiros
  ZQuery,
  // Componentes
  cpdbfindcontrols, cptexto, cpdbgrid, cpnumero, cpdbtext, cppagecontrol,
  // Repositorio
  fmconsultabasica, fmconsultaporcampo, fmnavcontroles, clparametrossistema,
  cpdbdata, ToolWin, frConsultaProduto;

type

  TfrmLancamentosManuais = class(TfrmCadastroPadrao)
    gbxLancamento: TGroupBox;
    sbnProcurarTipoMovimento: TSpeedButton;
    GBXTipoMovimento: TGroupBox;
    gbxReferencia: TGroupBox;
    gbxFilialTransferencia: TGroupBox;
    edtReferencia: TDBEditTexto;
    flkTipoMovimento: TtecDBFindLookup;
    flkFilialTransferencia: TtecDBFindLookup;
    sbnProcurarFilialTransferencia: TSpeedButton;
    dtxDescricaoTipoMovimento: TtecDBText;
    pnlFundoJanela: TPanel;
    pgcEstoque: TtecPageControl;
    tstUltimos: TTabSheet;
    dbgUltimo: TtecDBGrid;
    tstQuantidades: TTabSheet;
    dbgEstoqueQuantidade: TtecDBGrid;
    tstValores: TTabSheet;
    dbgEstoqueCustos: TtecDBGrid;
    sbnProcurarFilial: TSpeedButton;
    gbxFilial: TGroupBox;
    flkFilial: TtecDBFindLookup;
    dtxNomeFilial: TtecDBText;
    gbxValores: TGroupBox;
    edtCusto: TDBEditNumero;
    edtPrecoComICMS: TDBEditNumero;
    edtPrecoSemICMS: TDBEditNumero;
    gbxValoresAtuais: TGroupBox;
    edtCustoMedio: TDBEditNumero;
    gbxCustoMedio: TGroupBox;
    gbxValorfinanceiro: TGroupBox;
    edtFinanceiro: TDBEditNumero;
    edtQuantidade: TDBEditNumero;
    gbxPrecocomICMS: TGroupBox;
    edtEstoquePrecoComIcms: TDBEditNumero;
    edtEstoquePrecoSemIcms: TDBEditNumero;
    gbxPrecoSemICMS: TGroupBox;
    dbgExisteEstoque: TtecDBGrid;
    gbxQuantidades: TGroupBox;
    gbxData: TGroupBox;
    edtDataLancamento: TDBEditData;
    edtlUltimaCompra: TDBEditNumero;
    dtxNomeFilialTransf: TtecDBText;
    gbxUltimaCompra: TGroupBox;
    edtUltimaCompra: TDBEditNumero;
    lblQuantidade: TLabel;
    lblValor: TLabel;
    lblPrecoComICMS: TLabel;
    lblPrecoSemICMS: TLabel;
    lblUltimaCompra: TLabel;
    fraConsultaProduto1: TfraConsultaProduto;
    procedure flkTipoMovimentoExit(Sender: TObject);
    procedure sbnProcurarFilialClick(Sender: TObject);
    procedure sbnProcurarFilialTransferenciaClick(Sender: TObject);
    procedure sbnProcurarTipoMovimentoClick(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure edtPrecoSemICMSKeyPress(Sender: TObject; var Key: Char);
    procedure edtCustoKeyPress(Sender: TObject; var Key: Char);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edtlUltimaCompraKeyPress(Sender: TObject; var Key: Char);
    procedure flkCodigoProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    GravacaoConcluida : Boolean;
    procedure CondicaoConsultaItemProdutos;
  protected
    procedure EnabledTRUE_FALSE(Valor: Boolean);
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoIncluir: Boolean; override;
    procedure AlterarEstadoBotoes; override;
    function  InternoPesquisar(Titulo: String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    function  TabelaDePesquisa: TZDataSet; override;
    function  ValidarControles: Boolean;
    procedure ExibirMensagemPadronizadaDataLancto;

  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
  end;

var
  frmLancamentosManuais: TfrmLancamentosManuais;
  TipoPesquisa: TtecLancamentosManuais;

implementation

uses dmlancamentosmanuais;

{$R *.dfm}

constructor TfrmLancamentosManuais.Create(AOwner: TComponent);
var i: byte;
begin
  GravacaoConcluida := true;
  
  dtmLancamentosManuais := TdtmLancamentosManuais.Create(Self);
  inherited;
//  DataSet := dtmLancamentosManuais.TabelaMovimentos;
  DataSet :=dtmLancamentosManuais.qryMovimentos;
  EnabledTRUE_FALSE(False);
  gbxLancamento.SetFocus;
  {
  for i:=0 to dbgExisteEstoque.Columns.Count-1 do
   if dbgExisteEstoque.Columns[i].Width < ParSistema.TamanhoMascaraQuantidade then
     dbgExisteEstoque.Columns[i].Width := ParSistema.TamanhoMascaraQuantidade;


  if dbgUltimo.Columns[3].Width < ParSistema.TamanhoMascaraQuantidade then
    dbgUltimo.Columns[3].Width := ParSistema.TamanhoMascaraQuantidade;
  
    if dbgUltimo.Columns[4].Width < ParSistema.TamanhoMascaraQuantidade then
    dbgUltimo.Columns[4].Width := ParSistema.TamanhoMascaraQuantidade;

  for i:=2 to 8 do
   if dbgEstoqueQuantidade.Columns[i].Width < ParSistema.TamanhoMascaraQuantidade then
    dbgEstoqueQuantidade.Columns[i].Width := ParSistema.TamanhoMascaraQuantidade;
  }
  pgcEstoque.ActivePageIndex := 0;

//  flkCodigoProduto.vCampoPesquisa := nil;

  (*
  if parsistema.PermitirProdutoAlfanumerico then
  begin
//    flkCodigoProduto.LocateParameters := 'produtovisual,codigobarras';
    flkCodigoProduto.LookupParameters := 'produtovisual,codigobarras';
    flkCodigoProduto.Lookupfield   := 'produtovisual';
    flkCodigoProduto.DataField     := 'produtovisual';
    if parsistema.PesquisaPadraoProdutoCodigoBarras then
    begin
      flkCodigoProduto.LookupQueryParameter := 'codigobarras';
//      flkCodigoProduto.LocateQueryParameter := 'codigobarras';
    end
    else
    begin
      flkCodigoProduto.LookupQueryParameter := 'produtovisual';
//      flkCodigoProduto.LocateQueryParameter := 'produtovisual';
    end;
  end
  else
  begin
//    flkCodigoProduto.LocateParameters := 'produto,codigobarras';
    flkCodigoProduto.LookupParameters := 'produto,codigobarras';
    flkCodigoProduto.Lookupfield   := 'produto';
    flkCodigoProduto.DataField     := 'produto';
    if parsistema.PesquisaPadraoProdutoCodigoBarras then
    begin
      flkCodigoProduto.LookupQueryParameter := 'codigobarras';
//      flkCodigoProduto.LocateQueryParameter := 'codigobarras';
    end
    else
    begin
      flkCodigoProduto.LookupQueryParameter := 'produto';
//      flkCodigoProduto.LocateQueryParameter := 'produto';
    end;
  end;

  if(flkCodigoProduto.FParameterLabel<>'') then
    gbxProduto.Caption := flkCodigoProduto.FParameterLabel;

  *)

{

  gbxItemProduto.Caption := flkCodigoProduto.FParameterLabel;


  edtDataLancamento.MensagemPadronizada := ExibirMensagemPadronizadaDataLancto;
  edtDataLancamento.Minimo := dtmLancamentosManuais.NDiasLimiteLancto;

 }


 fraConsultaProduto1.fraConsultaItemProduto.CondicoesdaConsulta :=
   CondicaoConsultaItemProdutos;

 fraConsultaProduto1.fraConsultaItemProduto.qryProcuraItemProdutos.AfterOpen :=
   dtmLancamentosManuais.qryProcuraItemProdutosAfterOpen;

end;

destructor TfrmLancamentosManuais.Destroy;
begin
  dtmLancamentosManuais:=nil;
  inherited;
  frmLancamentosManuais := nil;
end;

procedure TfrmLancamentosManuais.EnabledTRUE_FALSE(Valor: Boolean);
var
  a: Integer;
begin
  for a:= ComponentCount - 1 downto 0 do begin

    if (Components[a] is TtecFindCustom)  or
       (Components[a] is TDBEdit)         or
       (Components[a] is TEdit)           or
       (Components[a] is TtecDBText)      or
       (Components[a] is TDBEditData)     or
       ((Components[a] is TSpeedButton) and
        not ((Components[a].Name = sbnIncluir.Name) or
             (Components[a].Name = sbnSalvar.Name)  or
             (Components[a].Name = sbnAjuda.Name)   or
             (Components[a].Name = sbnExcluir.Name) or
             (Components[a].Name = sbnProcurar.Name)))

    then
      TEdit(Components[a]).Enabled := Valor;
  end;
end;

function TfrmLancamentosManuais.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  with dtmLancamentosManuais do
    case TipoPesquisa of
             lamFILIAIS,
       lamFILIAISTRANSF : Result:= ExisteFilial(NomeCampo, Value);
     lamTIPOSMOVIMENTOS : Result:= ExisteTipoMovimento(NomeCampo, Value);
    else                  Result:= False;
    end;
end;

procedure TfrmLancamentosManuais.flkTipoMovimentoExit(Sender: TObject);
var
habilitado: boolean;
begin
  inherited;
  if(dtmLancamentosManuais.qryMovimentos.state=dsinsert) or
    (dtmlancamentosmanuais.qryMovimentosinsercaocancelada.AsBoolean) then
  begin
      flkFilialTransferencia.Enabled        := dtmLancamentosManuais.Transferencia;
      sbnProcurarFilialTransferencia.Enabled:= dtmLancamentosManuais.Transferencia;

      edtQuantidade.Enabled  := not VerificaOcorrencia(dtmLancamentosManuais.OperacoesMovimento,
                                                       Ord(opEmEstoque),
                                                       Ord(opReservaPrevia),
                                                       ['*']);
      if not edtQuantidade.Enabled then
        edtQuantidade.Text := '0';

      edtCusto.Enabled:= not VerificaOcorrencia(dtmLancamentosManuais.OperacoesMovimento,
                                                       Ord(opFinanceiro),
                                                       Ord(opVazio),
                                                       ['*','C']);
      edtPrecoComICMS.Enabled := edtCusto.Enabled;
      edtPrecoSemICMS.Enabled := edtCusto.Enabled;

      habilitado:=  VerificaOcorrencia(dtmLancamentosManuais.OperacoesMovimento,
                                          ord(opUltimaCompra),
                                          ord(opVazio),
                                          ['=']);
      edtPrecoComICMS.Enabled := habilitado;
      edtPrecoSemICMS.Enabled := habilitado;

      if not edtCusto.Enabled and
        (dtmLancamentosManuais.qryMovimentos.State in [dsedit, dsinsert]) then
      begin
        edtPrecoComICMS.Text := '0';
        edtPrecoSemICMS.Text := '0';
        edtCusto.Text        := '0';
      end;

      edtlUltimaCompra.Enabled := not dtmLancamentosManuais.qryMovimentosvalorultimacompra.ReadOnly;
  end;
end;


function TfrmLancamentosManuais.InternoGravar: Boolean;

begin
  Result:= inherited InternoGravar;

  if Result then
  begin

    try
      GravacaoConcluida := False;

      if ValidarControles then
      begin
        if dtmLancamentosManuais.GravarLancamento then
        begin
          EnabledTRUE_FALSE(False);
          dbgUltimo.SetFocus;
        end
        else
          dbgUltimo.SetFocus;
      end;
    finally
      GravacaoConcluida := true;
    end;
  end;

end;

function TfrmLancamentosManuais.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then begin
    EnabledTRUE_FALSE(True);
    flkFilialTransferencia.Enabled := False;
    dtmLancamentosManuais.IncluirLancamento;
    fraConsultaProduto1.fraConsultaItemProduto.edfcodigo.SetFocus;
  end;
end;

function TfrmLancamentosManuais.InternoPesquisar(Titulo: String): Integer;
begin
  Result:= mrNone;
  with dtmLancamentosManuais do begin
    if CtrlOn then
    begin
      if (ActiveControl = flkFilial) and not flkFilial.ReadOnly then begin
        TipoPesquisa:= lamFILIAIS;
        Titulo      := 'Filiais';
      end
      else if (ActiveControl = flkFilialTransferencia) and not flkFilialTransferencia.ReadOnly then begin
        TipoPesquisa:= lamFILIAISTRANSF;
        Titulo      := 'Filiais';
      end
      else if (ActiveControl = flkTipoMovimento) and not flkTipoMovimento.ReadOnly then begin
        TipoPesquisa:= lamTIPOSMOVIMENTOS;
        Titulo      := 'Tipos Movimentos';
      end
      else
        TipoPesquisa:= lamNENHUM;

      if TipoPesquisa <> lamNENHUM then begin
        AbrirTabelaPesquisa(TipoPesquisa);
        Result:= inherited InternoPesquisar(Titulo);
        if Result = mrOK then
          Selecionar(TipoPesquisa);
        FecharTabelaPesquisa(TipoPesquisa);
      end;
    end
  end;
end;

function TfrmLancamentosManuais.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  if TipoPesquisa = lamPRODUTOS then
       TfrmConsultaPorCampo(Result).ConsultaInterativa := False
  else TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
end;

procedure TfrmLancamentosManuais.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_Escape : begin
                   gbxLancamento.SetFocus;
                   dtmLancamentosManuais.FecharTabelas;
                   EnabledTRUE_FALSE(False);
                 end;
  end;
end;

procedure TfrmLancamentosManuais.sbnProcurarFilialClick(Sender: TObject);
begin
  CtrlOn:= True;
  flkFilial.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmLancamentosManuais.sbnProcurarFilialTransferenciaClick(Sender: TObject);
begin
  CtrlOn:= True;
  flkFilialTransferencia.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmLancamentosManuais.sbnProcurarTipoMovimentoClick(Sender: TObject);
begin
  CtrlOn:= True;
  flkTipoMovimento.SetFocus;
  InternoPesquisar('');
end;

function TfrmLancamentosManuais.TabelaDePesquisa: TZDataSet;
begin
  with dtmLancamentosManuais do
    case TipoPesquisa of
             lamFILIAIS,
    lamFILIAISTRANSF    : Result:= ConsultarFilial;
     lamTIPOSMOVIMENTOS : Result:= ConsultarTipoMovimento;
    else                  Result:= nil;
    end;
end;

function TfrmLancamentosManuais.ValidarControles: Boolean;
begin
  Result := (fraConsultaProduto1.fraConsultaItemProduto.edfcodigo.Text <> '');
  if Result then
    Result:= (flkFilial.Text <> '');
  if Result then
    Result:= (flkTipoMovimento.Text <> '');
  if Result then
    Result:=  not flkFilialTransferencia.Enabled or (flkFilialTransferencia.Text <> '');
  if Result then
    Result:= not edtQuantidade.Enabled or (edtQuantidade.Text <> '');

  if Result then
  begin
    Result:= not edtCusto.Enabled or (edtCusto.Text <> '');

    if edtCusto.Enabled then
    begin
      if (dtmLancamentosManuais.qryMovimentosvalor.asCurrency = 0) and
         (parsistema.Nao_permitir_financeiro_zerado_quando_M_ou_m) then
      begin
        result := false;
        edtCusto.setfocus;
        MensagemAviso('O Campo valor não pode estar zerado '+ #10#13 + 'para operações com + ou - no financeiro');
      end;
    end;
  end;

  if result then
  begin
    if (dtmLancamentosManuais.qryMovimentosquantidade.asfloat = 0) and
       ((pos('+',copy(dtmLancamentosManuais.qryProcuraTiposMovimentosoperacao.asString,1,9))<>0) or
        (pos('-',copy(dtmLancamentosManuais.qryProcuraTiposMovimentosoperacao.asString,1,9))<>0) or
        (pos('+',copy(dtmLancamentosManuais.qryProcuraTiposMovimentosoperacao.asString,16,2))<>0) or
        (pos('-',copy(dtmLancamentosManuais.qryProcuraTiposMovimentosoperacao.asString,16,2))<>0)) then
    begin
      result := False;
      edtQuantidade.setfocus;
      edtQuantidade.selectall;
      MensagemAviso('O campo Quantidade não pode estar zerado '+ #10#13 + 'para operações com + ou - nas quantidades');
    end;


  end;

  if Result then
    Result:= not edtPrecoComICMS.Enabled or (edtPrecoComICMS.Text <> '');
  if Result then
    Result:= not edtPrecoSemICMS.Enabled or (edtPrecoSemICMS.Text <> '');
  if Result then
    Result := edtDataLancamento.Text <> '';

  if not Result then
      MensagemAviso('Os controles devem ser preenchidos com' + #10#13 +
                     'uma informação válida.');
 { else
  begin
    if flkFilial.Text = flkFilialTransferencia.text then
    result := MensagemConfirmacao('A filial de transferência informada é a mesma da filial de origem, confirma mesmo assim?') = smbOk
  end;}

end;

procedure TfrmLancamentosManuais.edtQuantidadeExit(Sender: TObject);
begin
  inherited;
  if (edtCusto.Enabled) and (edtQuantidade.ValorSemFormatacao>=0) then
  begin
    if (edtCustoMedio.ValorSemFormatacao>0) then
      edtCusto.Text:=FloattoStr(edtCustoMedio.ValorSemFormatacao*edtQuantidade.ValorSemFormatacao)
    else
    if (edtUltimaCompra.ValorSemFormatacao>0) then
      edtCusto.Text:=FloattoStr(edtUltimaCompra.ValorSemFormatacao*edtQuantidade.ValorSemFormatacao)
    else
    if(edtEstoquePrecoComIcms.ValorSemFormatacao>0) then
      edtCusto.Text:=FloatToStr(edtEstoquePrecoComIcms.ValorSemFormatacao*edtQuantidade.ValorSemFormatacao)
    else
      edtCusto.Text:=FloatToStr(edtEstoquePrecoSemIcms.ValorSemFormatacao*edtQuantidade.ValorSemFormatacao);
  end;
end;
procedure TfrmLancamentosManuais.edtPrecoSemICMSKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key=#13 then
  begin
    if not edtlUltimaCompra.Enabled then
      InternoGravar;
  end;

end;

procedure TfrmLancamentosManuais.edtCustoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key=#13 then
  begin
    if not edtPrecoComICMS.Enabled then
      InternoGravar;
  end;
end;

procedure TfrmLancamentosManuais.edtQuantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key=#13 then
  begin
    if not edtCusto.Enabled then
      InternoGravar;
  end;
end;

procedure TfrmLancamentosManuais.ExibirMensagemPadronizadaDataLancto;
begin
  if strtodate(edtDataLancamento.Text) <= ParSistema.DataContabil then
    MensagemAviso(format(ctDATACONTABILMAIORDATALANCTO, ['de lançamento',
                     edtDataLancamento.Text, 'contábil', ParSistema.DataContabilstring]));
end;

procedure TfrmLancamentosManuais.edtlUltimaCompraKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key=#13 then
    InternoGravar;

end;

procedure TfrmLancamentosManuais.flkCodigoProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
{  gbxProduto.Caption := flkCodigoProduto.FParameterLabel;}
end;

procedure TfrmLancamentosManuais.AlterarEstadoBotoes;
begin
  inherited;

  sbnIncluir.Enabled  := DataSet.Active and (Dataset.State = dsBrowse) and GravacaoConcluida ;
  sbnProcurar.Enabled := sbnIncluir.Enabled and GravacaoConcluida;
  sbnExcluir.Enabled  := DataSet.Active and not DataSet.IsEmpty and GravacaoConcluida;
  sbnSalvar.Enabled   := (DataSet.State in [dsEdit, dsInsert]) and GravacaoConcluida;

end;

procedure TfrmLancamentosManuais.CondicaoConsultaItemProdutos;
begin
  if not parsistema.lancamentos_avulsos_de_produtos_compostos then
  begin
    fraConsultaProduto1.fraConsultaItemProduto.qryProcuraItemProdutos.macrobyname('SQLCondicaoCompostos').AsString :=
       ' and not (coalesce(c.composto,false)) ';
    fraConsultaProduto1.fraConsultaItemProduto.qryConsultaItemProdutos.macrobyname('SQLCondicaoCompostos').AsString :=
       ' and not (coalesce(c.composto,false)) ';
  end
  else
  begin
    fraConsultaProduto1.fraConsultaItemProduto.qryProcuraItemProdutos.macrobyname('SQLCondicaoCompostos').AsString := '';
    fraConsultaProduto1.fraConsultaItemProduto.qryConsultaItemProdutos.macrobyname('SQLCondicaoCompostos').AsString := '';
  end;
end;

end.



