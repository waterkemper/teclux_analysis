unit fmrelatoriocontratospendentes;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, cpdata, DBCtrls, cpdbtext,
  Mask, cpdbfindcontrols, ComCtrls, cppagecontrol, Buttons,
  cpeditioncontrolvalidation, biblio, ctconstantes, fmrelatoriopadrao,
  ZQuery, dateutils,
  fmconsultabasica,
  fmconsultaporcampo, CheckLst, DB, ZPgSqlQuery, cpquery,
  frlistagruposfiliais, frlistafiliais, ToolWin;

type
  TfrmRelatorioContratosPendentes = class(TfrmRelatorioPadrao)
    gbxContratosPendentes: TGroupBox;
    gbxFornecedores: TGroupBox;
    sbnProcurarFornecedores: TSpeedButton;
    dtxFornecedores: TtecDBText;
    edfFornecedor: TtecDbEditFind;
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
    gbxVendas: TGroupBox;
    edtDesde: TEditData;
    gbxSituacao: TGroupBox;
    edtSituacao: TEditData;
    ecvValidar: TtecEditionControlValidation;
    ckbPendentesCancelados: TCheckBox;
    ckbPendentes: TCheckBox;
    fraListaFiliais1: TfraListaFiliais;
    fraListaGruposFiliais1: TfraListaGruposFiliais;
    procedure sbnProcurarFornecedoresClick(Sender: TObject);
    procedure sbnConsultaItemProdutoClick(Sender: TObject);
    procedure sbnConsultaProdutosClick(Sender: TObject);
    procedure sbnConsultaGrupoProdutosClick(Sender: TObject);
    procedure sbnConsultaClasseClick(Sender: TObject);
    procedure pgcProdutosChange(Sender: TObject);
    procedure ckbPendentesClick(Sender: TObject);
    procedure ckbPendentesCanceladosClick(Sender: TObject);
    procedure fraListaFiliais1clbFiliaisClickCheck(Sender: TObject);
    procedure fraListaFiliais1sbnMarcarFiliaisClick(Sender: TObject);
    procedure fraListaGruposFiliais1clbGrupodeFiliaisClickCheck(
      Sender: TObject);
    procedure fraListaGruposFiliais1sbnmarcarGrupodeFiliaisClick(
      Sender: TObject);
    procedure edtDesdeExit(Sender: TObject);
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
  frmRelatorioContratosPendentes: TfrmRelatorioContratosPendentes;
  TipoPesquisa : TtecRelatorioVendas;
  Controle     : TWinControl;

implementation
{$R *.dfm}

uses dmrelatoriocontratospendentes;

{ TfrmRelatorioContratosPendentes }

constructor TfrmRelatorioContratosPendentes.Create(Aowner: Tcomponent);
var
  Dia, Mes, Ano: Word;
  Data: TDateTime;
begin
  dtmrelatoriocontratospendentes := Tdtmrelatoriocontratospendentes.Create(Self);
  inherited;
  DecodeDate(dtmRelatorioContratosPendentes.DataServidor,Ano,Mes,Dia);
  Data:= EncodeDate(Ano,Mes,01);
  edtSituacao.Text:= DateToStr(Data-1);
  DecodeDate(Data,Ano,Mes,Dia);
  Data:= EncodeDate(Ano,Mes,01);
  edtDesde.Text:= DateToStr(Data-90);
end;

destructor TfrmRelatorioContratosPendentes.Destroy;
begin
  dtmrelatoriocontratospendentes:=nil;
  inherited;
  frmRelatorioContratosPendentes:= nil;
end;

function TfrmRelatorioContratosPendentes.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  with dtmrelatoriocontratospendentes do
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

procedure TfrmRelatorioContratosPendentes.InternoImpressao;
begin
  inherited;
  MontaPesquisa;
end;

function TfrmRelatorioContratosPendentes.InternoPesquisar(Titulo: String): Integer;
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
        TipoPesquisa := rvCLASSES
      else if ActiveControl=edfFornecedor then
        TipoPesquisa := rvFORNECEDORES;

     with dtmrelatoriocontratospendentes do begin
       AbreTabelaPesquisa(TipoPesquisa);
       Result:= inherited InternoPesquisar(Titulo);
       if Result = mrOK then
         Selecionar(TipoPesquisa);
       FechaTabelaPesquisa(TipoPesquisa);
     end;
    end;
  end;
end;

function TfrmRelatorioContratosPendentes.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  if (TipoPesquisa in [rvITEMPRODUTOS, rvPRODUTOS]) then
       TfrmConsultaPorCampo(Result).ConsultaInterativa := False
  else TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
end;

procedure TfrmRelatorioContratosPendentes.MontaPesquisa;
begin
  if ecvValidar.Verify(gbxContratosPendentes, Controle) then
  begin
    if ValidarCamposSelecao then
    begin
      with dtmrelatoriocontratospendentes do
      begin
        PendentesCancelados := ckbPendentesCancelados.Checked;
        Pendentes := ckbPendentes.Checked;
        DataVenda    := edtDesde.Text;
        DataSituacao := edtSituacao.Text;
        DefinirParametros;
        Filiais             := fraListaFiliais1.ListaSelecionada;
        GrupoFiliais        := fraListaGruposFiliais1.ListaSelecionada;
        if GrupoFiliais<>'' then
          ParametroCabecalho:=ParametroCabecalho+' Grupo de Filiais: '+GrupoFiliais
        else
        if Filiais<>'' then
          ParametroCabecalho:=ParametroCabecalho+' Filiais: '+Filiais;

        ItemProdutos   := edfItemProduto.text;
        Produtos       := edfProduto.Text;
        Fornecedor     := edfFornecedor.Text;
        GrupoProdutos  := edfGrupoProduto.Text;
        ClasseProdutos := edfClasse.Text;
        if AbrirConsulta then
          ImprimirRelatorio
        else
          MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO,['Registro']));
      end;
    end;
  end;
end;

function TfrmRelatorioContratosPendentes.TabelaDePesquisa: TZdataSet;
begin
  with dtmrelatoriocontratospendentes do
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

function TfrmRelatorioContratosPendentes.ValidarCamposSelecao: Boolean;
begin
  Result := edtDesde.DataValida and edtSituacao.DataValida;
  if Result then
  begin
    Result := strtodate(edtDesde.text) <= strtodate(edtSituacao.Text);
    if Result then
      Result := OperadorTernario((Trim(edfFornecedor.Text) <> ''),edfFornecedor.Exist, True) and
                OperadorTernario((Trim(edfitemProduto.Text) <> ''), edfitemProduto.Exist, True) and
                OperadorTernario((Trim(edfProduto.Text) <> ''), edfProduto.Exist, True) and
                OperadorTernario((Trim(edfGrupoProduto.text) <> ''), edfGrupoProduto.Exist, True) and
                OperadorTernario((Trim(edfclasse.Text) <> ''), edfclasse.Exist, True)
    else
    begin
      MensagemAviso(format(ctDATAMENOR,['de situação', 'de pesquisa inicial']));
      edtSituacao.SetFocus;
    end;
  end;
end;

procedure TfrmRelatorioContratosPendentes.sbnProcurarFornecedoresClick(Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfFornecedor, ctFORNECEDORES);
end;

procedure TfrmRelatorioContratosPendentes.sbnConsultaItemProdutoClick(Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfItemProduto, ctITEMPRODUTO);
end;

procedure TfrmRelatorioContratosPendentes.sbnConsultaProdutosClick(Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfProduto, ctPRODUTO);
end;

procedure TfrmRelatorioContratosPendentes.sbnConsultaGrupoProdutosClick(Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfGrupoProduto, ctGRUPO);
end;

procedure TfrmRelatorioContratosPendentes.sbnConsultaClasseClick(Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfClasse, ctCLASSES);
end;

procedure TfrmRelatorioContratosPendentes.pgcProdutosChange(Sender: TObject);
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

procedure TfrmRelatorioContratosPendentes.ObterLista(Origem: TStrings; Destino: TCheckListBox);
begin
  Destino.Items.AddStrings(Origem);
end;

procedure TfrmRelatorioContratosPendentes.ckbPendentesClick(
  Sender: TObject);
begin
  inherited;
  if not ckbPendentes.Checked then
    ckbPendentesCancelados.Checked := true;
end;

procedure TfrmRelatorioContratosPendentes.ckbPendentesCanceladosClick(
  Sender: TObject);
begin
  inherited;
  if not ckbPendentesCancelados.Checked then
    ckbPendentes.Checked := true;
end;

procedure TfrmRelatorioContratosPendentes.fraListaFiliais1clbFiliaisClickCheck(
  Sender: TObject);
begin
  inherited;
  fraListaGruposFiliais1.sbnDesmarcarGrupodeFiliaisClick(self);

end;

procedure TfrmRelatorioContratosPendentes.fraListaFiliais1sbnMarcarFiliaisClick(
  Sender: TObject);
begin
  inherited;
  fraListaFiliais1.sbnMarcarFiliaisClick(Sender);
  fraListaGruposFiliais1.sbnDesmarcarGrupodeFiliaisClick(self);

end;

procedure TfrmRelatorioContratosPendentes.fraListaGruposFiliais1clbGrupodeFiliaisClickCheck(
  Sender: TObject);
begin
  inherited;
  fraListaFiliais1.sbnDesmarcarFiliaisClick(Sender);

end;

procedure TfrmRelatorioContratosPendentes.fraListaGruposFiliais1sbnmarcarGrupodeFiliaisClick(
  Sender: TObject);
begin
  inherited;
  fraListaGruposFiliais1.sbnmarcarGrupodeFiliaisClick(Sender);
  fraListaFiliais1.sbnDesmarcarFiliaisClick(Sender);
end;

procedure TfrmRelatorioContratosPendentes.edtDesdeExit(Sender: TObject);
begin
  inherited;
  edtSituacao.Minimo := DaysBetween(now, strtodate(edtDesde.Text))
end;

end.
