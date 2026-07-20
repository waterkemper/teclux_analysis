unit fmlivroapuracaoicms;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmrelatoriopadrao, ExtCtrls, Buttons, StdCtrls, cpdata, cpnumero,
  DBCtrls, cpdbtext, Mask, cpdbfindcontrols, ComCtrls, cppagecontrol,
  cpeditioncontrolvalidation, DateUtils,
  fmconsultabasica, fmconsultaporcampo,
  ZQuery,
  biblio, ctconstantes, cptexto,
  DB, clparametrossistema, ToolWin;

type
  TfrmLivroApuracaoIcms = class(TfrmRelatorioPadrao)
    gbxLivroApuracaoIcms: TGroupBox;
    rgpRelatorio: TRadioGroup;
    gbxNumeracao: TGroupBox;
    edtLivro: TEditNumero;
    edtPagina: TEditNumero;
    edtMaximo: TEditNumero;
    gbxImprimir: TGroupBox;
    ckbLivroApuracaoICMS: TCheckBox;
    ckbResumo: TCheckBox;
    ecvValida: TtecEditionControlValidation;
    gbxFilial: TGroupBox;
    edfFilial: TtecDbEditFind;
    sbnProcurarFilial: TSpeedButton;
    dtxFilial: TtecDBText;
    gbxPeriodo: TGroupBox;
    pgcPeriodo: TPageControl;
    tstMes: TTabSheet;
    tstPeriodo: TTabSheet;
    gbxPeriodoInicial: TGroupBox;
    edtDataInicial: TEditData;
    gbxPeriodoFinal: TGroupBox;
    edtDataFinal: TEditData;
    gbxMes: TGroupBox;
    edtMesAno: TEditMesAno;
    lblRelatorio: TStaticText;
    gbxLivro: TGroupBox;
    gbxPagina: TGroupBox;
    gbxMaximo: TGroupBox;
    procedure sbnProcurarFilialClick(Sender: TObject);
    procedure ckbLivroApuracaoICMSClick(Sender: TObject);
    procedure ckbResumoClick(Sender: TObject);
    procedure rgpRelatorioClick(Sender: TObject);
  private
    { Private declarations }
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
  frmLivroApuracaoIcms: TfrmLivroApuracaoIcms;
  TipoPesquisa: TTecPesquisa;
  ControleValido: TWinControl;

implementation
{$R *.dfm}
uses dmlivroapuracaoicms;

{ TfrmLivroApuracaoIcms }

constructor TfrmLivroApuracaoIcms.Create(AOwner: TComponent);
begin
  inherited;
  dtmLivroApuracaoIcms := TdtmLivroApuracaoIcms.Create(Self);
  with dtmLivroApuracaoIcms do
   Abre(ctTabelas);
  edtpagina.Text:='2';
  edtMaximo.Text:='499';
  edtMesAno.Text := FormatDateTime('mm/yyyy', DataLocal);
  edtDataInicial.Text := DateTimeToStr(PrimeiroDiaMesPassado(0));
  edtDataFinal.Text := DateTimeToStr(DataLocal);
  if ParSistema.LivrosFiscaisFolhaouPagina = 0
  then gbxPagina.Caption:= 'FOLHA'
  else gbxPagina.Caption:= 'PÁGINA';

  pgcPeriodo.ActivePage:= tstMes;
  pgcPeriodo.Width     := 93;
  gbxPeriodo.Width     := 99;
  gbxPeriodo.Caption   := 'PERÍODO';
  gbxImprimir.Visible  := true;
end;

destructor TfrmLivroApuracaoIcms.Destroy;
begin
  dtmLivroApuracaoIcms:=nil;
  inherited;
  frmLivroApuracaoIcms := nil;
end;

function TfrmLivroApuracaoIcms.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  with dtmLivroApuracaoIcms do
    case TipoPesquisa of
      pesFILIAIS      : Result := ExisteFilial(NomeCampo, Value);
      pesGRUPOSFILIAIS: Result := ExisteGrupoFilial(Nomecampo,Value);
    else  Result:= False;
    end;
end;

procedure TfrmLivroApuracaoIcms.internoImpressao;
begin
 inherited;
 if ValidarCamposSelecao then
  with dtmLivroApuracaoIcms do
  begin
   ParametroCabecalho:='';
   MesAno:=edtMesAno.Text;
   DataInicial:=edtDataInicial.Text;
   DataFinal := edtDataFinal.Text;
   ParametroFilial:=edfFilial.Text;
   ParametroLivro:=edtlivro.ValorSemFormatacao;
   ParametroPagina:=edtpagina.ValorSemFormatacao;
   ParametroMaximo:=edtMaximo.ValorSemFormatacao;
   LivrodeApuracaoICMS:=ckbLivroApuracaoICMS.Checked;
   Resumo:=ckbResumo.Checked;
   ParametrosRelatorio:=rgpRelatorio.ItemIndex;
   if AbrirConsultaRelatorios then
     ImprimirRelatorio;
  end;
end;

function TfrmLivroApuracaoIcms.InternoPesquisar(Titulo: String): Integer;
begin
  if PesquisaHabilitada then
    with dtmLivroApuracaoIcms do
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

function TfrmLivroApuracaoIcms.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa:= True;
end;

function TfrmLivroApuracaoIcms.PesquisaHabilitada: Boolean;
begin
  Result:= False;
  if (CtrlOn) and (ActiveControl is TtecDBEditFind) then
  begin
    if edfFilial.Focused then
      TipoPesquisa := pesFILIAIS;
    Result:= True;
  end;
end;

function TfrmLivroApuracaoIcms.TabelaDePesquisa: TZDataSet;
begin
  with dtmLivroApuracaoIcms do
    case TipoPesquisa of
      pesFILIAIS      : Result := ConsultarFilial;
      pesGRUPOSFILIAIS: Result := ConsultarGrupoFilial;
    else  Result:= nil;
    end;
end;

function TfrmLivroApuracaoIcms.TituloPesquisa: String;
begin
  case TipoPesquisa of
    pesFILIAIS      : Result := ctFILIAIS;
    pesGRUPOSFILIAIS: Result := ctGRUPOFILIAIS;
  end;
end;

function TfrmLivroApuracaoIcms.ValidarCamposSelecao: Boolean;
begin
  result:=ecvValida.Verify(gbxLivroApuracaoIcms, ControleValido);
  if Result then
  begin
    result:=ecvValida.Verify(gbxFilial, ControleValido);
    if result then
    begin
      Result := OperadorTernario(Trim(edffilial.Text) <> '',edffilial.Exist, True);
      if Result then
      begin
       if edtLivro.Text<>'' then
       begin
         if (edfFilial.Text='') then
         begin
          Result:=False;
          MensagemAviso(ctINFORMACAOLIVROFILIAL);
          edfFilial.SetFocus;
         end
         else
          Result:=True;
       end
       else
       begin
        if (rgpRelatorio.ItemIndex=1) and (edtLivro.Text='') then
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
end;

procedure TfrmLivroApuracaoIcms.sbnProcurarFilialClick(Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfFilial, ctFILIAIS);
end;

procedure TfrmLivroApuracaoIcms.ckbLivroApuracaoICMSClick(Sender: TObject);
begin
  inherited;
  if not ckbLivroApuracaoICMS.Checked then
    ckbResumo.Checked := True;
end;

procedure TfrmLivroApuracaoIcms.ckbResumoClick(Sender: TObject);
begin
  inherited;
  if not ckbResumo.Checked then
    ckbLivroApuracaoICMS.Checked := True;
end;

procedure TfrmLivroApuracaoIcms.rgpRelatorioClick(Sender: TObject);
begin
   inherited;
   case rgpRelatorio.ItemIndex of
   0: begin
         pgcPeriodo.ActivePage:= tstMes;
         pgcPeriodo.Width     := 93;
         gbxPeriodo.Width     := 99;
         gbxPeriodo.Caption   := 'PERÍODO';
         gbxImprimir.Visible  := true;
      end;
   1: begin
         pgcPeriodo.ActivePage:= tstPeriodo;
         pgcPeriodo.Width     := 173;
         gbxPeriodo.Width     := 178;
         gbxPeriodo.Caption   := 'DATAS PARA OS TERMOS';
         gbxImprimir.Visible  := false;
         if edtMesAno.Text <> '' then begin
            edtDataInicial.Text:= '01/' + edtMesAno.text;
            edtDataFinal.  Text:= DateTimetoStr(EncodeDate(YearOf(StrToDate('01/' + edtMesAno.Text)),
                                            MonthOf(StrToDate('01/' + edtMesAno.Text)),
                                            DaysInAMonth(YearOf(StrToDate('01/' + edtMesAno.Text)),
                                                        MonthOf(StrToDate('01/' + edtMesAno.Text)))));
         end;
      end;
   end;
end;

end.
