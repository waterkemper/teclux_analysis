unit fmcadastrotabelamontagem;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Buttons, ExtCtrls,

  //Terceiros
  ZQuery, ZPgSqlQuery,
  // PRojeto
  fmcadastropadrao, fmconsultabasica, fmconsultaporcampo, cpdbfindcontrols,
  DBCtrls, cpdbmemo, cpnumero, Mask, cptexto,
  //biblio
  ctconstantes, cpdbradiogroup, biblio, ToolWin;

type
  TfrmCadastroTabelaMontagem = class(TfrmCadastroPadrao)
    pnlfundojanela: TPanel;
    edtDescricao: TDBEditTexto;
    edtValorLoja: TDBEditNumero;
    edtValorDentro: TDBEditNumero;
    edtValorFora: TDBEditNumero;
    edfCodigo: TtecDbEditFind;
    mmoObservacoes: TtecDBMemo;
    rgpTipo: TtecDBRadioGroup;
    rbnPercentual: TtecRadioButton;
    rbnValor: TtecRadioButton;
    gbxCodigo: TGroupBox;
    gbxForaLoja: TGroupBox;
    gbxNaLoja: TGroupBox;
    gbxValoresMontagem: TGroupBox;
    gbxDescricao: TGroupBox;
    gbxObservacoes: TGroupBox;
    gbxNaRegiao: TGroupBox;
    gbxForaRegiao: TGroupBox;
    procedure edtValorLojaExit(Sender: TObject);
  private
    { Private declarations }
  protected
    function InternoExcluir: Boolean; override;
    function InternoGravar: Boolean; override;
    function InternoIncluir: Boolean; override;
    function InternoPesquisar(Titulo:String): Integer; override;
    function JanelaPesquisa: TfrmConsultaBasica; override;
    function TabelaDePesquisa: TZDataSet; override;
    function ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function ValidaControles: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;


  end;

var
  frmCadastroTabelaMontagem: TfrmCadastroTabelaMontagem;

implementation

uses dmcadastrotabelamontagem, fmnavcontroles;

{$R *.dfm}

{ TfrmCadastroTabelaMontagem }

constructor TfrmCadastroTabelaMontagem.Create(AOwner: TComponent);
begin
  inherited;
  dtmCadastroTabelaMontagem:= TdtmCadastroTabelaMontagem.Create(Self);
  DataSet:= dtmCadastroTabelaMontagem.TabelaMontagem;
end;

destructor TfrmCadastroTabelaMontagem.Destroy;
begin
  dtmCadastroTabelaMontagem:=nil;
  inherited;
  frmCadastroTabelaMontagem:= nil;
end;

function TfrmCadastroTabelaMontagem.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  result:=dtmcadastroTabelaMontagem.ExisteTabeladeMontagem(NomeCampo, Value);
end;

function TfrmCadastroTabelaMontagem.InternoExcluir: Boolean;
begin
  Result:= False;
  if not ctrlon then
  begin
    result:= inherited InternoExcluir;
    if result then
      dtmcadastroTabelaMontagem.ExcluirTabeladeMontagem;
  end;
end;

function TfrmCadastroTabelaMontagem.InternoGravar: Boolean;
begin
  Result := inherited InternoGravar;
  if Result then
    Result:= ValidaControles;
  if Result then
    dtmCadastroTabelaMontagem.GravarTabeladeMontagem;
end;

function TfrmCadastroTabelaMontagem.InternoIncluir: Boolean;
begin
  Result:= False;
  if not ctrlon then
  begin
    result:= inherited InternoIncluir;
    if result then
      dtmcadastroTabelaMontagem.IncluirTabeladeMontagem;
  end;
end;

function TfrmCadastroTabelaMontagem.InternoPesquisar(Titulo: String): Integer;
begin
  result:=0;
  if not CtrlOn then
  begin
    dtmCadastroTabelaMontagem.Abre(ctconsultatabelamontagem); //constante; abre a consulta
    result:=inherited internopesquisar('Tabela de Montagem');

    if Result = mrOK then
       dtmCadastroTabelaMontagem.PosicionarTabelaMontagem;

    dtmCadastroTabelaMontagem.Fecha(ctconsultaTabelaMontagem);
  end;
end;

function TfrmCadastroTabelaMontagem.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result:= TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(result).ConsultaInterativa := True;
end;

function TfrmCadastroTabelaMontagem.TabelaDePesquisa: TZDataSet;
begin
 result:=dtmCadastroTabelaMontagem.ConsultaTabelaMontagem;
end;

function TfrmCadastroTabelaMontagem.ValidaControles: Boolean;
Var
  MsnValor: String;
begin
  Result := True;
  if rbnPercentual.Checked then begin
    if (edtValorLoja.Text <> '') then begin
      Result:= StrToFloat(edtValorLoja.ValorSemFormatacao) <= 100;
      if not Result then begin
        MsnValor:= 'Valor Loja';
        edtValorLoja.SetFocus;
      end;
    end;
    if Result then begin
      if (edtValorDentro.Text <> '') then begin
        Result:= StrToFloat(edtValorDentro.ValorSemFormatacao) <= 100;
        if not Result then begin
          MsnValor:= 'Valor Dentro';
          edtValorDentro.SetFocus;
        end;
      end
    end;
    if Result then begin
      if (edtValorFora.Text <> '') then begin
        Result:= StrToFloat(edtValorFora.ValorSemFormatacao) <= 100;
        if not Result then begin
          MsnValor:= 'Valor Fora';
          edtValorFora.SetFocus;
        end;
      end;
    end;
    if not Result then
      MensagemAviso('O valor do campo "' + MsnValor + '" não deve ser superior a 100%.');
  end;
end;

procedure TfrmCadastroTabelaMontagem.edtValorLojaExit(Sender: TObject);
begin
  inherited;
  ValidaControles;
end;

end.
