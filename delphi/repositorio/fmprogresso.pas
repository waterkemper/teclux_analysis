unit fmprogresso;

interface

uses
  //CLX
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls,
  //Repositorio
  fmajuda;

type
  TfrmProgresso = class(TfrmAjuda)
    pnlFundoJanela: TPanel;
    pgbAndamento: TProgressBar;
    btnCancelar: TButton;
    lblProcessando: TLabel;
    procedure pgbAndamentoChanging(Sender: TObject; var Text: WideString; NewPosition: Integer);
  end;

var
  frmProgresso: TfrmProgresso;

implementation

uses biblio;

{$R *.dfm}

procedure TfrmProgresso.pgbAndamentoChanging(Sender: TObject; var Text: WideString; NewPosition: Integer);
begin
  if pgbAndamento.Position = pgbAndamento.Max then
  begin
    Close;
//    frmProgresso := nil;
  end;
end;

end.
