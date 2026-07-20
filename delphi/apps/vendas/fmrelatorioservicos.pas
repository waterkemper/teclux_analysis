unit fmrelatorioservicos;

interface

uses
  {Qete,} SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, cpdbgrid, ExtCtrls, StdCtrls, cpdata, CheckLst,
  Buttons, ComCtrls, cppagecontrol, biblio, ctconstantes,
  fmrelatoriopadrao, frlistagruposfiliais, frlistafiliais, Windows, ToolWin;

type
  TfrmRelatorioServicos = class(TFrmRelatorioPadrao)
    sbnDesmarcarServicos: TSpeedButton;
    sbnMarcarServicos: TSpeedButton;
    pgcFilialGrupoFilial: TtecPageControl;
    tstFilial: TTabSheet;
    tstGrupoFilial: TTabSheet;
    dbgServicos: TtecDBGrid;
    gbxPeriodo: TGroupBox;
    lblDataInicial: TLabel;
    edtDataInicial: TEditData;
    lblDataFinal: TLabel;
    edtDataFinal: TEditData;
    gbxAgrupamento: TGroupBox;
    ckbAgruparGrupoFilial: TCheckBox;
    ckbAgruparFilial: TCheckBox;
    rgpResumo: TRadioGroup;
    fraListaFiliais1: TfraListaFiliais;
    fraListaGruposFiliais1: TfraListaGruposFiliais;
    procedure dbgServicosDblClick(Sender: TObject);
    procedure sbnMarcarServicosClick(Sender: TObject);
    procedure sbnDesmarcarServicosClick(Sender: TObject);
    procedure dbgServicosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fraListaFiliais1clbFiliaisClickCheck(Sender: TObject);
    procedure fraListaFiliais1sbnMarcarFiliaisClick(Sender: TObject);
    procedure fraListaGruposFiliais1clbGrupodeFiliaisClickCheck(
      Sender: TObject);
    procedure fraListaGruposFiliais1sbnmarcarGrupodeFiliaisClick(
      Sender: TObject);
  private
    { Private declarations }
    procedure InternoImpressao; override;
    function  ValidarCamposSelecao: Boolean;
    
  public
    { Public declarations }
     constructor Create(AOwner: TComponent); override;
     destructor Destroy; override;
    
  end;

var
  frmRelatorioServicos: TfrmRelatorioServicos;

implementation
uses dmrelatorioservicos;

{$R *.dfm}

{ TfrmRelatorioServicos }

constructor TfrmRelatorioServicos.Create(AOwner: TComponent);
begin
  inherited;
  dtmRelatorioServicos := TdtmRelatorioServicos.Create(Self);
  edtDataInicial.Text := DateToStr(UltimoDiaMesPassado(1)+1);
  edtDataFinal.Text   := DateToStr(DataLocal);
end;

destructor TfrmRelatorioServicos.Destroy;
begin
  dtmRelatorioServicos:=nil;
  inherited;
  frmRelatorioServicos := nil;
end;

procedure TfrmRelatorioServicos.dbgServicosDblClick(Sender: TObject);
begin
  dtmRelatorioServicos.MarcarServicosSelecionadas(false, False);
end;

procedure TfrmRelatorioServicos.sbnMarcarServicosClick(Sender: TObject);
begin
  dtmRelatorioServicos.MarcarServicosSelecionadas(true, true);
end;

procedure TfrmRelatorioServicos.sbnDesmarcarServicosClick(Sender: TObject);
begin
  dtmRelatorioServicos.MarcarServicosSelecionadas(false, true);
end;

procedure TfrmRelatorioServicos.dbgServicosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_SPACE then
    if Shift = [ssCtrl] then
      dtmRelatorioServicos.MarcarServicosSelecionadas(false, False);
end;

procedure TfrmRelatorioServicos.InternoImpressao;
begin
  inherited;
  if ValidarCamposSelecao then
  begin
    with dtmRelatorioServicos do
    begin
      ParametroCabecalho  :='';
      MontarConsultaRelatorio;
      DataInicial         := edtDataInicial.Text;
      DataFinal           := edtDataFinal.Text;
      Filiais            := fraListaFiliais1.ListaSelecionada;
      GruposFiliais      := fraListaGruposFiliais1.ListaSelecionada;
      if GruposFiliais<>'' then
        ParametroCabecalho:=ParametroCabecalho+' Grupo de Filiais: '+GruposFiliais
      else
      if Filiais<>'' then
        ParametroCabecalho:=ParametroCabecalho+' Filiais: '+Filiais;
        
      MontarFiltroServicos;
      AgruparGrupoFilial  := ckbAgruparGrupoFilial.Checked;
      AgruparFilial       := ckbAgruparFilial.Checked;
      Resumo       := rgpResumo.ItemIndex;
      MontarOrdenacao;
      if AbrirConsultaRelatorio then
        ImprimirRelatorio
      else
       MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO,['Registro']));
    end;
  end;
end;

function TfrmRelatorioServicos.ValidarCamposSelecao: Boolean;
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

procedure TfrmRelatorioServicos.fraListaFiliais1clbFiliaisClickCheck(
  Sender: TObject);
begin
  inherited;
  fraListaGruposFiliais1.sbnDesmarcarGrupodeFiliaisClick(self);
end;

procedure TfrmRelatorioServicos.fraListaFiliais1sbnMarcarFiliaisClick(
  Sender: TObject);
begin
  inherited;
  fraListaFiliais1.sbnMarcarFiliaisClick(Sender);
  fraListaGruposFiliais1.sbnDesmarcarGrupodeFiliaisClick(self);

end;

procedure TfrmRelatorioServicos.fraListaGruposFiliais1clbGrupodeFiliaisClickCheck(
  Sender: TObject);
begin
  inherited;
  fraListaFiliais1.sbnDesmarcarFiliaisClick(Sender);

end;

procedure TfrmRelatorioServicos.fraListaGruposFiliais1sbnmarcarGrupodeFiliaisClick(
  Sender: TObject);
begin
  inherited;
  fraListaGruposFiliais1.sbnmarcarGrupodeFiliaisClick(Sender);
  fraListaFiliais1.sbnDesmarcarFiliaisClick(Sender);

end;

end.
