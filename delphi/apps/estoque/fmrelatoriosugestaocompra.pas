unit fmrelatoriosugestaocompra;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmrelatoriopadrao, StdCtrls, ExtCtrls, DBCtrls, cpdbtext, Mask,
  cpdbfindcontrols, ComCtrls, cppagecontrol, Buttons,
  fmconsultabasica, fmconsultaporcampo, ZQuery, ctconstantes, biblio,
  cpnumero, CheckLst, ToolWin;

type
  TfrmRelatorioSugestaoCompra = class(TFrmRelatorioPadrao)
    gbxParametros: TGroupBox;
    pgcProdutos: TtecPageControl;
    tstProdutos: TTabSheet;
    sbnConsultaProdutosInicial: TSpeedButton;
    edfProdutoInicial: TtecDbEditFind;
    dtxProdutoInicial: TtecDBText;
    tstGrupodeProdutos: TTabSheet;
    sbnConsultaGrupoProdutoInicial: TSpeedButton;
    edfGrupoProdutoInicial: TtecDbEditFind;
    dtxGrupoProdutoInicial: TtecDBText;
    tstClasses: TTabSheet;
    sbnConsultaClasseInicial: TSpeedButton;
    edfClasseInicial: TtecDbEditFind;
    dtxClasseInicial: TtecDBText;
    rgpOrdenacao: TRadioGroup;
    gbxAgrupamento: TGroupBox;
    ckbAgruparGrupoFilial: TCheckBox;
    ckbAgruparFilial: TCheckBox;
    ckbAgruparClasseProduto: TCheckBox;
    ckbAgruparGrupoProduto: TCheckBox;
    ckbAgruparProduto: TCheckBox;
    gbxIncluirItens: TGroupBox;
    ckbSemEstoqueMinimo: TCheckBox;
    ckbSemMovimentacaodeEstoque: TCheckBox;
    ckbSemSugestaoCompra: TCheckBox;
    gbxEstoque: TGroupBox;
    ckbemEstoque: TCheckBox;
    ckbReservado: TCheckBox;
    ckbTransito: TCheckBox;
    ckbDemonstracao: TCheckBox;
    ckbConserto: TCheckBox;
    ckbDanificada: TCheckBox;
    gbxTipodeRelatorio: TGroupBox;
    ckbImprimirDetalhes: TCheckBox;
    gbxAcimaMinimo: TGroupBox;
    edtPercentual: TEditNumero;
    lblProdutoInicial: TLabel;
    sbnConsultaProdutosFinal: TSpeedButton;
    edfProdutoFinal: TtecDbEditFind;
    dtxProdutoFinal: TtecDBText;
    lblProdutoFinal: TLabel;
    gbxFiliais: TGroupBox;
    sbnMarcarFiliais: TSpeedButton;
    sbnDesmarcarFiliais: TSpeedButton;
    clbFiliais: TCheckListBox;
    gbxGrupodeFiliais: TGroupBox;
    sbnmarcarGrupodeFiliais: TSpeedButton;
    sbnDesmarcarGrupodeFiliais: TSpeedButton;
    clbGrupodeFiliais: TCheckListBox;
    lblGrupoProdutoInicial: TLabel;
    lblGrupoProdutoFinal: TLabel;
    edfGrupoProdutoFinal: TtecDbEditFind;
    sbnConsultaGrupoProdutoFinal: TSpeedButton;
    dtxGrupoProdutoFinal: TtecDBText;
    edfClasseFinal: TtecDbEditFind;
    sbnConsultaClasseFinal: TSpeedButton;
    dtxClasseFinal: TtecDBText;
    lblClasseProdutoInicial: TLabel;
    lblClasseProdutoFinal: TLabel;
    rgpSelecao: TRadioGroup;
    procedure sbnConsultaProdutosInicialClick(Sender: TObject);
    procedure sbnConsultaGrupoProdutoInicialClick(Sender: TObject);
    procedure sbnConsultaClasseInicialClick(Sender: TObject);
    procedure pgcProdutosChange(Sender: TObject);
    procedure sbnMarcarFiliaisClick(Sender: TObject);
    procedure sbnDesmarcarFiliaisClick(Sender: TObject);
    procedure sbnmarcarGrupodeFiliaisClick(Sender: TObject);
    procedure sbnDesmarcarGrupodeFiliaisClick(Sender: TObject);
    procedure sbnConsultaProdutosFinalClick(Sender: TObject);
    procedure sbnConsultaGrupoProdutoFinalClick(Sender: TObject);
    procedure sbnConsultaClasseFinalClick(Sender: TObject);
    procedure clbFiliaisClickCheck(Sender: TObject);
    procedure clbGrupodeFiliaisClickCheck(Sender: TObject);
  protected
     function InternoPesquisar(Titulo: String): Integer; override;
     function JanelaPesquisa: TfrmConsultaBasica; override;
     function ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
     function TabelaDePesquisa: TZDataSet; override;
     procedure InternoImpressao; Override;
  public
     constructor Create(AOwner: TComponent); override;
     destructor Destroy; override;
     function PesquisaHabilitada: Boolean;
     function TituloPesquisa: String;
     function ValidarCamposSelecao: Boolean;
     procedure MontaPesquisa;
     procedure ObterLista(Origem: TStrings; Destino: TCheckListBox);
  private
    { Private declarations }
  end;

var
  frmRelatorioSugestaoCompra: TfrmRelatorioSugestaoCompra;
  TipoPesquisa: TTecPesquisa;

implementation
uses dmrelatoriosugestaocompra;

{$R *.dfm}

{ TfrmRelatorioSugestaoCompra }

constructor TfrmRelatorioSugestaoCompra.Create(AOwner: TComponent);
begin
  dtmRelatorioSugestaoCompra := TdtmRelatorioSugestaoCompra.Create(Self);
  inherited;
  try
    dtmRelatorioSugestaoCompra.Abre(ctTabelas);
    pgcProdutos.ActivePage := tstProdutos;
    edtPercentual.Text := '0';
    ObterLista(dtmRelatorioSugestaoCompra.ListaFiliais, clbFiliais);
    ObterLista(dtmRelatorioSugestaoCompra.ListaGruposFiliais, clbGrupodeFiliais);
    MarcarLista(clbFiliais, False);
    MarcarLista(clbGrupodeFiliais, False);
  except
     on E: Exception do ShowMessage(E.Message);
  end;

end;

destructor TfrmRelatorioSugestaoCompra.Destroy;
begin
  dtmRelatorioSugestaoCompra:=nil;
  inherited;
  frmRelatorioSugestaoCompra := nil;
end;

function TfrmRelatorioSugestaoCompra.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  with dtmRelatorioSugestaoCompra do
    case TipoPesquisa of
      pesPRODUTOSINICIAL,
      pesPRODUTOSFINAL     : Result := ExisteProduto(NomeCampo, Value);
      pesGRUPOSINICIAL,
      pesGRUPOSFINAL       : Result := ExisteGrupo(NomeCampo, Value);
      pesCLASSESINICIAL,
      pesCLASSESFINAL      : Result := ExisteClasse(NomeCampo, Value);
    else  Result:= False;
    end;
end;

procedure TfrmRelatorioSugestaoCompra.InternoImpressao;
begin
  inherited;
  MontaPesquisa;
end;

function TfrmRelatorioSugestaoCompra.InternoPesquisar(
  Titulo: String): Integer;
begin
  if PesquisaHabilitada then
    with dtmRelatorioSugestaoCompra do
    begin
      AbreTabelaPesquisa(TipoPesquisa);
      Result := inherited InternoPesquisar(TituloPesquisa);
      if Result = mrOK then
        Selecionar(TipoPesquisa);
      FechaTabelaPesquisa(TipoPesquisa);
    end
  else
    Result := 0;
end;

function TfrmRelatorioSugestaoCompra.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  if (TipoPesquisa in [pesPRODUTOSINICIAL, pesPRODUTOSFINAL]) then
       TfrmConsultaPorCampo(Result).ConsultaInterativa:= False
  else TfrmConsultaPorCampo(Result).ConsultaInterativa:= True;
end;

procedure TfrmRelatorioSugestaoCompra.MontaPesquisa;
var
 Param_Estoque : String;
begin
  if ValidarCamposSelecao then
  begin
    with dtmRelatorioSugestaoCompra do
    begin
      ParametroCabecalho :='';
      CabecalhoSaldoEstoque :='Saldo Estoque: ';
      MontarFiltroFiliais(clbFiliais);
      MontarFiltroGrupoFiliais(clbGrupodeFiliais);
      ParametroSelecao := rgpSelecao.ItemIndex;
      ParametroCodigoInicial := edfProdutoInicial.Text;
      ParametroCodigoFinal := edfProdutoFinal.Text;
      ParametroGrupoInicial := edfGrupoProdutoInicial.Text;
      ParametroGrupoFinal := edfGrupoProdutoFinal.Text;
      ParametroClasseInicial := edfClasseInicial.Text;
      ParametroClasseFinal := edfClasseFinal.Text;
      ParametroSemMovEstoque := ckbSemMovimentacaodeEstoque.Checked;
      ParametroSemEstoqueMin := ckbSemEstoqueMinimo.Checked;
      ParametroSemSugestaoCompra := ckbSemSugestaoCompra.Checked;
      ParametroPercentual := edtPercentual.ValorSemFormatacao;
      ParametroImprimirDetalhes := ckbImprimirDetalhes.Checked;

      Param_Estoque :='0';
      if ckbemEstoque.Checked then
      begin
        Param_Estoque :=Param_Estoque+' + e.emEstoque';
        CabecalhoSaldoEstoque := CabecalhoSaldoEstoque+'em Estoque + ';
      end;

      if ckbReservado.Checked then
      begin
        Param_Estoque :=Param_Estoque+' + e.Reservado';
        CabecalhoSaldoEstoque := CabecalhoSaldoEstoque+'Reservado + ';
      end;

      if ckbTransito.Checked then
      begin
        Param_Estoque :=Param_Estoque+' + e.Transito';
        CabecalhoSaldoEstoque := CabecalhoSaldoEstoque+'em Transito + ';
      end;

      if ckbDemonstracao.Checked then
      begin
        Param_Estoque :=Param_Estoque+' + e.Demonstracao';
        CabecalhoSaldoEstoque := CabecalhoSaldoEstoque+'Demonstracao + ';
      end;

      if ckbConserto.Checked then
      begin
        Param_Estoque :=Param_Estoque+' + e.Conserto';
        CabecalhoSaldoEstoque := CabecalhoSaldoEstoque+'Conserto + ';
      end;

      if ckbDanificada.Checked then
      begin
        Param_Estoque :=Param_Estoque+' + e.Danificada';
        CabecalhoSaldoEstoque := CabecalhoSaldoEstoque+'Danificada + ';
      end;

      CabecalhoSaldoEstoque := CabecalhoSaldoEstoque+'Pedido - Futuro';

      ParametroEstoque := Param_estoque;
      AgruparGrupoFilial:=ckbAgruparGrupoFilial.Checked;
      AgruparFilial:=ckbAgruparFilial.Checked;
      AgruparClasseGrupo:=ckbAgruparClasseProduto.Checked;
      AgruparGrupoProduto:=ckbAgruparGrupoProduto.Checked;
      AgruparProduto:=ckbAgruparProduto.Checked;
      ParametroOrdenacao:=rgpOrdenacao.ItemIndex;
      DefineOrdenacao;
      qrySugestaoCompra.Open;
      if not (qrySugestaoCompra.IsEmpty) then
       ImprimirRelatorio
      else
       MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO,['Registro']));
    end;
  end;
end;

function TfrmRelatorioSugestaoCompra.PesquisaHabilitada: Boolean;
begin
  Result:= False;
  if (CtrlOn) and (ActiveControl is TtecDBEditFind) then
  begin
    if edfProdutoInicial.Focused then
      TipoPesquisa := pesPRODUTOSINICIAL
    else
    if edfProdutoFinal.Focused then
      TipoPesquisa := pesPRODUTOSFINAL
    else
    if edfGrupoProdutoInicial.Focused then
      TipoPesquisa := pesGRUPOSINICIAL
    else
    if edfGrupoProdutoFinal.Focused then
      TipoPesquisa := pesGRUPOSFINAL
    else
    if edfClasseInicial.Focused then
      TipoPesquisa := pesCLASSESINICIAL
    else
    if edfClasseFinal.Focused then
      TipoPesquisa := pesCLASSESFINAL;
    Result:= True;
  end;
end;

function TfrmRelatorioSugestaoCompra.TabelaDePesquisa: TZDataSet;
begin
  with dtmRelatorioSugestaoCompra do
    case TipoPesquisa of
      pesPRODUTOSINICIAL,
      pesPRODUTOSFINAL     : Result := ConsultarProduto;
      pesGRUPOSINICIAL,
      pesGRUPOSFINAL       : Result := ConsultarGrupo;
      pesCLASSESINICIAL,
      pesCLASSESFINAL      : Result := ConsultarClasse;
    else  Result:= nil;
    end;
end;

function TfrmRelatorioSugestaoCompra.TituloPesquisa: String;
begin
  case TipoPesquisa of
    pesPRODUTOSINICIAL,
    pesPRODUTOSFINAL     : Result := ctPRODUTO;
    pesGRUPOSINICIAL,
    pesGRUPOSFINAL       : Result := ctGRUPOS;
    pesCLASSESINICIAL,
    pesCLASSESFINAL      : Result := ctCLASSES;
  end;
end;

function TfrmRelatorioSugestaoCompra.ValidarCamposSelecao: Boolean;
begin
 Result := OperadorTernario((Trim(edfProdutoInicial.Text) <> ''), edfProdutoInicial.Exist, True) and
           OperadorTernario((Trim(edfProdutoFinal.Text) <> ''), edfProdutoFinal.Exist, True) and
           OperadorTernario((Trim(edfGrupoProdutoInicial.Text) <> ''), edfGrupoProdutoInicial.Exist, True) and
           OperadorTernario((Trim(edfGrupoProdutoFinal.Text) <> ''), edfGrupoProdutoFinal.Exist, True) and
           OperadorTernario((Trim(edfClasseInicial.Text) <> ''), edfClasseInicial.Exist, True) and
           OperadorTernario((Trim(edfClasseFinal.Text) <> ''), edfClasseFinal.Exist, True);
end;

procedure TfrmRelatorioSugestaoCompra.sbnConsultaProdutosInicialClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfProdutoInicial, ctPRODUTO);
end;

procedure TfrmRelatorioSugestaoCompra.sbnConsultaGrupoProdutoInicialClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfGrupoProdutoInicial, ctGRUPOS);
end;

procedure TfrmRelatorioSugestaoCompra.sbnConsultaClasseInicialClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfClasseInicial, ctCLASSES);
end;

procedure TfrmRelatorioSugestaoCompra.pgcProdutosChange(Sender: TObject);
begin
  inherited;
    if pgcProdutos.ActivePage = tstProdutos then
    begin
     edfGrupoProdutoInicial.Clear;
     edfGrupoProdutoInicial.Exist;
     edfGrupoProdutoFinal.Clear;
     edfGrupoProdutoFinal.Exist;
     edfClasseInicial.Clear;
     edfClasseInicial.Exist;
     edfClasseFinal.Clear;
     edfClasseFinal.Exist;
     edfProdutoInicial.SetFocus;
    end
    else
      if pgcProdutos.ActivePage = tstGrupodeProdutos then
      begin
       edfProdutoInicial.Clear;
       edfProdutoInicial.Exist;
       edfProdutoFinal.Clear;
       edfProdutoFinal.Exist;
       edfClasseInicial.Clear;
       edfClasseInicial.Exist;
       edfClasseFinal.Clear;
       edfClasseFinal.Exist;
       edfGrupoProdutoInicial.SetFocus;
      end
      else
        if pgcProdutos.ActivePage = tstClasses then
        begin
         edfProdutoInicial.Clear;
         edfProdutoInicial.Exist;
         edfProdutoFinal.Clear;
         edfProdutoFinal.Exist;
         edfGrupoProdutoInicial.Clear;
         edfGrupoProdutoInicial.Exist;
         edfGrupoProdutoFinal.Clear;
         edfGrupoProdutoFinal.Exist;
         edfClasseInicial.SetFocus;
        end;
end;

procedure TfrmRelatorioSugestaoCompra.ObterLista(Origem: TStrings;
  Destino: TCheckListBox);
begin
  Destino.Items.AddStrings(Origem);
end;

procedure TfrmRelatorioSugestaoCompra.sbnMarcarFiliaisClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbFiliais, True);
  MarcarLista(clbGrupodeFiliais, False);
end;

procedure TfrmRelatorioSugestaoCompra.sbnDesmarcarFiliaisClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbFiliais, False);
end;

procedure TfrmRelatorioSugestaoCompra.sbnmarcarGrupodeFiliaisClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbGrupodeFiliais, True);
  MarcarLista(clbFiliais, False);
end;

procedure TfrmRelatorioSugestaoCompra.sbnDesmarcarGrupodeFiliaisClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbGrupodeFiliais, False);
end;

procedure TfrmRelatorioSugestaoCompra.sbnConsultaProdutosFinalClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfProdutoFinal, ctPRODUTO);
end;

procedure TfrmRelatorioSugestaoCompra.sbnConsultaGrupoProdutoFinalClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfGrupoProdutoFinal, ctGRUPOS);
end;

procedure TfrmRelatorioSugestaoCompra.sbnConsultaClasseFinalClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfClasseFinal, ctCLASSES);
end;

procedure TfrmRelatorioSugestaoCompra.clbFiliaisClickCheck(
  Sender: TObject);
begin
  inherited;
   MarcarLista(clbGrupodeFiliais, False);
end;

procedure TfrmRelatorioSugestaoCompra.clbGrupodeFiliaisClickCheck(
  Sender: TObject);
begin
  inherited;
   MarcarLista(clbFiliais, False);
end;

end.
