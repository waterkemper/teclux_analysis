unit fmcadastroprodutosimportados;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmcadastropadraonavegacao, cpnumero, frconsulta,
  frconsultacodigo, ComCtrls, Buttons, ExtCtrls, Mask, cpdbfindcontrols,
  dmcadastronotasfiscais, ToolWin;

type
  TfrmCadastroProdutosImportados = class(TfrmCadastroPadraoNav)
    gbxProduto: TGroupBox;
    gbxAdicao: TGroupBox;
    fraConsultaCodigoProduto: TfraConsultaCodigo;
    gbxQuantidade: TGroupBox;
    edtQuantidade: TDBEditNumero;
    gbxValorTotal: TGroupBox;
    edtValorTotal: TDBEditNumero;
    gbxIPI: TGroupBox;
    edtIPI: TDBEditNumero;
    flkAdicao: TtecDBFindLookup;
    procedure edtValorTotalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure  SetDataModulo (Dtm: TdtmCadastroNotasFiscais);

  protected
    dtmCadastroNotasFiscais : tdtmCadastroNotasFiscais;
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoIncluir: Boolean; override;
  public
    constructor Create(AOwner: TComponent; dtm: TdtmCadastroNotasFiscais);  reintroduce;
    destructor Destroy; override;

    { Public declarations }
  end;

var
  frmCadastroProdutosImportados: TfrmCadastroProdutosImportados;

implementation
  uses
    ctconstantes, biblio;
{$R *.dfm}

{ TfrmCadastroProdutosImportados }

constructor TfrmCadastroProdutosImportados.Create(AOwner: TComponent; dtm: TdtmCadastroNotasFiscais);
begin
  inherited create(AOwner);
  SetDataModulo(dtm);
  
  fraConsultaCodigoProduto.TipoPesquisa := pesItemPRODUTOS;
end;

function TfrmCadastroProdutosImportados.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then
    dtmCadastroNotasFiscais.ExcluirProdutoImportado;
end;

function TfrmCadastroProdutosImportados.InternoGravar: Boolean;
begin
  Result:= inherited InternoGravar;
  if Result then
    case dtmCadastroNotasFiscais.GravarProdutoImportado of
     -1 : Result := False;
      0 : begin
            Result := False;
            MensagemErro('Adição "' + flkAdicao.Text + '" não cadastrada!');
//            ShowMessage('Adição "' + edtAdicao.Text + '" não cadastrada!');
            flkAdicao.SetFocus;
          end;
      2 : begin
//            Result := False;
//            ShowMessage('A aliquota de IPI dos produtos pertencentes a adição "' + edtAdicao.Text + '"deve ser maior que 0(zero)');
            Result := True
//            edtIPI.SetFocus;
          end;
    end;
end;

function TfrmCadastroProdutosImportados.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then
    dtmCadastroNotasFiscais.IncluirProdutoImportado(False);
end;

procedure TfrmCadastroProdutosImportados.edtValorTotalKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if TeclaEnterOuReturn(Key) and (Shift = []) then
    if StrToCurr(edtValorTotal.Text) > 0 then
      if InternoGravar then
        InternoIncluir;
end;

destructor TfrmCadastroProdutosImportados.Destroy;
begin
  inherited;
  frmCadastroProdutosImportados := nil;

end;

procedure TfrmCadastroProdutosImportados.SetDataModulo(
  Dtm: TdtmCadastroNotasFiscais);
begin
  dtmCadastroNotasFiscais := Dtm;
  
  fraConsultaCodigoProduto.dtxDescricao.DataSource := dtmCadastroNotasFiscais.dsrProcuraProdutoNotaFiscal;
  fraConsultaCodigoProduto.edfCodigo.DataSource := dtmCadastroNotasFiscais.dsrProdutosImportados;
  fraConsultaCodigoProduto.edfCodigo.LookupSource := dtmCadastroNotasFiscais.dsrProcuraProdutoNotaFiscal;
  flkAdicao.DataSource := dtmCadastroNotasFiscais.dsrProdutosImportados;
  flkAdicao.LookupSource := dtmCadastroNotasFiscais.dsrProcuraAdicoesImportacao;
  edtQuantidade.DataSource := dtmCadastroNotasFiscais.dsrProdutosImportados;
  edtValorTotal.DataSource := dtmCadastroNotasFiscais.dsrProdutosImportados;
  edtIPI.DataSource := dtmCadastroNotasFiscais.dsrProdutosImportados;

end;

end.
