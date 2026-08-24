unit dmcadastromercadoriasanuncio;

interface

uses
  SysUtils, Classes, dmbasico, DB, cpdatasource, ZQuery, ZPgSqlQuery,
  cpquery, ctconstantes, biblio, Forms, clparametrossistema, clFinanceira,
  Math, Controls, FR_Class, FR_DSet, FR_DBSet, fmpreviewpadrao, Provider,
  DBClient, ZTransact;

type
  TdtmCadastroMercadoriasAnuncio = class(TdtmBasico)
    qryPlano: TtecQuery;
    qryConsultaProduto: TtecQuery;
    qryConsultaProdutocodigo: TLargeintField;
    qryConsultaProdutodescricao: TStringField;
    qryConsultaProdutoreferencia: TStringField;
    dsrPlano: TtecDataSource;
    qryProduto: TtecQuery;
    qryConsultaPlano: TtecQuery;
    qryConsultaPlanocodigo: TIntegerField;
    qryConsultaPlanodescricao: TStringField;
    qryConsultaPlanotaxamensaljuros: TFloatField;
    qryProdutosTabloide: TtecQuery;
    qryTabloide: TtecQuery;
    qryEstoques: TtecQuery;
    dsrProduto: TtecDataSource;
    dsrEstoques: TtecDataSource;
    qryProdutocodigo: TLargeintField;
    qryProdutodescricao: TStringField;
    qryProdutoreferencia: TStringField;
    dsrProdutosTabloide: TtecDataSource;
    dsrTabloide: TtecDataSource;
    qryTabloidedata: TDateField;
    qryTabloidedescricao: TStringField;
    qryProdutoprecopauta: TFloatField;
    qryProdutoprecosugestao: TFloatField;
    qryConsultaPlanotaxajurosanual: TFloatField;
    qryEstoquesdeposito: TFloatField;
    qryEstoquesloja: TFloatField;
    qryEstoquespedido: TFloatField;
    qryProdutosTabloidetabloide: TLargeintField;
    qryProdutosTabloideproduto: TLargeintField;
    qryProdutosTabloidequant_deposito: TFloatField;
    qryProdutosTabloidequant_loja: TFloatField;
    qryProdutosTabloidequant_pedido: TFloatField;
    qryProdutosTabloideplano: TIntegerField;
    qryProdutosTabloideprestacao: TFloatField;
    qryProdutosTabloideprecopauta: TFloatField;
    qryProdutosTabloideprecosugestao: TFloatField;
    qryProdutosTabloideprecovenda: TFloatField;
    qryProdutosTabloidetotal: TFloatField;
    qryProdutosTabloideposicao: TStringField;
    qryProdutosTabloidefoto: TStringField;
    spcTabloideProximo: TtecQuery;
    spcTabloideProximonumero: TIntegerField;
    qryConsultaTabloide: TtecQuery;
    qryConsultaTabloidenumero: TLargeintField;
    qryConsultaTabloidedata: TDateField;
    qryConsultaTabloidedescricao: TStringField;
    qryTabloidenumero: TLargeintField;
    qryProdutosTabloideobservacao: TStringField;
    qryProdutoobservacao: TStringField;
    qryAtualizaObservacao: TtecQuery;
    qryCaracteristica: TtecQuery;
    qryCaracteristicacaracteristica: TLargeintField;
    qryProdutosTabloidereferencia: TStringField;
    qryConsultaProdutovalorgrade1: TStringField;
    qryConsultaProdutovalorgrade2: TStringField;
    qryProdutosTabloidelinha: TStringField;
    qryProdutosTabloidecoluna: TStringField;
    qryProdutosTabloidevalorgrade1: TStringField;
    qryProdutosTabloidevalorgrade2: TStringField;
    qryProdutolinha: TStringField;
    qryProdutocoluna: TStringField;
    qryProdutovalorgrade1: TStringField;
    qryProdutovalorgrade2: TStringField;
    qryProdutosTabloideimprimir: TBooleanField;
    frpTabloides: TfrReport;
    fdsTabloide: TfrDBDataSet;
    fdsProdutosTabloide: TfrDBDataSet;
    qryProdutosTabloidedescricaoplano: TStringField;
    qryProdutosTabloidetaxajurosmensal: TFloatField;
    qryProdutosTabloidetaxajurosanual: TFloatField;
    dspProdutosTabloide: TDataSetProvider;
    cdsProdutosTabloide: TClientDataSet;
    cdsProdutosTabloidetabloide: TLargeintField;
    cdsProdutosTabloideproduto: TLargeintField;
    cdsProdutosTabloidedescricaoproduto: TStringField;
    cdsProdutosTabloidequant_deposito: TFloatField;
    cdsProdutosTabloidequant_loja: TFloatField;
    cdsProdutosTabloidequant_pedido: TFloatField;
    cdsProdutosTabloideplano: TIntegerField;
    cdsProdutosTabloideprestacao: TFloatField;
    cdsProdutosTabloideprecopauta: TFloatField;
    cdsProdutosTabloideprecosugestao: TFloatField;
    cdsProdutosTabloideprecovenda: TFloatField;
    cdsProdutosTabloidetotal: TFloatField;
    cdsProdutosTabloideposicao: TStringField;
    cdsProdutosTabloidefoto: TStringField;
    cdsProdutosTabloideobservacao: TStringField;
    cdsProdutosTabloidereferencia: TStringField;
    cdsProdutosTabloidelinha: TStringField;
    cdsProdutosTabloidecoluna: TStringField;
    cdsProdutosTabloidevalorgrade1: TStringField;
    cdsProdutosTabloidevalorgrade2: TStringField;
    cdsProdutosTabloideimprimir: TBooleanField;
    cdsProdutosTabloidedescricaoplano: TStringField;
    cdsProdutosTabloidetaxajurosmensal: TFloatField;
    cdsProdutosTabloidetaxajurosanual: TFloatField;
    qryPlanocodigo: TIntegerField;
    qryPlanodescricao: TStringField;
    qryPlanovalidadeinicial: TDateField;
    qryPlanovalidadefinal: TDateField;
    qryPlanoquantidadeparcelas: TIntegerField;
    qryPlanoalterarvencimento: TBooleanField;
    qryPlanoalterarvalor: TBooleanField;
    qryPlanoagente: TIntegerField;
    qryPlanotipoplano: TIntegerField;
    qryPlanotipocomissao: TStringField;
    qryPlanocomissao: TFloatField;
    qryPlanotaxamensaljuros: TFloatField;
    qryPlanointervaloparcelas: TIntegerField;
    qryPlanodiavenctoentrada: TDateField;
    qryPlanoprazovenctoentrada: TIntegerField;
    qryPlanotoleranciaentrada: TIntegerField;
    qryPlanoporcentagementrada: TFloatField;
    qryPlanocompraminima: TFloatField;
    qryPlanocompramaxima: TFloatField;
    qryPlanovalorminimoparcela: TFloatField;
    qryPlanodescontomaximo: TFloatField;
    qryPlanodiabase: TIntegerField;
    qryPlanoaposdia: TIntegerField;
    qryPlanomultiplo: TFloatField;
    qryPlanoimprparcelacarne: TBooleanField;
    qryPlanoenderecocompleto: TBooleanField;
    qryPlanomestrintadias: TBooleanField;
    qryPlanotoleranciaentreparcelas: TIntegerField;
    qryPlanotaxajurosanual: TFloatField;
    qryProdutosTabloidedescricaoproduto: TStringField;
    qryProdutosTabloideprodutovisual: TStringField;
    qryProdutocodigovisual: TStringField;
    procedure dsrProdutosTabloideDataChange(Sender: TObject;
      Field: TField);
    procedure qryTabloideAfterScroll(DataSet: TDataSet);
    procedure qryConsultaProdutoAfterOpen(DataSet: TDataSet);
    procedure qryProdutosTabloideAfterScroll(DataSet: TDataSet);
    procedure dsrProdutoDataChange(Sender: TObject; Field: TField);
  protected
    FTaxaAcumulada: Currency;

    function GetConsultarPlano: TZDataset;
    function GetConsultarProduto: TZDataset;
    function GetTabelaProdutosTabloide: TtecQuery;
    function GetConsultaTabloide: TZDataset;
    function GetTabelaTabloide: TZDataset;
    function GetSelecionarParaImpressao: Boolean;

    procedure LerProdutosIncluidos;
    procedure SetSelecionarParaImpressao(const Value: Boolean);
  private
    { Private declarations }
    FOnScrollLinhaColunaGrade: TNotifyEvent;
    function GetColunadaGrade: String;
    function GetLinhadaGrade: String;
//    procedure AtualizaObservacoes(Caracteristica: Integer; Value: String);
//    function GetCaracteristica(Produto: Integer): Integer;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure AbreTabelaPesquisa(TipoPesquisa: TtecProcuraTabloides);
    procedure Selecionar(TipoPesquisa: TtecProcuraTabloides);
    procedure FechaTabelaPesquisa(TipoPesquisa: TtecProcuraTabloides);
    procedure MarcarTodosProdutos(const Marcar: Boolean);
    procedure ImprimirProdutosTabloide;

    function  IncluirTabloide: Boolean;
    function  ExcluirTabloide: Boolean;
    function  GravarTabloide: Boolean;
    function  ExisteProduto(Campo, codigo: String): Boolean;
    function  ExistePlano(Campo, codigo: String): Boolean;
    function  IncluirProdutoTabloide: Boolean;
    function  EditarProdutosTabloide: Boolean;
    function  GravarProdutoTabloide: Boolean;
    function  ExcluirProdutoTabloide: Boolean;
    function  DiaFixo: Boolean;
    function  ValidarData: TDateTime;

    property  ConsultarProduto: TZDataset read GetConsultarProduto;
    property  ConsultarPlano: TZDataset read GetConsultarPlano;
    property  TabelaConsultaTabloide: TzDataset read GetConsultaTabloide;
    property  TabelaTabloide: TZDataset read GetTabelaTabloide;
    property  TabelaProdutosTabloide: TtecQuery read GetTabelaProdutosTabloide;
    property  OnScrollLinhaColunaGrade: TNotifyEvent read FOnScrollLinhaColunaGrade write FOnScrollLinhaColunaGrade;
    property  LinhadaGrade: String read GetLinhadaGrade;
    property  ColunadaGrade: String read GetColunadaGrade;
    property  SelecionarParaImpressao: Boolean read GetSelecionarParaImpressao write SetSelecionarParaImpressao;
  end;

var
  dtmCadastroMercadoriasAnuncio: TdtmCadastroMercadoriasAnuncio;

implementation

{$R *.dfm}
constructor TdtmCadastroMercadoriasAnuncio.Create(AOwner: TComponent);
begin
  inherited;
  qryTabloide.Tag := ctTabelas;
  qryConsultaTabloide.Tag := ctTabelaConsultaTabloides;
  qryConsultaProduto.Tag  := ctTabelasConsultaProdutos;
  qryConsultaPlano.Tag    := ctTabelasConsultaPlanos;
  qryProduto.Params[0].AsInteger := FilialBase;
  qryProdutosTabloidequant_deposito.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryProdutosTabloidequant_loja.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryProdutosTabloidequant_pedido.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryEstoquesdeposito.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryEstoquesloja.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryEstoquespedido.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
end;

procedure TdtmCadastroMercadoriasAnuncio.AbreTabelaPesquisa(TipoPesquisa: TtecProcuraTabloides);
begin
  case TipoPesquisa of
     ttcPRODUTO : begin
                    if ParSistema.UsarConsultaInterativa then
                      qryConsultaProduto.MacroByName('FiltroProduto').AsString:='';
                    Abre(ctTabelasConsultaProdutos);
                  end;
     ttcPLANO   : Abre(ctTabelasConsultaPlanos);
     ttcTABLOIDE: Abre(ctTabelaConsultaTabloides);
  end;
end;

procedure TdtmCadastroMercadoriasAnuncio.Selecionar(TipoPesquisa: TtecProcuraTabloides);
begin
  case TipoPesquisa of
    ttcPRODUTO  : begin
                    ReFazConsulta(qryProduto,[1], [qryConsultaProdutocodigo.asLargeInt]);
                    if not (qryProdutosTabloide.State in [dsedit, dsinsert]) then
                      qryProdutosTabloide.Edit;
                    qryProdutosTabloideproduto.AsLargeInt := qryProdutocodigo.AsLargeInt;
                    qryProdutosTabloideprodutovisual.AsString := qryProdutocodigovisual.AsString;
                  qryProdutosTabloideimprimir.asboolean :=  true;
                  end;
    ttcPLANO    : begin
                    if not (qryProdutosTabloide.State in [dsedit, dsinsert]) then
                      qryProdutosTabloide.Edit;
                    qryProdutosTabloideplano.AsInteger := qryConsultaPlanocodigo.AsInteger;
                    ReFazConsulta(qryPlano,[0],[qryConsultaPlanocodigo.asInteger]);
                  end;
    ttcTABLOIDE : ReFazConsulta(qryTabloide,[0],[qryConsultaTabloidenumero.AsVariant]);
  end;
end;

procedure TdtmCadastroMercadoriasAnuncio.FechaTabelaPesquisa(TipoPesquisa :TtecProcuraTabloides);
begin
  case TipoPesquisa of
    ttcPRODUTO  : Fecha(ctTabelasConsultaProdutos);
    ttcPLANO    : Fecha(ctTabelasConsultaPlanos);
    ttcTABLOIDE : Fecha(ctTabelaConsultaTabloides);
  end;
end;

function TdtmCadastroMercadoriasAnuncio.IncluirTabloide: Boolean;
begin
  qryTabloide.ReadOnly := false;
  ReFazConsulta(qryProdutosTabloide,[0],[0]);
  qryTabloide.Insert;
  qryTabloidedata.AsDateTime := DataServidor;
  Result := True;
end;

function TdtmCadastroMercadoriasAnuncio.GravarTabloide: Boolean;

  procedure AtualizaObservacoes(Caracteristica: Integer; Value: String);
  begin
    qryAtualizaObservacao.Params[1].AsInteger := Caracteristica;
    qryAtualizaObservacao.Params[0].AsString := Value;
    qryAtualizaObservacao.ExecSql;
  end;

  function GetCaracteristica(Produto: Integer): Integer;
  begin
    ReFazConsulta(qryCaracteristica,[0],[Produto]);
    result := qryCaracteristicacaracteristica.AsInteger;
  end;

begin
  if qryTabloide.CheckRequiredFields then begin
    if qryProdutosTabloide.RecordCount = 0 then begin
      MensagemAviso(format(ctTABLOIDESEMPRODUTO,[qryTabloidenumero.asString]));
      Result:=false;
    end
    else begin
      Result:=true;
      if qryTabloide.State = dsInsert then begin
        spcTabloideProximo.Open;
        qryTabloidenumero.AsCurrency := spcTabloideProximonumero.AsCurrency;
        spcTabloideProximo.Close;
      end;
      try
        GuardarRegistroAtual(qryProdutosTabloide,true);
        qryProdutosTabloide.First;
        while Not qryProdutosTabloide.Eof do begin
          qryProdutosTabloide.Edit;
          qryProdutosTabloidetabloide.AsInteger := qryTabloidenumero.AsInteger;
          //qryAtualizaObservacao.Edit;
          AtualizaObservacoes(GetCaracteristica(qryProdutosTabloideproduto.AsInteger),qryProdutosTabloideobservacao.AsString);
          //qryAtualizaObservacao.Post;
          //qryAtualizaObservacao.Next;
          qryProdutosTabloide.Post;
          qryProdutosTabloide.Next;
        end;
        VoltarRegistroAtual(qryProdutosTabloide);
        qryTabloide.Post;
        Perpetrar([qryTabloide, qryProdutosTabloide, qryAtualizaObservacao]);
      except
      end;
    end;
  end
  else result:=false;
end;

function TdtmCadastroMercadoriasAnuncio.IncluirProdutoTabloide: Boolean;
begin
  LerProdutosIncluidos;
  qryProdutosTabloide.ReadOnly := False;
  qryProdutosTabloide.Append;
  Result := True;
end;

function TdtmCadastroMercadoriasAnuncio.EditarProdutosTabloide: Boolean;
var
  RegAtual:TBookmark;
begin
  if qryProdutosTabloide.IsEmpty then begin
    IncluirProdutoTabloide;
    Result := True;
  end
  else begin
    ReFazConsulta(qryEstoques,[0],[qryProdutosTabloideproduto.AsLargeInt]);
    if qryProdutosTabloide.RecordCount = 0 then begin
      LerProdutosIncluidos;
      qryProdutosTabloide.Append;
    end
    else begin
      RegAtual := qryProdutosTabloide.GetBookmark;
      qryProdutosTabloide.GotoBookmark(RegAtual);
      qryProdutosTabloide.FreeBookmark(RegAtual);
    end;
    ReFazConsulta(qryEstoques,[0],[qryProdutosTabloideproduto.AsLargeInt]);
    Result := True;
  end;
end;

function TdtmCadastroMercadoriasAnuncio.GravarProdutoTabloide: Boolean;
begin
  if qryProdutosTabloide.CheckRequiredFields then
  begin
    qryTabloide.Edit;
    qryProdutosTabloide.Post;
    GravarTabloide;
    Result := True
  end
  else
    Result := False;
end;

function TdtmCadastroMercadoriasAnuncio.ExcluirProdutoTabloide: Boolean;
begin
  Result := True;
  if qryProdutosTabloide.RecordCount > 0 then begin
    if MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['o PRODUTO DO TABLOIDE'])) = smbOk then begin
      if qryProdutosTabloide.State = dsInsert then
           qryProdutosTabloide.Cancel
      else
        qryProdutosTabloide.Delete;
    end;
  end;
end;

function TdtmCadastroMercadoriasAnuncio.ExisteProduto(Campo, Codigo: String): Boolean;
const
  SQL = 'and (to_ascii(%s,''latin1'') ilike to_ascii(''%s%s'',''latin1''))';
begin
  qryConsultaProduto.MacroByName('FiltroProduto').asString:= Format(SQL, [Campo, Codigo, '%']);
  qryconsultaproduto.close;
  qryConsultaProduto.Open;
  Result := qryConsultaProduto.RecordCount > 0;
end;

function TdtmCadastroMercadoriasAnuncio.ExistePlano(campo, codigo: String): Boolean;
begin
  Result := ExisteCodigo(qryConsultaPlano, campo, codigo);
end;

function TdtmCadastroMercadoriasAnuncio.GetConsultarPlano: TZDataset;
begin
  Result:= qryConsultaPlano;
end;

function TdtmCadastroMercadoriasAnuncio.GetConsultarProduto: TZDataset;
begin
  Result:= qryConsultaProduto;
end;

function TdtmCadastroMercadoriasAnuncio.GetConsultaTabloide: TZDataset;
begin
  Result := qryConsultaTabloide;
end;

function TdtmCadastroMercadoriasAnuncio.GetTabelaProdutosTabloide: TtecQuery;
begin
  Result:= qryProdutosTabloide;
end;

function TdtmCadastroMercadoriasAnuncio.GetTabelaTabloide: TZDataset;
begin
  Result:= qryTabloide;
end;

function TdtmCadastroMercadoriasAnuncio.DiaFixo: Boolean;
begin
  Result:= ((qryPlanodiabase.AsInteger <> 0) or (qryPlanoaposdia.AsInteger <> 0));
end;

procedure TdtmCadastroMercadoriasAnuncio.LerProdutosIncluidos;
var
  Pos: TBookmark;
begin
  Pos := qryProdutosTabloide.GetBookmark;
  qryProdutosTabloide.DisableControls;
  try
    qryProdutosTabloide.First;
    while Not qryProdutosTabloide.Eof do
      qryProdutosTabloide.Next;
  finally
    qryProdutosTabloide.GotoBookmark(Pos);
    qryProdutosTabloide.FreeBookmark(Pos);
    qryProdutosTabloide.EnableControls;
  end;
end;

function TdtmCadastroMercadoriasAnuncio.ValidarData: TDateTime;
var
  DiaBase: Integer;
  Dia, Mes, Ano: Word;
  NewData : TDateTime;
begin
  DiaBase:= 0;
  DecodeDate(DataServidor,Ano,Mes,Dia);
  if qryPlanoaposdia.AsInteger > 0 then
    DiaBase:= qryPlanoaposdia.AsInteger
  else if qryPlanodiabase.AsInteger > 0 then
    DiaBase:= qryPlanodiabase.AsInteger;

  if Dia <= DiaBase then
    NewData:= EncodeDate(Ano,Mes,DiaBase)
  else begin
    Mes:= Mes + 1;
    if Mes > 12 then begin
      Mes:= Mes - 1;
      Ano:= Ano + 1;
    end;
    NewData:= EncodeDate(Ano,Mes,DiaBase);
  end;
  Result:= NewData;
end;

procedure TdtmCadastroMercadoriasAnuncio.dsrProdutosTabloideDataChange(
  Sender: TObject; Field: TField);
var
 DataAux: TDateTime;
begin
  inherited;
  if Field = qryProdutosTabloideproduto then
    begin
    if qryProduto.RecordCount <> 0 then
    begin
      dsrProdutosTabloide.OnDataChange := nil;
      qryProdutosTabloideprodutovisual.AsString := qryProdutocodigovisual.AsString;
      qryProdutosTabloidedescricaoproduto.AsString:= qryProdutodescricao.AsString;
      qryProdutosTabloideprecopauta.AsString:= qryProdutoprecopauta.AsString;
      qryProdutosTabloideprecosugestao.AsString:= qryProdutoprecosugestao.AsString;
      if (qryProdutosTabloideprecosugestao.AsFloat <> 0) and
         (qryProdutosTabloideprecovenda.AsFloat = 0) then
        qryProdutosTabloideprecovenda.AsFloat := qryProdutosTabloideprecosugestao.AsFloat;
      ReFazConsulta(qryEstoques,[0],[qryProdutocodigo.AsVariant]);
      qryProdutosTabloidequant_deposito.AsCurrency:= qryEstoquesdeposito.AsCurrency;
      qryProdutosTabloidequant_loja.AsCurrency:= qryEstoquesloja.AsCurrency;
      qryProdutosTabloidequant_pedido.AsCurrency:= qryEstoquespedido.AsInteger;
      qryProdutosTabloideobservacao.AsString:=qryProdutoobservacao.AsString;
      qryProdutosTabloidereferencia.AsString:=qryProdutoreferencia.AsString;
      qryProdutosTabloidelinha.AsString:=qryProdutolinha.AsString;
      qryProdutosTabloidecoluna.AsString:=qryProdutocoluna.AsString;
      qryProdutosTabloidevalorgrade1.AsString:=qryProdutovalorgrade1.AsString;
      qryProdutosTabloidevalorgrade2.AsString:=qryProdutovalorgrade2.AsString;
      qryProdutosTabloidedescricaoplano.AsString:=qryPlanodescricao.AsString;
      qryProdutosTabloidetaxajurosmensal.AsFloat:=qryPlanotaxamensaljuros.AsFloat;
      qryProdutosTabloidetaxajurosanual.AsFloat:=qryPlanotaxajurosanual.AsFloat;
      dsrProdutosTabloide.OnDataChange := dsrProdutosTabloideDataChange;
    end;
  end
  else if (Field = qryProdutosTabloideprodutovisual) then
     qryProdutosTabloideproduto.AsLargeInt := qryProdutocodigo.AsLargeInt
  else if (Field = qryProdutosTabloideplano) or
          (Field = qryProdutosTabloideprecovenda) then
  begin
    if (qryPlano.RecordCount <> 0) and (qryProdutosTabloideprecovenda.AsFloat > 0) then
    begin
      if DiaFixo then
        DataAux:= ValidarData
      else
      begin
        if qryPlanodiavenctoentrada.AsDateTime = 0 then
        begin
          if (qryPlanoprazovenctoentrada.AsInteger = 30) and qryPlanomestrintadias.AsBoolean then
               DataAux:= SomarDia(DataServidor,30,'S')
          else DataAux:= SomarDia(DataServidor,qryPlanoprazovenctoentrada.AsInteger,'N');
        end
        else DataAux:= qryPlanodiavenctoentrada.AsDateTime;
      end;
      FTaxaAcumulada:= tecFinanceira.TaxaAcumulada(DataAux,
                                                   DataServidor,
                                                   qryPlanoquantidadeparcelas.AsInteger,
                                                   qryPlanointervaloparcelas.AsInteger,
                                                   qryPlanotaxamensaljuros.AsFloat);
      if FTaxaAcumulada = 0 then
        qryProdutosTabloideprestacao.AsCurrency := 0
      else
      begin
        qryProdutosTabloideprestacao.AsCurrency := Multiplo(qryProdutosTabloideprecovenda.AsCurrency/FTaxaAcumulada,qryPlanomultiplo.AsCurrency);
        qryProdutosTabloidetotal.AsCurrency := qryProdutosTabloidePrestacao.AsCurrency * qryPlanoquantidadeparcelas.AsCurrency;
        qryProdutosTabloidetaxajurosmensal.AsFloat:=qryPlanotaxamensaljuros.AsFloat;
        qryProdutosTabloidetaxajurosanual.AsFloat:=qryPlanotaxajurosanual.AsFloat;
      end;
    end;
  end;
end;

procedure TdtmCadastroMercadoriasAnuncio.qryTabloideAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  ReFazConsulta(qryProdutosTabloide,[0],[qryTabloidenumero.Asvariant]);
end;

procedure TdtmCadastroMercadoriasAnuncio.qryConsultaProdutoAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryConsultaProdutovalorgrade1.Visible := ParSistema.UsarGradesProdutos;
  qryConsultaProdutovalorgrade2.Visible := ParSistema.UsarGradesProdutos;
end;

procedure TdtmCadastroMercadoriasAnuncio.qryProdutosTabloideAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if Assigned(OnScrollLinhaColunaGrade) then
    OnScrollLinhaColunaGrade(qryProdutosTabloide);
end;

function TdtmCadastroMercadoriasAnuncio.GetColunadaGrade: String;
begin
  result:= PrimeiraLetraEmMaiuscula(qryProdutosTabloidecoluna.AsString);
end;

function TdtmCadastroMercadoriasAnuncio.GetLinhadaGrade: String;
begin
  result := PrimeiraLetraEmMaiuscula(qryProdutosTabloidelinha.AsString)
end;

function TdtmCadastroMercadoriasAnuncio.GetSelecionarParaImpressao: Boolean;
begin
  Result := qryProdutosTabloideimprimir.AsBoolean;
end;

procedure TdtmCadastroMercadoriasAnuncio.SetSelecionarParaImpressao(const Value: Boolean);
begin
  qryProdutosTabloide.RequestLive := True;
  qryProdutosTabloide.Edit;
  qryProdutosTabloideimprimir.AsBoolean := Value;
  qryProdutosTabloide.Post;
  qryProdutosTabloide.RequestLive := False;
end;

procedure TdtmCadastroMercadoriasAnuncio.MarcarTodosProdutos(const Marcar: Boolean);
var
 RegistroAtual : TBookMark;
begin
  RegistroAtual := qryProdutosTabloide.GetBookmark;
  qryProdutosTabloide.First;
  while not qryProdutosTabloide.Eof do begin
    SelecionarParaImpressao := Marcar;
    qryProdutosTabloide.Next;
  end;
  qryProdutosTabloide.GotoBookmark(RegistroAtual);
  qryProdutosTabloide.FreeBookmark(RegistroAtual);
end;

procedure TdtmCadastroMercadoriasAnuncio.ImprimirProdutosTabloide;
var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
  FlagImp: Boolean;
begin
  FlagImp := False;
  if qryProdutosTabloide.Active then begin
     qryProdutosTabloide.First;
     while not qryProdutosTabloide.Eof do begin
       if qryProdutosTabloideImprimir.AsBoolean then
       begin
         FlagImp := True;
         break;
       end;
       qryProdutosTabloide.Next;
    end;
  end;

  if not FlagImp  then begin
     GuardarRegistroAtual(qryProdutosTabloide,true);
     qryProdutosTabloide.First;
     while not qryProdutosTabloide.Eof do
     begin
       qryProdutosTabloide.Edit;
       qryProdutosTabloideimprimir.AsBoolean:=true;
       qryProdutosTabloide.Next;
     end;
     VoltarRegistroAtual(qryProdutosTabloide);
  end;

  qryProdutosTabloide.First;

  frVariables['Rua']   := RuaFilialBase;
  frVariables['Bairro']:= BairroFilialBase + ' - CEP: ' + CEPFilialBase;
  frVariables['Cidade']:= CidadeFilialBase + ' - ' + EstadoFilialBase;
  frVariables['Fone']  := FoneFilialBase;
  frVariables['Outras']:= RazaoFilialBase;
  frVariables['titulo']:='MERCADORIAS PARA ANUNCIO';
  frmPreview := TfrmPreviewPadrao.create(self);
  if cdsProdutosTabloide.active then
    cdsProdutosTabloide.close;
  cdsProdutosTabloide.Open;
  try
    Relatorio := frmPreview.frCompositeReport;
    frmPreview.frCompositeReport.Reports.Clear;
    frmPreview.frCompositeReport.Reports.Add(frpTabloides);
    Relatorio.Preview := frmPreview.frPreviewPadrao;
    Relatorio.ShowReport;
    frmPreview.ShowModal;
  finally
    frmPreview.Free
  end;
end;


function TdtmCadastroMercadoriasAnuncio.ExcluirTabloide: Boolean;
begin
  Result := qryTabloide.RecordCount > 0;
  if Result then
    if MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['o TABLOIDE'])) = smbOk then begin
       if qryTabloide.State = dsInsert then begin
          qryProdutosTabloide.Cancel;
          qryTabloide.Cancel;
       end
       else begin
          qryProdutosTabloide.First;
          while not qryProdutosTabloide.Eof do begin
            qryProdutosTabloide.Delete;
          end;
       end;
      Perpetrar([qryProdutosTabloide]);
      qryTabloide.Delete;
      Perpetrar([qryTabloide]);
      Result := True;
    end else
      Result:= False;
end;

procedure TdtmCadastroMercadoriasAnuncio.dsrProdutoDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  if Field = qryProdutodescricao then
    qryProdutosTabloidedescricaoproduto.AsString := qryProdutodescricao.AsString;
end;

end.
