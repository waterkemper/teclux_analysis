unit fmListaOperacoes;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  dmimprimeosp, fmnavcontroles, Grids, DBGrids, cpdbgrid,
  StdCtrls, cpnumero, Buttons, DB, cpdatasource, fmcadastropadrao,
  ComCtrls, ExtCtrls, zquery, Windows;

type
  TfrmListaOperacoes = class(TfrmNavControles)
    dbgListaOperacoes: TtecDBGrid;
    bbnOK: TBitBtn;
    bbnCancelar: TBitBtn;
    dsrListaOperacoes: TtecDataSource;
    procedure dbgListaOperacoesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgListaOperacoesDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent;
                         TabelaOperacoes: TZDataSet);

    destructor  Destroy; override;

  end;

var
  frmListaOperacoes: TfrmListaOperacoes;

implementation

{$R *.dfm}

{ TfrmListaOperacoes }

{ TfrmListaOperacoes }


{ TfrmListaOperacoes }

constructor TfrmListaOperacoes.Create(AOwner: TComponent;
                                            TabelaOperacoes: TZDataset);
begin
  Inherited Create(AOwner);
  dsrListaOperacoes.DataSet := TabelaOperacoes;
end;


destructor TfrmListaOperacoes.Destroy;
begin
  inherited;
  frmListaOperacoes := nil;
end;

procedure TfrmListaOperacoes.dbgListaOperacoesKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_Space then
//    if Shift = [ssCtrl] then
      dtmImprimeOsp.MarcarRegistrosSelecionados;

end;

procedure TfrmListaOperacoes.dbgListaOperacoesDblClick(Sender: TObject);
begin
  inherited;
  dtmImprimeOsp.MarcarRegistrosSelecionados;
end;

end.
