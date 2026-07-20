unit fmrelatoriosaldodevedor;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmrelatoriopadrao, ExtCtrls, Buttons, frconsulta,
  frconsultacodigo, cpdata, dmrelatoriosaldodevedor, ctconstantes, ToolWin,
  ComCtrls;

type
  Tfrmrelatoriosaldodevedor = class(TfrmRelatorioPadrao)
    gbxPeriodo: TGroupBox;
    gbxEmpreendimento: TGroupBox;
    fraConsultaEmprendimento: TfraConsultaCodigo;
    edtData: TEditData;
  private
    { Private declarations }
  protected
    procedure InternoImpressao; override;

  public
    constructor Create(Aowner:Tcomponent);override;
    destructor  Destroy; override;
    { Public declarations }
  end;

var
  frmrelatoriosaldodevedor: Tfrmrelatoriosaldodevedor;

implementation

uses dmbasico;

{$R *.dfm}

{ Tfrmrelatoriosaldodevedor }

constructor Tfrmrelatoriosaldodevedor.Create(Aowner: Tcomponent);
begin
  inherited;
  dtmrelatoriosaldodevedor:= Tdtmrelatoriosaldodevedor.Create(Self);
  edtData.Text := DateToStr(Date);
  fraConsultaEmprendimento.TipoPesquisa:= pesEMPREENDIMENTOS;
end;

destructor Tfrmrelatoriosaldodevedor.Destroy;
begin
  dtmrelatoriosaldodevedor:= nil;
  inherited;
  frmrelatoriosaldodevedor:= nil;
end;

procedure Tfrmrelatoriosaldodevedor.InternoImpressao;
begin
  inherited;
  with dtmrelatoriosaldodevedor do
  begin
    Data := strtodate(edtData.Text);
    if fraConsultaEmprendimento.edfCodigo.Text <> '' then
      Empreendimento := strtoint(fraConsultaEmprendimento.edfCodigo.Text);
    if Data > 0  then
      ImprimirRelatorio;
  end;
end;

end.
