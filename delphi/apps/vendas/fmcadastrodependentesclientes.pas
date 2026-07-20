unit fmcadastrodependentesclientes;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, fmcadastropadrao, ComCtrls, Buttons, DBCtrls,
  cpdbtext, Mask, cpdbfindcontrols, fmconsultabasica, fmconsultaporcampo,
  ZQuery, dmcadastroclientes, ctconstantes, cptexto, cpdbdata, biblio,
  ToolWin;

type
  TfrmCadastroDependentesClientes = class(TfrmCadastroPadrao)
    pnlFundoJanela: TPanel;
    edtDependentesNome: TDBEditTexto;
    ckbDependentesClientesAutorizadoaComprar: TDBCheckBox;
    edtDependentesNascto: TDBEditData;
    gbxNomeDependente: TGroupBox;
    gbxNasctoDependente: TGroupBox;
    procedure sbnProcurarDependentesClick(Sender: TObject);
  protected
    dtmCadastroClientes: TdtmCadastroClientes;
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoIncluir: Boolean; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
  public
    destructor Destroy; override;
    procedure  SetDataModulo(Dtm: TdtmCadastroClientes);
  end;

var
  frmCadastroDependentesClientes: TfrmCadastroDependentesClientes;

implementation

{$R *.dfm}

{ TfrmCadastroDependentesClientes }

destructor TfrmCadastroDependentesClientes.Destroy;
begin
  inherited;
  frmCadastroDependentesClientes:= nil;
end;

function TfrmCadastroDependentesClientes.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
end;

function TfrmCadastroDependentesClientes.InternoGravar: Boolean;
begin
  Result:= inherited InternoGravar;
  dtmCadastroClientes.GravarDependentesClientes;
  edtDependentesNome.SetFocus;
end;

function TfrmCadastroDependentesClientes.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
end;

function TfrmCadastroDependentesClientes.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa     := True;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela := False;
end;

procedure TfrmCadastroDependentesClientes.SetDataModulo(Dtm: TdtmCadastroClientes);
begin
  dtmCadastroClientes:= Dtm;
end;


procedure TfrmCadastroDependentesClientes.sbnProcurarDependentesClick(Sender: TObject);
begin
  inherited;
  CtrlOn := True;
  InternoPesquisar('');
end;
end.
