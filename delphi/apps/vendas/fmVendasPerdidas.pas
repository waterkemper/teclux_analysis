unit fmVendasPerdidas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmcadastropadrao, ComCtrls, Buttons, ToolWin, ExtCtrls,
  StdCtrls, Mask, cpdbfindcontrols, DBCtrls, cpdbtext, AdvMemo, DBAdvMemo,
  frconsulta, frconsultacodigo, ctconstantes, BIBLIO, cpdbmemo, cptexto;

type
  TfrmVendasPerdidas = class(TFrmCadastroPadrao)
    stxNumero: TStaticText;
    edfVendaPerdida: TtecDbEditFind;
    stxDataHora: TStaticText;
    dtxDataHora: TtecDBText;
    stxFilial: TStaticText;
    dtxFilial: TtecDBText;
    dtxDescricaoFilial: TtecDBText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText1: TStaticText;
    stxGrupo: TStaticText;
    gbxObservacoes: TGroupBox;
    fraConsultaGrupo: TfraConsultaCodigo;
    stxItemProduto: TStaticText;
    fraConsultaItemProduto: TfraConsultaCodigo;
    stxItem: TStaticText;
    mmoObservacoes: TtecDBMemo;
    edtdescricaoitemproduto: TDBEditTexto;
    edtdescricaogrupoproduto: TDBEditTexto;
    fraConsultaVendedor: TfraConsultaCodigo;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    procedure edfVendaPerdidaExit(Sender: TObject);
    procedure fraConsultaItemProdutoedfCodigoKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure fraConsultaGrupoedfCodigoKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    procedure AtribuirDadosVendasPerdidas(Found: Boolean);
    procedure AtribuirDadosItemProdutos(Found: Boolean);
    procedure HabilitarControlesedtdescricaoitemproduto(Valor: Boolean);
    procedure HabilitarControlesedtdescricaogrupoproduto(Valor: Boolean);

  protected
    fraConsultaVendasPerdidas: TfraConsultaCodigo;
  public
    { Public declarations }
    procedure OperacaoPadrao(Value: Array of Variant); override;
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;

    function InternoIncluir: Boolean; override;
    function InternoGravar: Boolean; override;
    function InternoExcluir: Boolean; override;

    function InternoPesquisar(Titulo:String): Integer; override;

  end;

var
  frmVendasPerdidas: TfrmVendasPerdidas;

implementation

uses dmVendasPerdidas;


{$R *.dfm}

{ TfrmVendasPerdidas }

procedure TfrmVendasPerdidas.AtribuirDadosItemProdutos(Found: Boolean);
begin
  dtmVendasPerdidas.qryVendasPerdidas.edit;
  dtmVendasPerdidas.qryVendasPerdidasproduto.AsString := fraConsultaItemProduto.qryProcuraItemProdutos.fieldbyname('codigo').AsString;

  if not fraConsultaItemProduto.qryProcuraItemProdutos.fieldbyname('grupo').isNull then
  begin
    dtmVendasPerdidas.qryVendasPerdidasgrupo.AsString := fraConsultaItemProduto.qryProcuraItemProdutos.fieldbyname('grupo').AsString;
    fraConsultaGrupo.edfCodigo.Exist;
    fraConsultaGrupo.edfCodigo.readonly := true;
    HabilitarControlesedtdescricaogrupoproduto(false);
  end;
end;

procedure TfrmVendasPerdidas.AtribuirDadosVendasPerdidas(Found: Boolean);
begin
  with dtmVendasPerdidas do
  begin
    qryVendasPerdidas.parambyname('codigo').asstring := fraConsultaVendasPerdidas.qryConsultaVendasPerdidascodigo.asString;
    qryVendasPerdidas.close;
    qryVendasPerdidas.open;

    HabilitarControlesedtdescricaoitemproduto(fraConsultaItemProduto.edfCodigo.Text = '');
    HabilitarControlesedtdescricaogrupoproduto(fraConsultaGrupo.edfCodigo.Text = '');

  end;
end;

constructor TfrmVendasPerdidas.Create(AOwner: TComponent);
begin
  dtmVendasPerdidas := TdtmVendasPerdidas.create(self);
  inherited;
  DataSet := dtmVendasPerdidas.qryVendasPerdidas;


  fraConsultaVendasPerdidas := TfraConsultaCodigo.Create(self);
  fraConsultaVendasPerdidas.Name := 'fraConsultaVendasPerdidas';
//  fraConsultaVendasPerdidas.edfCodigo.MaxLength := 20;
//  fraConsultaVendasPerdidas.edfCodigo.DataSource := fraConsultaVendasPerdidas.dsrProcuraVendasPerdidas;
//  fraConsultaVendasPerdidas.edfCodigo.DataField := 'numero';
  fraConsultaVendasPerdidas.edfCodigo.Operacao := opPESQUISA;
  fraConsultaVendasPerdidas.AbrirTabelaProcura := false;
//  fraConsultaVendasPerdidas.CondicoesdaConsulta := CondicoesdaConsultaVendasPerdidas;
  fraConsultaVendasPerdidas.TipoPesquisa := pesVendasPerdidas;
  fraConsultaVendasPerdidas.OnFound := AtribuirDadosVendasPerdidas;

  fraConsultaItemProduto.TipoPesquisa := pesItemProdutos;
  fraConsultaItemProduto.onFound := AtribuirDadosItemProdutos;

  fraConsultaGrupo.TipoPesquisa := pesGRUPOS;

  fraConsultaVendedor.tipopesquisa := pesVENDEDORES;
  
//  edtdescricaoitemproduto.SendToBack;
//  edtdescricaogrupoproduto.SendToBack;


end;

destructor TfrmVendasPerdidas.Destroy;
begin

  inherited;
end;

function TfrmVendasPerdidas.InternoExcluir: Boolean;
begin
  dtmVendasPerdidas.Excluir;
end;

function TfrmVendasPerdidas.InternoGravar: Boolean;
begin
  dtmVendasPerdidas.Gravar;
end;

function TfrmVendasPerdidas.InternoIncluir: Boolean;
begin
  dtmVendasPerdidas.Incluir;
end;

function TfrmVendasPerdidas.InternoPesquisar(Titulo: String): Integer;
begin
  if not CtrlOn then
     fraConsultaVendasPerdidas.InternoPesquisar('Vendas Perdidas')
     {
  else
  if ActiveControl = fraConsultaItemProduto.edfCodigo then
    fraConsultaItemProduto.InternoPesquisar('Item de Produto')
    }

end;

procedure TfrmVendasPerdidas.OperacaoPadrao(Value: array of Variant);
begin
  inherited;
  if Value[0]='Incluir' then
    internoincluir;
end;


procedure TfrmVendasPerdidas.HabilitarControlesedtdescricaogrupoproduto(
  Valor: Boolean);
begin
  edtdescricaogrupoproduto.visible := valor;
end;

procedure TfrmVendasPerdidas.HabilitarControlesedtdescricaoitemproduto(
  Valor: Boolean);
begin
  edtdescricaoitemproduto.visible := valor;
  fraConsultaGrupo.edfCodigo.readonly := (fraConsultaItemProduto.edfCodigo.Text<>'');

end;

procedure TfrmVendasPerdidas.edfVendaPerdidaExit(Sender: TObject);
begin
  inherited;
  HabilitarControlesedtdescricaoitemproduto(fraConsultaItemProduto.edfCodigo.Text = '');
  HabilitarControlesedtdescricaogrupoproduto(fraConsultaGrupo.edfCodigo.Text = '');
//  fraConsultaItemProduto.edfCodigo.SetFocus;
end;


procedure TfrmVendasPerdidas.fraConsultaItemProdutoedfCodigoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  fraConsultaItemProduto.edfCodigoKeyDown(Sender, Key, Shift);

  if key = vk_return then
  begin
    ActiveControl := fraConsultaItemProduto.edfCodigo;
    HabilitarControlesedtdescricaoitemproduto(fraConsultaItemProduto.edfCodigo.Text = '');
    self.KeyDown(key, Shift);
  end;

end;

procedure TfrmVendasPerdidas.fraConsultaGrupoedfCodigoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  fraConsultaGrupo.edfCodigoKeyDown(Sender, Key, Shift);

  if key = vk_return then
  begin
    ActiveControl := fraConsultaGrupo.edfCodigo;
    HabilitarControlesedtdescricaogrupoproduto(fraConsultaGrupo.edfCodigo.Text = '');
    self.KeyDown(key, Shift);
  end;


end;


end.
