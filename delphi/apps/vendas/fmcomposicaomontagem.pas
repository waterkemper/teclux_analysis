unit fmcomposicaomontagem;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmnavcontroles, Grids, DBGrids, cpdbgrid, ExtCtrls,
  Buttons, fmcadastropadraonavegacao, ComCtrls, ToolWin;

type
  TfrmComposicaoMontagem = class(TfrmCadastroPadraoNav)
    pnlFundoJanela: TPanel;
    dbgComposicaoMontagem: TtecDBGrid;
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    { Public declarations }
  end;

var
  frmComposicaoMontagem: TfrmComposicaoMontagem;

implementation

uses
  dmordemservico, clparametrossistema;

{$R *.dfm}

{ TfrmComposicaoMontagem }


constructor TfrmComposicaoMontagem.Create(AOwner: TComponent);
begin
  inherited;
  {if dbgComponentesMontagem.columns[2].width  < ParSistema.TamanhoMascaraQuantidade then
    dbgComponentesMontagem.columns[2].width  := ParSistema.TamanhoMascaraQuantidade;
  if dbgComponentesMontagem.columns[5].width < ParSistema.TamanhoMascaraQuantidade then
    dbgComponentesMontagem.columns[5].width := ParSistema.TamanhoMascaraQuantidade;}
end;

destructor TfrmComposicaoMontagem.Destroy;
begin
  inherited;
  frmComposicaoMontagem := nil;
end;

end.
