unit fmrelatoriocupons;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmrelatoriopadrao, ExtCtrls, Buttons, frconsulta,
  frconsultacodigo, cpdata, ToolWin, ComCtrls;

type
  TfrmRelatorioCupons = class(TfrmRelatorioPadrao)
    gbxPeriodo: TGroupBox;
    edtPeriodoInicial: TEditData;
    edtPeriodoFinal: TEditData;
    lblPeriodoInicial: TLabel;
    lblPeriodoFinal: TLabel;
    gbxFilial: TGroupBox;
    fraConsultaCodigoFilial: TfraConsultaCodigo;
    gbxVendedor: TGroupBox;
    fraConsultaCodigoVendedor: TfraConsultaCodigo;
  private
    procedure MontarRelatorio;
    { Private declarations }
  protected
    procedure InternoImpressao; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    { Public declarations }
  end;

var
  frmRelatorioCupons: TfrmRelatorioCupons;

implementation

uses
  dmrelatoriocupons, ctconstantes, biblio, clusuario;

{$R *.dfm}

{ TfrmRelatorioCupons }

constructor TfrmRelatorioCupons.Create(AOwner: TComponent);
begin
  inherited;
  dtmRelatorioCupons := TdtmRelatorioCupons.Create(Self);
  edtPeriodoInicial.Text := DateToStr(dtmRelatorioCupons.DataServidor);
  edtPeriodoFinal.Text := DateToStr(dtmRelatorioCupons.DataServidor);
  fraConsultaCodigoFilial.TipoPesquisa := pesFILIAIS;
  fraConsultaCodigoFilial.edfCodigo.Text := IntToStr(dtmRelatorioCupons.FilialBase);
  fraConsultaCodigoFilial.edfCodigo.Exist;
  fraConsultaCodigoVendedor.TipoPesquisa := pesVENDEDORES;
end;

destructor TfrmRelatorioCupons.Destroy;
begin
  dtmRelatorioCupons := nil;
  frmRelatorioCupons := nil;
  inherited;
end;

procedure TfrmRelatorioCupons.InternoImpressao;
begin
  inherited;
  MontarRelatorio;
end;

procedure TfrmRelatorioCupons.MontarRelatorio;
begin
  with dtmRelatorioCupons do
  begin
    ParametroCabecalho := '';
    Filial      := fraConsultaCodigoFilial.edfCodigo.Text;
    Vendedor    := fraConsultaCodigoVendedor.edfCodigo.Text;
    DataInicial := edtPeriodoInicial.Text;
    DataFinal   := edtPeriodoFinal.Text;

    MontarSQL;

    if AbrirRelatorio then
      ImprimirRelatorio
    else
      MensagemAviso(format(ctNENHUMREGISTROENCONTRADO,['registro']));
  end;

end;

end.
