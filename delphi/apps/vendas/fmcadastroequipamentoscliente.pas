unit fmcadastroequipamentoscliente;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, fmcadastropadrao, ComCtrls, Buttons, DBCtrls,
  cpdbtext, Mask, cpdbfindcontrols, fmconsultabasica, fmconsultaporcampo,
  ZQuery, dmcadastroclientes, ctconstantes, biblio, ToolWin;

type
  TfrmCadastroEquipamentosCliente = class(TfrmCadastroPadrao)
    pnlFundoJanela: TPanel;
    gbxEquipamentosCliente: TGroupBox;
    lblEquipamento: TLabel;
    flkEquipamento: TtecDBFindLookup;
    dtxEquipamento: TtecDBText;
    sbnProcurarEquipamento: TSpeedButton;
    Label1: TLabel;
    dtxReferencia: TtecDBText;
    lblMarca: TLabel;
    dtxMarca: TtecDBText;
    dtxDescricaoMarca: TtecDBText;
    lblModelo: TLabel;
    dtxModelo: TtecDBText;
    lblOpcionais: TLabel;
    dtxOpcionais: TtecDBText;
    dtxAno: TtecDBText;
    lblAno: TLabel;
    procedure sbnProcurarEquipamentoClick(Sender: TObject);
    procedure flkEquipamentoMessage(var Msg: String);
  protected
    dtmCadastroClientes: TdtmCadastroClientes;
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoIncluir: Boolean; override;
    function  InternoPesquisar(Titulo:String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
  public
    destructor Destroy; override;
    procedure  SetDataModulo(Dtm: TdtmCadastroClientes);
  end;

var
  frmCadastroEquipamentosCliente: TfrmCadastroEquipamentosCliente;

implementation

{$R *.dfm}

{ TfrmCadastroEquipamentosCliente }

destructor TfrmCadastroEquipamentosCliente.Destroy;
begin
  inherited;
  frmCadastroEquipamentosCliente:= nil;
end;

function TfrmCadastroEquipamentosCliente.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then begin
//    dtmCadastroClientes.ExcluirEquipamentosCliente;
    flkEquipamento.Exist;
  end;
end;

function TfrmCadastroEquipamentosCliente.InternoGravar: Boolean;
begin
  Result:= inherited InternoGravar;
  if Result then
    if flkEquipamento.Exist then
//      dtmCadastroClientes.GravarEquipamentosCliente;
   frmCadastroEquipamentosCliente.SetFocus;
end;

function TfrmCadastroEquipamentosCliente.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then begin
//    dtmCadastroClientes.IncluirEquipamentosCliente(False);
    flkEquipamento.SetFocus;
  end;
end;

function TfrmCadastroEquipamentosCliente.InternoPesquisar(Titulo: String): Integer;
begin
  Result:= mrNone;
  if CtrlOn then with dtmCadastroClientes do begin
    AbreTabelasConsulta(tpEQUIPAMENTOS);
    Result := inherited InternoPesquisar('Equipamentos');
    if Result = mrOK then
      Selecionar(tpEQUIPAMENTOS);
    FechaTabelasConsulta(tpEQUIPAMENTOS);
  end;
end;

function TfrmCadastroEquipamentosCliente.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa     := True;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela := False;
end;

procedure TfrmCadastroEquipamentosCliente.SetDataModulo(Dtm: TdtmCadastroClientes);
begin
  dtmCadastroClientes:= Dtm;
end;

procedure TfrmCadastroEquipamentosCliente.sbnProcurarEquipamentoClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  InternoPesquisar('');
end;

procedure TfrmCadastroEquipamentosCliente.flkEquipamentoMessage(var Msg: String);
begin
  inherited;
  Msg:= 'O código ' + flkEquipamento.Text + ' não está cadastrado' + #10#13 +
        'ou já foi utilizado por outro cliente.';
end;

end.
