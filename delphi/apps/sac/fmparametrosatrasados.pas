unit fmparametrosatrasados;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  DB, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids,
  Mask, frintervalodata,
  fmparametroselecaobasica;

type
  TfrmParametrosAtrasados = class(TfrmParametroSelecaoBasica)
    gbxTipoAtraso: TGroupBox;
    rbnQualquerAtraso: TRadioButton;
    rbnPrimeiroAtraso: TRadioButton;
    fraDataVencimento: TfraIntervaloData;
    ckbNenhumPagamento: TCheckBox;
    rgpContactados: TRadioGroup;
    rgbConceitos: TGroupBox;
    lblConceitos: TLabel;
    mkeConceitos: TMaskEdit;
    rgpTelefone: TRadioGroup;
    procedure rgpTelefoneClick(Sender: TObject);
    procedure fraDataAtrasomkeDataInicioChange(Sender: TObject);
    procedure fraDataAtrasomkeDataFinalChange(Sender: TObject);
    procedure mkeConceitosChange(Sender: TObject);
    procedure rbnQualquerAtrasoClick(Sender: TObject);
    procedure rbnPrimeiroAtrasoClick(Sender: TObject);
    procedure ckbNenhumPagamentoClick(Sender: TObject);
    procedure bbnExecutarClick(Sender: TObject);
    procedure rgpContactadosClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  protected
    procedure MontarParametroSelecao(Parametros:TStringList);
    function  GetSQLAtrasado: WideString;
    function  GetFiltros: TStringList; override;
    function  NrRegistrosSelecionados: Integer; override;
  public
    constructor Create(AOwner: TComponent;SelecaoAnterior: TStringList); reintroduce;
    destructor  Destroy; override;
    property    SQLAtrasado: WideString read GetSQLAtrasado;
  end;

var
  frmParametrosAtrasados: TfrmParametrosAtrasados;

implementation

Uses
  dmparametrosatrasados,
  biblio, ctConstantes;

{$R *.dfm}

constructor TfrmParametrosAtrasados.Create(AOwner: TComponent; SelecaoAnterior: TStringList);
begin
  inherited Create(Aowner);
  FDataModulo:= Tdtmparametrosatrasados.Create(Self);
  DataSet:= Tdtmparametrosatrasados(DataModulo).TabelaConsultaAtrasado;
  lblQtde.Caption:= '';
  Tdtmparametrosatrasados(DataModulo).NenhumPagamento:= slNAO;
  Tdtmparametrosatrasados(DataModulo).TipoDeAtraso:= taNENHUM;
  if (SelecaoAnterior.Count > 0) then
     MontarParametroSelecao(SelecaoAnterior)
end;

destructor TfrmParametrosAtrasados.Destroy;
begin
  Tdtmparametrosatrasados(DataModulo).Free;
  inherited;
end;

procedure TfrmParametrosAtrasados.rgpTelefoneClick(Sender: TObject);
begin
  inherited;
  TdtmParametrosAtrasados(DataModulo).Telefones := TtecSelecao(rgpTelefone.ItemIndex)
end;

procedure TfrmParametrosAtrasados.fraDataAtrasomkeDataInicioChange(
  Sender: TObject);
begin
  inherited;
  TdtmParametrosAtrasados(DataModulo).DataVenInicial := fraDataVencimento.DataInicial;
end;

procedure TfrmParametrosAtrasados.fraDataAtrasomkeDataFinalChange(
  Sender: TObject);
begin
  inherited;
  TdtmParametrosAtrasados(DataModulo).DataVenFinal := fraDataVencimento.DataFinal;
end;

procedure TfrmParametrosAtrasados.mkeConceitosChange(Sender: TObject);
begin
  inherited;
  TdtmParametrosAtrasados(DataModulo).Conceitos := mkeConceitos.Text
end;

procedure TfrmParametrosAtrasados.rbnQualquerAtrasoClick(Sender: TObject);
begin
  inherited;
  if rbnQualquerAtraso = Sender then
    TdtmParametrosAtrasados(DataModulo).TipoDeAtraso := taQUALQUERATRASO
  else if rbnPrimeiroAtraso = Sender then
    TdtmParametrosAtrasados(DataModulo).TipoDeAtraso := taPRIMEIROATRASO;
end;

procedure TfrmParametrosAtrasados.rbnPrimeiroAtrasoClick(Sender: TObject);
begin
  inherited;
  if rbnQualquerAtraso = Sender then
    TdtmParametrosAtrasados(DataModulo).TipoDeAtraso := taQUALQUERATRASO
  else if rbnPrimeiroAtraso = Sender then
    TdtmParametrosAtrasados(DataModulo).TipoDeAtraso := taPRIMEIROATRASO;
end;

procedure TfrmParametrosAtrasados.ckbNenhumPagamentoClick(Sender: TObject);
begin
  inherited;
  if ckbNenhumPagamento.Checked then TdtmParametrosAtrasados(DataModulo).NenhumPagamento:= slSIM
  else                               TdtmParametrosAtrasados(DataModulo).NenhumPagamento:= slNAO;
end;

procedure TfrmParametrosAtrasados.bbnExecutarClick(Sender: TObject);
begin
//  inherited;
  if Assigned(DataModulo) then begin
    DataModulo.Fecha(ctSACTabelasConsultaAtrasados);
    DataModulo.Abre(ctSACTabelasConsultaAtrasados);
  end;
  lblQtde.Caption:= IntToStr(NrRegistrosSelecionados);
  bbnOK.Enabled := NrRegistrosSelecionados > 0;
end;

function TfrmParametrosAtrasados.GetSQLAtrasado: WideString;
begin
  Result := TdtmParametrosAtrasados(DataModulo).qryConsultaAtrasados.Sql.Text;
end;

function TfrmParametrosAtrasados.GetFiltros: TStringList;
var
  DataVencto,
  Pagamento  : string;
begin
  Pagamento  := '';
  DataVencto := '';
  Result:= TStringList.Create;
  with TdtmParametrosAtrasados(DataModulo) do begin
    if not DataEmBranco(DataVenInicial) then
       DataVencto:= '''' + Trocar(DataVenInicial,'-','/') + '''';
    if not DataEmBranco(DataVenFinal) then
       DataVencto:= DataVencto + ',' + '''' + Trocar(DataVenFinal,'-','/') + '''';
    case NenhumPagamento of
      slSIM   : Pagamento:= 'NENHUM';
      slNAO   : Pagamento:= '';
    end;
    case TipoDeAtraso of
      taPRIMEIROATRASO : Result.Add('" ATRASADO: ' + DataVencto + ' ( PRIMEIRO ' + Pagamento + ' )",');
      taQUALQUERATRASO : Result.Add('" ATRASADO: ' + DataVencto + ' ( QUALQUER ' + Pagamento + ' )",');
    end;
    if Conceitos <> '' then
       Result.Add('" CONCEITO: ' + mkeConceitos.Text + ' ",');
    case Contactados of
      slSIM: Result.Add('" CONTACTADO: is not null ",');
      slNAO: Result.Add('" CONTACTADO: is null ",');
    end;
    case Telefones of
      slSIM: Result.Add('" TELEFONE: SIM (fonenumero,fone2numero,empfonenumero,confonenumero,reffonenumero,reffone2numero) ",');
      slNAO: Result.Add('" TELEFONE: NAO (fonenumero,fone2numero,empfonenumero,confonenumero,reffonenumero,reffone2numero) ",');
    end;
  end;
end;

function TfrmParametrosAtrasados.NrRegistrosSelecionados: Integer;
begin
  Result := TdtmParametrosAtrasados(DataModulo).NrRegistrosSelecionados
end;

procedure TfrmParametrosAtrasados.MontarParametroSelecao(Parametros: TStringList);
var
  a,b,Idx                           : Integer;
  Rotulo,Valor,AuxTexto,Texto       : String;
  PosParent,PosParent1, PosParent2  : Integer;
begin
  inherited;
  for a:=0 to Parametros.Count - 1 do begin
    Texto:= ''; Rotulo:= ''; AuxTexto:= ''; Valor:= '';
    AuxTexto:= Parametros.Strings[a];
    for b:= 1 to Length(AuxTexto) do
      if not (AuxTexto[b] in ['"','''',',',' ']) then
         Texto:= Texto + AuxTexto[b];
    Idx   := Pos(':',Texto);
    Rotulo:= Copy(Texto,1,Idx-1);
    if Rotulo = 'CONTACTADO' then begin
      Valor := Copy(Texto,Idx+1,Length(Texto)-Idx);
      if ANSIUpperCase(Valor) = 'ISNOTNULL' then rgpContactados.ItemIndex := 0
      else
        if ANSIUpperCase(Valor) = 'ISNULL' then rgpContactados.ItemIndex := 1
        else
          rgpContactados.ItemIndex := 2;
      rgpContactadosClick(rgpContactados);
    end
    else
    if Rotulo = 'CONCEITO' then begin
       Valor  := Copy(Texto,Idx+1,Length(Texto)-Idx);
       mkeConceitos.Text:= Valor;
    end
    else
    if (Rotulo = 'TELEFONE') then begin
      PosParent:= Pos('(',Texto);
      Valor := Copy(Texto,Idx+1,((PosParent-1)-Idx));
      if ANSIUpperCase(Valor) = 'SIM' then rgPTelefone.ItemIndex := 0
      else
        if ANSIUpperCase(Valor) = 'NAO' then rgPTelefone.ItemIndex := 1
        else
          rgpTelefone.ItemIndex := 2;
      rgpTelefoneClick(rgpTelefone);
    end
    else
    if Rotulo = 'ATRASADO' then begin
      PosParent1:= Pos('(',Texto);
      PosParent2:= Pos(')',Texto);
      Valor := Trocar(Copy(Texto,Idx+1,((PosParent1-1)-Idx)),'/',{{DateSeparator} '/'} '/');
      if (Length(Valor) > 10) then begin
         fraDataVencimento.DataInicial:= Copy(Valor,1,10);
         fraDataVencimento.DataFinal  := Copy(Valor,11,20);
      end
       else
         fraDataVencimento.DataInicial:= Copy(Valor,1,10);

      Valor := Copy(Texto,PosParent1+1,(PosParent2-1)- PosParent1);
      ckbNenhumPagamento.Checked := (Length(Valor) > 8);
      ckbNenhumPagamentoClick(ckbNenhumPagamento);

      rbnPrimeiroAtraso.Checked := (ANSIUpperCase(Copy(Valor,1,8)) = 'PRIMEIRO');
      rbnQualquerAtraso.Checked := (ANSIUpperCase(Copy(Valor,1,8)) = 'QUALQUER');
      rbnPrimeiroAtrasoClick(rbnQualquerAtraso);
    end;
  end;
end;

procedure TfrmParametrosAtrasados.rgpContactadosClick(Sender: TObject);
begin
  inherited;
  if rgpContactados.ItemIndex > -1 then
    TdtmParametrosAtrasados(DataModulo).Contactados:= TtecSelecao(rgpContactados.ItemIndex);
end;

procedure TfrmParametrosAtrasados.FormActivate(Sender: TObject);
begin
  inherited;
  fraDataVencimento.mkeDataInicio.SetFocus;
end;

end.
