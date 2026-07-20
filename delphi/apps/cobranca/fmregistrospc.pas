unit fmregistrospc;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, DBCtrls, StdCtrls, Mask, Grids, DBGrids, ComCtrls,
  Windows,
  // Terceiros
  ZQuery,
  // Repositorio
  fmajudabt,
  // Componentes
  cpdbtext,
  // Constantes
  biblio, ctconstantes, ToolWin ;

type
  TfrmRegistroSPC = class(TfrmAjudaBt)
    gbxDiasCancelamento: TGroupBox;
    pnlFundoJanela: TPanel;
    lblDiasCancelamento: TLabel;
    sbnGerar: TSpeedButton;
    lblRemove: TLabel;
    lblInclui: TLabel;
    lblAviso: TLabel;
    procedure sbnGerarClick(Sender: TObject);
  protected
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
  end;

var
  frmRegistroSPC: TfrmRegistroSPC;
  TipoPesquisa: TtecPesquisa;

implementation

uses
  //Biblio
  clparametrossistema,
  //Repositorio
  dmbasico,
  //Projeto
  dmregistrospc;

{$R *.dfm}

constructor TfrmRegistroSPC.Create(AOwner: TComponent);
begin
  dtmRegistroSPC:= TdtmRegistroSPC.Create(Self);
  inherited;
//  lblDiasCancelamento.Caption:= IntToSTr(ParSistema.DiasAtraso) + ' dias';
  lblDiasCancelamento.Font.Style := lblDiasCancelamento.Font.Style + [fsBold];   
end;

destructor TfrmRegistroSPC.Destroy;
begin
  inherited;
  frmRegistroSPC:= nil;
end;

procedure TfrmRegistroSPC.KeyDown(var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_F6: sbnGerar.Click;
  end;
  inherited;
end;

procedure TfrmRegistroSPC.sbnGerarClick(Sender: TObject);
begin
  dtmRegistroSPC.InserirRegistro;
  dtmRegistroSPC.CancelarRegistro;
  MensagemAviso(ctSUCESSOSPC);
  Close;
end;

end.
