unit dmcadastrodebens;

interface

uses
  SysUtils, Classes, dmbasico, DB, cpdatasource, ZQuery, ZPgSqlQuery,
  cpquery,biblio,math,Forms, ZTransact, Windows,  ctconstantes, variants;

type
  TdtmCadastrodeBens = class(TdtmBasico)
    qryImobilizado: TtecQuery;
    qryImobilizadonumero: TIntegerField;
    qryImobilizadodata_entrada: TDateField;
    qryImobilizadofilialcontribuinte: TIntegerField;
    qryImobilizadocodigobem: TLargeintField;
    qryImobilizadonumlre: TStringField;
    qryImobilizadofolhalre: TStringField;
    qryImobilizadoICMSValor: TFloatField;
    qryImobilizadoICMSValorST: TFloatField;
    qryImobilizadoICMSValorFrt: TFloatField;
    qryImobilizadoICMSValorDif: TFloatField;
    qryImobilizadodata_saida: TDateField;
    qryImobilizadoprodutovisual: TStringField;
    qryImobilizadonmeses: TIntegerField;
    qryImobilizadoTotalICMS: TCurrencyField;
    dsrImobilizado: TtecDataSource;
    qryApropriacaoICMSImobilizado: TtecQuery;
    qryApropriacaoICMSImobilizadonumeroimobilizado: TIntegerField;
    qryApropriacaoICMSImobilizadoperiodo: TDateField;
    qryApropriacaoICMSImobilizadofator: TFloatField;
    qryApropriacaoICMSImobilizadovalor: TFloatField;
    qryApropriacaoICMSImobilizadomes: TStringField;
    qryApropriacaoICMSImobilizadosequencia: TIntegerField;
    dsrApropriacaoICMSImobilizado: TtecDataSource;
    spcImobilizadoProximo: TtecQuery;
    spcImobilizadoProximocodigo: TIntegerField;
    qryImobilizadotipomovimentosaida: TStringField;
    qryImobilizadoValorDoBem: TFloatField;
    qryImobilizadoidentificacao: TStringField;
    qryImobilizadoinfcomplementar: TStringField;
    qryImobilizadodatagarantia: TDateField;
    qryImobilizadotipoconta: TStringField;
    qryImobilizadodepreciar: TStringField;
    qryImobilizadovalordepreciar: TFloatField;
    qryImobilizadotaxadepreciacao: TFloatField;
    qryImobilizadodepreciacaoacumulada: TFloatField;
    qryImobilizadoobsdepreciacao: TStringField;
    qryImobilizadofuncaobemnaempresa: TStringField;
    qryImobilizadovidautil: TIntegerField;
    qryImobilizadoiniciouso: TDateField;
    qryImobilizadocodigonota: TIntegerField;
    qryImobilizadoccdobem: TIntegerField;
    qryImobilizadoccdepreciacaoacumulada: TIntegerField;
    qryImobilizadocccorrecaomonetaria: TIntegerField;
    qryImobilizadoccdepreciacao: TIntegerField;
    qryApropriacaoICMSImobilizadodataapropriacao: TDateField;
    qryImobilizadocentrodecusto: TIntegerField;
    qryImobilizadodadofiscal: TIntegerField;
    qryNotaSaida: TtecQuery;
    dsrNotaSaida: TtecDataSource;
    qryNotaSaidafilial: TIntegerField;
    qryNotaSaidaserie: TStringField;
    qryNotaSaidadadofiscal: TIntegerField;
    qryNotaSaidanumero: TIntegerField;
    qryNotaSaidanumitemdocfiscalsaida: TIntegerField;
    qryNotaSaidadata: TDateField;
    qryNotaEntrada: TtecQuery;
    dsrNotaEntrada: TtecDataSource;
    qryNotaEntradafornecedor: TIntegerField;
    qryNotaEntradatipofornecedor: TStringField;
    qryNotaEntradaserie: TStringField;
    qryNotaEntradanumero: TIntegerField;
    qryNotaEntradacodigo: TIntegerField;
    qryNotaEntradadata: TDateField;
    qryNotaEntradanumitemdocfiscal: TIntegerField;
    qryImobilizadofornecedor_entrada: TIntegerField;
    qryImobilizadotipofornecedor_entrada: TStringField;
    qryImobilizadoserie_entrada: TStringField;
    qryImobilizadonumero_entrada: TIntegerField;
    qryImobilizadoserie_saida: TStringField;
    qryImobilizadonumero_saida: TIntegerField;
    qryApropriacaoICMSImobilizadoperiodoapropriacao: TStringField;
    qryImobilizadoValorResidual: TFloatField;
    qryImobilizadoTaxaResidual: TCurrencyField;
    procedure qryImobilizadoCalcFields(DataSet: TDataSet);
    procedure qryImobilizadoAfterOpen(DataSet: TDataSet);
    procedure qryImobilizadoNewRecord(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure qryApropriacaoICMSImobilizadoAfterPost(DataSet: TDataSet);
    procedure ZMonitor1MonitorEvent(Sql, Result: String);
    procedure qryNotaEntradaBeforeOpen(DataSet: TDataSet);
    procedure qryNotaSaidaBeforeOpen(DataSet: TDataSet);
    procedure dsrImobilizadoDataChange(Sender: TObject; Field: TField);
    procedure qryImobilizadoAfterScroll(DataSet: TDataSet);
    procedure dsrApropriacaoICMSImobilizadoDataChange(Sender: TObject;
      Field: TField);
  private
    fBloqueado: boolean;
    procedure SetBloquear(const Value: boolean);
    function GetBloqueado: boolean;
  private
    fNotaEntradaBeforeOpen: TNotifyEvent;
    fNotaSaidaBeforeOpen: TNotifyEvent;
    FPegarParametrosdaTabela: Boolean;
    { Private declarations }

  public
    { Public declarations }
    fExisteApropriacoes: Boolean;
    procedure IncluirImobilizado;
    procedure GravarImobilizado;
    procedure CalcularApropriacao(ExibirMensagem: boolean = true);
    procedure LimparNotaEntrada;
    procedure LimparNotaSaida;
    property NotaEntradaBeforeOpen: TNotifyEvent read fNotaEntradaBeforeOpen write fNotaEntradaBeforeOpen;
    property NotaSaidaBeforeOpen: TNotifyEvent read fNotaSaidaBeforeOpen write fNotaSaidaBeforeOpen;
    function GravarApropriacao: Boolean;
    procedure VerificarPermissoes;
    function ExcluirBemImobilizado: boolean;

    property PegarParametrosdaTabela: Boolean read FPegarParametrosdaTabela write FPegarParametrosdaTabela;
    property bloqueado: boolean read GetBloqueado write SetBloquear;
    



  end;

var
  dtmCadastrodeBens: TdtmCadastrodeBens;

implementation

{$R *.dfm}

procedure TdtmCadastrodeBens.qryImobilizadoCalcFields(DataSet: TDataSet);
begin
  inherited;
  qryImobilizadoTotalICMS.AsCurrency := qryImobilizadoICMSValor.   AsCurrency +
                                        qryImobilizadoICMSValorST. AsCurrency +
                                        qryImobilizadoICMSValorFrt.AsCurrency +
                                        qryImobilizadoICMSValorDif.AsCurrency;

  qryImobilizadoTaxaResidual.AsCurrency:= 100 * qryImobilizadoValorResidual.AsCurrency /
                                                qryImobilizadoValorDoBem.   AsCurrency;

end;

procedure TdtmCadastrodeBens.qryImobilizadoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  RefazConsultaPorNome(qryApropriacaoICMSImobilizado,['numeroimobilizado'],[qryImobilizadonumero.AsVariant]);

//  qryNotaEntrada.BeforeOpen := nil;

  PegarParametrosdaTabela := true;

  RefazConsultaPorNome(qryNotaEntrada,['produto','filial','fornecedor','tipofornecedor','serie','numero'],
                       [inttostr(qryImobilizadocodigobem.Aslargeint), qryImobilizadofilialcontribuinte.AsInteger,
                        qryImobilizadofornecedor_entrada.AsInteger, qryImobilizadotipofornecedor_entrada.AsString,
                        qryImobilizadoserie_entrada.AsString, qryImobilizadonumero_entrada.AsInteger]);

//  qryNotaEntrada.BeforeOpen := qryNotaEntradaBeforeOpen;


//  qryNotaSaida.BeforeOpen := nil;

  RefazConsultaPorNome(qryNotaSaida,['produto','filial','serie','numero'],
                       [inttostr(qryImobilizadocodigobem.Aslargeint), qryImobilizadofilialcontribuinte.AsInteger,
                        qryImobilizadoserie_saida.AsString, qryImobilizadonumero_saida.AsInteger]);

//  qryNotasaida.BeforeOpen := qryNotaSaidaBeforeOpen;

  PegarParametrosdaTabela := false;

  VerificarPermissoes;                        

end;

procedure TdtmCadastrodeBens.qryImobilizadoNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryImobilizadonmeses.AsInteger := 48;
  qryImobilizado.Params[0].AsInteger := 0;
  qryImobilizadofilialcontribuinte.AsInteger := FilialBase;
  qryImobilizadotipoconta.AsString := 'A';
  qryImobilizadodepreciar.AsString := 'S';
  qryImobilizadoiniciouso.AsDateTime := now();
  qryImobilizadodata_entrada.AsDateTime := now();
end;

procedure TdtmCadastrodeBens.DataModuleCreate(Sender: TObject);
begin
  inherited;
  qryImobilizado.ParamByName('numero').AsInteger := 0;
  qryimobilizado.Open;

end;

procedure TdtmCadastrodeBens.qryApropriacaoICMSImobilizadoAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  qryImobilizado.Edit;
//  qryApropriacaoICMSImobilizado.Prior;
//  qryApropriacaoICMSImobilizado.Next;  //não alterava o valor
  VerificarPermissoes;
end;

procedure TdtmCadastrodeBens.CalcularApropriacao(ExibirMensagem: boolean = true);
var
  {vTotalImposto,} vimposto : real;
  i: integer;
  vData : TDateTime;
  continuar : Boolean;
begin
{  vTotalImposto := 0;}
  if not qryImobilizadonmeses.ReadOnly then
  begin
    qryApropriacaoICMSImobilizado.AfterPost := nil;

    continuar := true;
    if qryApropriacaoICMSImobilizado.RecordCount >0 then
       if ExibirMensagem then
         continuar := MensagemConfirmacao('Regerar as parcelas de apropriação do ICMS?')= smbOK ;

    if continuar then
    begin
      vImposto := 0;
      qryApropriacaoICMSImobilizado.DisableControls;
      while not qryApropriacaoICMSImobilizado.Eof do
        qryApropriacaoICMSImobilizado.Delete;

      if qryImobilizadoiniciouso.IsNull then
        vdata := qryImobilizadodata_entrada.AsDateTime
      else
        vData := qryImobilizadoiniciouso.AsDateTime;
        
      for i:= 1 to qryImobilizadonmeses.AsInteger do
      begin
        qryApropriacaoICMSImobilizado.Append;
        qryApropriacaoICMSImobilizadosequencia.AsInteger := I;

        if i = 1 then
          qryApropriacaoICMSImobilizadoperiodo.AsDateTime := vData
        else
        begin
          vData := IncMonth(vData);
          qryApropriacaoICMSImobilizadoperiodo.AsDateTime := vData;
        end;

        qryApropriacaoICMSImobilizadomes.AsString := FormatDateTime('MM/YYYY',vdata);

        {if i = qryImobilizadonmeses.AsInteger then
          vimposto := qryImobilizadoTotalICMS.Asfloat - vTotalImposto
        else}
          vimposto := truncar(qryImobilizadoTotalICMS.Asfloat / qryImobilizadonmeses.AsInteger,2);

        qryApropriacaoICMSImobilizadovalor.AsFloat := vimposto;
        {vTotalImposto := vTotalImposto + vimposto;}
        qryApropriacaoICMSImobilizadofator.AsFloat := vimposto/qryImobilizadoTotalICMS.AsFloat;
        qryApropriacaoICMSImobilizado.Post;
      end;

      qryApropriacaoICMSImobilizado.AfterPost := qryApropriacaoICMSImobilizadoAfterPost;

      qryApropriacaoICMSImobilizado.EnableControls;
    end;
    GravarImobilizado;
  end;
end;

procedure TdtmCadastrodeBens.GravarIMobilizado;
begin

  qryImobilizadodata_saida.Required := not qryImobilizadodadofiscal.IsNull;
  qryImobilizadotipomovimentosaida.Required := not qryImobilizadodata_saida.IsNull;

  qryImobilizadovidautil.Required := qryApropriacaoICMSImobilizado.RecordCount > 0;
  qryImobilizadocentrodecusto.Required := qryApropriacaoICMSImobilizado.RecordCount > 0;
  qryImobilizadofuncaobemnaempresa.Required := qryApropriacaoICMSImobilizado.RecordCount > 0;


  dsrImobilizado.onDataChange := nil;
  if qryImobilizado.CheckRequiredFields then
  begin
    if qryImobilizado.State in [dsInsert] then
    begin
      spcImobilizadoProximo.Open;
      qryImobilizadonumero.AsInteger:= spcImobilizadoProximocodigo.AsInteger;
      spcImobilizadoProximo.Close;
    end;

    GuardarRegistroAtual(qryApropriacaoICMSImobilizado,true);
    qryApropriacaoICMSImobilizado.AfterPost := nil;
    qryApropriacaoICMSImobilizado.First;
    while not qryApropriacaoICMSImobilizado.Eof do
    begin
      qryApropriacaoICMSImobilizado.edit;
      qryApropriacaoICMSImobilizadonumeroimobilizado.AsInteger := qryImobilizadonumero.AsInteger;
      qryApropriacaoICMSImobilizado.Post;
      qryApropriacaoICMSImobilizado.Next;
    end;
    VoltarRegistroAtual(qryApropriacaoICMSImobilizado);
    qryApropriacaoICMSImobilizado.AfterPost := qryApropriacaoICMSImobilizadoAfterPost;

    Perpetrar([qryImobilizado, qryApropriacaoICMSImobilizado]);
  end;
  dsrImobilizado.onDataChange := dsrImobilizadoDataChange;
end;

procedure TdtmCadastrodeBens.IncluirImobilizado;
begin
  qryImobilizado.Insert;
  RefazConsultaPorNome(qryApropriacaoICMSImobilizado,['numeroimobilizado'],[qryImobilizadonumero.AsVariant]);

end;

procedure TdtmCadastrodeBens.ZMonitor1MonitorEvent(Sql, Result: String);
var
 Listar : TStringList;
begin
  inherited;
  Listar := tStringlist.create;
  if fileexists('d:\log.sql') then
    Listar.loadfromfile('d:\log.sql');
  Listar.add('');
  Listar.add(sql);
  Listar.add(result);
  listar.savetofile('d:\log.sql');
  listar.free;
end;


procedure TdtmCadastrodeBens.LimparNotaEntrada;
begin
  if not qryImobilizadocodigonota.isnull then
  begin
    qryImobilizado.edit;
    qryImobilizadocodigonota.clear;
  end
end;

procedure TdtmCadastrodeBens.qryNotaEntradaBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  if assigned(NotaEntradaBeforeOpen) then
    NotaEntradaBeforeOpen(qryNotaEntrada);
end;

procedure TdtmCadastrodeBens.qryNotaSaidaBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  if assigned(NotaSaidaBeforeOpen) then
    NotaSaidaBeforeOpen(qryNotaSaida);

end;

procedure TdtmCadastrodeBens.LimparNotaSaida;
begin
  if not qryImobilizadodadofiscal.isnull then
  begin
    qryImobilizado.edit;
    qryImobilizadodadofiscal.clear;
  end
end;

function TdtmCadastrodeBens.GravarApropriacao: boolean;
begin
  result := true;

  try;
    if qryApropriacaoICMSImobilizadoperiodoapropriacao.Asstring<>'' then
      qryApropriacaoICMSImobilizadodataapropriacao.AsDateTime :=
        strtodatetime('01/'+qryApropriacaoICMSImobilizadoperiodoapropriacao.Asstring)
    else
      qryApropriacaoICMSImobilizadodataapropriacao.clear;

    qryApropriacaoICMSImobilizado.Post;
  except
    result := false;
  end;
end;

procedure TdtmCadastrodeBens.VerificarPermissoes;

  function ExisteDadosSaida: boolean;
  begin
    result := not qryImobilizadodata_saida.IsNull;
  end;

  function ExisteApropriacoes: boolean;
  begin
    result := false;
    GuardarRegistroAtual(qryApropriacaoICMSImobilizado,true);
    qryApropriacaoICMSImobilizado.First;
    while not qryApropriacaoICMSImobilizado.Eof do
    begin
      if not qryApropriacaoICMSImobilizadodataapropriacao.IsNull then
      begin
        result := true;
        break;
      end;
      qryApropriacaoICMSImobilizado.Next;
    end;
    VoltarRegistroAtual(qryApropriacaoICMSImobilizado);
    fExisteApropriacoes := result;
  end;


  procedure LiberarSaida;
  var i: integer;
  begin
    for i:=0 to qryNotaSaida.FieldCount -1 do
      qryNotaSaida.Fields[i].ReadOnly := false;
    qryImobilizadodata_saida.ReadOnly := false;
    qryImobilizadotipomovimentosaida.ReadOnly := false;
    qryImobilizadodadofiscal.ReadOnly :=false;
  end;

  procedure LiberarColunaApropriacao;
  begin
    qryApropriacaoICMSImobilizadodataapropriacao.ReadOnly := false;
    qryApropriacaoICMSImobilizadoperiodoapropriacao.ReadOnly := false;
  end;

  procedure LiberarDadosContabeis;
  begin
    qryImobilizadoccdobem.ReadOnly := false;
    qryImobilizadoccdepreciacaoacumulada.ReadOnly := false;
    qryImobilizadocccorrecaomonetaria.ReadOnly := false;
    qryImobilizadoccdepreciacao.ReadOnly := false;
  end;

begin
   if qryImobilizado.State = dsinsert then
     bloqueado:= false
   else
   begin
     if ExisteDadosSaida then
     begin
       Bloqueado := true;
       LiberarSaida;
//       LiberarDadoscontabeis;
     end
     else
     if ExisteApropriacoes then
     begin
       Bloqueado := true;
       LiberarSaida;
       LiberarColunaApropriacao;
       LiberarDadoscontabeis;
     end
     else
       bloqueado := false;
   end;

  {CAMPOS QUE NÃO PRECISAM SER BLOQUEADOS}

  {
  qryImobilizadovidautil.ReadOnly := false;
  qryImobilizadocentrodecusto.ReadOnly := false;
  qryImobilizadofuncaobemnaempresa.ReadOnly := false;
  qryImobilizadodatagarantia.ReadOnly := false;
  qryImobilizadoinfcomplementar.ReadOnly := false;
  qryImobilizadoidentificacao.ReadOnly := false;
  qryImobilizadoobsdepreciacao.ReadOnly := false;
  qryImobilizadodepreciacaoacumulada.ReadOnly := false;
  qryImobilizadotaxadepreciacao.ReadOnly := false;
  qryImobilizadovalordepreciar.ReadOnly := false;
  qryImobilizadoiniciouso.ReadOnly := false;
  qryImobilizadotipoconta.ReadOnly := false;
  qryImobilizadodepreciar.ReadOnly := false;
  }

end;

procedure TdtmCadastrodeBens.dsrImobilizadoDataChange(Sender: TObject;
  Field: TField);
begin
  if (field = qryImobilizadodata_saida) or
     (field = qryImobilizadotipomovimentosaida) then
     VerificarPermissoes
  else
  if field = qryImobilizadoICMSValor then
  begin
    if (qryImobilizadoICMSValor.OldValue <> null) and
       (qryImobilizadoICMSValor.OldValue <> qryImobilizadoICMSValor.ascurrency) and
       (qryApropriacaoICMSImobilizado.RecordCount <> 0) then
    begin
      if MensagemConfirmacao('O valor total a apropriar foi alterado. Regerar as parcelas de apropriação do ICMS?') = smbOK then
        CalcularApropriacao(false)
      else
      begin
        qryImobilizadoICMSValor.AsCurrency := qryImobilizadoICMSValor.OldValue;
        qryImobilizadoICMSValor.FocusControl;
      end;
    end;
  end
  else
  if field = qryImobilizadoICMSValorST then
  begin
    if (qryImobilizadoICMSValorST.OldValue <> null) and
       (qryImobilizadoICMSValorST.OldValue <> qryImobilizadoICMSValorST.ascurrency) and
       (qryApropriacaoICMSImobilizado.RecordCount <> 0) then
    begin
      if MensagemConfirmacao('O valor total a apropriar foi alterado. Regerar as parcelas de apropriação do ICMS?') = smbOK then
        CalcularApropriacao(false)
      else
      begin
        qryImobilizadoICMSValorST.AsCurrency := qryImobilizadoICMSValorST.OldValue;
        qryImobilizadoICMSValorST.FocusControl;
      end;
    end;
  end
  else
  if field = qryImobilizadoICMSValorFrt then
  begin
    if (qryImobilizadoICMSValorFrt.OldValue <> null) and
       (qryImobilizadoICMSValorFrt.OldValue <> qryImobilizadoICMSValorFrt.ascurrency) and
       (qryApropriacaoICMSImobilizado.RecordCount <> 0) then
    begin
      if MensagemConfirmacao('O valor total a apropriar foi alterado. Regerar as parcelas de apropriação do ICMS?') = smbOK then
        CalcularApropriacao(false)
      else
      begin
        qryImobilizadoICMSValorFrt.AsCurrency := qryImobilizadoICMSValorFrt.OldValue;
        qryImobilizadoICMSValorFrt.FocusControl;
      end;
    end;
  end
  else
  if field = qryImobilizadoICMSValorDif then
  begin
    if (qryImobilizadoICMSValorDif.OldValue <> null) and
       (qryImobilizadoICMSValorDif.OldValue <> qryImobilizadoICMSValorDif.ascurrency) and
       (qryApropriacaoICMSImobilizado.RecordCount <> 0) then
    begin
      if MensagemConfirmacao('O valor total a apropriar foi alterado. Regerar as parcelas de apropriação do ICMS?') = smbOK then
        CalcularApropriacao(false)
      else
      begin
        qryImobilizadoICMSValorDif.AsCurrency := qryImobilizadoICMSValorDif.OldValue;
        qryImobilizadoICMSValorDif.FocusControl;
      end;
    end;
  end;
  inherited;

end;

procedure TdtmCadastrodeBens.qryImobilizadoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  VerificarPermissoes;

end;

function TdtmCadastrodeBens.ExcluirBemImobilizado: boolean;
begin
  result := true;
  try
    qryImobilizado.Delete;
    perpetrar([qryimobilizado]);
  except
    result := false;
  end;
end;

procedure TdtmCadastrodeBens.dsrApropriacaoICMSImobilizadoDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  if field = qryApropriacaoICMSImobilizadoperiodoapropriacao then
  begin
    if qryApropriacaoICMSImobilizadoperiodoapropriacao.IsNull then
      qryApropriacaoICMSImobilizadodataapropriacao.Clear;
  end;
end;


procedure TdtmCadastrodeBens.SetBloquear(const Value: boolean);
var i : integer;
begin
  fBloqueado := Value;

  for i:=0 to qryImobilizado.FieldCount -1 do
    qryImobilizado.Fields[i].ReadOnly := Value;

  qryImobilizadonumero.ReadOnly := false;

  qryApropriacaoICMSImobilizadodataapropriacao.ReadOnly := Value;
  qryApropriacaoICMSImobilizadoperiodoapropriacao.ReadOnly := Value;

  for i:=0 to qryNotaEntrada.FieldCount -1 do
    qryNotaEntrada.Fields[i].ReadOnly := Value;

  for i:=0 to qryNotaSaida.FieldCount -1 do
    qryNotaSaida.Fields[i].ReadOnly := Value;

end;


function TdtmCadastrodeBens.GetBloqueado: boolean;
begin
  result := fBloqueado;
end;

end.
