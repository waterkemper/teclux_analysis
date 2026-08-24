unit fmCancelaItemFrenteCaixa;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, Windows,
  StdCtrls, fmcadastropadrao, Grids, DBGrids, cpdbgrid, ComCtrls,
  Buttons, ExtCtrls, dmfrentecaixa, ToolWin;

type
  TfrmCancelaItemFrenteCaixa = class(TfrmCadastroPadrao)
    tecDBGrid1: TtecDBGrid;
    procedure sbnSalvarClick(Sender: TObject);
    procedure sbnExcluirClick(Sender: TObject);
    procedure tecDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure tecDBGrid1DblClick(Sender: TObject);
  private
    FGravaCancelamrnto: Boolean;
    { Private declarations }
  protected
     procedure KeyDown(var Key: Word; Shift: TShiftState); override;
     procedure GravarCancelamento;
     procedure ExcluirCancelamento;
     procedure AlterarEstadoBotoes; override;
     procedure AlterarEstadoBotoes(Valor: Boolean); override;
    { Protected declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property GravaCancelamrnto : Boolean read FGravaCancelamrnto;
    { Public declarations }
  end;

var
  frmCancelaItemFrenteCaixa: TfrmCancelaItemFrenteCaixa;

implementation

{$R *.dfm}

procedure TfrmCancelaItemFrenteCaixa.sbnSalvarClick(Sender: TObject);
begin
  GravarCancelamento;
end;

procedure TfrmCancelaItemFrenteCaixa.sbnExcluirClick(Sender: TObject);
begin
  ExcluirCancelamento;
end;

constructor TfrmCancelaItemFrenteCaixa.Create(AOwner: TComponent);
begin
  inherited;
  DataSet := dtmFrenteCaixa.qryTecTempProdutosCancelados;
  FGravaCancelamrnto := False;
end;

destructor TfrmCancelaItemFrenteCaixa.Destroy;
begin
  inherited;
  frmCancelaItemFrenteCaixa := nil;
end;

procedure TfrmCancelaItemFrenteCaixa.tecDBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_SPACE) then
    dtmFrenteCaixa.marcaItemCancelado;
end;

procedure TfrmCancelaItemFrenteCaixa.FormCreate(Sender: TObject);
begin
  inherited;
  sbnSalvar.Enabled := True;
end;

procedure TfrmCancelaItemFrenteCaixa.ExcluirCancelamento;
begin
  FGravaCancelamrnto := False;
  Close;
end;

procedure TfrmCancelaItemFrenteCaixa.GravarCancelamento;
begin
  FGravaCancelamrnto := True;
  Close;
end;

procedure TfrmCancelaItemFrenteCaixa.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F5 then
    GravarCancelamento;
  if KEY = VK_F6 then
    ExcluirCancelamento;
  if Key = VK_ESCAPE then
    ExcluirCancelamento;
end;

procedure TfrmCancelaItemFrenteCaixa.AlterarEstadoBotoes;
begin
//
end;

procedure TfrmCancelaItemFrenteCaixa.AlterarEstadoBotoes(Valor: Boolean);
begin
 //
end;

procedure TfrmCancelaItemFrenteCaixa.tecDBGrid1DblClick(Sender: TObject);
begin
  dtmFrenteCaixa.marcaItemCancelado;
end;

end.
