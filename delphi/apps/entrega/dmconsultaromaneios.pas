unit dmconsultaromaneios;

interface

uses
  SysUtils, Classes, dmbasico, DB, ZQuery, ZPgSqlQuery, cpquery,
  cpdatasource, CheckLst, biblio, TypInfo, dmtecsoft;


type
  TdtmConsultaRomaneios = class(TdtmBasico)
    qryRomaneios: TtecQuery;
    dsrRomaneios: TtecDataSource;
    qryRomaneiosnumero: TIntegerField;
    qryRomaneiosfornecedor: TIntegerField;
    qryRomaneiosnomefornecedor: TStringField;
    qryRomaneiosemissao: TDateField;
    qryRomaneiostipo: TStringField;
    qryRomaneiosdocumentopag: TIntegerField;
    qryRomaneiosdatapagto: TDateField;
    qryRomaneiosvalorpagto: TFloatField;
    qryRomaneiosnomeusuarioconferencia: TStringField;
    qryRomaneiosdatahorausuarioconferencia: TDateTimeField;
    qryRomaneiossituacao_romaneio: TStringField;
    qryRomaneiosdescricaotipo: TStringField;
    qryRomaneiosNotas: TtecQuery;
    qryRomaneiosNotasnomefilial: TStringField;
    qryRomaneiosNotasserie: TStringField;
    qryRomaneiosNotasnumero_nf: TIntegerField;
    qryRomaneiosNotasmaquina: TIntegerField;
    qryRomaneiosNotasintervensao: TIntegerField;
    qryRomaneiosNotasnumero_cupom: TIntegerField;
    qryRomaneiosNotasdataemissao: TDateField;
    qryRomaneiosNotasentrega: TDateField;
    qryRomaneiosNotasvalor: TFloatField;
    qryRomaneiosNotascancelado: TBooleanField;
    qryRomaneiosNotasdadofiscal: TIntegerField;
    qryRomaneiosNotasobservacao: TStringField;
    qryRomaneiosNotasromaneio: TIntegerField;
    qryRomaneiosNotascodigofrete: TIntegerField;
    qryRomaneiosNotasfilialemissao: TIntegerField;
    qryRomaneiosNotasdescricaofrete: TStringField;
    qryRomaneiosNotasvalorfornecedor: TFloatField;
    qryRomaneiosNotasnomecliente: TStringField;
    qryRomaneiosNotasobservacao_2: TStringField;
    qryRomaneiosNotaschv_nfe: TStringField;
    qryRomaneiosNotasdata_hora_recebimento: TDateTimeField;
    qryRomaneiosNotascliente: TStringField;
    qryRomaneiosNotasvolumes: TIntegerField;
    dsrRomaneiosNotas: TtecDataSource;
    procedure qryRomaneiosAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure Open_Romaneios(DataInicial, DataFinal: String;

        ckbTipo, ckbSituacao: TCheckListBox;

        fraListaFiliaisEmissao,
        fraListaFiliaisDestino,
        fraSelecaoAleatoriaCliente,
        fraSelecaoAleatoriaFornecedores: String);

  end;

Type
  tTipoRomaneio = (N, T);
//  tSituacaoRomaneio = (FECHADA,CONFIRMADA,PARCIAL, ABERTA);
  

var
  dtmConsultaRomaneios: TdtmConsultaRomaneios;

implementation

{$R *.dfm}

{ TdtmConsultaRomaneios }

procedure TdtmConsultaRomaneios.Open_Romaneios(DataInicial,
  DataFinal: String; ckbTipo, ckbSituacao: TCheckListBox;
  fraListaFiliaisEmissao, fraListaFiliaisDestino,
  fraSelecaoAleatoriaCliente, fraSelecaoAleatoriaFornecedores: String);
var
  i: integer;
  vTipo, vSituacaoRomaneio: String;

begin
  try

    qryRomaneios.AfterScroll := nil;

    qryRomaneios.MacroByName('IntervaloDatas').asString :=
      MontarIntervaloData('r.emissao', DataInicial, DataFinal, False);

    qryRomaneios.MacroByName('Tipo').asString := '';
    for i:=0 to ckbTipo.count-1 do
    begin
      if ckbTipo.checked[i] then
        vTipo := vTipo + quotedstr(GetEnumName(TypeInfo(tTipoRomaneio), i)) + ', ';
    end;
    delete(vTipo, length(vtipo)-1, 2);
    if vTipo<>'' then
      qryRomaneios.MacroByName('Tipo').asString := 'and r.tipo in (' + vTipo + ')';


    for i:=0 to ckbSituacao.count-1 do
    begin
      if ckbSituacao.checked[i] then
        vSituacaoRomaneio := vSituacaoRomaneio + quotedstr(uppercase(ckbSituacao.items[i])) + ', ';
    end;

    vSituacaoRomaneio := Trocar(vSituacaoRomaneio,'â','Â');

    qryRomaneios.MacroByName('Situacao').asString := '';

    delete(vSituacaoRomaneio, length(vSituacaoRomaneio)-1, 2);
    if vSituacaoRomaneio<>'' then
      qryRomaneios.MacroByName('Situacao').asString := 'and r.situacao_romaneio in (' + vSituacaoRomaneio + ')';

    qryRomaneios.MacroByName('ListaFiliaisEmissao').asString := '';
    if fraListaFiliaisEmissao<>'' then
      qryRomaneios.MacroByName('ListaFiliaisEmissao').asString :=
       ' and df.filialemissao in ( '+fraListaFiliaisEmissao+')';

    qryRomaneios.MacroByName('ListaFiliaisDestino').asString := '';
    if fraListaFiliaisDestino<>'' then
      qryRomaneios.MacroByName('ListaFiliaisDestino').asString :=
       ' and df.cliente in ( '+fraListaFiliaisDestino+') '+
       ' and df.tipocliente=''L''';

    qryRomaneios.MacroByName('SelecaoAleatoriaCliente').asString := '';
    if fraSelecaoAleatoriaCliente<>'' then
      qryRomaneios.MacroByName('SelecaoAleatoriaCliente').asString :=
       ' and ('+fraSelecaoAleatoriaCliente+' ) ';


    qryRomaneios.MacroByName('SelecaoAleatoriaFornecedores').asString := '';

    if fraSelecaoAleatoriaFornecedores<>'' then
    begin
      qryRomaneios.MacroByName('SelecaoAleatoriaFornecedores').asString :=
        ' and ('+trocar(fraSelecaoAleatoriaFornecedores,'vf.','f.')+' ) ';
    end;

    qryRomaneios.close;
    qryRomaneios.open;

  finally
    qryRomaneios.AfterScroll := qryRomaneiosAfterScroll;
    qryRomaneiosAfterScroll(qryRomaneios);
  end;

end;

procedure TdtmConsultaRomaneios.qryRomaneiosAfterScroll(DataSet: TDataSet);
begin
  inherited;
  RefazConsultaPorNome(qryRomaneiosNotas, ['numero'], [qryRomaneiosnumero.asInteger]);
end;

end.
