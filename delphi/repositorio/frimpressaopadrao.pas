unit frimpressaopadrao;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, RLReport, dmbasico;

type
  TfrmImpressaoPadrao = class(TForm)
    rlrRelatorioPadrao: TRLReport;
    rlbTitulo: TRLBand;
    rlbRodape: TRLBand;
    rllDesenvolvedor: TRLLabel;
    rllSistema: TRLLabel;
    rlwTitulo: TRLDraw;
    rllNomeEmpresa: TRLLabel;
    rllCGC: TRLLabel;
    rllTituloRelatorio_1: TRLLabel;
    rllTituloRelatorio_2: TRLLabel;
    rllTituloRelatorio_3: TRLLabel;
    rlbDetalhe: TRLBand;
    rliData: TRLSystemInfo;
    rliHora: TRLSystemInfo;
    rliPagina: TRLSystemInfo;
    rlwBarra_1: TRLDraw;
    rlwBarra_2: TRLDraw;
    rlbCabecalho: TRLBand;
  private
    dtmBasico: TdtmBasico;
    FTitulo_2: String;
    FTitulo_3: String;
    procedure SetTitulo_2(const Value: String);
    procedure SetTitulo_3(const Value: String);
  public
    property Titulo_2: String read FTitulo_2 write SetTitulo_2;
    property Titulo_3: String read FTitulo_3 write SetTitulo_3;

    constructor Create(AOwner: TComponent); override;
  end;

var
  frmImpressaoPadrao: TfrmImpressaoPadrao;

implementation

{$R *.dfm}

{ TfrmImpressaoPadrao }

constructor TfrmImpressaoPadrao.Create(AOwner: TComponent);
begin
  inherited;
  rllNomeEmpresa.Caption := dtmBasico.RazaoFilialBase;
  rllCGC.Caption         := 'CNPJ: ' + dtmBasico.CNPJFilialBase;
end;

procedure TfrmImpressaoPadrao.SetTitulo_2(const Value: String);
begin
  if Titulo_2 <> Value then
    Titulo_2:= Value;
  rllTituloRelatorio_2.Caption:= Titulo_2;
end;

procedure TfrmImpressaoPadrao.SetTitulo_3(const Value: String);
begin
  if Titulo_3 <> Value then
    Titulo_3:= Value;
  rllTituloRelatorio_3.Caption:= Titulo_3;
end;

end.
