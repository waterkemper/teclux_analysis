unit dmexportacaovendasreducoes;

interface

uses
  SysUtils, Classes, dmbasico, DB, ZQuery, ZPgSqlQuery, cpquery, ZTransact;

type
  TdtmExportacaoVendasReducoes = class(TdtmBasico)
    qryVendas: TtecQuery;
    qryReducoes: TtecQuery;
    qryReducoescrz: TIntegerField;
    qryReducoestotalizadorgeral: TFloatField;
    qryReducoesvendabrutadiaria: TFloatField;
    qryReducoesvendaliquida: TFloatField;
    qryReducoesdescontos: TFloatField;
    qryReducoesacrescimos: TFloatField;
    qryReducoescancelamentos: TLargeintField;
    qryVendascodigo_cupom: TMemoField;
    qryVendascodigo_item: TMemoField;
    qryVendasquantidade: TMemoField;
    qryVendaspreco_unitario: TMemoField;
    qryVendascusto: TMemoField;
    qryVendassubtotal: TMemoField;
    qryVendasnum_item: TMemoField;
    qryVendasdescricao_item: TMemoField;
    qryVendasicms: TMemoField;
    qryVendasunidade: TMemoField;
  private
    { Private declarations }
  public
    function GerarArquivoVendas(PeriodoInicial, PeriodoFinal, Saida: String): Boolean;
    function GerarArquivoReducoes(PeriodoInicial, PeriodoFinal, Saida: String): Boolean;
    { Public declarations }
  end;

var
  dtmExportacaoVendasReducoes: TdtmExportacaoVendasReducoes;

implementation

uses
  biblio;
{$R *.dfm}

{ TdtmExportarVendasReducoes }

function TdtmExportacaoVendasReducoes.GerarArquivoReducoes(PeriodoInicial,
  PeriodoFinal, Saida: String): Boolean;
var
  Arquivo: TextFile;
begin
  qryReducoes.Close;
  qryReducoes.ParamByName('filialbase').AsInteger := FilialBase;
  qryReducoes.MacroByName('DATA').AsString := MontarIntervaloData('rz.datamovimento', PeriodoInicial,PeriodoFinal);
  qryReducoes.Open;
  Result := not qryReducoes.IsEmpty;

  if Result then
  begin
    if FileExists(Saida) then
      DeleteFile(Saida);

    AssignFile(Arquivo, Saida);
    try
      Rewrite(Arquivo);
      qryReducoes.First;
      while not qryReducoes.Eof do
      begin                      // DESCONTOS; ACRESCIMOS; CANCELAMENTOS;
        Writeln(Arquivo, qryReducoescrz.AsString              + ';' +                   //NUMERO REDUCAO
                         qryReducoestotalizadorgeral.AsString + ';' +                   //GRANDE TOTAL
                         qryReducoesvendabrutadiaria.AsString + ';' +                   //VENDA BRUTA
                         qryReducoesvendaliquida.AsString     + ';' +                   //VENDA LIQUIDA
                         qryReducoesdescontos.AsString        + ';' +                   //DESCONTOS
                         qryReducoesacrescimos.AsString       + ';' +                   //ACRESCIMOS
                         qryReducoescancelamentos.AsString    + ';');                   //CANCELAMENTOS
        qryReducoes.Next;
      end;
    finally
      CloseFile(Arquivo);
      qryReducoes.Close;
    end;
  end;
end;

function TdtmExportacaoVendasReducoes.GerarArquivoVendas(PeriodoInicial,
  PeriodoFinal, Saida: String): Boolean;
var
  Arquivo: TextFile;
begin
  qryVendas.Close;
  qryVendas.ParamByName('filialbase').AsInteger := FilialBase;
  qryVendas.MacroByName('DATA').AsString := MontarIntervaloData('det.dt_ini', PeriodoInicial,PeriodoFinal,true);
  qryVendas.Open;
  Result := not qryVendas.IsEmpty;

  if Result then
  begin
    if FileExists(Saida) then
      DeleteFile(Saida);

    AssignFile(Arquivo, Saida);
    try
      Rewrite(Arquivo);
      qryVendas.First;
      while not qryVendas.Eof do
      begin
        Writeln(Arquivo, qryVendascodigo_cupom.AsString+                        //FILIAL;
                         qryVendascodigo_item.AsString+                         //NUMERO COO
                         qryVendasquantidade.AsString+
                         qryVendaspreco_unitario.AsString+
                         qryVendascusto.AsString+
                         qryVendassubtotal.AsString+
                         qryVendasnum_item.AsString+
                         qryVendasdescricao_item.AsString+
                         qryVendasicms.AsString+
                         qryVendasunidade.AsString);                        //CANCELADO (s/n)
        qryVendas.Next;
      end;
    finally
      CloseFile(Arquivo);
      qryVendas.Close;
    end;
  end;  
end;

end.
