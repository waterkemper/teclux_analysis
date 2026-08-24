unit fmmetavendas;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmajudabt, Grids, DBGrids, cpdbgrid, ComCtrls, Buttons,
  ExtCtrls, dmfrentecaixa, biblio, DB, ToolWin;

type
  TfrmMetaVendas = class(TfrmAjudaBt)
    gbxFundoJanela: TGroupBox;
    lblDataLocal: TLabel;
    gbxMeta: TGroupBox;
    dbgMeta: TtecDBGrid;
    procedure dbgMetaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormLoaded(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    { Public declarations }
  end;

var
  frmMetaVendas: TfrmMetaVendas;

implementation

{$R *.dfm}

{ TfrmMetaVendas }

constructor TfrmMetaVendas.Create(AOwner: TComponent);
begin
  inherited;
  lblDataLocal.Caption := DiaDaSemana(DataLocal) + ' ' + FormatDateTime('dd/mm/yyyy',DataLocal);
end;

destructor TfrmMetaVendas.Destroy;
begin
  inherited;
  frmMetaVendas := nil;
end;

procedure TfrmMetaVendas.dbgMetaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  case column.Index of
    1: if TDBGrid(Sender).DataSource.DataSet.FieldByName('percentual').AsCurrency < 100 then
         TDBGrid(Sender).Canvas.Font.Color := clRed
       else
         TDBGrid(Sender).Canvas.Font.Color := clGreen;
  end;
  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmMetaVendas.FormLoaded(Sender: TObject);
begin
  inherited;
  dtmFrenteCaixa.RefazConsultaMetaVendas;
end;



end.
