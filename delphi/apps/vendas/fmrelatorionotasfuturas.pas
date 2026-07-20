unit fmrelatorionotasfuturas;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, cpdata, DBCtrls, cpdbtext,
  Mask, cpdbfindcontrols, ComCtrls, cppagecontrol, Buttons,
  cpeditioncontrolvalidation, biblio, ctconstantes, fmrelatoriopadrao,
  ZQuery,
  fmconsultabasica,
  fmconsultaporcampo, CheckLst, DB, ZPgSqlQuery, cpquery, ToolWin;

type
  TfrmRelatorioNotasFuturas = class(TfrmRelatorioPadrao)
    gbxNotasFuturas: TGroupBox;
    pgcProdutos: TtecPageControl;
    tstItemProduto: TTabSheet;
    sbnConsultaItemProduto: TSpeedButton;
    edfItemProduto: TtecDbEditFind;
    dtxItemProduto: TtecDBText;
    tstProdutos: TTabSheet;
    sbnConsultaProdutos: TSpeedButton;
    edfProduto: TtecDbEditFind;
    dtxProdutos: TtecDBText;
    tstGrupodeProdutos: TTabSheet;
    sbnConsultaGrupoProdutos: TSpeedButton;
    edfGrupoProduto: TtecDbEditFind;
    dtxGrupoProdutos: TtecDBText;
    tstClasses: TTabSheet;
    sbnConsultaClasse: TSpeedButton;
    edfClasse: TtecDbEditFind;
    dtxClasse: TtecDBText;
    gbxFiliais: TGroupBox;
    sbnMarcarFiliais: TSpeedButton;
    sbnDesmarcarFiliais: TSpeedButton;
    clbFiliais: TCheckListBox;
    gbxGrupodeFiliais: TGroupBox;
    sbnmarcarGrupodeFiliais: TSpeedButton;
    sbnDesmarcarGrupodeFiliais: TSpeedButton;
    clbGrupodeFiliais: TCheckListBox;
    gbxPeriodo: TGroupBox;
    lblDataInicial: TLabel;
    edtDataInicial: TEditData;
    lblDataFinal: TLabel;
    edtDataFinal: TEditData;
    procedure sbnConsultaItemProdutoClick(Sender: TObject);
    procedure sbnConsultaProdutosClick(Sender: TObject);
    procedure sbnConsultaGrupoProdutosClick(Sender: TObject);
    procedure sbnConsultaClasseClick(Sender: TObject);
    procedure pgcProdutosChange(Sender: TObject);
    procedure sbnMarcarFiliaisClick(Sender: TObject);
    procedure sbnDesmarcarFiliaisClick(Sender: TObject);
    procedure sbnmarcarGrupodeFiliaisClick(Sender: TObject);
    procedure sbnDesmarcarGrupodeFiliaisClick(Sender: TObject);
  protected
    function  InternoPesquisar(Titulo:String): Integer; override;
    function  TabelaDePesquisa: TZdataSet; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    procedure InternoImpressao; override;
  public
    constructor Create(Aowner:Tcomponent);override;
    destructor  Destroy; override;
    procedure MontaPesquisa;
    function  ValidarCamposSelecao: Boolean;
    procedure ObterLista(Origem: TStrings; Destino: TCheckListBox);
  end;
var
  frmRelatorioNotasFuturas: TfrmRelatorioNotasFuturas;
  TipoPesquisa : TtecRelatorioVendas;
  Controle     : TWinControl;

implementation
{$R *.dfm}

uses dmrelatorionotasfuturas;

{ TfrmRelatorionotasfuturas }

constructor TfrmRelatorioNotasFuturas.Create(Aowner: Tcomponent);
begin
  dtmrelatorionotasfuturas := Tdtmrelatorionotasfuturas.Create(Self);
  inherited;
  ObterLista(dtmRelatorionotasfuturas.ListaFiliais, clbFiliais);
  ObterLista(dtmRelatorionotasfuturas.ListaGruposFiliais, clbGrupodeFiliais);
end;

destructor TfrmRelatorioNotasFuturas.Destroy;
begin
  dtmrelatorionotasfuturas:=nil;
  inherited;
  frmRelatorionotasfuturas:= nil;
end;

function TfrmRelatorioNotasFuturas.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  with dtmrelatorionotasfuturas do
    case tipoPesquisa of
      rvITEMPRODUTOS    : result := ExisteItemProdutos(NomeCampo, Value);
      rvGRUPOPRODUTOS   : result := ExisteGrupoProdutos(NomeCampo, Value);
      rvPRODUTOS        : result := ExisteProdutos(NomeCampo, Value);
      rvCLASSES         : result := ExisteClasses(NomeCampo, Value);
      rvFORNECEDORES    : result := ExisteFornecedor(NomeCampo, Value);
    else
      result := false;
    end;
end;

procedure TfrmRelatorioNotasFuturas.InternoImpressao;
begin
  inherited;
  MontaPesquisa;
end;

function TfrmRelatorioNotasFuturas.InternoPesquisar(Titulo: String): Integer;
begin
  Result := mrNone;
  if ActiveControl is TtecFindCustom then begin
    if CtrlOn then begin
      if ActiveControl=edfItemProduto then
        TipoPesquisa := rvITEMPRODUTOS
      else if ActiveControl=edfGrupoProduto then
        TipoPesquisa := rvGRUPOPRODUTOS
      else if ActiveControl=edfProduto then
        TipoPesquisa := rvPRODUTOS
      else if ActiveControl=edfClasse then
        TipoPesquisa := rvCLASSES;

     with dtmRelatorioNotasFuturas do begin
       AbreTabelaPesquisa(TipoPesquisa);
       Result:= inherited InternoPesquisar(Titulo);
       if Result = mrOK then
         Selecionar(TipoPesquisa);
       FechaTabelaPesquisa(TipoPesquisa);
     end;
    end;
  end;
end;

function TfrmRelatorioNotasFuturas.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  if (TipoPesquisa in [rvITEMPRODUTOS, rvPRODUTOS]) then
       TfrmConsultaPorCampo(Result).ConsultaInterativa := False
  else TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
end;

procedure TfrmRelatorioNotasFuturas.MontaPesquisa;
begin
  if ValidarCamposSelecao then begin
    with dtmRelatorioNotasFuturas do begin
      ParametroCabecalho  :='';
      DataInicial         := edtDataInicial.Text;
      DataFinal           := edtDataFinal.Text;
      MontarFiltroFiliais(clbFiliais);
      MontarFiltroGrupoFiliais(clbGrupodeFiliais);
      ItemProdutos   := edfItemProduto.text;
      Produtos       := edfProduto.Text;
      GrupoProdutos  := edfGrupoProduto.Text;
      ClasseProdutos := edfClasse.Text;
      if abrirconsultanotaspendentes then
         ImprimirRelatorio
      else MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO,['Registro']));
    end;
  end;
end;

function TfrmRelatorioNotasFuturas.TabelaDePesquisa: TZdataSet;
begin
  with dtmRelatorioNotasFuturas do
    case TipoPesquisa of
             rvITEMPRODUTOS    : Result := ConsultaItemProdutos;
             rvGRUPOPRODUTOS   : Result := ConsultaGrupoProdutos;
             rvCLASSES         : Result := ConsultaClasses;
             rvPRODUTOS        : Result := ConsultaProdutos;
             rvFORNECEDORES    : Result := ConsultaFornecedores;
    else
             Result:= nil;
    end;

end;

function TfrmRelatorioNotasFuturas.ValidarCamposSelecao: Boolean;
begin
 Result := (edtDataInicial.DataValida and edtDataFinal.DataValida);
 if Result then
 begin
  if (not dataembranco(edtDataInicial.text) and not dataembranco(edtDataFinal.text)) then
    Result:=StrToDate(edtDataInicial.Text) <= StrToDate(edtDataFinal.Text);
  if result then
  begin
    Result:=(not dataembranco(edtDataInicial.text) or not dataembranco(edtDataFinal.text));
    if Result then
      Result := OperadorTernario((Trim(edfitemProduto.Text) <> ''), edfitemProduto.Exist, True) and
                OperadorTernario((Trim(edfProduto.Text) <> ''), edfProduto.Exist, True) and
                OperadorTernario((Trim(edfGrupoProduto.text) <> ''), edfGrupoProduto.Exist, True) and
                OperadorTernario((Trim(edfclasse.Text) <> ''), edfclasse.Exist, True)
    else
    begin
     MensagemAviso(ctDATAINVALIDA);
     edtDataInicial.SetFocus;
    end;
  end
  else
  begin
    MensagemAviso(ctDTINICIALMAIORDTFINAL);
    edtDataInicial.SetFocus;
  end;
 end;
end;

procedure TfrmRelatorioNotasFuturas.sbnConsultaItemProdutoClick(Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfItemProduto, ctITEMPRODUTO);
end;

procedure TfrmRelatorioNotasFuturas.sbnConsultaProdutosClick(Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfProduto, ctPRODUTO);
end;

procedure TfrmRelatorioNotasFuturas.sbnConsultaGrupoProdutosClick(Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfGrupoProduto, ctGRUPO);
end;

procedure TfrmRelatorioNotasFuturas.sbnConsultaClasseClick(Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfClasse, ctCLASSES);
end;

procedure TfrmRelatorioNotasFuturas.pgcProdutosChange(Sender: TObject);
begin
  inherited;
  if pgcProdutos.ActivePage = tstItemProduto then begin
    edfGrupoProduto.Clear;
    edfProduto.Clear;
    edfClasse.Clear;
    edfItemProduto.setFocus;
  end
  else if pgcProdutos.ActivePage = tstProdutos then begin
    edfItemProduto.Clear;
    edfGrupoProduto.Clear;
    edfClasse.Clear;
    edfProduto.SetFocus;
  end
  else if pgcProdutos.ActivePage = tstGrupodeProdutos then begin
    edfItemProduto.Clear;
    edfProduto.Clear;
    edfClasse.Clear;
    edfGrupoProduto.SetFocus;
  end
  else if pgcProdutos.ActivePage = tstClasses then begin
    edfItemProduto.Clear;
    edfProduto.Clear;
    edfGrupoProduto.Clear;
    edfClasse.SetFocus;
  end;
end;

procedure TfrmRelatorioNotasFuturas.ObterLista(Origem: TStrings; Destino: TCheckListBox);
begin
  Destino.Items.AddStrings(Origem);
end;

procedure TfrmRelatorioNotasFuturas.sbnMarcarFiliaisClick(Sender: TObject);
begin
  inherited;
  MarcarLista(clbFiliais, True);
  MarcarLista(clbGrupodeFiliais, False);
end;

procedure TfrmRelatorioNotasFuturas.sbnDesmarcarFiliaisClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbFiliais, False);
end;

procedure TfrmRelatorioNotasFuturas.sbnmarcarGrupodeFiliaisClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbGrupodeFiliais, True);
  MarcarLista(clbFiliais, False);
end;

procedure TfrmRelatorioNotasFuturas.sbnDesmarcarGrupodeFiliaisClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbGrupodeFiliais, False);
end;

end.
