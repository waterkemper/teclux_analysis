unit fmquadroprogramacaosemanal;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, dmquadroprogramacaosemanal, fmcadastropadrao, Grids,
  DBGrids, cpdbgrid, frconsulta, frconsultacodigo, cptexto, ComCtrls,
  cppagecontrol, Buttons, ExtCtrls, Windows, biblio, ctconstantes, dateutils,
  Spin, ToolWin;

type
  TfrmQuadroProgramacaoSemanal = class(TfrmCadastroPadrao)
    pgcParametrosQuadroSemana: TtecPageControl;
    tstParametros: TTabSheet;
    gbxparametroCliente: TGroupBox;
    tstregistros: TTabSheet;
    dbgprogramacaosemanal: TtecDBGrid;
    sbnGerar: TSpeedButton;
    sbnImprmir: TSpeedButton;
    fraConsultaClientes: TfraConsultaCodigo;
    gbxPeriodo: TGroupBox;
    gbxInicial: TGroupBox;
    lblBarraInicial: TLabel;
    gbxFinal: TGroupBox;
    Label1: TLabel;
    lblA: TLabel;
    edtSemanaInicial: TSpinEdit;
    edtAnoinicial: TSpinEdit;
    edtSemanaFinal: TSpinEdit;
    edtAnoFinal: TSpinEdit;
    gbxQuantidades: TGroupBox;
    procedure sbnGerarClick(Sender: TObject);
    procedure sbnImprmirClick(Sender: TObject);
    procedure pgcParametrosQuadroSemanaChange(Sender: TObject);
    procedure fraConsultaClientessbnProcuraClick(Sender: TObject);
    procedure edtSemanaFinalExit(Sender: TObject);
    procedure edtAnoFinalExit(Sender: TObject);
    procedure edtAnoinicialExit(Sender: TObject);
    procedure edtSemanaInicialExit(Sender: TObject);
  private
    FAnoInicial: String;
    FAnoFinal: String;
    FSemanaFinal: String;
    FValidaSemanaInicial: Boolean;
    FValidaSemanaFinal: Boolean;
    function GetAnoInicial: String;
    function GetAnoFinal: String;
    function GetSemanaFinal: String;
    function GetValidaSemanaFinal: Boolean;
    function GetValidaSemanaInicial: Boolean;
    { Private declarations }
  protected
    function ValidarCampos: Boolean;
    property AnoInicial : String read GetAnoInicial write FAnoInicial;
    property AnoFinal : String read GetAnoFinal write FAnoFinal;
    property ValidaSemanaInicial : Boolean read GetValidaSemanaInicial write FValidaSemanaInicial;
    property ValidaSemanaFinal   : Boolean read GetValidaSemanaFinal   write FValidaSemanaFinal;
    function PeriodoInicial : Boolean;
    function PeriodoFinal : Boolean;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;

  end;

var
  frmQuadroProgramacaoSemanal: TfrmQuadroProgramacaoSemanal;

implementation

{$R *.dfm}

procedure TfrmQuadroProgramacaoSemanal.sbnGerarClick(Sender: TObject);
begin
  inherited;

  edtSemanaInicialExit(nil);
  edtAnoinicialExit(nil);
  edtSemanaFinalExit(nil);
  edtAnoFinalExit(nil);
  
  if ValidarCampos then
  begin
    with dtmquadroprogramacaosemanal do
    begin

      if trim(edtSemanaInicial.Text)<>'' then
        SemanaInicio := preencheString(edtSemanaInicial.Text,'0',2,False)
      else
        SemanaInicio := '';

      if trim(edtSemanaFinal.Text)<>'' then
        SemanaFim      := preencheString(edtSemanaFinal.Text,'0',2,False)
      else
        SemanaFim := '';

      if trim(edtAnoinicial.Text)<>'' then
        AnoInicio    := edtAnoinicial.Text
      else
        AnoInicio    := '';

      if trim(edtAnoFinal.Text)<>'' then
        AnoFim          := edtAnoFinal.Text
      else
        AnoFim := '';

      Cliente:= fraConsultaClientes.edfCodigo.Text;
      ExisteInicial   := ((trim(edtSemanaInicial.Text) <> '') and (trim(edtAnoinicial.Text) <> ''));
      ExisteFinal     := ((trim(edtSemanaFinal.Text) <> '') and (trim(edtAnoFinal.Text) <> ''));


      if GerarConsulta then
      begin
        MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO, [ctOSP]));
        pgcParametrosQuadroSemana.ActivePageIndex:=0;
        edtSemanaInicial.SetFocus;
      end
      else
      begin
        Ordenar;
        pgcParametrosQuadroSemana.ActivePageIndex:=1;
        dbgprogramacaosemanal.SetFocus;
        sbnImprmir.Enabled:= True;
      end;
    end;
  end;
end;

procedure TfrmQuadroProgramacaoSemanal.sbnImprmirClick(Sender: TObject);
begin
  inherited;

  {$IFDEF MSWINDOWS}
  if MensagemSimNaoOpcaoCancelar('Deseja Exportar para o Excel','',False) = mryes then
    dtmQuadroProgramacaoSemanal.GravarExcel
  else
    dtmQuadroProgramacaoSemanal.ImprimirRelatorio;
  {$ELSE }
    dtmQuadroProgramacaoSemanal.ImprimirRelatorio;
  {$ENDIF}


end;

function TfrmQuadroProgramacaoSemanal.ValidarCampos: Boolean;
begin
  Result:= true;
  if  (trim(edtSemanaInicial.text) <> '') and (trim(edtSemanaFinal.text) <> '') and
      (trim(edtAnoinicial.text) <> '') and (trim(edtAnoFinal.text) <> '') then

    if ((strtoint(trim(edtSemanaFinal.text)) < strtoint(trim(edtSemanaInicial.Text))) and
       (strtoint(trim(edtAnoinicial.Text)) = strtoint(trim(edtAnoFinal.Text)))) or

       ((strtoint(trim(edtAnoinicial.Text)) > strtoint(trim(edtAnoFinal.text)) )) then
  begin
    MensagemAviso(ctERROPERIODO);
    Result:= False;
    edtSemanaInicial.SetFocus;
  end;
  if ((ValidaSemanaInicial = False) or
      (ValidaSemanaFinal   = False)) then
  begin
    MensagemAviso(ctVALIDARCONTROLES);
    Result:= False;
    edtSemanaInicial.SetFocus;
  end;
end;

function TfrmQuadroProgramacaoSemanal.GetAnoInicial: String;
begin
  FAnoInicial:= edtAnoinicial.Text;
  Result:= FAnoInicial;
end;

function TfrmQuadroProgramacaoSemanal.GetAnoFinal: String;
begin
  FAnoFinal:= edtAnoFinal.Text;
  Result := FAnoFinal;
end;

function TfrmQuadroProgramacaoSemanal.GetSemanaFinal: String;
begin
  FSemanaFinal:= edtSemanaFinal.Text;
  Result := FSemanaFinal;
end;


function TfrmQuadroProgramacaoSemanal.GetValidaSemanaFinal: Boolean;
begin
  FValidaSemanaFinal:= True;
  if ((edtSemanaFinal.Text = '') and (edtAnoFinal.Text <> '')) or
     ((edtSemanaFinal.Text <> '') and (edtAnoFinal.Text = '')) then
    FValidaSemanaFinal:= False;
  Result := FValidaSemanaFinal;
end;

function TfrmQuadroProgramacaoSemanal.GetValidaSemanaInicial: Boolean;
begin
    FValidaSemanaInicial:= True;
  if ((edtSemanaInicial.Text = '') and (edtAnoinicial.Text <> '')) or
     ((edtSemanaInicial.Text <> '') and (edtAnoinicial.Text = '')) then
    FValidaSemanaInicial:= False;
  Result := FValidaSemanaInicial;
end;

function TfrmQuadroProgramacaoSemanal.PeriodoFinal: Boolean;
begin
  Result:= False;
  If ((edtSemanaInicial.Text = '') and (edtAnoinicial.Text = '')) and
     ((edtSemanaFinal.Text <> '') and (edtAnoFinal.Text <> '')) then
    Result:= True;
end;

function TfrmQuadroProgramacaoSemanal.PeriodoInicial: Boolean;
begin
    Result:= False;
  If ((edtSemanaFinal.Text = '') and (edtAnoFinal.Text = '')) and
     ((edtSemanaInicial.Text <> '') and (edtAnoinicial.Text <> '')) then
    Result:= True;
end;

constructor TfrmQuadroProgramacaoSemanal.Create(AOwner: TComponent);
begin
  dtmQuadroProgramacaoSemanal:= TdtmQuadroProgramacaoSemanal.Create(Self);
  inherited;
  DataSet:= dtmQuadroProgramacaoSemanal.qryOsp;
  sbnImprmir.Enabled:= False;
  pgcParametrosQuadroSemana.ActivePage:= tstParametros;
  edtSemanaInicial.SetFocus;
  fraConsultaClientes.TipoPesquisa:= pesCLIENTES;
  
  if fraConsultaClientes.TipoCliente = '' then
    fraConsultaClientes.TipoCliente := 'C';

  edtSemanaInicial.Text:= FStr(WeekOfTheYear(Now()+7),$00);
  edtAnoInicial.   Text:= FStr(YearOf       (Now()+7),$41);

  edtSemanaFinal.Text:= FStr(WeekOfTheYear(Now()+7),$00);
  edtAnoFinal.   Text:= FStr(YearOf       (Now()+7),$41);
end;





procedure TfrmQuadroProgramacaoSemanal.pgcParametrosQuadroSemanaChange(
  Sender: TObject);
begin
  inherited;
  if pgcParametrosQuadroSemana.ActivePage = tstParametros then
    edtSemanaInicial.SetFocus
  else if pgcParametrosQuadroSemana.ActivePage = tstregistros then
    dbgprogramacaosemanal.SetFocus;
end;

procedure TfrmQuadroProgramacaoSemanal.fraConsultaClientessbnProcuraClick(
  Sender: TObject);
begin
  inherited;
  fraConsultaClientes.sbnProcuraClick(Sender);

end;

procedure TfrmQuadroProgramacaoSemanal.edtSemanaFinalExit(Sender: TObject);
begin
  inherited;
  if trim(edtSemanaFinal.Text)='' then
    while edtAnoFinal.Value <> 2009 do
    //    edtAnoFinal.StepDown;
end;

procedure TfrmQuadroProgramacaoSemanal.edtAnoFinalExit(Sender: TObject);
begin
  inherited;
  if trim(edtAnoFinal.Text)='' then
    while edtSemanaFinal.Value <> 0 do
 //   edtSemanaFinal.StepDown;
end;

procedure TfrmQuadroProgramacaoSemanal.edtAnoinicialExit(Sender: TObject);
begin
  inherited;
  if trim(edtAnoInicial.Text)='' then
    while edtSemanaInicial.Value <> 0 do
  //  edtSemanaInicial.StepDown;
end;

procedure TfrmQuadroProgramacaoSemanal.edtSemanaInicialExit(
  Sender: TObject);
begin
  inherited;
  if trim(edtSemanaInicial.Text)='' then
    while edtAnoinicial.Value <> 2009 do
//    edtAnoinicial.StepDown;
end;

procedure TfrmQuadroProgramacaoSemanal.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key =VK_F6 then
    sbnGerarClick(Self)
  else if Key =VK_F7 then
    sbnImprmirClick(Self);

end;

end.
