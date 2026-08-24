unit fmquadroatrasosemanal;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmrelatoriopadrao, cptexto, Grids, DBGrids, cpdbgrid,
  frconsulta, frconsultacodigo, ComCtrls, cppagecontrol, ExtCtrls,
  Buttons, cpdbspinedit, cpdbdata, cpdata, DateUtils, Biblio, Windows,
  ctconstantes, ToolWin;

type
  TfrmQuadroAtrasoSemanal = class(TfrmRelatorioPadrao)
    pgcParametrosQuadroSemana: TtecPageControl;
    tstParametros: TTabSheet;
    gbxparametroCliente: TGroupBox;
    fraConsultaClientes: TfraConsultaCodigo;
    tstregistros: TTabSheet;
    dbgprogramacaosemanal: TtecDBGrid;
    sbnGerar: TSpeedButton;
    gbxPeriodo: TGroupBox;
    gbxInicial: TGroupBox;
    edtSemanaInicial: TEditTexto;
    edtAnoinicial: TEditTexto;
    lblBarraInicial: TLabel;
    gbxFinal: TGroupBox;
    edtSemanaFinal: TEditTexto;
    edtAnoFinal: TEditTexto;
    Label1: TLabel;
    lblA: TLabel;
    gbxQuantidades: TGroupBox;
    procedure sbnGerarClick(Sender: TObject);
    procedure pgcParametrosQuadroSemanaChange(Sender: TObject);
    procedure edtSemanaInicialExit(Sender: TObject);
    procedure edtSemanaFinalExit(Sender: TObject);
  private
    { Private declarations }

  protected
    procedure InternoImpressao; override;


  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;

  end;

var
  frmQuadroAtrasoSemanal: TfrmQuadroAtrasoSemanal;

implementation

uses dmquadroatrasosemanal;

{$R *.dfm}

constructor TfrmQuadroAtrasoSemanal.Create(AOwner: TComponent);
begin
  dtmQuadroAtrasoSemanal:= TdtmQuadroAtrasoSemanal.Create(Self);
  inherited;
  sbnImprimir.Enabled:= False;
  pgcParametrosQuadroSemana.ActivePage:= tstParametros;
  fraConsultaClientes.TipoPesquisa:= pesCLIENTES;

  if fraConsultaClientes.TipoCliente = '' then
    fraConsultaClientes.TipoCliente := 'C';
    
//  frmQuadroAtrasoSemanal.ActiveControl := frmQuadroAtrasoSemanal.edtSemanaInicial;
  edtSemanaInicial.SetFocus;
end;

procedure TfrmQuadroAtrasoSemanal.sbnGerarClick(Sender: TObject);
begin
  inherited;
  with dtmQuadroAtrasoSemanal do
  begin
    SemanaInicio    := edtSemanaInicial.Text;
    SemanaFim       := edtSemanaFinal.Text;
    AnoInicio       := edtAnoinicial.Text;
    AnoFim          := edtAnoFinal.Text;
    Cliente:= fraConsultaClientes.edfCodigo.Text;
    ExisteInicial   := ((edtSemanaInicial.Text <> '') and (edtAnoinicial.Text <> ''));
    ExisteFinal     := ((edtSemanaFinal.Text <> '') and (edtAnoFinal.Text <> ''));

    if GerarConsulta then
    begin
      MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO, [ctOSP]));
      pgcParametrosQuadroSemana.ActivePageIndex:=0;
      edtSemanaInicial.SetFocus;
    end
    else
    begin
      pgcParametrosQuadroSemana.ActivePageIndex:=1;
      dbgprogramacaosemanal.SetFocus;
      sbnImprimir.Enabled:= True;
    end;
  end;
end;

procedure TfrmQuadroAtrasoSemanal.InternoImpressao;
begin
  inherited;

  {$IFDEF MSWINDOWS}
  if MensagemSimNaoOpcaoCancelar('Deseja Exportar para o Excel','',False) = mryes then
    dtmQuadroAtrasoSemanal.GravarExcel
  else
    dtmQuadroAtrasoSemanal.ImprimirRelatorio;
  {$ELSE }
    dtmQuadroAtrasoSemanal.ImprimirRelatorio;
  {$ENDIF}

  self.SetFocus;
end;

procedure TfrmQuadroAtrasoSemanal.pgcParametrosQuadroSemanaChange(
  Sender: TObject);
begin
  inherited;
  if pgcParametrosQuadroSemana.ActivePage = tstParametros then
    edtSemanaInicial.SetFocus
  else if pgcParametrosQuadroSemana.ActivePage = tstregistros then
    dbgprogramacaosemanal.SetFocus;
end;

procedure TfrmQuadroAtrasoSemanal.edtSemanaInicialExit(Sender: TObject);
begin
  inherited;
  if edtSemanaInicial.Text <> '' then
    edtSemanaInicial.Text:= preencheString(edtSemanaInicial.Text,'0',2,False);

end;

procedure TfrmQuadroAtrasoSemanal.edtSemanaFinalExit(Sender: TObject);
begin
  inherited;
  if edtSemanaFinal.Text <> '' then
    edtSemanaFinal.Text:= preencheString(edtSemanaFinal.Text,'0',2,False);

end;

procedure TfrmQuadroAtrasoSemanal.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key =VK_F6 then
    sbnGerarClick(Self)
end;

end.
