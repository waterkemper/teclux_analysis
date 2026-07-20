unit fmdiarioauxiliarparcelas;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmrelatoriopadrao, ExtCtrls, Buttons, StdCtrls, cpdata, CheckLst,
  ComCtrls, cppagecontrol,
    //Biblio
  biblio,
  ctConstantes, cpeditioncontrolvalidation, cpnumero, DBCtrls, cpdbtext,
  Mask, cpdbfindcontrols,
  fmconsultabasica,
  fmconsultaporcampo, ZQuery, clparametrossistema, ToolWin;


type
  TfrmDiarioAuxiliarParcelas = class(TFrmRelatorioPadrao)
    rgpResumo: TRadioGroup;
    gbxAgrupamento: TGroupBox;
    ckbAgruparGrupoFilial: TCheckBox;
    ckbAgruparFilial: TCheckBox;
    pgcFilialGrupoFilial: TtecPageControl;
    tstFilial: TTabSheet;
    sbnProcurarFilial: TSpeedButton;
    edfFilial: TtecDbEditFind;
    dtxFilial: TtecDBText;
    tstGrupoFilial: TTabSheet;
    sbnProcuraGrupoFilial: TSpeedButton;
    edfGrupoFilial: TtecDbEditFind;
    dtxGrupoFilial: TtecDBText;
    rgpRelatorio: TRadioGroup;
    gbxNumeracao: TGroupBox;
    edtLivro: TEditNumero;
    lblLivro: TLabel;
    lblPagina: TLabel;
    lblMaximo: TLabel;
    edtPagina: TEditNumero;
    edtMaximo: TEditNumero;
    gbxDataSituacao: TGroupBox;
    edtDataSituacao: TEditData;
    ecvValida: TtecEditionControlValidation;
    procedure pgcFilialGrupoFilialChange(Sender: TObject);
    procedure sbnProcurarFilialClick(Sender: TObject);
    procedure sbnProcuraGrupoFilialClick(Sender: TObject);
  private
    { Private declarations }
  protected
    function InternoPesquisar(Titulo: String): Integer; override;
    function JanelaPesquisa: TfrmConsultaBasica; override;
    function ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function TabelaDePesquisa: TZDataSet; override;
    procedure InternoImpressao; override;
    function PesquisaHabilitada: Boolean;
    function TituloPesquisa: String;
    function  ValidarCamposSelecao: Boolean;
    

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmDiarioAuxiliarParcelas: TfrmDiarioAuxiliarParcelas;
  ControleValido : TWinControl;
  TipoPesquisa: TTecPesquisa;

implementation

uses dmdiarioauxiliarparcelas;

{$R *.dfm}

{ TfrmDiarioAuxiliarParcelas }

constructor TfrmDiarioAuxiliarParcelas.Create(AOwner: TComponent);
begin
  dtmdiarioauxiliarparcelas:= Tdtmdiarioauxiliarparcelas.Create(Self);
  inherited;
  dtmdiarioauxiliarparcelas.Abre(ctTabelas);
  edtDataSituacao.Text     := DateToStr(Date);
  edtpagina.Text:='2';
  edtMaximo.Text:='9999';
  if ParSistema.LivrosFiscaisFolhaouPagina = 0 then
    lblPagina.Caption := ctFOLHA;

end;

destructor TfrmDiarioAuxiliarParcelas.Destroy;
begin
  inherited;
  frmDiarioAuxiliarParcelas:= nil;
end;

function TfrmDiarioAuxiliarParcelas.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  with dtmdiarioauxiliarparcelas do
    case TipoPesquisa of
      pesFILIAIS      : Result := ExisteFilial(NomeCampo, Value);
      pesGRUPOSFILIAIS: Result := ExisteGrupoFilial(Nomecampo,Value);
    else  Result:= False;
    end;

end;

procedure TfrmDiarioAuxiliarParcelas.InternoImpressao;
begin
  inherited;
  if ValidarCamposSelecao then begin
    with dtmdiarioauxiliarparcelas do
    begin
      ParametroCabecalho :='';
      DataSituacao := edtDataSituacao.Text;
      ParametroFilial:=edfFilial.Text;
      ParametroGrupoFiliais:=edfGrupoFilial.Text;
      ParametroLivro     := edtlivro.ValorSemFormatacao;
      ParametroPagina    := edtpagina.ValorSemFormatacao;
      ParametroMaximo    := edtMaximo.ValorSemFormatacao;
      ParametroRelatorio := rgpRelatorio.ItemIndex;
      AgruparGrupoFilial := ckbAgruparGrupoFilial.Checked;
      AgruparFilial      := ckbAgruparFilial.Checked;
      MontarOrdenacao;
      Resumo        := rgpResumo.ItemIndex;
      if (ParametroRelatorio=1) or AbrirTabelaRelatorio then
        ImprimirRelatorio
      else
        MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO,['Registro']));
    end;
  end;

end;

function TfrmDiarioAuxiliarParcelas.InternoPesquisar(
  Titulo: String): Integer;
begin
  if PesquisaHabilitada then
    with dtmdiarioauxiliarparcelas do
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

function TfrmDiarioAuxiliarParcelas.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa:= True;
end;

function TfrmDiarioAuxiliarParcelas.PesquisaHabilitada: Boolean;
begin
  Result:= False;
  if (CtrlOn) and (ActiveControl is TtecDBEditFind) then
  begin
    if edfFilial.Focused then
      TipoPesquisa := pesFILIAIS
    else
    if edfGrupoFilial.Focused then
      TipoPesquisa := pesGRUPOSFILIAIS;
    Result:= True;
  end;
end;

function TfrmDiarioAuxiliarParcelas.TabelaDePesquisa: TZDataSet;
begin
  with dtmdiarioauxiliarparcelas do
    case TipoPesquisa of
      pesFILIAIS      : Result := ConsultarFilial;
      pesGRUPOSFILIAIS: Result := ConsultarGrupoFilial;
    else  Result:= nil;
    end;
end;

function TfrmDiarioAuxiliarParcelas.TituloPesquisa: String;
begin
  case TipoPesquisa of
    pesFILIAIS      : Result := ctFILIAIS;
    pesGRUPOSFILIAIS: Result := ctGRUPOFILIAIS;
  end;
end;

procedure TfrmDiarioAuxiliarParcelas.pgcFilialGrupoFilialChange(
  Sender: TObject);
begin
  inherited;
  if pgcFilialGrupoFilial.ActivePage = tstFilial then begin
    edfGrupoFilial.Clear;
    edfFilial.setFocus;
  end
  else begin
    edfFilial.Clear;
    edfGrupoFilial.setFocus;
  end;

end;

function TfrmDiarioAuxiliarParcelas.ValidarCamposSelecao: Boolean;
begin
  result:=ecvValida.Verify(pnlFundoJanela, ControleValido);
   if Result then
   begin
    Result := edtDataSituacao.DataValida;
    if Result then
    begin
      Result:=not dataembranco(edtDataSituacao.text);
      if Result then
      begin
       Result := OperadorTernario((Trim(edffilial.Text) <> ''),edffilial.Exist, True) and
                 OperadorTernario((Trim(edfgrupofilial.Text) <> ''), edfgrupofilial.Exist, True);
       if Result then
       begin
         if edtLivro.Text<>'' then
         begin
           if ((edfFilial.Text='') and (edfGrupoFilial.Text='')) then
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
      end
      else
      begin
       MensagemAviso(ctDATAINVALIDA);
       edtDataSituacao.SetFocus;
      end;
    end;
   end;

end;

procedure TfrmDiarioAuxiliarParcelas.sbnProcurarFilialClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfFilial, ctFILIAIS);
end;

procedure TfrmDiarioAuxiliarParcelas.sbnProcuraGrupoFilialClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfGrupoFilial, ctGRUPOFILIAIS);
end;

end.
