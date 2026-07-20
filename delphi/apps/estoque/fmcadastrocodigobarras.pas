unit fmcadastrocodigobarras;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  DBCtrls, Mask, ComCtrls, ExtCtrls, Buttons, Windows, DB,
  // Biblio
  biblio, ctconstantes,
  // Componentes
  cpdata, cpnumero, cptexto, cpdbfindcontrols, cpdbdata, cpdbtext,
  // Terceiros
  ZQuery,
  // Repositorio
  fmconsultabasica, fmconsultaporcampo, fmcadastropadrao,
  // Projeto
  dmcadastroprodutos, ToolWin, cpdbedittext;

type

  TfrmCadastroCodigoBarras = class(TfrmCadastroPadrao)
    gbxConsulta: TGroupBox;
    pnlFundoJanela: TPanel;
    dtxCodigoProduto: TtecDBText;
    dtxProduto: TtecDBText;
    edtCodigoBarras: TDBEditTexto;
    gbxCodBarras: TGroupBox;
    procedure edtCodigoBarrasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    {dtmCadastroProdutos: TdtmCadastroProdutos;}
  protected
    function  InternoIncluir: Boolean; override;
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
  public
//    procedure  SetDataModulo(Dtm: TdtmCadastroProdutos);
    destructor Destroy; override;
  end;

var
  frmCadastroCodigoBarras: TfrmCadastroCodigoBarras;

implementation

{$R *.dfm}

destructor TfrmCadastroCodigoBarras.Destroy;
begin
  inherited;
  frmCadastroCodigoBarras := nil;
end;

function TfrmCadastroCodigoBarras.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then begin
    if not CtrlOn then
      Result := dtmCadastroProdutos.ExcluirCodigoBarras;
  end;
end;

function TfrmCadastroCodigoBarras.InternoGravar: Boolean;
begin
  Result:= inherited InternoGravar;
  if Result then
    if not CtrlOn then
    begin

       {
       case Length(edtCodigoBarras.Text) of
          12:  Result:= ValidarUPC_A(edtCodigoBarras.Text);
          13:  Result:= ValidarEAN13(edtCodigoBarras.Text);
          else Result:= false;
       end;
       }

       if Result
       then Result:= dtmCadastroProdutos.CodigoBarrasPodeInserir(edtCodigoBarras.Text)
       else MensagemAviso(ctCODIGOBARRASINVALIDO);

       if Result
       then Result:= dtmCadastroProdutos.GravarCodigoBarras
       else edtCodigoBarras.SetFocus;
    end;
end;

{
procedure TfrmCadastroCodigoBarras.SetDataModulo(Dtm: TdtmCadastroProdutos);
begin
  dtmCadastroProdutos := Dtm;
end;
}

function TfrmCadastroCodigoBarras.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then begin
    if not CtrlOn then
      Result := dtmCadastroProdutos.IncluirCodigoBarras(False);
  end;
end;

procedure TfrmCadastroCodigoBarras.edtCodigoBarrasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Shift = [ssCtrl]) and (Key = TeclaInserirRegistro) then
    edtCodigoBarras.Text := NovoCodigoBarras(dtxCodigoProduto.DataSource.DataSet.fieldbyname('codigo').AsString);
end;

end.
