unit fmOrdensCarga;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmcadastropadrao, ComCtrls, Buttons, ToolWin, ExtCtrls, Grids,
  DBGrids, cpdbgrid, frendereco, frenderecoeditor, StdCtrls, Mask,
  cpdbfindcontrols, cpdbdata, DBCtrls, cptexto, fmcadastropadraonavegacao,
  dmOrdensCarga;

type
  TfrmOrdensCarga = class(TfrmCadastroPadrao)
    gbxNrOrdemCarga: TGroupBox;
    edfOrdemdeCarga: TtecDbEditFind;
    GroupBox1: TGroupBox;
    pnlOrdemCarga: TPanel;
    edtData: TDBEditData;
    dbgOrdensCarga: TtecDBGrid;
    dbgentrega: TtecDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;

  end;

var
  frmOrdensCarga: TfrmOrdensCarga;

implementation

{$R *.dfm}

{ TfrmOrdensCarga }

constructor TfrmOrdensCarga.Create(AOwner: TComponent);
begin
  dtmOrdensCarga := TdtmOrdensCarga.Create(Self);
  inherited;
  DataSet := dtmOrdensCarga.qryOrdensCarga;


end;

destructor TfrmOrdensCarga.Destroy;
begin
  dtmOrdensCarga := nil;
  inherited;
  frmOrdensCarga := nil;

end;

end.
 