unit fmcadastroblocos;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, dmcadastroempreendimentos, fmcadastropadrao, DBCtrls,
  cptexto, Mask, cpdbfindcontrols, ComCtrls, Buttons, ExtCtrls,
  Biblio, ctconstantes, ToolWin;

type
  TfrmCadastroBlocos = class(TfrmCadastroPadrao)
    pnlDados: TPanel;
    gbxCodigo: TGroupBox;
    gbxDescricao: TGroupBox;
    edtDescricaoBloco: TDBEditTexto;
    edtCodigo: TDBEditTexto;
    gbxBlocos: TGroupBox;
  private
    { Private declarations }

  protected
    function InternoExcluir: Boolean; override;
    function InternoGravar: Boolean; override;
    function InternoIncluir: Boolean; override;    

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
  end;

var
  frmCadastroBlocos: TfrmCadastroBlocos;

implementation

{$R *.dfm}

{ TfrmCadastroBlocos }

constructor TfrmCadastroBlocos.Create(AOwner: TComponent);
begin
  inherited;
  DataSet:= dtmcadastroempreendimentos.qryBlocos;
end;

destructor TfrmCadastroBlocos.Destroy;
begin
  inherited;
  frmCadastroBlocos:= nil;
end;

function TfrmCadastroBlocos.InternoExcluir: Boolean;
begin
  Result:= False;
  Result := inherited InternoExcluir;
  if Result then
    Result := dtmcadastroempreendimentos.ExcluirBloco;
end;

function TfrmCadastroBlocos.InternoGravar: Boolean;
begin
  Result := dtmcadastroempreendimentos.GravarBloco;
end;

function TfrmCadastroBlocos.InternoIncluir: Boolean;
begin
  Result := False;
  if not CtrlOn then
    Result := dtmcadastroempreendimentos.IncluirBloco(False);
  edtDescricaoBloco.SetFocus;
end;

end.
