unit fmrelatoriomovimentacaodiaria;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmrelatoriopadrao, StdCtrls, ExtCtrls, Buttons, DBCtrls, cpdbtext,
  Mask, cpdbfindcontrols, cpdata, cpdbradiogroup,
  fmconsultabasica, fmconsultaporcampo, ZQuery, biblio, ctconstantes,
  cpeditioncontrolvalidation, Grids, DBGrids, cpdbgrid, CheckLst,
  ComCtrls, cppagecontrol, frlistagrupoprodutos, ToolWin;

type
  TfrmRelatorioMovimentacaoDiaria = class(TfrmRelatorioPadrao)
    gbxMovimentacaoDiaria: TGroupBox;
    gbxPeriodo: TGroupBox;
    edtDataInicial: TEditData;
    ecvValida: TtecEditionControlValidation;
    lblA: TLabel;
    edtDataFinal: TEditData;
    pgcFilialGrupoFilial: TtecPageControl;
    tstFilial: TTabSheet;
    sbnMarcarFiliais: TSpeedButton;
    sbnDesmarcarFiliais: TSpeedButton;
    clbFiliais: TCheckListBox;
    tstGrupoFilial: TTabSheet;
    sbnmarcarGrupodeFiliais: TSpeedButton;
    sbnDesmarcarGrupodeFiliais: TSpeedButton;
    clbGrupodeFiliais: TCheckListBox;
    sbnMarcarMovimentos: TSpeedButton;
    sbnDesmarcarMovimentos: TSpeedButton;
    clbMovimentos: TCheckListBox;
    rgpResumo: TRadioGroup;
    gbxAgrupamento: TGroupBox;
    ckbAgruparGrupoFilial: TCheckBox;
    ckbAgruparFilial: TCheckBox;
    ckbAgruparProduto: TCheckBox;
    ckbAgruparMovimento: TCheckBox;
    ckbAgruparData: TCheckBox;
    ckbSaldoInicial: TCheckBox;
    rgbOrdenacao: TRadioGroup;
    gbxMovimentos: TGroupBox;
    fraListaGrupoProdutos: TfraListaGrupoProdutos;
    Bevel1: TBevel;
    pnldireito: TPanel;
    ckbAgruparbGrupoProduto: TCheckBox;
    ckbNomedoPreco: TCheckBox;
    rgpTipodeMovimentacao: TRadioGroup;
    gbxPeriodoProcessamento: TGroupBox;
    Label1: TLabel;
    edtDataInicialProcessamento: TEditData;
    edtDataFinalProcessamento: TEditData;
    procedure sbnMarcarFiliaisClick(Sender: TObject);
    procedure sbnDesmarcarFiliaisClick(Sender: TObject);
    procedure sbnmarcarGrupodeFiliaisClick(Sender: TObject);
    procedure sbnDesmarcarGrupodeFiliaisClick(Sender: TObject);
    procedure sbnMarcarMovimentosClick(Sender: TObject);
    procedure sbnDesmarcarMovimentosClick(Sender: TObject);
  private
    procedure ObterLista(Origem: TStrings; Destino: TCheckListBox);
  protected
     procedure MontaPesquisa;
     procedure InternoImpressao; Override;
     function InternoPesquisar(Titulo: String): Integer; override;
     function JanelaPesquisa: TfrmConsultaBasica; override;
     function ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
     function TabelaDePesquisa: TZDataSet; override;
     function ValidarCamposSelecao: Boolean;
     function PesquisaHabilitada: Boolean;
  public
     constructor Create(AOwner: TComponent); override;
     destructor Destroy; override;
  end;

var
  frmRelatorioMovimentacaoDiaria: TfrmRelatorioMovimentacaoDiaria;
  ControleValido: TWinControl;
  TipoPesquisa: TTecPesquisa;

implementation

uses dmrelatoriomovimentacaodiaria;

{$R *.dfm}

{ TfrmMovimentacaoDiaria }

constructor TfrmRelatorioMovimentacaoDiaria.Create(AOwner: TComponent);
var
  a,PosVirg, Item: integer;
  strMov,
  RelacaoMov: TStringList;
begin
  dtmRelatorioMovimentacaoDiaria := TdtmRelatorioMovimentacaoDiaria.Create(Self);
  dtmRelatorioMovimentacaoDiaria.LerArquivoCFG;
  inherited;
  edtDataInicial.Text  := DateToStr(dtmRelatorioMovimentacaoDiaria.DataServidor);
  edtDataFinal.Text  := DateToStr(dtmRelatorioMovimentacaoDiaria.DataServidor);
  pgcFilialGrupoFilial.ActivePage := tstFilial;
  ObterLista(dtmRelatorioMovimentacaoDiaria.ListaFiliais, clbFiliais);
  ObterLista(dtmRelatorioMovimentacaoDiaria.ListaGruposFiliais, clbGrupodeFiliais);
  ObterLista(dtmRelatorioMovimentacaoDiaria.ListaMovimentos,clbMovimentos);

  DtmRelatorioMovimentacaoDiaria.MarcarMovimentos;
  RelacaoMov:= dtmRelatorioMovimentacaoDiaria.MovimentosaMarcar;
  for a:= 0 to RelacaoMov.Count -1 do
  begin
    Item:= strtoint(RelacaoMov[a]);
    clbMovimentos.Checked[Item]:= True;
  end;
  edtDataInicial.SetFocus;
end;

destructor TfrmRelatorioMovimentacaoDiaria.Destroy;
begin
  dtmRelatorioMovimentacaoDiaria:=nil;
  inherited;
  frmRelatorioMovimentacaoDiaria:= nil;
end;

function TfrmRelatorioMovimentacaoDiaria.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  with dtmRelatorioMovimentacaoDiaria do
  case TipoPesquisa of
    pesFILIAIS : Result := ExisteFilial(NomeCampo, Value);
    pesTIPOMOVIMENTOS : Result := ExisteTipoMovimento(NomeCampo, Value);
  else
    Result := False;
  end;
end;

function TfrmRelatorioMovimentacaoDiaria.InternoPesquisar(Titulo: String): Integer;
begin
  if PesquisaHabilitada then
   with dtmRelatorioMovimentacaoDiaria do
   begin
    AbreTabelaPesquisa(TipoPesquisa);
    Result := inherited InternoPesquisar(Titulo);
    if Result = mrOK then
      Selecionar(TipoPesquisa);
    FechaTabelaPesquisa(TipoPesquisa);
   end
  else
  Result := 0;
end;

procedure TfrmRelatorioMovimentacaoDiaria.InternoImpressao;
begin
  inherited;
  MontaPesquisa;
end;

function TfrmRelatorioMovimentacaoDiaria.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa:= True;
end;

function TfrmRelatorioMovimentacaoDiaria.TabelaDePesquisa: TZDataSet;
begin
  with dtmRelatorioMovimentacaoDiaria do
  case TipoPesquisa of
    pesFILIAIS    : Result := ConsultarFilial;
    pesTIPOMOVIMENTOS : Result := ConsultarMovimento;
  else
    Result := nil;
end;
end;

procedure TfrmRelatorioMovimentacaoDiaria.MontaPesquisa;
begin
  if ValidarCamposSelecao then
  begin
    with dtmRelatorioMovimentacaoDiaria do
    begin
      MovimentosResumoSql;
      ParametroCabecalho:='';
      DataInicial := edtDataInicial.Text;
      DataFinal := edtDataFinal.Text;

      DataInicialProcessamento := edtDataInicialProcessamento.Text;
      DataFinalProcessamento := edtDataFinalProcessamento.Text;

      MontarFiltroFiliais(clbFiliais);
      MontarFiltroGrupoFiliais(clbGrupodeFiliais);
      MontarFiltroTiposMovimentos(clbMovimentos);
      GrupoProdutos := fraListaGrupoProdutos.ListaSelecionada;
      AgruparGrupoFilial:=ckbAgruparGrupoFilial.Checked;
      AgruparFilial:=ckbAgruparFilial.Checked;
      AgruparData := ckbAgruparData.Checked;
      AgruparGrupoProduto := ckbAgruparbGrupoProduto.Checked;
      AgruparMovimento:=ckbAgruparMovimento.Checked;
      AgruparProduto:=ckbAgruparProduto.Checked;
      TiposMovimentacoes := ttecTiposMovimentacoes(rgpTipodeMovimentacao.ItemIndex);

      Ordenacao:= rgbOrdenacao.ItemIndex;
      SaldoInicial:=ckbSaldoInicial.Checked;
      NomedoPreco := ckbNomedoPreco.Checked;


      Resumo := rgpResumo.ItemIndex;

      if GerarRelatorio then
        ImprimirRelatorio
      else
        MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO,['Registro']));

    end;
  end;
end;

function TfrmRelatorioMovimentacaoDiaria.ValidarCamposSelecao: Boolean;
begin
  Result:= ecvValida.Verify(gbxMovimentacaoDiaria, ControleValido);
  if Result then
  begin
   Result := (edtDataInicial.DataValida and edtDataFinal.DataValida);
   if Result then
   begin
    if (not dataembranco(edtDataInicial.text) and not dataembranco(edtDataFinal.text)) then
      Result:=StrToDate(edtDataInicial.Text) <= StrToDate(edtDataFinal.Text);

    if result then
    begin
      Result:=(not dataembranco(edtDataInicial.text) or not dataembranco(edtDataFinal.text));
      if not Result then
      begin
        MensagemAviso(ctDTINICIALMAIORDTFINAL);
       edtDataInicial.SetFocus;
      end;
    end
    else
    begin
      MensagemAviso(ctDATAINVALIDA);
      edtDataInicial.SetFocus;
    end;
   end;
  end;

  if result then
  begin
    Result := (edtDataInicialProcessamento.DataValida and edtDataFinalProcessamento.DataValida);

    if Result then
    begin
      if (not dataembranco(edtDataInicialProcessamento.text) and not dataembranco(edtDataFinalProcessamento.text)) then
        Result:=StrToDate(edtDataInicialProcessamento.Text) <= StrToDate(edtDataFinalProcessamento.Text);

      if not Result then
      begin
        MensagemAviso(ctDTINICIALMAIORDTFINAL);
        edtDataInicialProcessamento.SetFocus;
      end;
    end;
  end;
  
end;

function TfrmRelatorioMovimentacaoDiaria.PesquisaHabilitada: Boolean;
begin
end;

procedure TfrmRelatorioMovimentacaoDiaria.ObterLista(Origem: TStrings;
  Destino: TCheckListBox);
begin
  Destino.Items.AddStrings(Origem);
end;

procedure TfrmRelatorioMovimentacaoDiaria.sbnMarcarFiliaisClick(
  Sender: TObject);
begin
  inherited;
   MarcarLista(clbFiliais,true);
   MarcarLista(clbGrupodeFiliais,false);
end;

procedure TfrmRelatorioMovimentacaoDiaria.sbnDesmarcarFiliaisClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbFiliais,false);
end;

procedure TfrmRelatorioMovimentacaoDiaria.sbnmarcarGrupodeFiliaisClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbGrupodeFiliais,true);
  MarcarLista(clbFiliais,false);
end;

procedure TfrmRelatorioMovimentacaoDiaria.sbnDesmarcarGrupodeFiliaisClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbGrupodeFiliais,false);
end;

procedure TfrmRelatorioMovimentacaoDiaria.sbnMarcarMovimentosClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbMovimentos,true);
end;

procedure TfrmRelatorioMovimentacaoDiaria.sbnDesmarcarMovimentosClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbMovimentos,false);
end;

end.
