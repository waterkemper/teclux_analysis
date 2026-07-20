
unit fmespelhocarne;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmrelatoriopadrao, ExtCtrls, Buttons, cpdata, frconsulta,
  frconsultacodigo, dmespelhocarne, ctconstantes, biblio, clparametrossistema;

type
  Tfrmespelhocarne = class(TfrmRelatorioPadrao)
    gbxFilial: TGroupBox;
    gbxPeriodo: TGroupBox;
    gbxPeriodoInicial: TGroupBox;
    gbxPeriodoFinal: TGroupBox;
    edtPeriodoInicial: TEditData;
    edtPeriodoFinal: TEditData;
    gbxAgente: TGroupBox;
    rgpCarnes: TRadioGroup;
    fraConsultaFilial: TfraConsultaCodigo;
    fraConsultaAgente: TfraConsultaCodigo;
  private
    { Private declarations }
  protected
    procedure InternoImpressao; override;
  public
    constructor Create(Aowner:Tcomponent);override;
    { Public declarations }
  end;

var
  frmespelhocarne: Tfrmespelhocarne;

implementation

{$R *.dfm}

{ Tfrmespelhocarne }

constructor Tfrmespelhocarne.Create(Aowner: Tcomponent);
begin
  dtmEspelhoCarne := TdtmEspelhoCarne.Create(Self);
  inherited;
  fraConsultaFilial.SomenteFiliaisUsuario :=
      ParSistema.RelatorioSomenteFiliaisAutorizadas;
  fraConsultaFilial.TipoPesquisa   := pesFILIAIS;
  fraConsultaAgente.TipoPesquisa   := pesAGENTES;
  fraConsultaFilial.edfCodigo.Text := IntToStr(dtmEspelhoCarne.FilialBase);
  fraConsultaFilial.edfCodigo.Exist;
  edtPeriodoInicial.Text     := DateToStr(dtmEspelhoCarne.DataServidor);
  edtPeriodoFinal.Text       := DateToStr(dtmEspelhoCarne.DataServidor);
end;

procedure Tfrmespelhocarne.InternoImpressao;
begin
  inherited;
  if (trim(edtPeriodoInicial.Text) <> '') then
  begin
    if (trim(edtPeriodoFinal.Text) <> '') then
    begin
      if not dtmEspelhoCarne.GerarEspelho(fraConsultaFilial.edfCodigo.Text,
                  fraConsultaFilial.edfCodigo.DataSource.DataSet.fieldbyname('nome').AsString,
                  fraConsultaAgente.edfCodigo.Text,
                  fraConsultaAgente.edfCodigo.DataSource.DataSet.fieldbyname('descricao').AsString,
                  edtPeriodoInicial.Text, edtPeriodoFinal.Text, rgpCarnes.ItemIndex) then
        MensagemAviso(ctCONSULTAVAZIA);
    end
    else
    begin
      MensagemAviso(Format(ctCAMPODEVESERPREENCHIDO,['Período Final']));
      edtPeriodoFinal.SetFocus;
    end
  end
  else
  begin
    MensagemAviso(Format(ctCAMPODEVESERPREENCHIDO,['Período Inicial']));
    edtPeriodoInicial.SetFocus;
  end;
end;

end.
 