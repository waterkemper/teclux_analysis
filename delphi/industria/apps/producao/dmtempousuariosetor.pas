unit dmtempousuariosetor;

interface

uses
  SysUtils, Classes, dmbasico, DB, cpdatasource, ZQuery, ZPgSqlQuery,
  cpquery, dmtecsoft, biblio, ctconstantes, ExcelExport, ZTransact;

type
  Tdtmtempousuariosetor = class(TdtmBasico)
    qrytempousuariosetor: TtecQuery;
    dsrtempousuariosetor: TtecDataSource;
    ExcelExport1: TExcelExport;
    qrySetores: TtecQuery;
    qrySetoressetor: TStringField;
    procedure qrytempousuariosetorAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    function AbrirConsulta(DataInicial, DataFinal,
                           ListaSetoresProducao, ListaFuncionarios,
                           ListaSetoresProducao2, ListaFuncionarios2: String): boolean;
    procedure ExportarExcell;
  end;

var
  dtmtempousuariosetor: Tdtmtempousuariosetor;

implementation

{$R *.dfm}

{ Tdtmtempousuariosetor }

function Tdtmtempousuariosetor.AbrirConsulta(DataInicial, DataFinal,
  ListaSetoresProducao, ListaFuncionarios,
  ListaSetoresProducao2, ListaFuncionarios2: String): boolean;
var
 vLider : string;
 vMediaEficiencia : Currency;
 vMaiorValorPremio : Currency;
 vNumero: integer;
 vFinalArquivo : Boolean;
 vListaSetores : String;
 i : integer;

begin
  if (DataInicial<>'') and (DataFinal<>'') then
  begin
    qrytempousuariosetor.sql[NumerodalinhanoTexto(qrytempousuariosetor.sql, 'FiltroPeriodo_1')+1] := format('and oou.data between ''''%s'''' and ''''%s''''',
                                                                                                 [FormatDateTime('yyyy-mm-dd',StrToDateTime(datainicial)),
                                                                                                  FormatDateTime('yyyy-mm-dd',StrToDateTime(datafinal))]);

    qrytempousuariosetor.sql[NumerodalinhanoTexto(qrytempousuariosetor.sql, 'FiltroPeriodo_2')+1] := format('and oou.data between ''''%s'''' and ''''%s''''',
                                                                                                 [FormatDateTime('yyyy-mm-dd',StrToDateTime(datainicial)),
                                                                                                  FormatDateTime('yyyy-mm-dd',StrToDateTime(datafinal))]);

    qrytempousuariosetor.sql[NumerodalinhanoTexto(qrytempousuariosetor.sql, 'FiltroPeriodo_3')+1] := format('and oou.data between ''''%s'''' and ''''%s''''',
                                                                                                 [FormatDateTime('yyyy-mm-dd',StrToDateTime(datainicial)),
                                                                                                  FormatDateTime('yyyy-mm-dd',StrToDateTime(datafinal))]);


    qrySetores.macrobyname('FiltroPeriodo').asstring := format('and oou.data between ''%s'' and ''%s''',
                                                        [FormatDateTime('yyyy-mm-dd',StrToDateTime(datainicial)),
                                                         FormatDateTime('yyyy-mm-dd',StrToDateTime(datafinal))]);

  end
  else
  if (DataInicial<>'') and (DataFinal='') then
  begin
    qrytempousuariosetor.sql[NumerodalinhanoTexto(qrytempousuariosetor.sql, 'FiltroPeriodo_1')+1] := format('and oou.data >= ''''%s''''',
                                                                                                 [FormatDateTime('yyyy-mm-dd',StrToDateTime(datainicial))]);
    qrytempousuariosetor.sql[NumerodalinhanoTexto(qrytempousuariosetor.sql, 'FiltroPeriodo_2')+1] := format('and oou.data >= ''''%s''''',
                                                                                                 [FormatDateTime('yyyy-mm-dd',StrToDateTime(datainicial))]);
    qrytempousuariosetor.sql[NumerodalinhanoTexto(qrytempousuariosetor.sql, 'FiltroPeriodo_3')+1] := format('and oou.data >= ''''%s''''',
                                                                                                 [FormatDateTime('yyyy-mm-dd',StrToDateTime(datainicial))]);

    qrySetores.macrobyname('FiltroPeriodo').asstring := format('and oou.data >= ''%s''',
                                                        [FormatDateTime('yyyy-mm-dd',StrToDateTime(datainicial))]);
  end
  else
  if (DataInicial='') and (DataFinal<>'') then
  begin
    qrytempousuariosetor.sql[NumerodalinhanoTexto(qrytempousuariosetor.sql, 'FiltroPeriodo_1')+1] := format('and oou.data <= ''''%s''''',
                                                                                                 [FormatDateTime('yyyy-mm-dd',StrToDateTime(datafinal))]);
    qrytempousuariosetor.sql[NumerodalinhanoTexto(qrytempousuariosetor.sql, 'FiltroPeriodo_2')+1] := format('and oou.data <= ''''%s''''',
                                                                                                 [FormatDateTime('yyyy-mm-dd',StrToDateTime(datafinal))]);
    qrytempousuariosetor.sql[NumerodalinhanoTexto(qrytempousuariosetor.sql, 'FiltroPeriodo_3')+1] := format('and oou.data <= ''''%s''''',
                                                                                                 [FormatDateTime('yyyy-mm-dd',StrToDateTime(datafinal))]);

    qrySetores.macrobyname('FiltroPeriodo').asstring := format('and oou.data <= ''%s''',
                                                        [FormatDateTime('yyyy-mm-dd',StrToDateTime(datafinal))]);
  end
  else
  if (DataInicial='') and (DataFinal='') then
  begin
    qrytempousuariosetor.sql[NumerodalinhanoTexto(qrytempousuariosetor.sql, 'FiltroPeriodo_1')+1] := '';
    qrytempousuariosetor.sql[NumerodalinhanoTexto(qrytempousuariosetor.sql, 'FiltroPeriodo_2')+1] := '';
    qrySetores.macrobyname('FiltroPeriodo').asstring := '';
  end;

  if ListaSetoresProducao <> '' then
  begin
    qrytempousuariosetor.sql[NumerodalinhanoTexto(qrytempousuariosetor.sql, 'FiltroSetoresProducao_1')+1] := 'and sp.codigo in ('+ListaSetoresProducao2+')';
    qrytempousuariosetor.sql[NumerodalinhanoTexto(qrytempousuariosetor.sql, 'FiltroSetoresProducao_2')+1] := 'and sp.codigo in ('+ListaSetoresProducao2+')';
    qrytempousuariosetor.sql[NumerodalinhanoTexto(qrytempousuariosetor.sql, 'FiltroSetoresProducao_3')+1] := 'and sp.codigo in ('+ListaSetoresProducao2+')';
    qrysetores.macrobyname('FiltroSetoresProducao').asstring := 'and sp.codigo in ('+ListaSetoresProducao+')';
  end
  else
  begin
    qrytempousuariosetor.sql[NumerodalinhanoTexto(qrytempousuariosetor.sql, 'FiltroSetoresProducao_1')+1] := '';
    qrytempousuariosetor.sql[NumerodalinhanoTexto(qrytempousuariosetor.sql, 'FiltroSetoresProducao_2')+1] := '';
    qrytempousuariosetor.sql[NumerodalinhanoTexto(qrytempousuariosetor.sql, 'FiltroSetoresProducao_3')+1] := '';
    qrysetores.macrobyname('FiltroSetoresProducao').asstring := '';
  end;

  if ListaFuncionarios <> '' then
  begin
    qrytempousuariosetor.sql[NumerodalinhanoTexto(qrytempousuariosetor.sql, 'FiltroFuncionarios_1')+1] := 'and oou.usuario in ('+ListaFuncionarios2+')';
    qrytempousuariosetor.sql[NumerodalinhanoTexto(qrytempousuariosetor.sql, 'FiltroFuncionarios_2')+1] := 'and oou.usuario in ('+ListaFuncionarios2+')';
    qrytempousuariosetor.sql[NumerodalinhanoTexto(qrytempousuariosetor.sql, 'FiltroFuncionarios_3')+1] := 'and oou.usuario in ('+ListaFuncionarios2+')';
    qrysetores.macrobyname('FiltroFuncionarios').asstring := 'and oou.usuario in ('+ListaFuncionarios+')';
  end
  else
  begin
    qrytempousuariosetor.sql[NumerodalinhanoTexto(qrytempousuariosetor.sql, 'FiltroFuncionarios_1')+1] := '';
    qrytempousuariosetor.sql[NumerodalinhanoTexto(qrytempousuariosetor.sql, 'FiltroFuncionarios_2')+1] := '';
    qrytempousuariosetor.sql[NumerodalinhanoTexto(qrytempousuariosetor.sql, 'FiltroFuncionarios_3')+1] := '';    
    qrysetores.macrobyname('FiltroFuncionarios').asstring := '';
  end;

  qrysetores.close;
  qrysetores.open;
  qrysetores.first;
  while not qrysetores.eof do
  begin
    vListaSetores := vListaSetores + uppercase(qrySetoressetor.asstring) + ' varchar(6), ';
    qrysetores.next;
  end;

  if vListaSetores <> '' then
   delete(vLIstasetores,length(vListaSetores)-1,1);

  qrytempousuariosetor.macrobyname('Setores').asstring := vListaSetores;

  qrytempousuariosetor.Close;
  qrytempousuariosetor.Open;

  for i := 0 to qrytempousuariosetor.fieldcount-1 do
    qrytempousuariosetor.fields[i].DisplayLabel := uppercase(qrytempousuariosetor.fields[i].fieldname);

  qrytempousuariosetor.FieldByName('usuario').DisplayLabel := 'USUÁRIO';
  qrytempousuariosetor.FieldByName('nomeusuario').DisplayLabel := 'NOME';

  if qrytempousuariosetor.IsEmpty then
  begin
    result := false;
    MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO,['Registro']));
  end
  else
    result := true
end;

procedure Tdtmtempousuariosetor.ExportarExcell;
begin
  GuardarRegistroAtual(qrytempousuariosetor,true);
  ExcelExport1.ExportDataset;
  VoltarRegistroAtual(qrytempousuariosetor);
end;

procedure Tdtmtempousuariosetor.qrytempousuariosetorAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  if qrytempousuariosetor.FindField('descricao')<>nil then
     qrytempousuariosetor.Fieldbyname('descricao').DisplayWidth := 100

end;

end.
