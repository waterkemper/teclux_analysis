unit fmparametroselecaobasica;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Windows,
  //Repositorio
  dmbasico, fmnavcontroles, fmajuda, fmconsultabasica, DB, Grids, DBGrids,
  cpdatasource, cpdbgrid, ComCtrls;

type
  TfrmParametroSelecaoBasica = class(TfrmConsultaBasica)
    bbnExecutar: TBitBtn;
    pnlNrRegistros: TPanel;
    lblNrRegistros: TLabel;
    lblQtde: TLabel;
    procedure bbnExecutarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  protected
    FDataModulo: TdtmBasico;
    procedure AtivarProcura; virtual;
    function  GetFiltros: TStringList; virtual; abstract;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    function  NrRegistrosSelecionados: Integer; virtual; abstract;
  public
    property DataModulo: TdtmBasico read FDataModulo;
    property Filtros: TStringList read GetFiltros;
  end;

implementation

{$R *.dfm}

Uses
  //CLX
  {Qete,}
  //Biblio
  ctconstantes;

procedure TfrmParametroSelecaoBasica.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close
  else
    inherited KeyDown(Key, Shift);
end;

procedure TfrmParametroSelecaoBasica.bbnExecutarClick(Sender: TObject);
begin
  inherited;
  if Assigned(DataModulo) then begin
    DataModulo.Fecha(ctSACTabelasConsultaContratos);
    DataModulo.Abre(ctSACTabelasConsultaContratos);
  end;
  lblQtde.Caption:= IntToStr(NrRegistrosSelecionados);
  bbnOK.Enabled := NrRegistrosSelecionados > 0;
end;

procedure TfrmParametroSelecaoBasica.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action:= caHide;
end;

procedure TfrmParametroSelecaoBasica.AtivarProcura;
begin
  //
end;

end.
