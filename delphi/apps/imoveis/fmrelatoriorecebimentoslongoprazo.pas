unit fmrelatoriorecebimentoslongoprazo;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmrelatoriopadrao, ExtCtrls, Buttons, cpdata, frconsulta,
  frconsultacodigo, dmrelatoriorecebimentoslongoprazo, DateUtils,
  ctconstantes, biblio;

type
  Tfrmrelatoriorecebimentoslongoprazo = class(TfrmRelatorioPadrao)
    gbxEmpreendimento: TGroupBox;
    fraConsultaEmprendimento: TfraConsultaCodigo;
    gbxCliente: TGroupBox;
    fraConsultaCliente: TfraConsultaCodigo;
    ckbResumo: TCheckBox;
    gbxPeriodo: TGroupBox;
    edtDataInicial: TEditData;
    edtDataFinal: TEditData;
    lblA: TLabel;
    gbxdataBase: TGroupBox;
    edtDataBase: TEditData;
  private
    { Private declarations }
    FDataBase   : TDateTime;
    FDataInicial: TDateTime;
    FDataFinal  : TDateTime;
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
  frmrelatoriorecebimentoslongoprazo: Tfrmrelatoriorecebimentoslongoprazo;

implementation

{$R *.dfm}

{ Tfrmrelatoriorecebimentoslongoprazo }

constructor Tfrmrelatoriorecebimentoslongoprazo.Create(Aowner: Tcomponent);
begin
  inherited;
  dtmrelatoriorecebimentoslongoprazo:= Tdtmrelatoriorecebimentoslongoprazo.Create(Self);
  fraConsultaEmprendimento.TipoPesquisa := pesEMPREENDIMENTOS;
  fraConsultaCliente.TipoPesquisa       := pesCLIENTES;
  TratarDatas;
end;

destructor Tfrmrelatoriorecebimentoslongoprazo.Destroy;
begin
  dtmrelatoriorecebimentoslongoprazo:= nil;
  inherited;
  frmrelatoriorecebimentoslongoprazo:= nil;
end;

procedure Tfrmrelatoriorecebimentoslongoprazo.InternoImpressao;
begin
  inherited;
  with dtmrelatoriorecebimentoslongoprazo do
  begin
    Cliente        := 0;
    Empreendimento := 0;
    if ValidarCampos then
    begin
      DataInicial     := strtodate(edtDataInicial.Text);
      DataFinal       := strtodate(edtDataFinal.Text);
      DataBase        := StrToDate(edtDataBase.Text);
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
      SoEmpreendimento:= ckbResumo.Checked;

      ImprimirRelatorio;
    end
    else
      MensagemAviso(Mensagem);
  end;
end;

procedure Tfrmrelatoriorecebimentoslongoprazo.TratarDatas;
var AnoAnterior : String;
begin
  AnoAnterior := inttostr(YearOf(DataLocal)-1);
  FDataBase   := StrToDate('31/12/'+AnoAnterior);
  FDataInicial:= StrToDate('01/01/'+inttostr(YearOf(DataLocal)));
  FDataFinal  := StrToDate('31/12/'+inttostr(YearOf(DataLocal)+40));

  edtDataBase.Text    := datetostr(FDataBase);
  edtDataInicial.Text := DateToStr(FDataInicial);
  edtDataFinal.Text   := DateToStr(FDataFinal);

end;

function Tfrmrelatoriorecebimentoslongoprazo.ValidarCampos: Boolean;
begin
  Result:= True;
  Mensagem := 'Os seguintes problemas foram encontrados: ' + sLineBreak;
  if edtDataInicial.Text = '' Then
  begin
    Mensagem:= Mensagem + CDataInicial + sLineBreak;
    Result:= False;
  end;
  if edtDataFinal.Text = '' then
  begin
    Mensagem:= Mensagem + CDataFinal + sLineBreak;
    Result:= False;
  end;
  if edtDataBase.Text  = '' then
  begin
    Mensagem:= Mensagem + CDataBase + sLineBreak;
    Result:= False;
  end;
end;

end.
