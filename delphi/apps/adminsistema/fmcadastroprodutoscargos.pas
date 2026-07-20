unit fmcadastroprodutoscargos;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, DB,
  StdCtrls, fmcadastropadrao, cpnumero, DBCtrls, cpdbtext, Biblio, Mask,
  cpdbfindcontrols, ComCtrls, ctconstantes, Buttons, dmcadastrotabelascrediario,
  ExtCtrls, frconsulta, frconsultacodigo, fmconsultabasica, fmconsultaporcampo,
  // Terceiros
  ZQuery, ToolWin, clparametrossistema;

type
  TfrmCadastroProdutosCargos = class(TfrmCadastroPadrao)
    gbxProduto: TGroupBox;
    gbxmarkup: TGroupBox;
    edtMarkup: TDBEditNumero;
    fraConsultaCodigoProduto: TfraConsultaCodigo;
    procedure fraConsultaCodigoProdutosbnProcuraClick(Sender: TObject);
    procedure fraConsultaCodigoProdutoedfCodigoFound(Found: Boolean);
    procedure FormShow(Sender: TObject);
    procedure fraConsultaCodigoProdutoedfCodigoExit(Sender: TObject);
    procedure edtMarkupKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  protected
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoIncluir: Boolean; override;
    procedure PreencherDescricao;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure AtribuirDadosProdutos(Found: Boolean);
    
  end;

var
  frmCadastroProdutosCargos: TfrmCadastroProdutosCargos;
  TipoPesquisa : TtecTabelasCrediario;
implementation

uses fmnavcontroles;

{$R *.dfm}

{ TForm1 }


{ TfrmCadastroProdutosCargos }

constructor TfrmCadastroProdutosCargos.Create(AOwner: TComponent);
begin
  inherited;
  with dtmCadastroTabelasCrediario do
   if not qryProdutosporCargo.Active then
   qryProdutosporCargo.Open;

   {
   if ParSistema.PermitirProdutoAlfanumerico then
   begin
     fraConsultaCodigoProduto.edfCodigo.LocateParameters := 'produtovisual';
     fraConsultaCodigoProduto.edfCodigo.LookupField := 'produtovisual';
     fraConsultaCodigoProduto.edfCodigo.LookupParameters := 'produtovisual';
     fraConsultaCodigoProduto.edfCodigo.LookupQueryParameter := 'produtovisual';
     fraConsultaCodigoProduto.edfCodigo.DataField := 'produtovisual';
   end
   else
   begin
     fraConsultaCodigoProduto.edfCodigo.LocateParameters := 'produto';
     fraConsultaCodigoProduto.edfCodigo.LookupField := 'produto';
     fraConsultaCodigoProduto.edfCodigo.LookupParameters := 'produto';
     fraConsultaCodigoProduto.edfCodigo.LookupQueryParameter := 'produto';
     fraConsultaCodigoProduto.edfCodigo.DataField := 'produto';
   end;
   }

  fraConsultaCodigoProduto.edfCodigo.PosicionarProdutoNaoEncontrado := true;
  fraConsultaCodigoProduto.OnFound := AtribuirDadosProdutos;
  fraConsultaCodigoProduto.TipoPesquisa:= pesITEMPRODUTOS;
end;

destructor TfrmCadastroProdutosCargos.Destroy;
begin
  inherited;
  frmCadastroProdutosCargos:= nil;
end;

function TfrmCadastroProdutosCargos.InternoIncluir: Boolean;
begin
  Result:= False;
  if not CtrlOn then
  begin
    if dtmCadastroTabelasCrediario.qryProdutosporCargo.CheckRequiredFields then
      dtmCadastroTabelasCrediario.qryProdutosporCargo.Append;
    fraConsultaCodigoProduto.edfCodigo.SetFocus;
    Result:= True;
  end;
end;

procedure TfrmCadastroProdutosCargos.fraConsultaCodigoProdutosbnProcuraClick(
  Sender: TObject);
begin
  inherited;
    fraConsultaCodigoProduto.sbnProcuraClick(Sender);
    with dtmCadastroTabelasCrediario do
      if qryCargosmarkuppadrao.AsFloat > 0then
        edtMarkup.Text:= floattostr(qryCargosmarkuppadrao.asfloat);
//    edtMarkup.SetFocus;
end;

procedure TfrmCadastroProdutosCargos.PreencherDescricao;
begin
  with dtmCadastroTabelasCrediario do
  begin
    if (qryProdutosporCargo.State = dsInsert) then
      qryProdutosporCargodescricao.AsString :=
         fraConsultaCodigoProduto.edfCodigo.LookupQuery.fieldbyname('descricaolc').AsString;
  end;
end;

function TfrmCadastroProdutosCargos.InternoGravar: Boolean;
begin
  try
    PreencherDescricao;
    with dtmCadastroTabelasCrediario do
    begin
      if (qryProdutosporCargo.State = dsInsert) then
        qryProdutosporCargocargo.AsInteger := qryCargoscodigo.Asinteger;
      qryProdutosporCargomarkup.AsFloat:= edtMarkup.ValorSemFormatacao;
      qryProdutosporCargo.Edit;
      GravarProdutoCargo;
    end;
  finally
    Result:= true;
    edtMarkup.SetFocus;
  end;
end;

function TfrmCadastroProdutosCargos.InternoExcluir: Boolean;
begin
  Result:= False;
  if not dtmCadastroTabelasCrediario.qryProdutosporCargo.IsEmpty then
  begin
    if MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['o PRODUTO'])) = smbOk then
    begin
      dtmCadastroTabelasCrediario.qryProdutosporCargo.Delete;
      Result := True;
    end;
  end;
end;

procedure TfrmCadastroProdutosCargos.fraConsultaCodigoProdutoedfCodigoFound(
  Found: Boolean);
begin
  inherited;
  fraConsultaCodigoProduto.edfCodigoFound(Found);
  with dtmCadastroTabelasCrediario do
  begin
    if qryCargosmarkuppadrao.AsFloat > 0then
      edtMarkup.Text:= floattostr(qryCargosmarkuppadrao.asfloat);

    if ParSistema.PermitirProdutoAlfanumerico then
      dtmCadastroTabelasCrediario.qryProdutosporCargoproduto.AsString :=
        fraConsultaCodigoProduto.qryProcuraItemProdutos.fieldbyname('produto').AsString
    else
      dtmCadastroTabelasCrediario.qryProdutosporCargoprodutovisual.AsString :=
        fraConsultaCodigoProduto.qryProcuraItemProdutos.fieldbyname('produtovisual').AsString;
  end;

  edtMarkup.SetFocus;
end;

procedure TfrmCadastroProdutosCargos.FormShow(Sender: TObject);
begin
  inherited;
  fraConsultaCodigoProduto.edfCodigo.SetFocus;
end;

procedure TfrmCadastroProdutosCargos.fraConsultaCodigoProdutoedfCodigoExit(
  Sender: TObject);
begin
  inherited;
  with dtmCadastroTabelasCrediario do
      if qryCargosmarkuppadrao.AsFloat > 0 then
        if edtMarkup.Text = '' then
          edtMarkup.Text:= floattostr(qryCargosmarkuppadrao.asfloat);
  edtMarkup.SetFocus;


  
end;

procedure TfrmCadastroProdutosCargos.edtMarkupKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
 // if TeclaEnterOuReturn(key) then
   // if fraConsultaCodigoProduto.edfCodigo.Text <> '' then
     // InternoGravar;
end;

procedure TfrmCadastroProdutosCargos.AtribuirDadosProdutos(Found: Boolean);
begin
  fraConsultaCodigoProduto.OnFound := nil;
  fraConsultaCodigoProduto.edfCodigo.Modified := true;
  fraConsultaCodigoProduto.edfCodigo.doexit;
  fraConsultaCodigoProduto.OnFound := AtribuirDadosProdutos;
end;

end.
