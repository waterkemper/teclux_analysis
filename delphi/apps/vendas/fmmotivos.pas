unit fmmotivos;

interface

uses
  //CLX
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  Buttons, DBCtrls, Mask, Grids, DBGrids, cpdbgrid, ExtCtrls, DB,
  //Terceiros
  ZQuery,
  //Componentes
  cpdbfindcontrols, cpdbtext, cpdatasource, 
  //Repositorio
  fmnavcontroles, fmconsultabasica, cpmemo;

type
  TfrmMotivos = class(TfrmNavControles)
    bbnOK: TBitBtn;
    bbnCancelar: TBitBtn;
    dbgMotivos: TtecDBGrid;
    pnlFundoJanela: TPanel;
    gbxFundoJanela: TGroupBox;
    dsrMotivos: TtecDataSource;
    gbxTexto: TGroupBox;
    gbxBotoes: TGroupBox;
    mmoTexto: TtecMemo;
    procedure bbnOKClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  protected
    ObrigarMotivoeTexto : Boolean;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
  public
    constructor Create(AOwner: TComponent; Titulo: String; DataSet: TZDataSet; ExibirTexto: boolean = false; ObrigarMotivoeTexto: boolean = false); reintroduce;
    destructor  Destroy; override;
    
  end;

var
  frmMotivos: TfrmMotivos;

implementation

{$R *.dfm}

{ TfrmMotivos }

constructor TfrmMotivos.Create(AOwner: TComponent; Titulo: String; DataSet: TZDataSet; ExibirTexto: boolean; ObrigarMotivoeTexto: boolean);
begin
  inherited Create(AOwner);
  self.ObrigarMotivoeTexto := ObrigarMotivoeTexto;
  dsrMotivos.DataSet := DataSet;
  Caption            := Format(Caption, [Titulo]);
  gbxTexto.visible := ExibirTexto;
  if ObrigarMotivoeTexto then
    bbnOK.modalresult := mrNone
  else
    bbnOK.modalresult := mrOk;
end;

destructor TfrmMotivos.Destroy;
begin
  inherited;
  frmMotivos := nil;

end;

function TfrmMotivos.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := nil;
end;

procedure TfrmMotivos.bbnOKClick(Sender: TObject);
begin
  inherited;
  if ObrigarMotivoeTexto then
  begin
    if (dsrMotivos.dataset.recordcount <> 0) and (mmoTexto.text <> '') then
      modalresult := mrOK
    else
      modalresult := mrNone;
  end
  else
    modalresult := mrOK;
end;

procedure TfrmMotivos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  CanClose := (ModalResult = mrOk) or (ModalResult = mrCancel); 
end;

end.
