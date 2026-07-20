unit fmcadastronfsaidafrete;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmcadastropadrao, cpnumero, Mask, cpdbfindcontrols,
  ComCtrls, Buttons, ExtCtrls, DBCtrls, cptexto,fmconsultabasica,
  ctconstantes, frconsulta, frconsultacodigo, dmbasico, clparametrossistema,
  ToolWin, dmcadastronotasfiscais;

type
  Tfrmcadastronfsaidafrete = class(TfrmCadastroPadrao)
    gbxDadosNota: TGroupBox;
    gbxValorNota: TGroupBox;
    edtvalorNota: TDBEditNumero;
    gbxCliente: TGroupBox;
    edtCliente: TDBEditTexto;
    edtNomeCliente: TDBEditTexto;
    gbxNrNota: TGroupBox;
    fraConsultaNota: TfraConsultaCodigo;
    procedure fraConsultaNotaedfCodigoFound(Found: Boolean);
    procedure fraConsultaNotasbnProcuraClick(Sender: TObject);
  private
    procedure AtribuirCampos(Found: Boolean);
    procedure  SetDataModulo (Dtm: TdtmCadastroNotasFiscais);

  protected
    dtmCadastroNotasFiscais : tdtmCadastroNotasFiscais;
  
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoIncluir: Boolean; override;

  public
    ParametroFilial : Variant;
    ParametroSerie  : Variant;
    ParametroNota   : Variant;
    constructor Create(AOwner: TComponent; dtm: TdtmCadastroNotasFiscais); reintroduce;
    destructor Destroy; override;
  end;

var
  frmcadastronfsaidafrete: Tfrmcadastronfsaidafrete;
  TipoProcura: TtecProcuraCadastroNotasFiscais;
  Pesquisa: Boolean;

implementation

{$R *.dfm}

{ Tfrmcadastronfsaidafrete }

constructor Tfrmcadastronfsaidafrete.Create(AOwner: TComponent; dtm: TdtmCadastroNotasFiscais);
begin

  inherited create(AOwner);
  SetDataModulo(dtm);

  DataSet:= dtmCadastroNotasFiscais.qryConsultadadosFiscais;

  fraConsultaNota.TipoPesquisa   := pesNOTASFILIAIS;
  dtmCadastroNotasFiscais.qryConsultadadosFiscais.ParamByName('Filial').AsInteger:= FilialBase;
  dtmCadastroNotasFiscais.qryConsultadadosFiscais.ParamByName('Serie').AsString:= dtmCadastroNotasFiscais.SerieSugestao;
  fraConsultaNota.qryProcuraNotas.ParamByName('Filial').AsInteger:= FilialBase;
  fraConsultaNota.qryProcuraNotas.ParamByName('Serie').AsString:= dtmCadastroNotasFiscais.SerieSugestao;
  fraconsultanota.OnFound := Atribuircampos;

  dtmCadastroNotasFiscais.qryConsultaDadosFiscais.Open;
end;

destructor Tfrmcadastronfsaidafrete.Destroy;
begin
  dtmCadastroNotasFiscais.qryConsultaDadosFiscais.Cancel;
  dtmCadastroNotasFiscais.qryConsultaDadosFiscais.Close;
  frmcadastronfsaidafrete:= nil;
  inherited;
end;

function Tfrmcadastronfsaidafrete.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then
  dtmCadastroNotasFiscais.ExcluirNotaFiscalSaida;
end;

function Tfrmcadastronfsaidafrete.InternoGravar: Boolean;
begin
  with dtmCadastroNotasFiscais do
  begin
    qryNotasSaidasFrete.Open;
    qryNotasSaidasFrete.Append;

    qryNotasSaidasFretenotasaida.AsInteger:= qryConsultaDadosFiscaisnumeronota.AsInteger;
    qryNotasSaidasFretedadofiscal.AsInteger:= qryConsultaDadosFiscaisnumero.AsInteger;

    qryNotasSaidasFrete.Post;
    qryConsultadadosFiscais.Cancel;
    AlterarEstadoBotoes;
    end;
  self.SetFocus;
end;

function Tfrmcadastronfsaidafrete.InternoIncluir: Boolean;
begin
    Result:= inherited InternoIncluir;
  if Result then begin
    dtmCadastroNotasFiscais.IncluirNotaSaida;
  end;
end;

procedure Tfrmcadastronfsaidafrete.AtribuirCampos(Found: Boolean);
begin
  try
    if Pesquisa then
    begin
      with dtmCadastroNotasFiscais do
        ReFazConsulta(qryConsultadadosFiscais,[0,1,2],[fraConsultaNota.qryProcuraNotasfilial.AsVariant,
                                                       fraConsultaNota.qryProcuraNotasserie.AsVariant,
                                                       fraConsultaNota.qryProcuraNotasnumero.AsVariant]);
    end;
  finally
    dtmCadastroNotasFiscais.qryConsultadadosFiscais.ParamByName('Filial').AsInteger:= FilialBase;
    dtmCadastroNotasFiscais.qryConsultadadosFiscais.ParamByName('Serie').AsString:= dtmCadastroNotasFiscais.SerieSugestao;
  end;
end;

procedure Tfrmcadastronfsaidafrete.fraConsultaNotaedfCodigoFound(
  Found: Boolean);
begin
  inherited;
  dtmCadastroNotasFiscais.qryConsultaDadosFiscais.Edit;
end;

procedure Tfrmcadastronfsaidafrete.fraConsultaNotasbnProcuraClick(
  Sender: TObject);
begin
  inherited;
  Pesquisa:= True;
  fraConsultaNota.sbnProcuraClick(Sender);
end;

procedure Tfrmcadastronfsaidafrete.SetDataModulo(
  Dtm: TdtmCadastroNotasFiscais);
begin

  dtmCadastroNotasFiscais := Dtm;

  edtvalorNota.DataSource := dtmCadastroNotasFiscais.dsrConsultaDadosFiscais;
  edtCliente.DataSource := dtmCadastroNotasFiscais.dsrConsultaDadosFiscais;
  edtNomeCliente.DataSource := dtmCadastroNotasFiscais.dsrConsultaDadosFiscais;
  fraConsultaNota.edfCodigo.DataSource := dtmCadastroNotasFiscais.dsrConsultaDadosFiscais;
  
end;

end.
