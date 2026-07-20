unit fmrelatorioparcelasatraso;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmrelatoriopadrao, ExtCtrls, Buttons, cpdata, frconsulta,
  frconsultacodigo, dmrelatorioparcelasatraso, DateUtils,
  ctconstantes, biblio, ToolWin, ComCtrls;

type
  Tfrmrelatorioparcelasatraso = class(TfrmRelatorioPadrao)
    gbxEmpreendimento: TGroupBox;
    fraConsultaEmprendimento: TfraConsultaCodigo;
    gbxCliente: TGroupBox;
    fraConsultaCliente: TfraConsultaCodigo;
    gbxdataBase: TGroupBox;
    edtDataBase: TEditData;
    rgpResumo: TRadioGroup;
    lblOpcoes: TLabel;
  private
    { Private declarations }
    FDataBase   : TDateTime;
{    FDataInicial: TDateTime;
    FDataFinal  : TDateTime;}
  protected
    Mensagem : String;
    procedure InternoImpressao; override;
    function  ValidarCampos : Boolean;
    Procedure TratarDatas;
    
  public
    constructor Create(Aowner:Tcomponent);override;
    destructor  Destroy; override;
    { Public declarations }
  end;

const
  CDataInicial = '- Período inicial não preenchido.';
  CDataFinal   = '- Período final não preenchido.';
  CDataBase    = '- Data base não preenchida.';

var
  frmrelatorioparcelasatraso: Tfrmrelatorioparcelasatraso;

implementation

{$R *.dfm}

{ Tfrmrelatorioparcelasatraso }

constructor Tfrmrelatorioparcelasatraso.Create(Aowner: Tcomponent);
begin
  inherited;
  dtmrelatorioparcelasatraso:= Tdtmrelatorioparcelasatraso.Create(Self);
  fraConsultaEmprendimento.TipoPesquisa := pesEMPREENDIMENTOS;
  fraConsultaCliente.TipoPesquisa       := pesCLIENTES;
  TratarDatas;
end;

destructor Tfrmrelatorioparcelasatraso.Destroy;
begin
  dtmrelatorioparcelasatraso:= nil;
  inherited;
  frmrelatorioparcelasatraso:= nil;
end;

procedure Tfrmrelatorioparcelasatraso.InternoImpressao;
begin
  inherited;
  with dtmrelatorioparcelasatraso do
  begin
    Cliente        := 0;
    Empreendimento := 0;
    if ValidarCampos then
    begin
      DataBase:= StrToDate(edtDataBase.Text);
      if fraConsultaEmprendimento.edfCodigo.Text <> '' then
      begin
        Empreendimento    := strtoint(fraConsultaEmprendimento.edfCodigo.Text);
        NomeEmpreendimento:= fraConsultaEmprendimento.qryProcuraEmpreendimentosnome.AsString;
      end;
      if fraConsultaCliente.edfCodigo.Text <> '' then
      begin
        Cliente         := strtoint(fraConsultaCliente.edfCodigo.Text);
        NomeCliente     := fraConsultaCliente.qryProcuraClientenome.AsString;
      end;
      tiporelatorio := rgpResumo.ItemIndex;

      ImprimirRelatorio;
    end
    else
      MensagemAviso(Mensagem);
  end;
end;

procedure Tfrmrelatorioparcelasatraso.TratarDatas;
var AnoAnterior : String;
begin
  AnoAnterior := inttostr(YearOf(DataLocal)-1);
  FDataBase   := DataLocal; //StrToDate('31/12/'+AnoAnterior);
{  FDataInicial:= StrToDate('01/01/'+inttostr(YearOf(DataLocal)));
  FDataFinal  := StrToDate('31/12/'+inttostr(YearOf(DataLocal)+40));}

  edtDataBase.Text:= datetostr(FDataBase);

end;

function Tfrmrelatorioparcelasatraso.ValidarCampos: Boolean;
begin
  Result:= True;
  Mensagem := 'Os seguintes problemas foram encontrados: ' + sLineBreak;
  if edtDataBase.Text  = '' then
  begin
    Mensagem:= Mensagem + CDataBase + sLineBreak;
    Result:= False;
  end;
end;

end.
