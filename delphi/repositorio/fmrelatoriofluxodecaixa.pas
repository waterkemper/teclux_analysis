unit fmrelatoriofluxodecaixa;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmrelatoriopadrao, ExtCtrls, Buttons, ctconstantes, biblio,
  cpdata, DBCtrls, cpdbtext, Mask, cpdbfindcontrols, ComCtrls,
  cppagecontrol, ZQuery, fmconsultabasica, fmconsultaporcampo,
  cpeditioncontrolvalidation, cptexto, clparametrossistema, cpnumero,
  ToolWin;

type
  Tfrmrelatoriofluxodecaixa = class(TfrmRelatorioPadrao)
    pgcFilialGrupoFilial: TtecPageControl;
    tstFilial: TTabSheet;
    sbnConsultaFilial: TSpeedButton;
    edfFilial: TtecDbEditFind;
    dtxFilial: TtecDBText;
    tstGrupoFilial: TTabSheet;
    sbnConsultaGrupoFilial: TSpeedButton;
    edfGrupoFilial: TtecDbEditFind;
    dtxGrupoFilial: TtecDBText;
    ecvValida: TtecEditionControlValidation;
    gbxAgrupamento: TGroupBox;
    ckbAgruparGrupoFilial: TCheckBox;
    ckbAgruparFilial: TCheckBox;
    rgpTipodeRelatorio: TRadioGroup;
    gbxFluxo: TGroupBox;
    gbxSaldoInicial: TGroupBox;
    edtSaldoInicial: TEditNumero;
    gbxPeriodoFluxo: TGroupBox;
    edtDataInicial: TEditData;
    edtDataFinal: TEditData;
    gbxAcumulado: TGroupBox;
    edtDataInicialAcumulado: TEditData;
    edtDataFinalAcumulado: TEditData;
    ckbExibirSaldoAcumulado: TCheckBox;
    lblRelatorio: TPanel;
    lblAPeriodo: TLabel;
    lblAAcumulado: TLabel;
    procedure sbnConsultaFilialClick(Sender: TObject);
    procedure sbnConsultaGrupoFilialClick(Sender: TObject);
    procedure pgcFilialGrupoFilialChange(Sender: TObject);
    procedure edtDataInicialExit(Sender: TObject);
    procedure rgpTipodeRelatorioClick(Sender: TObject);
    procedure ckbAgruparFilialClick(Sender: TObject);
    procedure ckbAgruparGrupoFilialClick(Sender: TObject);
    procedure FormLoaded(Sender: TObject);
    procedure ckbExibirSaldoAcumuladoClick(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure InternoImpressao; override;
    function  InternoPesquisar(Titulo:String): Integer; override;
    function  TabelaDePesquisa: TZdataSet; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
  public
    { Public declarations }
    constructor Create(Aowner:Tcomponent);override;
    destructor  Destroy; override;
    procedure MontaPesquisa;
    function  ValidarCamposSelecao: Boolean;
  end;

var
  frmrelatoriofluxodecaixa: Tfrmrelatoriofluxodecaixa;
  TipoPesquisa      : TtecRelatorioVendas;
  ControleValido    : TWinControl;
implementation
uses dmrelatoriofluxodecaixa;

{$R *.dfm}

{ Tfrmrelatoriofluxodecaixa }

constructor Tfrmrelatoriofluxodecaixa.Create(Aowner: Tcomponent);
begin
  dtmrelatoriofluxodecaixa := Tdtmrelatoriofluxodecaixa.Create(Self);
  inherited;
  dtmrelatoriofluxodecaixa.Abre(ctTabelas);
  edtDataInicial.Text          := DateToStr(dtmrelatoriofluxodecaixa.DataServidor);
  edtDataFinal.Text            := DateToStr(dtmrelatoriofluxodecaixa.DataServidor);
  edtDataInicialAcumulado.Text :=datetostr(ParSistema.DataInicialFluxoCaixa);
  edtDataFinalAcumulado.Text   := DateToStr(dtmrelatoriofluxodecaixa.DataServidor-1);
  edtSaldoInicial.text := floattostr(dtmrelatoriofluxodecaixa.SaldoFluxoCaixa);

end;

destructor Tfrmrelatoriofluxodecaixa.Destroy;
begin
  dtmrelatoriofluxodecaixa:=nil;
  inherited;
  frmrelatoriofluxodecaixa:= nil;
end;

function Tfrmrelatoriofluxodecaixa.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  with dtmrelatoriofluxodecaixa do
    case tipoPesquisa of
      rvFILIAIS         : result := ExisteFiliais(NomeCampo, Value);
      rvGRUPOFILIAIS    : result := ExisteGrupoFiliais(NomeCampo, Value);
    else
      result := false;
    end;
end;

procedure Tfrmrelatoriofluxodecaixa.InternoImpressao;
begin
  inherited;
  MontaPesquisa;
end;

function Tfrmrelatoriofluxodecaixa.InternoPesquisar(
  Titulo: String): Integer;
begin
  Result := mrNone;
  if ActiveControl is TtecFindCustom then
  begin
    if CtrlOn then
    begin
      if ActiveControl=edfFilial then
          TipoPesquisa := rvFILIAIS
      else
        if ActiveControl=edfGrupoFilial then
          TipoPesquisa := rvGRUPOFILIAIS;

     with dtmrelatoriofluxodecaixa do
     begin
       AbreTabelaPesquisa(TipoPesquisa);
       Result:= inherited InternoPesquisar(Titulo);
       if Result = mrOK then
         Selecionar(TipoPesquisa);
       FechaTabelaPesquisa(TipoPesquisa);
     end;
    end;
  end;
end;

function Tfrmrelatoriofluxodecaixa.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
end;

procedure Tfrmrelatoriofluxodecaixa.MontaPesquisa;
begin
  if ValidarCamposSelecao then begin
    with dtmrelatoriofluxodecaixa do
    begin
      qryFluxoporEvento.Sql.text := qryFluxoporEvento_aux.Sql.text;
      qryFluxoDetalhado.Sql.text := qryFluxoDetalhado_aux.Sql.text;
      ExibirSaldoAcumulado  := ckbExibirSaldoAcumulado.Checked;
      ExibirSaldoInicial := not (ckbAgruparGrupoFilial.Checked or ckbAgruparFilial.Checked);
      TipoRelatorio         := rgpTipodeRelatorio.ItemIndex;
      ParametroCabecalho    :='';
      DataInicial           := edtDataInicial.Text;
      DataFinal             := edtDataFinal.Text;
      DataInicialAcumulado  := edtDataInicialAcumulado.Text;
      DataFinalAcumulado    := edtDataFinalAcumulado.Text;
      Filiais               := edfFilial.Text;
      GrupoFiliais          := edfGrupoFilial.Text;
      SaldoInicial          := edtSaldoInicial.ValorSemFormatacao;
      AgruparGrupoFilial    := ckbAgruparGrupoFilial.Checked;
      AgruparFilial         := ckbAgruparFilial.Checked;
      MontarOrdenacao;
      case rgpTipodeRelatorio.ItemIndex of
      0: refazconsulta(qryFluxoporEvento,[],[]);
      1: refazconsulta(qryFluxoDetalhado,[],[]);
      end;

      if not (qryFluxoDetalhado.IsEmpty) or
         not (qryFluxoporEvento.IsEmpty) then
         ImprimirRelatorio
      else begin
            MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO,['Registro']));
            if pgcFilialGrupoFilial.ActivePage = tstFilial then
               edfFilial.setFocus
            else
               edfGrupoFilial.setFocus;
           end;
    end;
  end;
end;

function Tfrmrelatoriofluxodecaixa.TabelaDePesquisa: TZdataSet;
begin
  with dtmrelatoriofluxodecaixa do
    case TipoPesquisa of
             rvFILIAIS         : Result := Consultafiliais;
             rvGRUPOFILIAIS    : Result := ConsultaGrupoFiliais;
    else
             Result:= nil;
    end;
end;

function Tfrmrelatoriofluxodecaixa.ValidarCamposSelecao: Boolean;
begin
   Result := ecvValida.Verify(pnlFundoJanela, ControleValido);

   if Result then
     if strtodate(edtDataInicial.Text)>strtodate(edtDataFinal.Text) then
     begin
      MensagemAviso(ctDTINICIALMAIORDTFINAL);
      edtDataInicial.SetFocus;
      Result:=false;
     end;

   if Result then
     if strtodate(edtDataInicialAcumulado.Text)>strtodate(edtDataFinalAcumulado.Text) then
     begin
      MensagemAviso(ctDTINICIALMAIORDTFINAL);
      edtDataInicialAcumulado.SetFocus;
      Result:=false;
     end;

   if Result then
     if strtodate(edtDataFinalAcumulado.Text)<>(strtodate(edtDataInicial.Text)-1) then
     Begin
      MensagemAviso(ctDTFINALACUMULADOMAIORDTINICIAL);
      edtDataFinalAcumulado.SetFocus;
      Result:=false;
     end;

   if Result then
     Result := OperadorTernario((Trim(edfFilial.Text) <> ''), edfFilial.Exist, True) and
                OperadorTernario((Trim(edfGrupoFilial.text) <> ''), edfGrupoFilial.Exist, True);
end;

procedure Tfrmrelatoriofluxodecaixa.sbnConsultaFilialClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfFilial, ctFILIAIS);
end;

procedure Tfrmrelatoriofluxodecaixa.sbnConsultaGrupoFilialClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfGrupoFilial, ctGRUPOFILIAIS);
end;

procedure Tfrmrelatoriofluxodecaixa.pgcFilialGrupoFilialChange(
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

procedure Tfrmrelatoriofluxodecaixa.edtDataInicialExit(Sender: TObject);
begin
  inherited;
  edtDataFinalAcumulado.Text:=datetostr((strtodate(edtDataInicial.Text)-1));
//  dtmrelatoriofluxodecaixa.DataFinalAcumulado := edtDataFinalAcumulado.Text;
//  edtSaldoInicial.text := floattostr(dtmrelatoriofluxodecaixa.SaldoFluxoCaixa(dtmrelatoriofluxodecaixa.DataFinalAcumulado));
end;

procedure Tfrmrelatoriofluxodecaixa.rgpTipodeRelatorioClick(
  Sender: TObject);
begin
  inherited;
//  gbxJuros.Visible := (rgpTipodeRelatorio.ItemIndex = 1);
//  rgpNivel.Visible := (rgpTipodeRelatorio.ItemIndex = 1);
end;

procedure Tfrmrelatoriofluxodecaixa.ckbAgruparFilialClick(Sender: TObject);
begin
  inherited;
  gbxSaldoInicial.Enabled:=(not ckbAgruparFilial.Checked) and (not ckbAgruparGrupoFilial.Checked);
end;

procedure Tfrmrelatoriofluxodecaixa.ckbAgruparGrupoFilialClick(
  Sender: TObject);
begin
  inherited;
  gbxSaldoInicial.Enabled:=(not ckbAgruparFilial.Checked) and (not ckbAgruparGrupoFilial.Checked);
end;

procedure Tfrmrelatoriofluxodecaixa.FormLoaded(Sender: TObject);
begin
  inherited;
  edtDataInicial.SetFocus;
end;

procedure Tfrmrelatoriofluxodecaixa.ckbExibirSaldoAcumuladoClick(
  Sender: TObject);
begin
  inherited;
  edtDataInicialAcumulado.Enabled := ckbExibirSaldoAcumulado.Checked;
  edtDataFinalAcumulado.Enabled := ckbExibirSaldoAcumulado.Checked;
end;

end.
