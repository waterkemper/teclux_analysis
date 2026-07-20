unit fmvisualizarlogClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmnavcontroles, DB, ZQuery, ZPgSqlQuery, cpquery, cpdatasource,
  Grids, DBGrids, cpdbgrid, biblio, dmtecsoft, AdvObj, BaseGrid, AdvGrid,
  DBAdvGrid, ctconstantes, clparametrossistema, Menus, AdvMenus,
  tmsAdvGridExcel, AsgFindDialog;

type
  TfrmVisualizarLogClientes = class(TfrmNavControles)
    dsrVisualizarLogClientes: TtecDataSource;
    qryVisualizarLogClientes: TtecQuery;
    qryVisualizarLogClientescodigo: TIntegerField;
    qryVisualizarLogClientesnome: TStringField;
    qryVisualizarLogClientesnascto: TDateField;
    qryVisualizarLogClientesapelido: TStringField;
    qryVisualizarLogClientessexo: TStringField;
    qryVisualizarLogClientescivil: TStringField;
    qryVisualizarLogClientescivildata: TDateField;
    qryVisualizarLogClientesiddocumento: TStringField;
    qryVisualizarLogClientesidorgao: TStringField;
    qryVisualizarLogClientesiddata: TDateField;
    qryVisualizarLogClientesidestado: TStringField;
    qryVisualizarLogClientespessoatipo: TStringField;
    qryVisualizarLogClientespessoanumero: TStringField;
    qryVisualizarLogClientesmae: TStringField;
    qryVisualizarLogClientespai: TStringField;
    qryVisualizarLogClientesconceito: TIntegerField;
    qryVisualizarLogClientesnaturalcidade: TIntegerField;
    qryVisualizarLogClientesnaturalestado: TStringField;
    qryVisualizarLogClientesrua: TStringField;
    qryVisualizarLogClientesestado: TStringField;
    qryVisualizarLogClientescidade: TIntegerField;
    qryVisualizarLogClientesbairro: TIntegerField;
    qryVisualizarLogClientescep: TIntegerField;
    qryVisualizarLogClientesfonetipo: TStringField;
    qryVisualizarLogClientesfoneddd: TIntegerField;
    qryVisualizarLogClientesfonenumero: TIntegerField;
    qryVisualizarLogClientesfoneramal: TStringField;
    qryVisualizarLogClientesfone2ddd: TIntegerField;
    qryVisualizarLogClientesfone2numero: TIntegerField;
    qryVisualizarLogClientesfone2ramal: TStringField;
    qryVisualizarLogClientesrestipo: TStringField;
    qryVisualizarLogClientesresonus: TFloatField;
    qryVisualizarLogClientesrestempo: TDateField;
    qryVisualizarLogClientesempresa: TStringField;
    qryVisualizarLogClientesempadmissao: TDateField;
    qryVisualizarLogClientesempcep: TIntegerField;
    qryVisualizarLogClientesempcomprovado: TBooleanField;
    qryVisualizarLogClientesempfoneddd: TIntegerField;
    qryVisualizarLogClientesempfonenumero: TIntegerField;
    qryVisualizarLogClientesempfoneramal: TStringField;
    qryVisualizarLogClientesempoutrasdescricao: TStringField;
    qryVisualizarLogClientesempoutrasfaixa: TIntegerField;
    qryVisualizarLogClientesempoutrasvalor: TFloatField;
    qryVisualizarLogClientesemprendafaixa: TIntegerField;
    qryVisualizarLogClientesemprendavalor: TFloatField;
    qryVisualizarLogClientesemprua: TStringField;
    qryVisualizarLogClientesempestado: TStringField;
    qryVisualizarLogClientesempcidade: TIntegerField;
    qryVisualizarLogClientesempbairro: TIntegerField;
    qryVisualizarLogClientesempcargo: TIntegerField;
    qryVisualizarLogClientesconjuge: TIntegerField;
    qryVisualizarLogClientesconnome: TStringField;
    qryVisualizarLogClientesconadmissao: TDateField;
    qryVisualizarLogClientesconcep: TIntegerField;
    qryVisualizarLogClientesconempresa: TStringField;
    qryVisualizarLogClientesconfoneddd: TIntegerField;
    qryVisualizarLogClientesconfonenumero: TIntegerField;
    qryVisualizarLogClientesconfoneramal: TStringField;
    qryVisualizarLogClientesconnascto: TDateField;
    qryVisualizarLogClientesconrendafaixa: TIntegerField;
    qryVisualizarLogClientesconrendavalor: TFloatField;
    qryVisualizarLogClientesconrua: TStringField;
    qryVisualizarLogClientesconestado: TStringField;
    qryVisualizarLogClientesconcidade: TIntegerField;
    qryVisualizarLogClientesconbairro: TIntegerField;
    qryVisualizarLogClientesconcargo: TIntegerField;
    qryVisualizarLogClientesreferencia: TStringField;
    qryVisualizarLogClientesreftipo: TStringField;
    qryVisualizarLogClientesrefrua: TStringField;
    qryVisualizarLogClientesrefestado: TStringField;
    qryVisualizarLogClientesrefcidade: TIntegerField;
    qryVisualizarLogClientesrefbairro: TIntegerField;
    qryVisualizarLogClientesrefcep: TIntegerField;
    qryVisualizarLogClientesreffoneddd: TIntegerField;
    qryVisualizarLogClientesreffonenumero: TIntegerField;
    qryVisualizarLogClientesreffoneramal: TStringField;
    qryVisualizarLogClientesreffone2ddd: TIntegerField;
    qryVisualizarLogClientesreffone2numero: TIntegerField;
    qryVisualizarLogClientesreffone2ramal: TStringField;
    qryVisualizarLogClientesobservacoes: TStringField;
    qryVisualizarLogClientesemail: TStringField;
    qryVisualizarLogClientesautomovel: TBooleanField;
    qryVisualizarLogClientescartaocredito: TBooleanField;
    qryVisualizarLogClientescartaoloja: TBooleanField;
    qryVisualizarLogClientescheque: TBooleanField;
    qryVisualizarLogClienteschequeespecial: TBooleanField;
    qryVisualizarLogClientesdependentes: TIntegerField;
    qryVisualizarLogClientesonus: TFloatField;
    qryVisualizarLogClientesenderecoalterado: TDateField;
    qryVisualizarLogClientesfilialcadastro: TIntegerField;
    qryVisualizarLogClientesdatacadastro: TDateField;
    qryVisualizarLogClientesultimaalteracao: TDateField;
    qryVisualizarLogClientesdebito: TIntegerField;
    qryVisualizarLogClientescredito: TIntegerField;
    qryVisualizarLogClientesplanopadrao: TIntegerField;
    qryVisualizarLogClientesnaoexibirfichafinanceira: TBooleanField;
    qryVisualizarLogClientescontribicms: TBooleanField;
    qryVisualizarLogClientesmarkup: TFloatField;
    qryVisualizarLogClientesaniversario: TDateField;
    qryVisualizarLogClientesinscricaomunicipal: TStringField;
    qryVisualizarLogClientesobsnotafiscal: TStringField;
    qryVisualizarLogClientesobsipisuspenso: TStringField;
    qryVisualizarLogClientesipisuspenso: TBooleanField;
    qryVisualizarLogClientesvendedor: TIntegerField;
    qryVisualizarLogClientespracapagtocidade: TIntegerField;
    qryVisualizarLogClientespracapagtoestado: TStringField;
    qryVisualizarLogClientesclientetransito: TIntegerField;
    qryVisualizarLogClientescobrancaemcarteira: TBooleanField;
    qryVisualizarLogClientessuframa: TStringField;
    qryVisualizarLogClientesnumero: TIntegerField;
    qryVisualizarLogClientesempnumero: TIntegerField;
    qryVisualizarLogClientesconnumero: TIntegerField;
    qryVisualizarLogClientesrefnumero: TIntegerField;
    qryVisualizarLogClientescomplemento: TStringField;
    qryVisualizarLogClientesempcomplemento: TStringField;
    qryVisualizarLogClientesconcomplemento: TStringField;
    qryVisualizarLogClientesrefcomplemento: TStringField;
    qryVisualizarLogClientessite: TStringField;
    qryVisualizarLogClientesdebitoqdofornecedor: TIntegerField;
    qryVisualizarLogClientescreditoqdofornecedor: TIntegerField;
    qryVisualizarLogClienteshistoricocontabil: TIntegerField;
    qryVisualizarLogClientesnosimples: TBooleanField;
    qryVisualizarLogClientestagadpednfe: TBooleanField;
    qryVisualizarLogClientesrecolhericmsst: TBooleanField;
    qryVisualizarLogClientesnaoligar: TBooleanField;
    qryVisualizarLogClientesrazaonaoligar: TStringField;
    qryVisualizarLogClientesusuariosetounaoligar: TIntegerField;
    qryVisualizarLogClientesdatahoranaoligar: TDateTimeField;
    qryVisualizarLogClienteshistoricocontabilpagtoduplicata: TIntegerField;
    qryVisualizarLogClientesconsumidorfinal: TBooleanField;
    qryVisualizarLogClientescodigo_sistema: TIntegerField;
    qryVisualizarLogClientesbusca: TStringField;
    qryVisualizarLogClientesfichaalerta: TStringField;
    qryVisualizarLogClientesatendimentogeroufichaalerta: TIntegerField;
    qryVisualizarLogClientesatendimentoforcouexibicaodafichafinanceira: TIntegerField;
    qryVisualizarLogClientesdata_atualizacao_vendedor: TDateTimeField;
    qryVisualizarLogClientesusuario_atualizacao_vendedor: TIntegerField;
    qryVisualizarLogClientestrigger_mode: TStringField;
    qryVisualizarLogClientestrigger_tuple: TStringField;
    qryVisualizarLogClientestrigger_changed: TDateTimeField;
    qryVisualizarLogClientestrigger_user: TStringField;
    qryVisualizarLogClientestrigger_id: TLargeintField;
    dbgVisualizarLogClientes: TDBAdvGrid;
    qryVisualizarLogClientesnaogerarcashback: TBooleanField;
    AdvGridFindDialog1: TAdvGridFindDialog;
    AdvGridExcelIO1: TAdvGridExcelIO;
    AdvPopupMenu1: TAdvPopupMenu;
    Pesquizar1: TMenuItem;
    ExportarExcel1: TMenuItem;
    procedure Pesquizar1Click(Sender: TObject);
    procedure ExportarExcel1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

  end;

var
  frmVisualizarLogClientes: TfrmVisualizarLogClientes;
  AcionarTelaVisualizarLogClientes: procedure (Owner: TComponent; Cliente: Integer);


implementation

{$R *.dfm}


procedure AcionarTelaVisualizarLogClientes_(Owner: TComponent; Cliente: Integer);
begin
  if not assigned(frmVisualizarLogClientes) or (frmVisualizarLogClientes.Owner <> Owner) then
  begin
    if assigned(frmVisualizarLogClientes) then
      frmVisualizarLogClientes.free;

    frmVisualizarLogClientes := TfrmVisualizarLogClientes.create(Owner);

    frmVisualizarLogClientes.qryVisualizarLogClientes.parambyname('cliente').asInteger := cliente;
    frmVisualizarLogClientes.qryVisualizarLogClientes.close;
    frmVisualizarLogClientes.qryVisualizarLogClientes.open;
    frmVisualizarLogClientes.dbgVisualizarLogClientes.AutoSize := false;
    frmVisualizarLogClientes.dbgVisualizarLogClientes.AutoSize := true;



    if frmVisualizarLogClientes.qryVisualizarLogClientes.isempty then
      MensagemAviso('Log não encontrada.')
    else
      frmVisualizarLogClientes.showmodal;
  end;
  frmVisualizarLogClientes.free;
//  frmVisualizarImageURL.BringToFront;
end;


{ TfrmVisualizarLogClientes }

constructor TfrmVisualizarLogClientes.Create(AOwner: TComponent);
begin
  inherited;
  dbgVisualizarLogClientes.Bands.PrimaryColor := TColor(strtoint(parsistema.CorZebradoRelatorio));
  dbgVisualizarLogClientes.ActiveRowColor := TColor(strtoint(parsistema.CorZebradoRelatorio));
end;

destructor TfrmVisualizarLogClientes.Destroy;
begin
  frmVisualizarLogClientes := nil;
  inherited;
end;

procedure TfrmVisualizarLogClientes.Pesquizar1Click(Sender: TObject);
begin
  inherited;
  AdvGridFindDialog1.Execute;

end;

procedure TfrmVisualizarLogClientes.ExportarExcel1Click(Sender: TObject);
var
  vNomeArquivo : String;

begin
  inherited;
  vNomeArquivo := ExtractFilePath(Application.ExeName) + 'Saidas\VisualizarLogClientes.xls';
  AdvGridExcelIO1.XLSExport(vNomeArquivo, 'VisualizarLogClientes');
end;

initialization
   AcionarTelaVisualizarLogClientes :=  AcionarTelaVisualizarLogClientes_;

end.
