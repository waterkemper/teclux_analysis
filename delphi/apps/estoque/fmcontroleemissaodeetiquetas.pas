unit fmcontroleemissaodeetiquetas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmrelatoriopadrao, ExtCtrls, Buttons, ToolWin, ComCtrls,
  frintervalodatas, dmcontroleemissaodeetiquetas, frlistafiliais;

type
  TfrmControleEmissaodeEtiquetas = class(TFrmRelatorioPadrao)
    fraIntervaloDatas: TfraIntervaloDatas;
    fraListaFiliais: TfraListaFiliais;
  private
    { Private declarations }
    procedure InternoImpressao; override;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

  end;

var
  frmControleEmissaodeEtiquetas: TfrmControleEmissaodeEtiquetas;

implementation

{$R *.dfm}

{ TfrmControleEmissaodeEtiquetas }

constructor TfrmControleEmissaodeEtiquetas.Create(AOwner: TComponent);
begin
  inherited;
  dtmControleEmissaodeEtiquetas := TdtmControleEmissaodeEtiquetas.Create(Self);

end;

destructor TfrmControleEmissaodeEtiquetas.Destroy;
begin

  inherited;
end;

procedure TfrmControleEmissaodeEtiquetas.InternoImpressao;
begin
  inherited;
  dtmControleEmissaodeEtiquetas.ImprimirRelatorio(fraIntervaloDatas.edtdatainicial.text,
                                                  fraIntervaloDatas.edtdatafinal.text,
                                                  fraListaFiliais.ListaSelecionada
                                                  );

end;

end.
