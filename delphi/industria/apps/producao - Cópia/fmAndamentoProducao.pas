unit fmAndamentoProducao;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  dmcadastroosp, fmnavcontroles, Grids, DBGrids, cpdbgrid,
  StdCtrls, cpnumero, Buttons, DB, cpdatasource, fmcadastropadrao,
  ComCtrls, ExtCtrls, zquery, Windows;

type
  TfrmAndamentoProducao = class(TfrmNavControles)
    dbgAndamentoProducao: TtecDBGrid;
    bbnOK: TBitBtn;
    bbnCancelar: TBitBtn;
    dsrAndamentoProducao: TtecDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);

    destructor  Destroy; override;

  end;

var
  frmAndamentoProducao: TfrmAndamentoProducao;

implementation

{$R *.dfm}

{ TfrmAndamentoProducao }

{ TfrmAndamentoProducao }


{ TfrmAndamentoProducao }

constructor TfrmAndamentoProducao.Create(AOwner: TComponent);
begin
  Inherited Create(AOwner);
end;


destructor TfrmAndamentoProducao.Destroy;
begin
  inherited;
  frmAndamentoProducao := nil;
end;

end.
