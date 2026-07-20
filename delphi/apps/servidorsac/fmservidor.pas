unit fmservidor;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, Grids, DBGrids, StdCtrls, ComCtrls,
  // Repositorio
  fmajudabt,
  // Componentes
  cpdbgrid, cpsacclient, Provider, SqlExpr, DB, DBClient, DBLocal,
  DBLocalS, cpdatasource, DBXpress, IdBaseComponent, IdAntiFreezeBase,
  IdAntiFreeze;

type
  TfrmServidorChamadas = class(TfrmAjudaBt)
    lblParametros: TLabel;
    edtParametros: TEdit;
    sbnAbrir: TSpeedButton;
    odlAbrir: TOpenDialog;
    btnSetar: TButton;
    btnIniciar: TButton;
    IdAntiFreeze1: TIdAntiFreeze;
    ssvSac: TtecSacTcpServer;
    procedure sbnAbrirClick(Sender: TObject);
    procedure btnSetarClick(Sender: TObject);
    procedure btnIniciarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ssvSacChamada;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ssvSacResponse(Numero: Cardinal; Call: Word;
      Response: TResponse; ResponseResult: TResponseResult);
  private
  public
    constructor Create(AOwnwer: TComponent); override;
  end;

var
  frmServidorChamadas: TfrmServidorChamadas;

implementation

uses dmchamadas, dmtecsoft, cpquery;

{$R *.dfm}

constructor TfrmServidorChamadas.Create(AOwnwer: TComponent);
begin
  inherited;
  dtmChamadas:= TdtmChamadas.Create(Self);
  bvlBotoesEd.Hide;
  sbnProcurar.Hide;
  sbnAjuda.Left:= 0;
end;

procedure TfrmServidorChamadas.sbnAbrirClick(Sender: TObject);
begin
  if odlAbrir.Execute then
    edtParametros.Text:= odlAbrir.FileName;
end;

procedure TfrmServidorChamadas.btnSetarClick(Sender: TObject);
begin
  ssvSac.SocketParams:= Trim(edtParametros.Text);
  if ssvSac.SocketParams <> '' then
    ssvSac.SendSocketParams;
end;

procedure TfrmServidorChamadas.btnIniciarClick(Sender: TObject);
begin
  ssvSac.Connect;
  dtmchamadas.InicializaChamadas;
end;

procedure TfrmServidorChamadas.FormActivate(Sender: TObject);
begin
  edtParametros.Text:= ssvSac.SocketParams;
end;

procedure TfrmServidorChamadas.ssvSacChamada;
var numero,
    chamada:  cardinal;
    status:   char;
    operador: string;
    fone:     string;
    Call:     Word;
begin
  Case dtmChamadas.LerPrimeiraChamada(numero,chamada,status,operador,fone) of
   'E': begin
          ssvSacResponse(Numero,0,reLock,rrNone);
          ssvSac.Chamada(Numero,Operador,Fone);
        end;
   'D': begin
          Call := dtmChamadas.BuscaChamada(Chamada);
          ssvSacResponse(Numero,0,reCallEnd,rrSucess);
          If Call <> 0 then
            ssvSac.DerrubaChamada(Call);
        end;
  end;
  sleep(1000);
end;

procedure TfrmServidorChamadas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dtmchamadas.qryChamadas.Close;
  ssvSac.Disconect;
  inherited;
end;

procedure TfrmServidorChamadas.ssvSacResponse(Numero: Cardinal;
  Call: Word; Response: TResponse; ResponseResult: TResponseResult);
var status:    char;
begin
  status := 'X';
  case Response of
      reAlocation: case ResponseResult of
                     rrSucess: status := 'A';
                     rrFail  : status := 'F';
                   end;
      reDial     : status := 'D';
      reRungUp   : status := 'T';
      reCallEnd  : case ResponseResult of
                     rrNone,
                     rrCallProblem  : status := 'C';
                     rrBusy         : status := 'O';
                     rrNumberProblem: status := 'N';
                     rrSucess       : status := 'S';
                     Else             status := 'S';
                   end;
  end;
  dtmChamadas.AtualizarStatus(Numero,Call,Status);
end;

end.
