unit fmcadastroparcelasdevolucao;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmcadastropadrao, ComCtrls, Buttons, ExtCtrls, StdCtrls, Mask,
  cpdbfindcontrols, cpnumero, cpdbdata, dmdevolucaomercadorias,
  fmconsultabasica, fmconsultaporcampo, ZQuery, DBCtrls, cpdbtext, ToolWin;

type
  TfrmCadastroParcelaDevolucao = class(TfrmCadastroPadrao)
    pnlFundoJanela: TPanel;
    gbxParcelasDevolucao: TGroupBox;
    edtDataVencto: TDBEditData;
    edtValorVencto: TDBEditNumero;
    lblDataVencto: TLabel;
    lblValorVencto: TLabel;
  protected
    dtmDevolucao: TdtmDevolucaoMercadorias;
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoIncluir: Boolean; override;
  public
    destructor Destroy; override;
    procedure  SetDataModulo(Dtm: TdtmDevolucaoMercadorias);
  end;
var
  frmCadastroParcelaDevolucao: TfrmCadastroParcelaDevolucao;

implementation

{$R *.dfm}

{ TfrmCadastroParcelaDevolucao }

destructor TfrmCadastroParcelaDevolucao.Destroy;
begin
  inherited;
  frmCadastroParcelaDevolucao:= nil;
end;

function TfrmCadastroParcelaDevolucao.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then begin
    dtmDevolucao.ExcluirParcelas;
    Close;
  end;  
end;

function TfrmCadastroParcelaDevolucao.InternoGravar: Boolean;
begin
  Result:= Inherited InternoGravar;
  if Result then begin
    dtmDevolucao.GravarParcelas;
    Close;
  end;
end;

function TfrmCadastroParcelaDevolucao.InternoIncluir: Boolean;
begin
  Result:= Inherited InternoIncluir;
  if Result then
    dtmDevolucao.IncluirParcelas(False);
end;

procedure TfrmCadastroParcelaDevolucao.SetDataModulo(Dtm: TdtmDevolucaoMercadorias);
begin
  dtmDevolucao:= dtm;
end;

end.
