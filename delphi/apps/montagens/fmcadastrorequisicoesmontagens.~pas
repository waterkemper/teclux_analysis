unit fmcadastrorequisicoesmontagens;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmcadastropadrao, ComCtrls, Buttons, ExtCtrls, DBCtrls,
  Mask, Grids, DBGrids, ActnList, Windows, DB,
  // constantes
  ctconstantes, biblio,
  // Terceiros
  ZQuery, ZPgSqlQuery,
  // Componentes
  cpdbtext, cpdbfindcontrols, cpdbdata, cptexto, cpdbgrid, cppagecontrol, cpdbmemo,
  cpnumero, cpquery, cpeditioncontrolvalidation,
  // Repositorio
  frendereco, frenderecoeditor, frtelefone, frfoneramal, fmConsultaBasica,
  fmConsultaporCampo, clparametrossistema,
  // Projeto
  dmcadastrorequisicoesmontagens, fmcadastrorequisicoesitensmontagens,
  ToolWin;

type
  TfrmCadastroRequisicoesMontagens = class(TfrmCadastroPadrao)
    gbxRequisicoesMontagens: TGroupBox;
    gbxItensRequisicoes: TGroupBox;
    pgcRequisicoes: TtecPageControl;
    tstRequisicao: TTabSheet;
    tstEnderecoEntrega: TTabSheet;
    fraEnderecoEditor1: TfraEnderecoEditor;
    sbnProcurarMontador: TSpeedButton;
    sbnProcuraFilialdeMontagem: TSpeedButton;
    sbnProcuraVendedor: TSpeedButton;
    sbnProcurarCliente: TSpeedButton;
    flkMontador: TtecDBFindLookup;
    dtxRazaoMontador: TtecDBText;
    flkFilialdeMontagem: TtecDBFindLookup;
    dtxNomeFilialdeMontagem: TtecDBText;
    flkVendedor: TtecDBFindLookup;
    dtxNomeVendedor: TtecDBText;
    flkCliente: TtecDBFindLookup;
    dtxNomeCliente: TtecDBText;
    gbxObservacoesItens: TGroupBox;
    mmoObservacoes: TtecDBMemo;
    sbnIncluirProduto: TSpeedButton;
    sbnExcluirProduto: TSpeedButton;
    fraFoneRamal1: TfraFoneRamal;
    edfNumero: TtecDbEditFind;
    edtDataAbertura: TDBEditData;
    dtxDataHora: TtecDBText;
    pgcNotasCupons: TtecPageControl;
    tstNotasFiscais: TTabSheet;
    sbnFilialNota: TSpeedButton;
    dtxFilialNota: TtecDBText;
    tstCuponsFiscais: TTabSheet;
    sbnFilialCupon: TSpeedButton;
    dtxFilialCupon: TtecDBText;
    flkFilialEmissaoCupom: TtecDBFindLookup;
    edtECF: TDBEditNumero;
    edtIntervensao: TDBEditNumero;
    sbnProcuraDadosFiscaisNota: TSpeedButton;
    sbnProcuraDadosFiscaisCupom: TSpeedButton;
    sbnProcuraSeriesFiliais: TSpeedButton;
    flkFilialEmissaoNota: TtecDBFindLookup;
    edfCupomFiscal: TtecDbEditFind;
    tstObservacoes: TTabSheet;
    gbxObservacao: TGroupBox;
    mmoObservacoesRequisicoes: TtecDBMemo;
    edfNotaFiscal: TtecDbEditFind;
    flkSerie: TtecDBFindLookup;
    sbnImprimir: TSpeedButton;
    gbxSituacao: TGroupBox;
    dtxSituacaoMontagem: TtecDBText;
    dtxSituacaoPagto: TtecDBText;
    AclAbilitar: TActionList;
    actabilitar: TAction;
    dtxContrato: TtecDBText;
    dtxFaturamento: TtecDBText;
    dbgRequisicoesItens: TtecDBGrid;
    gbxNrRequisicao: TGroupBox;
    gbxAbertura: TGroupBox;
    gbxEmissao: TGroupBox;
    gbxFilialMontagem: TGroupBox;
    gbxMontador: TGroupBox;
    gbxVendedor: TGroupBox;
    gbxClientes: TGroupBox;
    gbxContrato: TGroupBox;
    gbxFaturamento: TGroupBox;
    gbxMontagem: TGroupBox;
    gbxPagamento: TGroupBox;
    gbxFilialNota: TGroupBox;
    gbxSerie: TGroupBox;
    gbxNrNota: TGroupBox;
    gbxFililalCupom: TGroupBox;
    gbxECF: TGroupBox;
    gbxIntervencao: TGroupBox;
    gbxNrCupom: TGroupBox;
    procedure sbnProcuraVendedorClick(Sender: TObject);
    procedure sbnProcurarClienteClick(Sender: TObject);
    procedure sbnProcurarMontadorClick(Sender: TObject);
    procedure sbnProcuraFilialdeMontagemClick(Sender: TObject);
    procedure sbnIncluirProdutoClick(Sender: TObject);
    procedure dbgRequisicoesItensDblClick(Sender: TObject);
    procedure dbgRequisicoesItensKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sbnExcluirProdutoClick(Sender: TObject);
    procedure sbnFilialNotaClick(Sender: TObject);
    procedure sbnFilialCuponClick(Sender: TObject);
    procedure sbnProcuraDadosFiscaisNotaClick(Sender: TObject);
    procedure sbnProcuraDadosFiscaisCupomClick(Sender: TObject);
    procedure sbnProcuraSeriesFiliaisClick(Sender: TObject);
    procedure edtECFExit(Sender: TObject);
    procedure edtIntervensaoExit(Sender: TObject);
    procedure flkFilialEmissaoNotaExit(Sender: TObject);
    procedure flkFilialEmissaoCupomExit(Sender: TObject);
    procedure edfNumeroFound(Found: Boolean);
    procedure edfNotaFiscalFound(Found: Boolean);
    procedure flkSerieExit(Sender: TObject);
    procedure sbnImprimirClick(Sender: TObject);
    procedure actabilitarUpdate(Sender: TObject);
    procedure edfNotaFiscalExit(Sender: TObject);
    procedure fraEnderecoEditor1sbnRuaClick(Sender: TObject);
    procedure edfCupomFiscalExit(Sender: TObject);
  private
    procedure AfterScrollLinhaColunaGrade(Sender: TObject);
  protected
    function  InternoIncluir: Boolean; override;
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoPesquisar(Titulo:String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
    function  PermitirProcura: Boolean;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  IncluirEditarRequisicoesItens(Editar: Boolean): Boolean;
    function  TituloPesquisa(Tipo: TipoProcuraRequisicoes): String;
    function  InternoIncluirSimilar: Boolean;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmCadastroRequisicoesMontagens: TfrmCadastroRequisicoesMontagens;
  ControleValido: TWinControl;
  TipoProcura: TipoProcuraRequisicoes;


implementation

{$R *.dfm}
{ TfrmCadastroRequisicoesMontagens }

constructor TfrmCadastroRequisicoesMontagens.Create(AOwner: TComponent);
begin
  dtmCadastroRequisicoesMontagens:= TdtmCadastroRequisicoesMontagens.Create(Self);
  inherited;
  DataSet:= dtmCadastroRequisicoesMontagens.TabelaRequisicoes;
  dbgRequisicoesItens.Columns[3].Visible := ParSistema.UsarGradesProdutos;
  dbgRequisicoesItens.Columns[4].Visible := ParSistema.UsarGradesProdutos;
  dtmCadastroRequisicoesMontagens.OnScrollLinhaColunaGrade := AfterScrollLinhaColunaGrade;
  dbgRequisicoesItens.Columns[5].Width := length(ParSistema.MascaraQuantidade)*7;
end;

destructor TfrmCadastroRequisicoesMontagens.Destroy;
begin
  dtmCadastroRequisicoesMontagens:=nil;
  inherited;
  frmCadastroRequisicoesMontagens:=nil;
end;

function TfrmCadastroRequisicoesMontagens.InternoExcluir: Boolean;
begin
  Result := false;
  if not ctrlon then begin
    Result:= inherited InternoExcluir;
    if result then
      dtmCadastroRequisicoesMontagens.ExcluirRequisicoes;
  end;
end;

function TfrmCadastroRequisicoesMontagens.InternoGravar: Boolean;
Var
  CondicaoNota, CondicaoCupom: Boolean;
begin
 Result:= inherited InternoGravar;
 if Result then begin
   with dtmCadastroRequisicoesMontagens do begin
     CondicaoNota := (((flkFilialEmissaoNota.Text <> '') or
                     (flkSerie.Text <> '') or
                     (edfNotaFiscal.Text <> '')) and
                     (pgcNotasCupons.ActivePage = tstNotasFiscais)) or
                     (RequisicoesDadoFiscal <> 0);
     CondicaoCupom:= (((flkFilialEmissaoCupom.Text <> '') or
                     (edtECF.Text <> '') or
                     (edtIntervensao.Text <> '') or
                     (edfCupomFiscal.Text <> '')) and
                     (pgcNotasCupons.ActivePage = tstCuponsFiscais)) or
                     (RequisicoesDadoFiscal <> 0);
     if (pgcNotasCupons.ActivePage = tstNotasFiscais) then begin
       qryRequisicoesfilialemissao.Required := CondicaoNota;
       qryRequisicoesserie.Required         := CondicaoNota;
       qryRequisicoesnotafiscal.Required    := CondicaoNota;
       qryRequisicoescupomfiscal.Required   := False;
       qryRequisicoesmaquina.Required       := False;
       qryRequisicoesintervensao.Required   := False;
     end
     else begin
       qryRequisicoesfilialemissao.Required := CondicaoCupom;
       qryRequisicoesserie.Required         := False;
       qryRequisicoesnotafiscal.Required    := False;
       qryRequisicoescupomfiscal.Required   := CondicaoCupom;
       qryRequisicoesmaquina.Required       := CondicaoCupom;
       qryRequisicoesintervensao.Required   := CondicaoCupom;
     end;
     GravarRequisicoes;
   end;
 end;
end;

function TfrmCadastroRequisicoesMontagens.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if not CtrlOn then
    if Result then begin
      dtmCadastroRequisicoesMontagens.IncluirRequisicoes;
      if pgcNotasCupons.ActivePageIndex = 0 then
           flkFilialEmissaoNota.SetFocus
      else flkFilialEmissaoCupom.SetFocus;
      edtDataAbertura.SetFocus;
    end;
end;

function TfrmCadastroRequisicoesMontagens.InternoPesquisar(Titulo: String): Integer;
begin
  Result := mrNone;
  if PermitirProcura then begin
    with dtmCadastroRequisicoesMontagens do begin
      AbreTabelaPesquisa(tipoprocura);
      Titulo := TituloPesquisa(tipoprocura);
      Result:= Inherited InternoPesquisar(Titulo);
      if Result = mrOK then
        Selecionar(tipoProcura);
        FechaTabelaPesquisa(tipoprocura);
    end;
  end;
end;

function TfrmCadastroRequisicoesMontagens.JanelaPesquisa: TfrmConsultaBasica;
var
  Jan: TfrmConsultaPorCampo;
begin
  Jan := TfrmConsultaPorCampo.Create(nil);
  Jan.ConsultaInterativa := Not (TipoProcura in [tpRequisicoesClientes]) and CtrlOn;
  Jan.UsarParametrosDaTabela := Not (TipoProcura in [tpRequisicoesVendedores,
                                                     tpRequisicoesDadosFiscaisNota]) and CtrlOn;
  Result := Jan
end;

function TfrmCadastroRequisicoesMontagens.PermitirProcura: Boolean;
begin
  Result := True;
  if CtrlOn then begin
    if flkVendedor.Focused then begin
      Result := True;
      tipoProcura := tpRequisicoesVendedores;
    end
    else if flkMontador.Focused then begin
      Result := True;
      tipoProcura := tpRequisicoesMontadores;
    end
    else if flkFilialdeMontagem.Focused then begin
      Result := True;
      tipoProcura := tpRequisicoesFiliaisdeMontagem;
    end
    else if flkCliente.Focused then begin
      Result := True;
      tipoProcura := tpRequisicoesClientes;
    end
    else if flkFilialEmissaoNota.Focused then begin
      Result := True;
      tipoProcura := tpRequisicoesFilialEmissaoNota;
    end
    else if flkFilialEmissaoCupom.Focused then begin
      Result := True;
      tipoProcura := tpRequisicoesFilialEmissaoCupom;
    end
    else if flkSerie.Focused then begin
      Result := True;
      tipoProcura := tpRequisicoesSerie;
    end
    else if edfNotaFiscal.Focused then begin
      Result := True;
      tipoProcura := tpRequisicoesDadosFiscaisNota;
    end
    else if edfCupomFiscal.Focused then begin
      Result := True;
      tipoProcura := tpRequisicoesDadosFiscaisCupom;
    end;
  end
  else TipoProcura := tpRequisicoesMontagem;
end;

procedure TfrmCadastroRequisicoesMontagens.sbnProcuraVendedorClick(Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkVendedor, ctVENDEDORES)
end;

function TfrmCadastroRequisicoesMontagens.TabelaDePesquisa: TZDataSet;
begin
  Result := inherited TabelaDePesquisa;
    with dtmCadastroRequisicoesMontagens do
      case tipoprocura of
        tpRequisicoesMontagem           : Result := ConsultaRequisicoes;
        tpRequisicoesVendedores         : Result := ConsultaVendedores;
        tpRequisicoesMontadores         : Result := ConsultaMontadores;
        tpRequisicoesDadosFiscaisNota   : Result := ConsultaDadosFiscaisNotas;
        tpRequisicoesDadosFiscaisCupom  : Result := ConsultaDadosFiscaisCupons;
        tpRequisicoesFiliaisdeMontagem,
        tpRequisicoesFilialEmissaoNota,
        tpRequisicoesFilialEmissaoCupom : Result := ConsultaFiliaisdeMontagem;
        tpRequisicoesClientes           : Result := ConsultaClientes;
        tpRequisicoesSerie              : Result := ConsultaSeriesFiliais;
      end;
end;

procedure TfrmCadastroRequisicoesMontagens.sbnProcurarClienteClick(Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkCliente, ctCLIENTES)
end;

procedure TfrmCadastroRequisicoesMontagens.sbnProcurarMontadorClick(Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkMontador, ctMONTADORES)
end;

procedure TfrmCadastroRequisicoesMontagens.sbnProcuraFilialdeMontagemClick(Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkFilialdeMontagem, ctFILIAIS)
end;

function TfrmCadastroRequisicoesMontagens.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  with dtmCadastroRequisicoesMontagens do
  if CtrlOn then
    case tipoprocura of
      tpRequisicoesDadosFiscaisNota   : Result := ExisteDadoFiscalNota(NomeCampo, Value);
      tpRequisicoesDadosFiscaisCupom  : Result := ExisteDadoFiscalCupom(NomeCampo, Value);
      tpRequisicoesVendedores         : Result := ExisteVendedor(NomeCampo, Value);
      tpRequisicoesMontadores         : Result := ExisteMontador(NomeCampo, Value);
      tpRequisicoesFiliaisdeMontagem,
      tpRequisicoesFilialEmissaoNota,
      tpRequisicoesFilialEmissaoCupom : Result := ExisteFilialdeMontagem(NomeCampo, Value);
      tpRequisicoesClientes           : Result := ExisteCliente(NomeCampo, Value);
      tpRequisicoesSerie              : Result := ExisteSeriesFiliais(NomeCampo, Value)
      else                              Result := False
    end
  else Result := ExisteRequisicoes(NomeCampo, Value);
end;

procedure TfrmCadastroRequisicoesMontagens.sbnIncluirProdutoClick(Sender: TObject);
begin
  inherited;
  IncluirEditarRequisicoesItens(False);
end;

procedure TfrmCadastroRequisicoesMontagens.dbgRequisicoesItensDblClick(Sender: TObject);
begin
  inherited;
  IncluirEditarRequisicoesItens(True)
end;

procedure TfrmCadastroRequisicoesMontagens.dbgRequisicoesItensKeyDown(Sender: TObject;
          var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Shift = [ssCtrl]) then
    case key of
      TeclaEditarRegistro : IncluirEditarRequisicoesItens(True);
      TeclaInserirRegistro: begin
                              if sbnIncluirProduto.Enabled then
                              IncluirEditarRequisicoesItens(False);
                            end;
   end;
end;

function TfrmCadastroRequisicoesMontagens.TituloPesquisa(Tipo: TipoProcuraRequisicoes): String;
begin
  case tipo of
    tpRequisicoesMontagem           : Result := ctREQUISICOES;
    tpRequisicoesVendedores         : Result := ctVENDEDORES;
    tpRequisicoesMontadores         : Result := ctMONTADORES;
    tpRequisicoesDadosFiscaisNota   : Result := ctNOTASFISCAIS;
    tpRequisicoesDadosFiscaisCupom  : Result := ctCUPONSFISCAIS;
    tpRequisicoesFiliaisdeMontagem,
    tpRequisicoesFilialEmissaoNota,
    tpRequisicoesFilialEmissaoCupom : Result := ctFILIAIS;
    tpRequisicoesClientes           : Result := ctCLIENTES;
    tpRequisicoesSerie              : Result := ctSERIES;
  end;
end;

procedure TfrmCadastroRequisicoesMontagens.sbnExcluirProdutoClick(Sender: TObject);
begin
  inherited;
  dtmCadastroRequisicoesMontagens.ExcluirRequisicoesItens
end;

procedure TfrmCadastroRequisicoesMontagens.sbnFilialNotaClick(Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkFilialEmissaoNota, ctFILIAIS)
end;

procedure TfrmCadastroRequisicoesMontagens.sbnFilialCuponClick(Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkFilialEmissaoCupom, ctFILIAIS)
end;

procedure TfrmCadastroRequisicoesMontagens.sbnProcuraDadosFiscaisNotaClick(Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfNotaFiscal, ctNOTASFISCAIS);
end;

procedure TfrmCadastroRequisicoesMontagens.sbnProcuraDadosFiscaisCupomClick(Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfCupomFiscal, ctCUPONSFISCAIS);
end;

procedure TfrmCadastroRequisicoesMontagens.sbnProcuraSeriesFiliaisClick(Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkSerie, ctSERIES);
end;

procedure TfrmCadastroRequisicoesMontagens.edtECFExit(Sender: TObject);
begin
inherited;
 with dtmCadastroRequisicoesMontagens do
   if edtECF.Text <> '' then
        ParametroECF:= edtECF.Text
   else ParametroECF:= '';
end;

procedure TfrmCadastroRequisicoesMontagens.edtIntervensaoExit(Sender: TObject);
begin
  inherited;
  with dtmCadastroRequisicoesMontagens do
    if edtIntervensao.Text <> '' then
         ParametroIntervensao:=edtIntervensao.Text
    else ParametroIntervensao:='';
end;

procedure TfrmCadastroRequisicoesMontagens.flkFilialEmissaoNotaExit(Sender: TObject);
begin
  inherited;
  with dtmCadastroRequisicoesMontagens do
    if flkFilialEmissaoNota.Text <> '' then
         ParametroFilialEmissaoNota:= flkFilialEmissaoNota.Text
    else ParametroFilialEmissaoNota:= '';
end;

procedure TfrmCadastroRequisicoesMontagens.flkFilialEmissaoCupomExit(Sender: TObject);
begin
  inherited;
  with dtmCadastroRequisicoesMontagens do
    if flkFilialEmissaoCupom.Text <> '' then
         ParametroFilialEmissaoCupom:= flkFilialEmissaoCupom.Text
    else ParametroFilialEmissaoCupom:= '';
end;

function TfrmCadastroRequisicoesMontagens.IncluirEditarRequisicoesItens(Editar: Boolean): Boolean;
begin
  Result := False;
  if not Assigned (frmCadastroRequisicoesitensmontagens) then
    frmcadastrorequisicoesitensmontagens:=TfrmCadastroRequisicoesItensMontagens.create(frmcadastrorequisicoesitensmontagens);
  with frmcadastrorequisicoesitensmontagens do
  begin
    SetDataModulo(dtmCadastroRequisicoesMontagens);
    DataSet := dtmCadastroRequisicoesMontagens.TabelaRequisicoesItens;

    if Editar and not dtmCadastroRequisicoesMontagens.TabelaRequisicoesItens.IsEmpty then
         Result := dtmCadastroRequisicoesMontagens.EditarRequisicoesItens
    else Result := dtmCadastroRequisicoesMontagens.IncluirRequisicoesItens;
    if Result then begin
      flkProduto.Exist;
      flkFilialProduto.Exist;
      flkTabeladeMontagem.Exist;
      aclAbilitaUpdate(Self);
      ShowModal;
      free;
    end;
  end;
end;

function TfrmCadastroRequisicoesMontagens.InternoIncluirSimilar: Boolean;
begin
  if dtmCadastroRequisicoesMontagens.QtdadeProdutos = 0 then
     Result := False
  else begin
    Result := inherited InternoIncluir;
    if CtrlOn and dbgRequisicoesItens.Focused then
      Result := IncluirEditarRequisicoesItens(True)
  end
end;

procedure TfrmCadastroRequisicoesMontagens.edfNumeroFound(Found: Boolean);
begin
  inherited;
  if found then
    with dtmCadastroRequisicoesMontagens do begin
      PassarParametroTipo;
      PassarParametrosInativo;
      flkMontador.Exist;
      flkCliente.Exist;
      flkVendedor.Exist;
      if (RequisicoesCupom <> '') and (RequisicoesNota = '') then
        pgcNotasCupons.ActivePage := tstCuponsFiscais
      else
        pgcNotasCupons.ActivePage := tstNotasFiscais;
    end;
end;

procedure TfrmCadastroRequisicoesMontagens.edfNotaFiscalFound(Found: Boolean);
begin
 inherited;
 with dtmCadastroRequisicoesMontagens do begin
   if found then
     if not AtualizaItensRequisicoesNotas(flkFilialEmissaoNota.Text, flkserie.Text, edfNotaFiscal.Text) then begin
       RequisicoesNota:= '';
       edfNotaFiscal.SetFocus;
     end;
   end;
end;

procedure TfrmCadastroRequisicoesMontagens.flkSerieExit(Sender: TObject);
begin
  inherited;
  with dtmCadastroRequisicoesMontagens do
    if flkSerie.Text <> '' then
         ParametroSerie:= flkSerie.Text
    else ParametroSerie:= '';
end;

procedure TfrmCadastroRequisicoesMontagens.sbnImprimirClick(Sender: TObject);
begin
  inherited;
  dtmCadastroRequisicoesMontagens.imprimirRequisicao;
end;

procedure TfrmCadastroRequisicoesMontagens.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_F7     : if sbnImprimir.Enabled then
                   sbnImprimir.Click;
    VK_ESCAPE : with dtmCadastroRequisicoesMontagens do begin
                   passarparametrotipo;
                   passarparametrosInativo;
                   flkMontador.Exist;
                   flkCliente.Exist;
                   flkVendedor.Exist;
                 end;
  end;
end;

procedure TfrmCadastroRequisicoesMontagens.actabilitarUpdate(Sender: TObject);
Var
 RequisicaoVazia, RequisicaoItemVazio, DadoFiscalExistente: Boolean;
begin
  inherited;
  with dtmCadastroRequisicoesMontagens do begin
    DadoFiscalExistente         := RequisicoesDadoFiscal <> 0;
    RequisicaoVazia             := TabelaRequisicoes.IsEmpty;
    RequisicaoItemVazio         := TabelaRequisicoesItens.IsEmpty;
    sbnImprimir.Enabled         := edfNumero.Text <> '';
    if DadoFiscalExistente or RequisicaoVazia then begin
      sbnIncluirProduto.Enabled   := False;
      sbnExcluirProduto.Enabled   := False;
      sbnProcuraVendedor.Enabled  := False;
      sbnProcurarCliente.Enabled  := False;
      flkCliente.Enabled          := False;
      flkVendedor.Enabled         := False;
    end
    else Begin
      sbnIncluirProduto.Enabled   := True;
      sbnExcluirProduto.Enabled   := not PermiteAlterarRequisicaoItem and not RequisicaoItemVazio;
      sbnProcuraVendedor.Enabled  := not PermiteAlterarRequisicao and not RequisicaoVazia;
      sbnProcurarCliente.Enabled  := not PermiteAlterarRequisicao and not RequisicaoVazia;
      flkCliente.Enabled          := True;
      flkVendedor.Enabled         := True;
     end;

    if PermiteAlterarRequisicao or RequisicaoVazia then begin
      sbnExcluir.Enabled                  := False;
      sbnFilialNota.Enabled               := False;
      sbnProcuraSeriesFiliais.Enabled     := False;
      sbnProcuraDadosFiscaisNota.Enabled  := False;
      sbnFilialCupon.Enabled              := False;
      sbnProcuraDadosFiscaisCupom.Enabled := False;
      sbnProcuraFilialdeMontagem.Enabled  := False;
      sbnProcurarMontador.Enabled         := False;
      fraEnderecoEditor1.sbnRua.Enabled   := False;
      fraEnderecoEditor1.sbnBairro.Enabled:= False;
    end
    else begin
      sbnExcluir.Enabled                  := True;
      sbnFilialNota.Enabled               := True;
      sbnProcuraSeriesFiliais.Enabled     := True;
      sbnProcuraDadosFiscaisNota.Enabled  := True;
      sbnFilialCupon.Enabled              := True;
      sbnProcuraDadosFiscaisCupom.Enabled := True;
      sbnProcuraFilialdeMontagem.Enabled  := True;
      sbnProcurarMontador.Enabled         := True;
      fraEnderecoEditor1.sbnRua.Enabled   := True;
      fraEnderecoEditor1.sbnBairro.Enabled:= True;
    end;
  end;
end;

procedure TfrmCadastroRequisicoesMontagens.edfNotaFiscalExit(Sender: TObject);
begin
  inherited;
  with dtmCadastroRequisicoesMontagens do begin
    if edfNotaFiscal.Text <> '' then begin
      if NotaFiscalAlterada(flkFilialEmissaoNota.text,
                            flkSerie.Text,
                            edfNotaFiscal.text) then
      if not AtualizaItensRequisicoesNotas(flkFilialEmissaoNota.Text, flkserie.Text, edfNotaFiscal.Text) then
        edfNotaFiscal.SetFocus
      else begin
        flkMontador.Exist;
        flkCliente.Exist;
      end;
    end;
  end;
end;

procedure TfrmCadastroRequisicoesMontagens.fraEnderecoEditor1sbnRuaClick(Sender: TObject);
begin
  inherited;
  fraEnderecoEditor1.sbnRuaClick(Sender);
end;

procedure TfrmCadastroRequisicoesMontagens.edfCupomFiscalExit(Sender: TObject);
begin
  inherited;
  with dtmCadastroRequisicoesMontagens do begin
    if edfCupomFiscal.Text<>'' then
      if CupomFiscalAlterado(flkFilialEmissaoCupom.text, edtECF.Text, edtIntervensao.Text, edfCupomFiscal.text) then
      begin
        if not AtualizaItensRequisicoesCupons(flkFilialEmissaoCupom.Text, edtECF.Text, edtIntervensao.Text, edfCupomFiscal.Text) then
          edfCupomFiscal.SetFocus
        else
        begin
          flkMontador.Exist;
          flkCliente.Exist;
        end;
      end;
  end;
end;

procedure TfrmCadastroRequisicoesMontagens.AfterScrollLinhaColunaGrade(
  Sender: TObject);
begin
 dbgRequisicoesItens.columns[3].title.Caption := dtmcadastrorequisicoesmontagens.LinhadaGrade;
 dbgRequisicoesItens.columns[4].title.caption := dtmcadastrorequisicoesmontagens.ColunadaGrade;
end;

end.

