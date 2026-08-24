unit fmVisualizacaoCampos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, CheckLst, Grids, AdvObj, BaseGrid, AdvGrid,
  AdvCGrid, DB, ZQuery, ZPgSqlQuery, cpquery, cpdatasource, DBAdvGrid,
  cpdatabase, ExtCtrls;

type
  TfrmVisualizacaoCampos = class(TForm)
    bbnOK: TBitBtn;
    bbnCancelar: TBitBtn;
    dsrCampos: TtecDataSource;
    qryCampos: TtecQuery;
    lstCampos: TDBAdvGrid;
    qryCamposvisivel: TBooleanField;
    qryCamposnomedocampo: TStringField;
    qryCamposnomenogrid: TStringField;
    qryCamposvisivelOriginal: TBooleanField;
    qryCamposnomenogridOriginal: TStringField;
    btnReverter: TBitBtn;
    pnlAbaixo: TPanel;
    procedure qryCamposAfterPost(DataSet: TDataSet);
    procedure btnReverterClick(Sender: TObject);
  private
    FCamposAfterPost: TNotifyEvent;
    FReverterCampos: TNotifyEvent;
  private
    { Private declarations }

  public
    { Public declarations }
    constructor Create(AOwner: TComponent; DataBase: TtecDatabase = nil); reintroduce;
    destructor Destroy; override;
    Property CamposAfterPost : TNotifyEvent read FCamposAfterPost Write fCamposAfterPost;
    Property ReverterCampos : TNotifyEvent read FReverterCampos Write fReverterCampos;

  end;

var
  frmVisualizacaoCampos: TfrmVisualizacaoCampos;

implementation

{$R *.dfm}

{ TfrmVisualizacaoCampos }

constructor TfrmVisualizacaoCampos.Create(AOwner: TComponent; DataBase: TtecDatabase);
begin
  inherited Create(AOwner);
  qryCampos.database := Database;
  qryCampos.close;
  qryCampos.open;
  qryCampos.delete;
end;

destructor TfrmVisualizacaoCampos.Destroy;
begin
  frmVisualizacaoCampos := nil;
  inherited;
end;

procedure TfrmVisualizacaoCampos.qryCamposAfterPost(DataSet: TDataSet);
begin
  if assigned(CamposAfterPost) then
    CamposAfterPost(DataSet);
end;

procedure TfrmVisualizacaoCampos.btnReverterClick(Sender: TObject);
begin
  if assigned(ReverterCampos)  then
    ReverterCampos(Sender);
end;

end.
