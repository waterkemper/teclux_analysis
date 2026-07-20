unit fmlivroauxiliarimpostosretidos;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmrelatoriopadrao, ExtCtrls, Buttons, StdCtrls, cpnumero, cpdata,
  DBCtrls, cpdbtext, Mask, cpdbfindcontrols, ComCtrls, cppagecontrol,
  cpeditioncontrolvalidation, dateutils,
  fmconsultabasica, fmconsultaporcampo, ZQuery, ctconstantes, biblio,
  clparametrossistema, CheckLst, cptexto, ToolWin;

type
  TfrmLivroAuxiliarImpostosRetidos = class(TFrmRelatorioPadrao)
    gbxLivroSaidaMercadorias: TGroupBox;
    edtLivro: TEditNumero;
    edtPagina: TEditNumero;
    edtMaximo: TEditNumero;
    rgpRelatorio: TRadioGroup;
    ecvValida: TtecEditionControlValidation;
    gbxFiliais: TGroupBox;
    edfFilial: TtecDbEditFind;
    sbnProcurarFilial: TSpeedButton;
    dtxFilial: TtecDBText;
    gbxPeriodo: TGroupBox;
    pgcPeriodo: TPageControl;
    tstMes: TTabSheet;
    edtDia: TEditDia;
    edtDataFinalPeriodo: TEditData;
    tstPeriodo: TTabSheet;
    gbxPeriodoInicial: TGroupBox;
    edtDataInicial: TEditData;
    gbxPeriodoFinal: TGroupBox;
    edtDataFinal: TEditData;
    gbxDoDia: TGroupBox;
    gbxAteDia: TGroupBox;
    gbxNumeracao: TGroupBox;
    gbxNrLivro: TGroupBox;
    gbxPagina: TGroupBox;
    gbxMaximo: TGroupBox;
    lblRelatorio: TLabel;
    procedure sbnProcurarFilialClick(Sender: TObject);
    procedure edtDataFinalExit(Sender: TObject);
    procedure rgpRelatorioClick(Sender: TObject);
  private
  protected
     function InternoPesquisar(Titulo: String): Integer; override;
     function JanelaPesquisa: TfrmConsultaBasica; override;
     function ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
     function TabelaDePesquisa: TZDataSet; override;
     procedure internoImpressao; Override;
  public
    { Public declarations }
     constructor Create(AOwner: TComponent); override;
     destructor Destroy; override;
     function PesquisaHabilitada: Boolean;
     function TituloPesquisa: String;
     function ValidarCamposSelecao: Boolean;
  end;

var
  frmLivroAuxiliarImpostosRetidos: TfrmLivroAuxiliarImpostosRetidos;
  TipoPesquisa: TTecPesquisa;
  ControleValido: TWinControl;


implementation
uses dmlivroauxiliarimpostosretidos;

{$R *.dfm}

{ TfrmLivroAuxiliarImpostosRetidos }

constructor TfrmLivroAuxiliarImpostosRetidos.Create(AOwner: TComponent);
begin
  inherited;
  dtmLivroAuxiliarImpostosRetidos := TdtmLivroAuxiliarImpostosRetidos.Create(Self);
  with dtmLivroAuxiliarImpostosRetidos do
   Abre(ctTabelas);
  edtpagina.Text:=  '2';
  edtMaximo.Text:= '499';
  edtDataFinalPeriodo.Text := DateToStr(UltimoDiaMesPassado(1));
  edtdia.DataFinal := DateToStr(UltimoDiaMesPassado(1));
  edtDia.Text:='01';
  edtDataInicial.Text := DateTimeToStr(PrimeiroDiaMesPassado(0));
  edtDataFinal.Text := DateTimeToStr(DataLocal);
  if ParSistema.LivrosFiscaisFolhaouPagina = 0
  then gbxPagina.Caption:= ANSIUpperCase(ctFolha)
  else gbxPagina.Caption:= ANSIUpperCase(ctPagina);

  pgcPeriodo.ActivePage := tstMes;
  edtDia.SetFocus;
end;

destructor TfrmLivroAuxiliarImpostosRetidos.Destroy;
begin
  dtmLivroAuxiliarImpostosRetidos:=nil;
  inherited;
  frmLivroAuxiliarImpostosRetidos := nil;
end;

function TfrmLivroAuxiliarImpostosRetidos.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  with dtmLivroAuxiliarImpostosRetidos do
    case TipoPesquisa of
      pesFILIAIS      : Result := ExisteFilial(NomeCampo, Value);
    else  Result:= False;
    end;
end;

procedure TfrmLivroAuxiliarImpostosRetidos.internoImpressao;
begin
  inherited;
  if ValidarCamposSelecao then
  with dtmLivroAuxiliarImpostosRetidos do
  begin
   ParametroCabecalho:='';
   DiaInicial:=edtDia.Text;
   DataFinalPeriodo:=edtDataFinalPeriodo.Text;
   DataInicial:=edtDataInicial.Text;
   DataFinal := edtDataFinal.Text;
   ParametroFilial:=edfFilial.Text;
   ParametroLivro:=edtlivro.ValorSemFormatacao;
   ParametroPagina:=edtpagina.ValorSemFormatacao;
   ParametroMaximo:=edtMaximo.ValorSemFormatacao;
   ParametroRelatorio:=rgpRelatorio.ItemIndex;

   if AbrirConsultasRelatorio or (rgpRelatorio.ItemIndex=1) then
     ImprimirRelatorio;
  end;
end;

function TfrmLivroAuxiliarImpostosRetidos.InternoPesquisar(
  Titulo: String): Integer;
begin
  if PesquisaHabilitada then
    with dtmLivroAuxiliarImpostosRetidos do
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

function TfrmLivroAuxiliarImpostosRetidos.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa:= True;
end;

function TfrmLivroAuxiliarImpostosRetidos.PesquisaHabilitada: Boolean;
begin
  Result:= False;
  if (CtrlOn) and (ActiveControl is TtecDBEditFind) then
  begin
    if edfFilial.Focused then
      TipoPesquisa := pesFILIAIS;
    Result:= True;
  end;
end;

function TfrmLivroAuxiliarImpostosRetidos.TabelaDePesquisa: TZDataSet;
begin
  with dtmLivroAuxiliarImpostosRetidos do
    case TipoPesquisa of
      pesFILIAIS      : Result := ConsultarFilial;
    else  Result:= nil;
    end;
end;

function TfrmLivroAuxiliarImpostosRetidos.TituloPesquisa: String;
begin
  case TipoPesquisa of
    pesFILIAIS      : Result := ctFILIAIS;
    pesGRUPOSFILIAIS: Result := ctGRUPOFILIAIS;
  end;
end;

function TfrmLivroAuxiliarImpostosRetidos.ValidarCamposSelecao: Boolean;
begin
  result:=ecvValida.Verify(gbxLivroSaidaMercadorias, ControleValido);
  if Result then
  begin
    Result := OperadorTernario((Trim(edffilial.Text) <> ''),edffilial.Exist, True);
    if Result then
    begin
      {
      if edtLivro.Text<>'' then
      begin
        if (edfFilial.Text='') or
           not EPrimeiroeUltimodiadoMes(edtDia.Text+formatdatetime('/mm/yyyy',strtodate(edtDataFinal.Text)),
                                        edtDataFinal.Text) then
        begin
          Result:=False;
          MensagemAviso(ctINFORMACAOLIVROFILIAL);
          if edfFilial.Text='' then
            edtDia.SetFocus
          else
            edfFilial.SetFocus;
        end
        else
          Result:=True;
      end
      else
      }
      begin
        if (rgpRelatorio.ItemIndex=1) and
         ((edtLivro.Text='') or
          (edtDataInicial.Text='') or
          (edtdatafinal.Text='')) then
        begin
          Result:=False;
          MensagemAviso(ctPARAMETROSINEXISTENTES);
          edtLivro.SetFocus;
        end
        else
          Result:=True;
      end;
    end;
  end;
end;

procedure TfrmLivroAuxiliarImpostosRetidos.sbnProcurarFilialClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfFilial, ctFILIAIS);
end;

procedure TfrmLivroAuxiliarImpostosRetidos.edtDataFinalExit(Sender: TObject);
begin
  inherited;
  if edtDataFinal.DataValida then
    if edtDataFinal.Text <> '' then
      if strtoint(FormatDateTime('dd',strtodate(edtDataFinal.Text)))<strtoint(edtDia.Text) then
      begin
        edtdia.Text := '01';
        edtdia.SetFocus;
        edtdia.SelectAll;
      end;
  edtdia.DataFinal := edtDataFinal.Text;
end;

procedure TfrmLivroAuxiliarImpostosRetidos.rgpRelatorioClick(
  Sender: TObject);
begin
  inherited;
  case rgpRelatorio.ItemIndex of
  0: pgcPeriodo.ActivePage := tstMes;
  1: begin
       pgcPeriodo.ActivePage := tstPeriodo;
       if edtDia.Text<>'' then
         edtDataInicial.Text := edtdia.Text+copy(edtDataFinalPeriodo.Text,3,8);
       edtDataFinal.Text := edtDataFinalPeriodo.Text;
     end;
  end;
end;

end.
