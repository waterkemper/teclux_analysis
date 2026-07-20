unit fmparametrosselecaoatrasados;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  DB, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids,
  Mask, frintervalodata,
  fmparametroselecaobasica, cpnumero, DBCtrls, cpdbtext, cpdbfindcontrols,
  cpdatasource, cpdbgrid, ComCtrls;

type
  TfrmParametrosSelecaoAtrasados = class(TfrmParametroSelecaoBasica)
    gbxTipoAtraso: TGroupBox;
    fraDataVencimento: TfraIntervaloData;
    ckbNenhumPagamento: TCheckBox;
    rgpOcorrencias: TRadioGroup;
    rgbCarencia: TGroupBox;
    rgpTelefone: TRadioGroup;
    rgpConceitos: TGroupBox;
    ckbPrimeiroAtraso: TCheckBox;
    lblConceitos: TLabel;
    lblCarencia: TLabel;
    edtCarencia: TEditNumero;
    edfConceitos: TtecDbEditFind;
    dtxAtrasados: TtecDBText;
    sbnFilial: TSpeedButton;
    procedure rgpTelefoneClick(Sender: TObject);
    procedure fraDataAtrasomkeDataInicioChange(Sender: TObject);
    procedure fraDataAtrasomkeDataFinalChange(Sender: TObject);
    procedure ckbNenhumPagamentoClick(Sender: TObject);
    procedure bbnExecutarClick(Sender: TObject);
    procedure rgpOcorrenciasClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ckbPrimeiroAtrasoClick(Sender: TObject);
    procedure edtCarenciaChange(Sender: TObject);
    procedure edfConceitosChange(Sender: TObject);
    procedure sbnFilialClick(Sender: TObject);
  protected
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    function  ExisteConceito(Ind: Integer; NomeCampo: String; inf: Variant): boolean;
    function  GetSQLAtrasado: WideString;
    function  GetFiltros: TStringList; override;
    function  NrRegistrosSelecionados: Integer; override;
  public
    constructor Create(AOwner: TComponent;SelecaoAnterior: TStringList); reintroduce;
    destructor  Destroy; override;
    property    SQLAtrasado: WideString read GetSQLAtrasado;
  end;

var
  frmParametrosSelecaoAtrasados: TfrmParametrosSelecaoAtrasados;

implementation

Uses
  {Qete,}
  biblio,
  ctConstantes,
  fmconsultaporcampo,
  dmparametrosselecaoatrasados;

{$R *.dfm}

constructor TfrmParametrosSelecaoAtrasados.Create(AOwner: TComponent; SelecaoAnterior: TStringList);
begin
  inherited Create(Aowner);
  FDataModulo:= Tdtmparametrosselecaoatrasados.Create(Self);
  DataSet:= Tdtmparametrosselecaoatrasados(DataModulo).TabelaConsultaAtrasado;
  lblQtde.Caption:= '';
  rgpTelefoneClick(rgpTelefone);
  rgpOcorrenciasClick(rgpOcorrencias);
end;

destructor TfrmParametrosSelecaoAtrasados.Destroy;
begin
  DataModulo.Fecha(ctSACTabelasConsultaAtrasados);
  Tdtmparametrosselecaoatrasados(DataModulo).Free;
  inherited;
end;

procedure TfrmParametrosSelecaoAtrasados.rgpTelefoneClick(Sender: TObject);
begin
  inherited;
  Tdtmparametrosselecaoatrasados(DataModulo).Telefones := TtecSelecao(rgpTelefone.ItemIndex)
end;

procedure TfrmParametrosSelecaoAtrasados.fraDataAtrasomkeDataInicioChange(Sender: TObject);
begin
  inherited;
  Tdtmparametrosselecaoatrasados(DataModulo).DataVenInicial := fraDataVencimento.DataInicial;
end;

procedure TfrmParametrosSelecaoAtrasados.fraDataAtrasomkeDataFinalChange(Sender: TObject);
begin
  inherited;
  Tdtmparametrosselecaoatrasados(DataModulo).DataVenFinal := fraDataVencimento.DataFinal;
end;

procedure TfrmParametrosSelecaoAtrasados.ckbNenhumPagamentoClick(Sender: TObject);
begin
  inherited;
  if ckbNenhumPagamento.Checked then Tdtmparametrosselecaoatrasados(DataModulo).NenhumPagamento:= slSIM
  else                               Tdtmparametrosselecaoatrasados(DataModulo).NenhumPagamento:= slNAO;
end;

procedure TfrmParametrosSelecaoAtrasados.bbnExecutarClick(Sender: TObject);
begin
//  inherited;
  fraDataAtrasomkeDataInicioChange(fraDataVencimento.mkeDataInicio);
  fraDataAtrasomkeDataFinalChange(fraDataVencimento.mkeDataFinal);
  rgpOcorrenciasClick(rgpOcorrencias);
  rgpTelefoneClick(rgpTelefone);
  ckbPrimeiroAtrasoClick(ckbPrimeiroAtraso);
  ckbNenhumPagamentoClick(ckbNenhumPagamento);
  edtCarenciaChange(edtCarencia);
  edfConceitosChange(edfConceitos);
  if Assigned(DataModulo) then begin
   DataModulo.Fecha(ctSACTabelasConsultaAtrasados);
   DataModulo.Abre(ctSACTabelasConsultaAtrasados);
  end;
  lblQtde.Caption:= IntToStr(NrRegistrosSelecionados);
  bbnOK.Enabled := NrRegistrosSelecionados > 0;
end;

function TfrmParametrosSelecaoAtrasados.GetSQLAtrasado: WideString;
begin
  Tdtmparametrosselecaoatrasados(DataModulo).qryConsultaAtrasados.Sql.Delete(0);
  Result := Tdtmparametrosselecaoatrasados(DataModulo).qryConsultaAtrasados.Sql.Text;
end;

function TfrmParametrosSelecaoAtrasados.GetFiltros: TStringList;
var
  DataVencto,
  Pagamento  : string;
begin
  Pagamento  := '';
  DataVencto := '';
  Result:= TStringList.Create;
  with Tdtmparametrosselecaoatrasados(DataModulo) do begin
    if not DataEmBranco(DataVenInicial) then
       DataVencto:= '''' + Trocar(DataVenInicial,'-','/') + '''';
    if not DataEmBranco(DataVenFinal) then
       DataVencto:= DataVencto + ',' + '''' + Trocar(DataVenFinal,'-','/') + '''';
    case NenhumPagamento of
      slSIM   : Pagamento:= 'NENHUM';
      slNAO   : Pagamento:= '';
    end;
    if Conceitos <> '' then
       Result.Add('" CONCEITO: ' + edfConceitos.Text + ' ",');
    case Ocorrencias of
      slSIM: Result.Add('" CONTACTADO: is not null ",');
      slNAO: Result.Add('" CONTACTADO: is null ",');
    end;
    case Telefones of
      slSIM: Result.Add('" TELEFONE: SIM ",');
      slNAO: Result.Add('" TELEFONE: NAO ",');
    end;
  end;
end;

function TfrmParametrosSelecaoAtrasados.NrRegistrosSelecionados: Integer;
begin
  Result := Tdtmparametrosselecaoatrasados(DataModulo).NrRegistrosSelecionados
end;

procedure TfrmParametrosSelecaoAtrasados.rgpOcorrenciasClick(Sender: TObject);
begin
  inherited;
  if rgpOcorrencias.ItemIndex > -1 then
    Tdtmparametrosselecaoatrasados(DataModulo).Ocorrencias:= TtecSelecao(rgpOcorrencias.ItemIndex);
end;

procedure TfrmParametrosSelecaoAtrasados.FormActivate(Sender: TObject);
begin
  inherited;
  fraDataVencimento.mkeDataInicio.SetFocus;
end;

procedure TfrmParametrosSelecaoAtrasados.ckbPrimeiroAtrasoClick(Sender: TObject);
begin
  inherited;
  if ckbPrimeiroAtraso.Checked then Tdtmparametrosselecaoatrasados(DataModulo).TipoDeAtraso:= slSIM
  else                              Tdtmparametrosselecaoatrasados(DataModulo).TipoDeAtraso:= slNAO;
end;

procedure TfrmParametrosSelecaoAtrasados.edtCarenciaChange(Sender: TObject);
begin
  inherited;
  Tdtmparametrosselecaoatrasados(DataModulo).Carencia := edtCarencia.Text
end;

procedure TfrmParametrosSelecaoAtrasados.edfConceitosChange(Sender: TObject);
begin
  inherited;
  Tdtmparametrosselecaoatrasados(DataModulo).Conceitos := edfConceitos.Text
end;

procedure TfrmParametrosSelecaoAtrasados.sbnFilialClick(Sender: TObject);
var
  Procurar: TfrmConsultaPorCampo;
begin
  inherited;
  Procurar := TfrmConsultaPorCampo.Create(nil);
  Procurar.ConsultaInterativa := True;
  Procurar.DataSet := TdtmParametrosSelecaoAtrasados(DataModulo).TabelaConsultaConceitos;
  Procurar.ExisteCodigo := ExisteConceito;
  TdtmParametrosSelecaoAtrasados(DataModulo).Abre(ctConsultaConceitos);
  if Procurar.ShowModal('Conceitos') = mrOk then begin
    TdtmParametrosSelecaoAtrasados(DataModulo).PosicionarConceitos;
//    TdtmParametrosSelecaoAtrasados(DataModulo).Conceitos := edtConceitos.Text;
  end;
  Procurar.Free;
  TdtmParametrosSelecaoAtrasados(DataModulo).Fecha(ctConsultaConceitos);
  SetFocus
end;

function TfrmParametrosSelecaoAtrasados.ExisteConceito(Ind: Integer; NomeCampo: String;
  inf: Variant): boolean;
begin
  Result := TdtmParametrosSelecaoAtrasados(DataModulo).ExisteConceitos(NomeCampo, inf);
end;

procedure TfrmParametrosSelecaoAtrasados.KeyDown(var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_F9: if edfConceitos.Focused and (Shift = [ssCtrl]) then
               sbnFilialClick(sbnFilial);
  end;
  inherited KeyDown(Key,Shift);
end;

end.
