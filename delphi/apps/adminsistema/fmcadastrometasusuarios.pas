
unit fmcadastrometasusuarios;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmcadastropadrao, ComCtrls, Buttons, ExtCtrls, StdCtrls, cpnumero,
  Mask, DBCtrls, dmcadastrosinternos, frcomissao, cpdata, ctconstantes,
  cpdbdata, cpcep, cpdbfindcontrols, biblio, DB, cpdbmesano, ToolWin;

type
  TfrmCadastroMetasUsuarios = class(TfrmCadastroPadrao)
    pnlFundoJanela: TPanel;
    gbxMetasUsuarios: TGroupBox;
    lblAnoMes: TLabel;
    lblValor: TLabel;
    lblDiasMetas: TLabel;
    lblDiasMes: TLabel;
    edtValor: TDBEditNumero;
    edtDiasMetas: TDBEditNumero;
    edtDiasMes: TDBEditNumero;
    fraComissao1: TfraComissao;
    edtMesAno: TDBEditmesano;
    procedure FormShow(Sender: TObject);
  protected
    FEditando: Boolean;
    dtmCadastrosInternos: TdtmCadastrosInternos;
  public
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoIncluir: Boolean; override;
    procedure SetDataModulo(Dtm: TdtmCadastrosInternos);
    destructor Destroy; override;
    property Editando: Boolean read FEditando write FEditando;
  end;

var
  frmCadastroMetasUsuarios: TfrmCadastroMetasUsuarios;

implementation

{$R *.dfm}

{ TfrmCadastroMetasUsuarios }

destructor TfrmCadastroMetasUsuarios.Destroy;
begin
  inherited;
  frmCadastroMetasUsuarios:= nil;
end;

function TfrmCadastroMetasUsuarios.InternoExcluir: Boolean;
begin
 Result := inherited InternoExcluir;
 if not CtrlOn then
 begin
  if Result then
   dtmCadastrosInternos.ExcluirMetasUsuarios;
 end;
end;

function TfrmCadastroMetasUsuarios.InternoGravar: Boolean;
begin
  Result:= inherited InternoGravar;
  if Result then
    dtmCadastrosInternos.GravarMetasUsuarios(edtMesAno.Text);
end;

function TfrmCadastroMetasUsuarios.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if not CtrlOn then begin
    if Result then begin
      dtmCadastrosInternos.IncluirMetasUsuarios(False);
      edtMesAno.SetFocus;
    end;
  end;
end;

procedure TfrmCadastroMetasUsuarios.SetDataModulo(Dtm: TdtmCadastrosInternos);
begin
  dtmCadastrosInternos:= Dtm;
end;

procedure TfrmCadastroMetasUsuarios.FormShow(Sender: TObject);
begin
  inherited;
  dtmCadastrosInternos.IncluirMetasUsuarios(Editando);
end;

end.
