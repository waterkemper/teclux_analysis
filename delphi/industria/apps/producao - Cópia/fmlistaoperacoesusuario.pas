unit fmlistaoperacoesusuario;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, dmoperacoesosp, fmajuda, Grids, DBGrids, cpdbgrid, Buttons, Windows,
  biblio, db, ctconstantes, ComCtrls;

type
  TfrmListaOperacoesUsuario = class(TfrmAjuda)
    dbgOperacoes: TtecDBGrid;
    btnOK: TBitBtn;
    btncancelar: TBitBtn;
    StaticText1: TStaticText;
    dbgListaOperacaoMaquinaLiberada: TtecDBGrid;
    dbgListaOperacaoMaquinaUtilizada: TtecDBGrid;
    dbgListaOperacaoMaquinaBloqueada: TtecDBGrid;
    pgcMaquinas: TPageControl;
    tstMaquinasDisponiveis: TTabSheet;
    tstMaquinasEmUso: TTabSheet;
    tstMaquinasBloqueadas: TTabSheet;
    gbxMaquinas: TGroupBox;
    procedure dbgOperacoesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgListaOperacaoMaquinaLiberadaKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure btnOKClick(Sender: TObject);
    procedure dbgListaOperacaoMaquinaLiberadaDrawColumnCell(
      Sender: TObject; const Rect: TRect; DataCol: Integer;
      Column: TColumn; State: TGridDrawState);
    procedure dbgOperacoesDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    destructor Destroy; override;


  end;
{
type
  TtecDBGridAux  = class(TDBGrid);
  }


var
  frmListaOperacoesUsuario: TfrmListaOperacoesUsuario;

implementation

{$R *.dfm}

procedure TfrmListaOperacoesUsuario.dbgOperacoesKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_return then
  begin
    if dtmOperacoesOSP.qryListaOperacaoLiberadatipooperacao.asstring='ABERTURA' then
    begin
      if dtmOperacoesOSP.qryListaOperacaoMaquinaLiberada.RecordCount > 1 then
        dbgListaOperacaoMaquinaLiberada.SetFocus
      else
      if dtmOperacoesOSP.qryListaOperacaoMaquinaLiberada.RecordCount = 1 then
        ModalResult := mrOk
      else
      if (dtmOperacoesOSP.qryListaOperacaoMaquinaUtilizada.RecordCount <> 0) {or
         (dtmOperacoesOSP.qryListaOperacaoMaquinaBloqueada.RecordCount <> 0)}  then
        MensagemAviso('Não existem máquinas disponíveis para a operação.')
      else
        ModalResult := mrOk
    end
    else
      ModalResult := mrOk;
  end;
  inherited;
end;

destructor TfrmListaOperacoesUsuario.Destroy;
begin
  inherited;
  frmListaOperacoesUsuario := nil;
end;

procedure TfrmListaOperacoesUsuario.dbgListaOperacaoMaquinaLiberadaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_return then
  begin
    if dtmOperacoesOSP.qryListaOperacaoLiberadatipooperacao.asstring='ABERTURA' then
    begin
      if dtmOperacoesOSP.qryListaOperacaoMaquinaLiberada.RecordCount >= 1 then
        ModalResult := mrOk
      else
      if (dtmOperacoesOSP.qryListaOperacaoMaquinaUtilizada.RecordCount <> 0) {or
         (dtmOperacoesOSP.qryListaOperacaoMaquinaBloqueada.RecordCount <> 0)}  then
        MensagemAviso('Não existem máquinas disponíveis para a operação.')
      else
        ModalResult := mrOk
    end;
  end;
  inherited;
end;

procedure TfrmListaOperacoesUsuario.btnOKClick(Sender: TObject);
var
  vcontinuar : boolean;
begin
  inherited;
  vcontinuar := true;
  if dtmOperacoesOSP.qryListaOperacaoLiberadatipooperacao.asstring='ABERTURA' then
  begin
    if not dtmOperacoesOSP.qryListaOperacaoLiberadanaobloqueiausuario.AsBoolean
       and dtmOperacoesOSP.qryListaOperacaoMaquinaLiberadanaobloqueiausuario.AsBoolean then
    begin
      vcontinuar := false;
      if (MensagemConfirmacao('Esta máquina esta vinculada a operações não bloqueantes e a operação selecionada é bloqueante.') = smbOk) then
        vcontinuar := true;
    end;

    if vcontinuar then
    begin
      if dtmOperacoesOSP.qryListaOperacaoMaquinaLiberada.RecordCount >= 1 then
        ModalResult := mrOk
      else
      if (dtmOperacoesOSP.qryListaOperacaoMaquinaUtilizada.RecordCount <> 0) {or
         (dtmOperacoesOSP.qryListaOperacaoMaquinaBloqueada.RecordCount <> 0)}  then
        MensagemAviso('Não existem máquinas disponíveis para a operação.')
      else
        ModalResult := mrOk
    end;
  end
  else
    ModalResult := mrOk;
end;

procedure TfrmListaOperacoesUsuario.dbgListaOperacaoMaquinaLiberadaDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if gdSelected in State then
//  if dtmOperacoesOSP.qryListaOperacaoMaquinaLiberada.RecNo =  TtecDBGridAux(dbgListaOperacaoMaquinaLiberada).Row   then
  begin
    TDBGrid(Sender).Canvas.Font.Color := clRed;
    TDBGrid(Sender).Canvas.Font.Style := [fsBold];
  end
  else
  begin
    TDBGrid(Sender).Canvas.Font.Color := clBlack;
    TDBGrid(Sender).Canvas.Font.Style := [];
  end;
  dbgListaOperacaoMaquinaLiberada.DefaultDrawColumnCell(Rect,DataCol,Column,State);

end;

procedure TfrmListaOperacoesUsuario.dbgOperacoesDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
 i: integer;
begin
  inherited;
//  if dbgOperacoes.DataSource.DataSet.RecNo =  TtecDBGridAux(dbgOperacoes).row then
  if gdSelected in State then
  begin
    TDBGrid(Sender).Canvas.Font.Color := clRed;
    TDBGrid(Sender).Canvas.Font.Style := [fsBold];
  end
  else
  begin
    TDBGrid(Sender).Canvas.Font.Color := clBlack;
    TDBGrid(Sender).Canvas.Font.Style := [];
  end;
  dbgOperacoes.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

end.
