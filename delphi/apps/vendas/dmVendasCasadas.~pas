unit dmVendasCasadas;

interface

uses
  SysUtils, Classes, dmbasico, DB, ZQuery, ZPgSqlQuery, cpquery,
  cpdatasource, dmTecsoft, biblio, ctconstantes, ZSqlTypes, variants;

type
  TdtmVendasCasadas = class(TdtmBasico)
    dsrProdutosVendasCasadas: TtecDataSource;
    qryProdutosVendasCasadas: TtecQuery;
    qryProdutosVendasCasadascodigo_p1: TLargeintField;
    qryProdutosVendasCasadasdescricao_p1: TStringField;
    qryProdutosVendasCasadascodigo_p2: TLargeintField;
    qryProdutosVendasCasadasdescricao_p2: TStringField;
    qryProdutosVendasCasadascodigovisual_p1: TStringField;
    qryProdutosVendasCasadascodigovisual_p2: TStringField;
    qryProdutosVendasCasadasocorrencias: TLargeintField;
    qryProdutosVendasCasadasmarcar: TBooleanField;
    qryProdutosVendasCasadasgrupo_p1: TStringField;
    qryProdutosVendasCasadasclasse_p1: TStringField;
    qryProdutosVendasCasadasmarca_p1: TIntegerField;
    qryProdutosVendasCasadasgrupo_p2: TStringField;
    qryProdutosVendasCasadasclasse_p2: TStringField;
    qryProdutosVendasCasadasmarca_p2: TIntegerField;
    qryProdutosVendasCasadaspreco_p1: TFloatField;
    qryProdutosVendasCasadaspreco_p2: TFloatField;
    qryProdutosVendasCasadastotalestoque_p1: TFloatField;
    qryProdutosVendasCasadastotalestoque_p2: TFloatField;
    qryProdutosVendasCasadasquantidade_p1: TFloatField;
    qryProdutosVendasCasadasquantidade_p2: TFloatField;
    qryProdutosVendasCasadasmarcaroriginal: TBooleanField;
    qrycross_selling: TtecQuery;
    qryProdutosVendasCasadascaracteristica_p1: TLargeintField;
    qryProdutosVendasCasadascaracteristica_p2: TLargeintField;
    qrycross_sellingcaracteristica: TLargeintField;
    qrycross_sellingcaracteristica_cross: TLargeintField;
    qrycross_selling_repository: TtecQuery;
    qryGruposCasados: TtecQuery;
    dsrGruposCasados: TtecDataSource;
    qryGruposCasadosgrupo_p1: TStringField;
    qryGruposCasadosdescricaogrupo_p1: TStringField;
    qryGruposCasadosclasse_p1: TStringField;
    qryGruposCasadosmarca_p1: TIntegerField;
    qryGruposCasadosgrupo_p2: TStringField;
    qryGruposCasadosdescricaogrupo_p2: TStringField;
    qryGruposCasadosclasse_p2: TStringField;
    qryGruposCasadosmarca_p2: TIntegerField;
    qryGruposCasadosmarcar: TBooleanField;
    qrycrossgrupo_selling: TtecQuery;
    qrycrossgrupo_selling_repository: TtecQuery;
    qrycrossgrupo_sellinggrupo: TStringField;
    qrycrossgrupo_sellinggrupo_cross: TStringField;
    qryGruposCasadosocorrencias: TLargeintField;
    procedure dsrProdutosVendasCasadasDataChange(Sender: TObject;
      Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); Override;
    Function AbrirConsulta(
          DataInicial, DataFinal,
          ListaCondicaoItemdeproduto,
          ListaCondicaoProduto,
          ListaCondicaoGrupo,
          ListaCondicaoClasse,
          ListaCondicaoMarca,
          ListaCondicaoPromocoes: String;
          QtCasadosporProduto: integer): Boolean;

    procedure GravarProdutosVendasCasadas;
    procedure GravarGruposVendasCasadas;

  end;

var
  dtmVendasCasadas: TdtmVendasCasadas;

implementation

{$R *.dfm}

{ TdtmVendasCasadas }

function TdtmVendasCasadas.AbrirConsulta(
  DataInicial, DataFinal,
  ListaCondicaoItemdeproduto,
  ListaCondicaoProduto, ListaCondicaoGrupo, ListaCondicaoClasse,
  ListaCondicaoMarca, ListaCondicaoPromocoes: String;
  QtCasadosporProduto: integer): Boolean;
var
 i: integer;

begin

  result := true;

  qryProdutosVendasCasadas.parambyname('DataInicial').asDatetime := strtodate(datainicial);
  qryProdutosVendasCasadas.parambyname('DataFinal').asDatetime := strtodate(datafinal);
  qryProdutosVendasCasadas.parambyname('filialbase').asInteger := FilialBase;
  qryProdutosVendasCasadas.parambyname('QtCasadosporProduto').asInteger := QtCasadosporProduto;

  for i:=0 to qryProdutosVendasCasadas.Macros.count-1 do
    qryProdutosVendasCasadas.macros[i].Clear;

  if ListaCondicaoItemdeproduto<>'' then
  begin
    qryProdutosVendasCasadas.macrobyname('ListaCondicaoItemdeproduto').asString :=
      ' and (('+ trocar(ListaCondicaoItemdeproduto,'p.','p1.') + ') or ('+
                 trocar(ListaCondicaoItemdeproduto,'p.','p2.') +'))';
  end;

  if ListaCondicaoProduto<>'' then
  begin
    qryProdutosVendasCasadas.macrobyname('ListaCondicaoProduto').asString :=
      ' and (('+ trocar(ListaCondicaoProduto,'c.','c1.') + ') or ('+
                 trocar(ListaCondicaoProduto,'c.','c2.') +'))';
  end;

  if ListaCondicaoGrupo<>'' then
  begin
    qryProdutosVendasCasadas.macrobyname('ListaCondicaoGrupo').asString :=
      ' and (('+ trocar(ListaCondicaoGrupo,'g.','g1.') + ') or ('+
                 trocar(ListaCondicaoGrupo,'g.','g2.') +'))';
  end;


  if ListaCondicaoClasse<>'' then
  begin
    qryProdutosVendasCasadas.macrobyname('ListaCondicaoClasse').asString :=
      ' and (('+ trocar(ListaCondicaoMarca,'cl.','cl1.') + ') or ('+
                 trocar(ListaCondicaoMarca,'cl.','cl2.') +'))';
  end;

  if ListaCondicaoMarca<>'' then
  begin
    qryProdutosVendasCasadas.macrobyname('ListaCondicaoMarca').asString :=
      ' and (('+ trocar(ListaCondicaoMarca,'m.','m1.') + ') or ('+
                 trocar(ListaCondicaoMarca,'m.','m2.') +'))';
  end;

  if ListaCondicaoPromocoes<>'' then
  begin
    qryProdutosVendasCasadas.macrobyname('ListaCondicaoPromocoes').asString :=
      ' and (('+ trocar(ListaCondicaoPromocoes,'ga.','ga1.') + ') or ('+
                 trocar(ListaCondicaoPromocoes,'ga.','ga2.') +'))';
  end;

  qryGruposCasados.params := qryProdutosVendasCasadas.params;
  qryGruposCasados.macros := qryProdutosVendasCasadas.macros;


  qryProdutosVendasCasadas.close;
  qryProdutosVendasCasadas.open;

  qryGruposCasados.close;
  qryGruposCasados.open;

  if (qryProdutosVendasCasadas.recordcount <> 0) or
     (qryGruposCasados.recordcount <> 0) then
    result := true
  else
  begin
    result := false;
    MensagemAviso(format(ctNENHUMREGISTROENCONTRADO,['registro']));
  end;

end;

constructor TdtmVendasCasadas.Create(AOwner: TComponent);
begin
  inherited;
  qryProdutosVendasCasadas.tag := ctTabelas;
end;

procedure TdtmVendasCasadas.GravarProdutosVendasCasadas;
var
{ vLista : String;}
 vSLIsta_p1 : TStringList;
 vSLIsta_p2 : TStringList;
 vSLista_S  : TStringList;
 i: integer;

begin

{  vLista := '';}
  qrycross_selling.sql.text := qrycross_selling_repository.sql.text;

  vSLista_p1 := TStringList.create;
  vSLista_p2 := TStringList.create;
  vSLista_S := TStringList.create;

  qryProdutosVendasCasadas.GuardarRegistroAtual(false);
  qryProdutosVendasCasadas.ShowRecordTypes := [ztModified];
  qryProdutosVendasCasadas.first;
  while not qryProdutosVendasCasadas.eof do
  begin
    vSLista_p1.Append(qryProdutosVendasCasadascaracteristica_p1.asString);
    vSLista_p2.Append(qryProdutosVendasCasadascaracteristica_p2.asString);
    vSLista_S.Append(Booltostr(qryProdutosVendasCasadasmarcar.asBoolean, true ));

   {
    vLista := vLista + '('+qryProdutosVendasCasadascaracteristica_p1.asString + ',' +
                           qryProdutosVendasCasadascaracteristica_p2.asString + '), ';
     }



                           {
    if qryProdutosVendasCasadasmarcar.asboolean and
       not qryProdutosVendasCasadasmarcaroriginal.asboolean then
    begin

    end
    else
    if not qryProdutosVendasCasadasmarcar.asboolean and
       qryProdutosVendasCasadasmarcaroriginal.asboolean then
    begin

    end;
    }
    qryProdutosVendasCasadas.next;
  end;

  qryProdutosVendasCasadas.ShowRecordTypes := [ztModified, ztInserted, ztUnmodified];

  qrycross_selling.sql.append('(');
  if vSLista_p1.count <> 0 then
  begin
    for i:=0 to vSLista_p1.count-1 do
    begin
      if i = vSLista_p1.count-1 then
        qrycross_selling.sql.append('('+vSLista_p1[i] + ',' + vSLista_p2[i] +')')
      else
        qrycross_selling.sql.append('('+vSLista_p1[i] + ',' + vSLista_p2[i] +'),');
    end;
  end
  else
    qrycross_selling.sql.append('(0,0)');

  qrycross_selling.sql.append(')');

  qrycross_selling.close;
  qrycross_selling.open;

  if vSLista_p1.count <> 0 then
  begin

    for i:=0 to vSLista_p1.count-1 do
    begin

      if vSLista_S[i] = 'False' then
      begin
        if qrycross_selling.locate('caracteristica;caracteristica_cross',
           VarArrayOf([vSLista_p1[i], vSLista_p2[i]]), []) then
          qrycross_selling.delete
      end
      else
      if not qrycross_selling.locate('caracteristica;caracteristica_cross',
           VarArrayOf([vSLista_p1[i], vSLista_p2[i]]), []) then
      begin
        qrycross_selling.append;
        qrycross_sellingcaracteristica.asString := vSLista_p1[i];
        qrycross_sellingcaracteristica_cross.asString := vSLista_p2[i];
        qrycross_selling.post;
      end;
    end;

    perpetrar([qrycross_selling]);

  end;

  qryProdutosVendasCasadas.VoltarRegistro;

end;

procedure TdtmVendasCasadas.dsrProdutosVendasCasadasDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;

  if field = qryProdutosVendasCasadasmarcar then
  begin
    ;
  end;
end;

procedure TdtmVendasCasadas.GravarGruposVendasCasadas;
var
{ vLista : String;}
 vSLIsta_p1 : TStringList;
 vSLIsta_p2 : TStringList;
 vSLista_S  : TStringList;
 i: integer;

begin

{  vLista := '';}
  qryCrossGrupo_selling.sql.text := qryCrossGrupo_selling_repository.sql.text;

  vSLista_p1 := TStringList.create;
  vSLista_p2 := TStringList.create;
  vSLista_S := TStringList.create;

  qryGruposCasados.GuardarRegistroAtual(false);
  qryGruposCasados.ShowRecordTypes := [ztModified];
  qryGruposCasados.first;
  while not qryGruposCasados.eof do
  begin
    vSLista_p1.Append(qryGruposCasadosgrupo_p1.asString);
    vSLista_p2.Append(qryGruposCasadosgrupo_p2.asString);
    vSLista_S.Append(Booltostr(qryGruposCasadosmarcar.asBoolean, true ));

   {
    vLista := vLista + '('+qryGruposCasadoscaracteristica_p1.asString + ',' +
                           qryGruposCasadoscaracteristica_p2.asString + '), ';
     }



                           {
    if qryGruposCasadosmarcar.asboolean and
       not qryGruposCasadosmarcaroriginal.asboolean then
    begin

    end
    else
    if not qryGruposCasadosmarcar.asboolean and
       qryGruposCasadosmarcaroriginal.asboolean then
    begin

    end;
    }
    qryGruposCasados.next;
  end;

  qryGruposCasados.ShowRecordTypes := [ztModified, ztInserted, ztUnmodified];

  qryCrossGrupo_selling.sql.append('(');
  if vSLista_p1.count <> 0 then
  begin
    for i:=0 to vSLista_p1.count-1 do
    begin
      if i = vSLista_p1.count-1 then
        qryCrossGrupo_selling.sql.append('('+quotedstr(vSLista_p1[i]) + ',' +
                                             quotedstr(vSLista_p2[i]) +')')
      else
        qryCrossGrupo_selling.sql.append('('+quotedstr(vSLista_p1[i]) + ',' +
                                             quotedstr(vSLista_p2[i]) +'),');
    end;
  end
  else
    qryCrossGrupo_selling.sql.append('(''0'',''0'')');

  qryCrossGrupo_selling.sql.append(')');

  qryCrossGrupo_selling.close;
  qryCrossGrupo_selling.open;

  if vSLista_p1.count <> 0 then
  begin

    for i:=0 to vSLista_p1.count-1 do
    begin

      if vSLista_S[i] = 'False' then
      begin
        if qryCrossGrupo_selling.locate('grupo;grupo_cross',
           VarArrayOf([vSLista_p1[i], vSLista_p2[i]]), []) then
          qryCrossGrupo_selling.delete
      end
      else
      if not qryCrossGrupo_selling.locate('grupo;grupo_cross',
           VarArrayOf([vSLista_p1[i], vSLista_p2[i]]), []) then
      begin
        qryCrossGrupo_selling.append;
        qryCrossGrupo_sellinggrupo.asString := vSLista_p1[i];
        qryCrossGrupo_sellinggrupo_cross.asString := vSLista_p2[i];
        qryCrossGrupo_selling.post;
      end;
    end;

    perpetrar([qryCrossGrupo_selling]);

  end;

  qryGruposCasados.VoltarRegistro;

end;

end.
