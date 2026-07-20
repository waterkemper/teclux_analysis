unit fmcadastrohistoricos;

interface

uses
  //CLX
  SysUtils, Types, Classes, Variants, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls, Mask, DBCtrls, {Qete,} DB, biblio,
  //Componentes
  cptexto, cpdbdata, ctconstantes, cpdbfindcontrols,
  //Terceiros
  ZQuery,
  //Repositorio
  fmconsultabasica, fmconsultaporcampo, fmcadastropadrao,
  //Projeto
  dmcadastrohistoricos, ComCtrls, cpnumero,
  fmimpressaohistoricos, ToolWin;

type
  TfrmCadastroHistoricos = class(TfrmCadastroPadrao)
    edfCodigoProcura: TtecDbEditFind;
    edtDescricao: TDBEditTexto;
    edtInativo: TDBEditData;
    gbxParametros: TGroupBox;
    ckbCaixa: TDBCheckBox;
    ckbPagar: TDBCheckBox;
    ckbContabil: TDBCheckBox;
    pnlFundoJanela: TPanel;
    gbxCodigo: TGroupBox;
    gbxInativo: TGroupBox;
    gbxDescricao: TGroupBox;
    sbnImprimir: TSpeedButton;
    procedure sbnImprimirClick(Sender: TObject);
  protected
     function  InternoIncluir: Boolean; override;
     function  InternoExcluir: Boolean; override;
     Function  InternoGravar: Boolean; Override;
     function  InternoPesquisar(Titulo:String): Integer; override;
     function  JanelaPesquisa: TfrmConsultaBasica; override;
     function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
     function  TabelaDePesquisa: TZDataSet; override;
     function  TabelaDoParametro(Parametro: Integer): TZDataSet; override;
  public
     constructor Create(AOwner: TComponent); Override;
     destructor  Destroy; override;
  end;

var
  frmCadastroHistoricos: TfrmCadastroHistoricos;

implementation

{$R *.dfm}

constructor TfrmCadastroHistoricos.Create(AOwner: TComponent);
begin
   dtmcadastrohistoricos:= Tdtmcadastrohistoricos.Create(Self);
   inherited;
   dtmcadastrohistoricos.Abre(ctCaixaCadastroHistoricos);
   DataSet:= dtmcadastrohistoricos.TabelaHistoricos;
end;

destructor TfrmCadastroHistoricos.Destroy;
begin
  dtmcadastrohistoricos:=nil;
  inherited;
  frmCadastroHistoricos := nil;
end;

function TfrmCadastroHistoricos.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then begin
    if not CtrlOn then
      dtmcadastrohistoricos.IncluirHistoricos;
  end;
end;

function TfrmCadastroHistoricos.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then begin
    if not CtrlOn then
      dtmcadastrohistoricos.ExcluirHistoricos;
  end;
end;

function TfrmCadastroHistoricos.InternoGravar: Boolean;
begin
  Result:= inherited InternoGravar;
  if Result then
    dtmcadastrohistoricos.GravarHistorico;
end;

function TfrmCadastroHistoricos.InternoPesquisar(Titulo:String): Integer;
begin
  Result:= mrOK;
  if not CtrlOn then begin
    dtmcadastrohistoricos.Abre(ctCaixaConsultaHistoricos);
    Result:= inherited InternoPesquisar(ctHISTORICO);
    if Result = mrOK then
       dtmcadastrohistoricos.SelecionarHistoricos;
    dtmcadastrohistoricos.Fecha(ctCaixaConsultaHistoricos);
  end;
end;

function TfrmCadastroHistoricos.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
end;

function TfrmCadastroHistoricos.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  Result:= dtmcadastrohistoricos.ExisteHistorico(NomeCampo, Value);
end;

function TfrmCadastroHistoricos.TabelaDePesquisa: TZDataSet;
begin
  Result:= dtmcadastrohistoricos.TabelaConsultarHistorico;
end;

function TfrmCadastroHistoricos.TabelaDoParametro(Parametro: Integer): TZDataSet;
begin
  Result:= dtmcadastrohistoricos.Tabelahistoricos
end;

procedure TfrmCadastroHistoricos.sbnImprimirClick(Sender: TObject);
begin
  inherited;
  frmImpressaoHistoricos := TfrmImpressaoHistoricos.Create(frmImpressaoHistoricos);
  try
    if frmImpressaoHistoricos.ShowModal = mrOK then
      dtmCadastroHistoricos.ImprimirHistoricos(frmImpressaoHistoricos.rgpOrdenacao.ItemIndex,
                                               frmImpressaoHistoricos.rgpInativos.ItemIndex,
                                               frmImpressaoHistoricos.ckbCaixa.Checked,
                                               frmImpressaoHistoricos.ckbContasapagar.Checked,
                                               frmImpressaoHistoricos.ckbContabilidade.Checked);
  finally
    frmImpressaoHistoricos.Free;
  end
end;

end.
