
unit fmcadastrocomissoescobrancausuarios;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, fmcadastropadrao, ComCtrls, Buttons, DBCtrls,
  cpdbtext, cpnumero, dmcadastrosinternos, ctconstantes, biblio, Mask,
  ToolWin;

type
  TfrmCadastroComissoesCobrancaUsuarios = class(TfrmCadastroPadrao)
    pnlFundoJanela: TPanel;
    gbxComissoesCobranca: TGroupBox;
    dtxEvento: TtecDBText;
    lblEvento: TLabel;
    lblFaixa1: TLabel;
    lblFaixa2: TLabel;
    lblFaixa3: TLabel;
    lblFaixa4: TLabel;
    edtFaixa1: TDBEditNumero;
    edtFaixa2: TDBEditNumero;
    edtFaixa3: TDBEditNumero;
    edtFaixa4: TDBEditNumero;
    lblPerc1: TLabel;
    lblPerc2: TLabel;
    lblPerc3: TLabel;
    lblPerc4: TLabel;
    procedure edtFaixa1Exit(Sender: TObject);
    procedure edtFaixa2Exit(Sender: TObject);
    procedure edtFaixa3Exit(Sender: TObject);
    procedure edtFaixa4Exit(Sender: TObject);
  private
    dtmCadastrosInternos: TdtmCadastrosInternos;
  public
    function  InternoGravar: Boolean; override;
    procedure  SetDataModulo(Dtm: TdtmCadastrosInternos);
    destructor Destroy; override;
    procedure ValidaComissao(comissao: TDBEditNumero);
  end;

var
  frmCadastroComissoesCobrancaUsuarios: TfrmCadastroComissoesCobrancaUsuarios;

implementation

{$R *.dfm}

{ TfrmCadastroComissoesCobrancaUsuarios }

destructor TfrmCadastroComissoesCobrancaUsuarios.Destroy;
begin
  inherited;
  frmCadastroComissoesCobrancaUsuarios:= nil;
end;

function TfrmCadastroComissoesCobrancaUsuarios.InternoGravar: Boolean;
begin
  Result:= inherited InternoGravar;
  if Result then
    dtmCadastrosInternos.GravarComissoesCobranca;
end;

procedure TfrmCadastroComissoesCobrancaUsuarios.SetDataModulo(Dtm: TdtmCadastrosInternos);
begin
  dtmCadastrosInternos:= Dtm;
end;

procedure TfrmCadastroComissoesCobrancaUsuarios.edtFaixa1Exit(
  Sender: TObject);
begin
  inherited;
  ValidaComissao(edtFaixa1);
end;

procedure TfrmCadastroComissoesCobrancaUsuarios.edtFaixa2Exit(
  Sender: TObject);
begin
  inherited;
  ValidaComissao(edtFaixa2);
end;

procedure TfrmCadastroComissoesCobrancaUsuarios.edtFaixa3Exit(
  Sender: TObject);
begin
  inherited;
  ValidaComissao(edtFaixa3);
end;

procedure TfrmCadastroComissoesCobrancaUsuarios.edtFaixa4Exit(
  Sender: TObject);
begin
  inherited;
  ValidaComissao(edtFaixa4);
end;

procedure TfrmCadastroComissoesCobrancaUsuarios.ValidaComissao(
  comissao: TDBEditNumero);
begin
if comissao.Text <> '' then
 if (StrToFloat(comissao.Text) > 100) then
 begin
  MensagemAviso(ctAVISOCOMISSAO);
  comissao.Text := '0';
  comissao.setfocus;
 end;
end;

end.
