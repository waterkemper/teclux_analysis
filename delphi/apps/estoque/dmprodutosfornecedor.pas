unit dmprodutosfornecedor;

interface

uses
  //CLX
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  Math, DB, CheckLst,
  //Terceiros
  ZQuery, ZPgSqlQuery,
  //Biblio
  ctconstantes, biblio, clusuario, clparametrossistema,
  //Componentes
  cpquery, cpdatasource,
  //Repositorio
  fmpreviewpadrao, dmtecsoft, dmbasico, cptable, FR_DSet, FR_DBSet, FR_Class,
  ZTransact;

type
  TdtmProdutosFornecedor = class(TdtmBasico)
    qryProdutos_Fornecedor: TtecQuery;
    dsrProdutos_Fornecedor: TtecDataSource;
    qryProcuraProdutosInicial: TtecQuery;
    dsrProcuraProdutosInicial: TtecDataSource;
    qryConsultaProdutos: TtecQuery;
    qryGrupos: TtecQuery;
    qryGruposcodigo: TStringField;
    qryGruposdescricao: TStringField;
    qryClasses: TtecQuery;
    qryClassesdescricao: TStringField;
    qryClassescodigo: TStringField;
    qryMarcas: TtecQuery;
    qryMarcasdescricao: TStringField;
    qryMarcascodigo: TIntegerField;
    qryProcuraFornecedoresInicial: TtecQuery;
    dsrProcuraFornecedoresInicial: TtecDataSource;
    qryConsultaFornecedores: TtecQuery;
    qryConsultaFornecedoresnome: TStringField;
    qryConsultaFornecedorescodigo: TIntegerField;
    qryProcuraFornecedoresInicialcodigo: TIntegerField;
    qryProcuraFornecedoresInicialnome: TStringField;
    qryProcuraProdutosFinal: TtecQuery;
    dsrProcuraProdutosFinal: TtecDataSource;
    qryProcuraProdutosInicialcodigo: TLargeintField;
    qryProcuraProdutosInicialdescricao: TStringField;
    qryProcuraProdutosFinalcodigo: TLargeintField;
    qryProcuraProdutosFinaldescricao: TStringField;
    qryConsultaProdutoscodigo: TLargeintField;
    qryConsultaProdutosdescricao: TStringField;
    qryProcuraFornecedoresFinal: TtecQuery;
    dsrProcuraFornecedoresFinal: TtecDataSource;
    qryProcuraFornecedoresFinalcodigo: TIntegerField;
    qryProcuraFornecedoresFinalnome: TStringField;
    qryProdutos_Fornecedorcodigo: TLargeintField;
    qryProdutos_Fornecedordescricao: TStringField;
    qryProdutos_Fornecedorgrupo: TStringField;
    qryProdutos_Fornecedorclasse: TStringField;
    qryProdutos_Fornecedorfornecedor: TIntegerField;
    qryProdutos_Fornecedordata: TDateField;
    qryProdutos_Fornecedorpreco: TFloatField;
    qryProdutos_Fornecedornome: TStringField;
    qryProdutos_Fornecedormarca: TIntegerField;
    qryProdutos_Fornecedordescricaomarca: TStringField;
    qryProdutos_Fornecedordescricaogrupo: TStringField;
    qryProdutos_Fornecedordescricaoclasse: TStringField;
    qryConsultaProdutosreferencia: TStringField;
    qryProdutos_Fornecedoripi: TFloatField;
    qryProdutos_Fornecedorprecocomicms: TFloatField;
    qryProdutos_Fornecedorprecoultimaentrada: TFloatField;
    qryProdutos_Fornecedorprecoipiultimaentrada: TFloatField;
    qryProdutos_Fornecedoripiultimaentrada: TFloatField;
    qryProdutos_Fornecedordataultimaentrada: TDateTimeField;
    qryProdutos_Fornecedorobservacao: TStringField;
    frpProdutos_Fornecedor: TfrReport;
    fdsProdutos_Fornecedor: TfrDBDataSet;
    qryProdutos_Fornecedorcodigovisual: TStringField;
    procedure frpProdutos_FornecedorBeforePrint(Memo: TStringList;
      View: TfrView);
  private
    FSelecaoProduto: Integer;
    FSelecaoFornecedor: Integer;
    FFornecedorInicial: string;
    FProdutoFinal: String;
    FProdutoInicial: String;
    FFornecedorFinal: String;
    function  GetListaGrupos: TLista;
    function  GetListaClasses: TLista;
    procedure SetOrdenacao(const Value: Integer);
    procedure SetProdutoFinal(const Value: string);
    procedure SetProdutoInicial(const Value: string);
    procedure SetFornecedorFinal(const Value: String);
    procedure SetFornecedorInicial(const Value: string);
    procedure SetCidade(const Value: String);
    procedure SetEstado(const Value: String);
  protected
    procedure FiltroProduto;
    procedure FiltroFornecedor;
    function GetConsultarCaracteristicas: TtecQuery;
    function GetConsultarFornecedores: TtecQuery;
    function GetNumeroRegistro: Integer;
    function GetListaMarcas: TLista;
  public
    procedure AbreTabelaPesquisa(TipoPesquisa: TtecRelatorioProdutosFornecedor);
    constructor Create(AOwner: TComponent); override;
    function  ExisteProdutos(campo, codigo: String): Boolean;
    function  ExisteFornecedores(campo, codigo: String): Boolean;
    procedure FechaTabelaPesquisa(TipoPesquisa: TtecRelatorioProdutosFornecedor);
    procedure LimpaTabelas;
    procedure MontarFiltroMarcas(Marca: TCheckListBox);
    procedure MontarFiltroGrupos(Grupo: TCheckListBox);
    procedure MontarFiltroClasses(Classe: TCheckListBox);
    procedure Selecionar(TipoPesquisa: TtecRelatorioProdutosFornecedor);
    procedure GerarRelatorio;
    procedure Imprimir;

    property ConsultarCaracteristicas: TtecQuery read GetConsultarCaracteristicas;
    property ConsultarFornecedores: TtecQuery read GetConsultarFornecedores;
    property NumeroRegistro: Integer read GetNumeroRegistro;
    property ProdutoInicial: String read FProdutoInicial write SetProdutoInicial;
    property ProdutoFinal: String read FProdutoFinal write SetProdutoFinal;
    property SelecaoProduto: Integer read FSelecaoProduto write FSelecaoProduto;
    property FornecedorInicial: string read FFornecedorInicial write SetFornecedorInicial;
    property FornecedorFinal: String read FFornecedorFinal write SetFornecedorFinal;
    property SelecaoFornecedor: Integer read FSelecaoFornecedor write FSelecaoFornecedor;
    property Cidade: String write SetCidade;
    property Estado: String write SetEstado;
    property Ordenacao: Integer write SetOrdenacao;
    property ListaMarcas: TLista read GetListaMarcas;
    property ListaGrupos: TLista read GetListaGrupos;
    property ListaClasses: TLista read GetListaClasses;
  end;

  Const
    WhereBase = 39;
    WhereProduto     = WhereBase + 1;
    WhereFornecedor  = WhereBase + 2;
    WhereMarca       = WhereBase + 3;
    WhereGrupo       = WhereBase + 4;
    WhereClasse      = WhereBase + 5;
    WhereCidade      = WhereBase + 6;
    WhereEstado      = WhereBase + 7;
    WhereOrdem       = WhereBase + 14;
var
  //dtmManutencaoPreco: TdtmManutencaoPreco;
    FListaMarcas  : TLista;
    FListaGrupos  : TLista;
    FListaClasses : TLista;


implementation

{$R *.dfm}

procedure TdtmProdutosFornecedor.AbreTabelaPesquisa(TipoPesquisa: TtecRelatorioProdutosFornecedor);
begin
  case TipoPesquisa of
      rpfPRODUTOINICIAL,
        rpfPRODUTOFINAL: begin
                           qryConsultaProdutos.Sql[04]:= 'Where(p.codigo = 0)';
                           qryConsultaProdutos.Open;
                         end;
   rpfFORNECEDORINICIAL,
     rpfFORNECEDORFINAL: Abre(ctConsultaFornecedores);
  end;
end;

constructor TdtmProdutosFornecedor.Create(AOwner: TComponent);
begin
  inherited;
  qryProcuraProdutosInicial.Tag     := ctTabelas;
  qryProcuraProdutosFinal.Tag       := ctTabelas;
  qryProcuraFornecedoresInicial.Tag := ctTabelas;
  qryProcuraFornecedoresFinal.Tag   := ctTabelas;

  qryConsultaProdutos.Tag           := ctPesquisaCaracteristica;
  qryConsultaFornecedores.Tag       := ctConsultaFornecedores;
end;

function TdtmProdutosFornecedor.ExisteProdutos(campo, codigo: String): boolean;
const
  SQL = 'where (to_ascii(p.%s,''latin1'') ilike to_ascii(''%s%s'',''latin1''))';
begin
  qryConsultaProdutos.Sql[04]:= Format(SQL, [Campo, Codigo, '%']);
  qryConsultaProdutos.Open;
  Result := (qryConsultaProdutos.RecordCount > 0);
end;

function TdtmProdutosFornecedor.ExisteFornecedores(campo, codigo: String): Boolean;
begin
  Result := ExisteCodigo(qryConsultaFornecedores, campo, codigo);
end;

procedure TdtmProdutosFornecedor.FechaTabelaPesquisa(TipoPesquisa: TtecRelatorioProdutosFornecedor);
begin
  case TipoPesquisa of
     rpfPRODUTOINICIAL,
        rpfPRODUTOFINAL: Fecha(ctPesquisaCaracteristica);
  rpfFORNECEDORINICIAL,
     rpfFORNECEDORFINAL: Fecha(ctConsultaFornecedores);
  end;
end;

function TdtmProdutosFornecedor.GetConsultarCaracteristicas: TtecQuery;
begin
  Result := qryConsultaProdutos;
end;

function TdtmProdutosFornecedor.GetConsultarFornecedores: TtecQuery;
begin
  Result:= qryConsultaFornecedores;
end;

function TdtmProdutosFornecedor.GetNumeroRegistro: Integer;
begin
  Result:= qryProdutos_Fornecedor.RecordCount;
end;

procedure TdtmProdutosFornecedor.LimpaTabelas;
begin
  if not qryProcuraProdutosInicial.IsEmpty then
    ReFazConsulta(qryProcuraProdutosInicial,[0],[0]);
  if not qryProcuraProdutosFinal.IsEmpty then
    ReFazConsulta(qryProcuraProdutosFinal,[0],[0]);
  if not qryProcuraFornecedoresInicial.IsEmpty then
    RefazConsulta(qryProcuraFornecedoresInicial, [0],[0]);
  if not qryProcuraFornecedoresFinal.IsEmpty then
    RefazConsulta(qryProcuraFornecedoresFinal, [0],[0]);
  if not qryProdutos_Fornecedor.IsEmpty then
    Fecha(ctManutencaoPreco);
end;

procedure TdtmProdutosFornecedor.Selecionar(TipoPesquisa: TtecRelatorioProdutosFornecedor);
begin
  case TipoPesquisa of
     rpfPRODUTOINICIAL : ReFazConsulta(qryProcuraProdutosInicial,[0],[qryConsultaProdutoscodigo.AsString]);
       rpfPRODUTOFINAL : ReFazConsulta(qryProcuraProdutosFinal,  [0],[qryConsultaProdutoscodigo.AsString]);
  rpfFORNECEDORINICIAL : ReFazConsulta(qryProcuraFornecedoresInicial,[0],[qryConsultaFornecedorescodigo.AsInteger]);
    rpfFORNECEDORFINAL : ReFazConsulta(qryProcuraFornecedoresFinal,  [0],[qryConsultaFornecedorescodigo.AsInteger]);
  end;
end;

function TdtmProdutosFornecedor.GetListaMarcas: TLista;
var
  Ind: Integer;
begin
  FillChar(FListaMarcas,SizeOf(FListaMarcas),0);
  qryMarcas.Open;
  SetLength(FListaMarcas, qryMarcas.RecordCount);
  Ind:= 0;
  while not qryMarcas.Eof do begin
    FListaMarcas[Ind].codigo   := qryMarcascodigo.AsString;
    FListaMarcas[Ind].descricao:= qryMarcasdescricao.AsString;
    Inc(Ind);
    qryMarcas.Next;
  end;
  qryMarcas.Close;
  Result := FListaMarcas;
end;

function TdtmProdutosFornecedor.GetListaGrupos: TLista;
Var
  Ind: Integer;
begin
  FillChar(FListaGrupos,SizeOf(FListaGrupos),0);
  qryGrupos.Open;
  SetLength(FListaGrupos, qryGrupos.RecordCount);
  Ind:= 0;
  while not qryGrupos.Eof do begin
    FListaGrupos[Ind].codigo   := qryGruposcodigo.AsString;
    FListaGrupos[Ind].descricao:= qryGruposdescricao.AsString;
    Inc(Ind);
    qryGrupos.Next;
  end;
  qryGrupos.Close;
  Result := FListaGrupos;
end;

function TdtmProdutosFornecedor.GetListaClasses: TLista;
Var
  Ind: Integer;
begin
  FillChar(FListaClasses,SizeOf(FListaClasses),0);
  qryClasses.Open;
  SetLength(FListaClasses, qryClasses.RecordCount);
  Ind:= 0;
  while not qryClasses.Eof do begin
    FListaClasses[Ind].codigo   := qryClassescodigo.AsString;
    FListaClasses[Ind].descricao:= qryClassesdescricao.AsString;
    Inc(Ind);
    qryClasses.Next;
  end;
  qryClasses.Close;
  Result := FListaClasses;
end;

procedure TdtmProdutosFornecedor.MontarFiltroMarcas(Marca: TCheckListBox);
var
  STRMarcas: String;
  Ind: Integer;
begin
  STRMarcas := '';
  for Ind:= 0 to (Length(FListaMarcas) - 1) do
    if Marca.Checked[Ind] then
      STRMarcas := STRMarcas + FListaMarcas[Ind].codigo + ',';
  STRMarcas := Copy(STRMarcas, 0, Length(STRMarcas) - 1);
  if STRMarcas <> '' then
       qryProdutos_Fornecedor.Sql[WhereMarca]:= 'and (c.marca in (' + STRMarcas + '))'
  else qryProdutos_Fornecedor.Sql[WhereMarca]:= '';
end;

procedure TdtmProdutosFornecedor.MontarFiltroClasses(Classe: TCheckListBox);
var
  STRClasses: String;
  Ind: Integer;
begin
  STRClasses := '';
  for Ind:= 0 to (Length(FListaClasses) - 1) do
    if Classe.Checked[Ind] then
      STRClasses := STRClasses + QuotedStr(FListaClasses[Ind].codigo) + ',';
  STRClasses := Copy(STRClasses, 0, Length(STRClasses) - 1);
  if STRClasses <> '' then
       qryProdutos_Fornecedor.Sql[WhereClasse]:= 'and (c.classe in (' + STRClasses + '))'
  else qryProdutos_Fornecedor.Sql[WhereClasse]:= '';
end;

procedure TdtmProdutosFornecedor.MontarFiltroGrupos(Grupo: TCheckListBox);
var
  STRGrupos: String;
  Ind: Integer;
begin
  STRGrupos := '';
  for Ind:= 0 to (Length(FListaGrupos) - 1) do
    if Grupo.Checked[Ind] then
      STRGrupos := STRGrupos + QuotedStr(FListaGrupos[Ind].codigo) + ',';
  STRGrupos := Copy(STRGrupos, 0, Length(STRGrupos) - 1);
  if STRGrupos <> '' then
       qryProdutos_Fornecedor.Sql[WhereGrupo]:= 'and (c.grupo in (' + STRGrupos + '))'
  else qryProdutos_Fornecedor.Sql[WhereGrupo]:= '';
end;

procedure TdtmProdutosFornecedor.SetOrdenacao(const Value: Integer);
begin
  case Value of
    0: qryProdutos_Fornecedor.Sql[WhereOrdem]:= 'Order By p.codigovisual';
    1: qryProdutos_Fornecedor.Sql[WhereOrdem]:= 'Order By UPPER(TO_ASCII(p.Descricao,''LATIN1''))';
    2: qryProdutos_Fornecedor.Sql[WhereOrdem]:= 'Order By UPPER(TO_ASCII(f.nome,''LATIN1'')), p.codigovisual, UPPER(TO_ASCII(p.Descricao,''LATIN1''))';
    3: qryProdutos_Fornecedor.Sql[WhereOrdem]:= 'Order By UPPER(TO_ASCII(m.Descricao,''LATIN1'')), p.codigovisual, UPPER(TO_ASCII(p.Descricao,''LATIN1''))';
    4: qryProdutos_Fornecedor.Sql[WhereOrdem]:= 'Order By UPPER(TO_ASCII(g.Descricao,''LATIN1'')), p.codigovisual, UPPER(TO_ASCII(p.Descricao,''LATIN1''))';
    5: qryProdutos_Fornecedor.Sql[WhereOrdem]:= 'Order By UPPER(TO_ASCII(cl.Descricao,''LATIN1'')), p.codigovisual, UPPER(TO_ASCII(p.Descricao,''LATIN1''))';
  end;
end;

procedure TdtmProdutosFornecedor.SetProdutoFinal(const Value: string);
begin
  FProdutoFinal:= Value;
  FiltroProduto;
end;

procedure TdtmProdutosFornecedor.SetProdutoInicial(const Value: string);
begin
  FProdutoInicial:= Value;
  FiltroProduto;
end;

procedure TdtmProdutosFornecedor.SetFornecedorFinal(const Value: String);
begin
  FFornecedorFinal:= Value;
  FiltroFornecedor;
end;

procedure TdtmProdutosFornecedor.SetFornecedorInicial(const Value: string);
begin
  FFornecedorInicial:= Value;
  FiltroFornecedor;
end;

procedure TdtmProdutosFornecedor.SetCidade(const Value: String);
begin
  if Value <> '' then
       qryProdutos_Fornecedor.Sql[WhereCidade]:= 'and ((Select count(*) From fornecedores f' +
                                                 '      Where (f.codigo = fp.fornecedor) ' +
                                                 '        and (f.cidade in (Select c.codigo ' +
                                                 '                          From cidades c ' +
                                                 '                          Where (to_ascii(c.nome,''latin1'') ILIKE to_ascii(' + QuotedStr('%'+Value+'%') + ',''latin1''))))) > 0)'
  else qryProdutos_Fornecedor.Sql[WhereCidade]:= '';
end;

procedure TdtmProdutosFornecedor.SetEstado(const Value: String);
begin
  if Value <> '' then
       qryProdutos_Fornecedor.Sql[WhereEstado]:= 'and ((Select count(*) From fornecedores f ' +
                                                 '      Where (f.codigo = fp.fornecedor) ' +
                                                 '        and (to_ascii(f.estado,''latin1'') ILIKE to_ascii(' + QuotedStr('%'+Value+'%') + ',''latin1''))) > 0)'
  else qryProdutos_Fornecedor.Sql[WhereEstado]:= '';
end;

procedure TdtmProdutosFornecedor.FiltroFornecedor;
begin
  case FSelecaoProduto of
    0: begin
         if FFornecedorInicial <> '' then begin
           if FFornecedorFinal = '' then
                qryProdutos_Fornecedor.Sql[WhereFornecedor]:= 'and (fp.fornecedor = ' + FFornecedorInicial + ')'
           else qryProdutos_Fornecedor.Sql[WhereFornecedor]:= 'and (fp.fornecedor between ' + FFornecedorInicial + ' and ' + FFornecedorFinal+ ')'
         end
         else begin
           if FFornecedorFinal <> '' then
                qryProdutos_Fornecedor.Sql[WhereFornecedor]:= 'and (fp.fornecedor = ' + FFornecedorFinal + ')'
           else qryProdutos_Fornecedor.Sql[WhereFornecedor]:= '';
         end;
       end;
    1: begin
         if FFornecedorInicial <> '' then begin
           if FFornecedorFinal = '' then
                qryProdutos_Fornecedor.Sql[WhereFornecedor]:= 'and (f.nome = ' + QuotedStr(qryProcuraFornecedoresInicialnome.AsString) + ')'
           else qryProdutos_Fornecedor.Sql[WhereFornecedor]:= 'and (f.nome between ' + QuotedStr(qryProcuraFornecedoresInicialnome.AsString) +
                                               ' and ' + QuotedStr(qryProcuraFornecedoresFinalnome.AsString) + ')'
         end
         else begin
           if FFornecedorFinal <> '' then
                qryProdutos_Fornecedor.Sql[WhereFornecedor]:= 'and (f.nome = ' + QuotedStr(qryProcuraFornecedoresFinalnome.AsString) + ')'
           else qryProdutos_Fornecedor.Sql[WhereFornecedor]:= '';
         end;
       end;
  end;
end;

procedure TdtmProdutosFornecedor.FiltroProduto;
begin
  case FSelecaoProduto of
    0: begin
         if FProdutoInicial <> '' then begin
           if FProdutoFinal = '' then
                qryProdutos_Fornecedor.Sql[WhereProduto]:= 'Where (p.codigo = ' + FProdutoInicial + ')'
           else qryProdutos_Fornecedor.Sql[WhereProduto]:= 'Where (p.codigo between ' + FProdutoInicial + ' and ' + FProdutoFinal + ')'
         end
         else begin
           if FProdutoFinal <> '' then
                qryProdutos_Fornecedor.Sql[WhereProduto]:= 'Where (p.codigo = ' + FProdutoFinal + ')'
           else qryProdutos_Fornecedor.Sql[WhereProduto]:= 'Where (p.codigo > 0)';
         end;
       end;
    1: begin
         if FProdutoInicial <> '' then begin
           if FProdutoFinal = '' then
                qryProdutos_Fornecedor.Sql[WhereProduto]:= 'Where (p.descricao = ' + QuotedStr(qryProcuraProdutosInicialdescricao.AsString) + ')'
           else qryProdutos_Fornecedor.Sql[WhereProduto]:= 'Where (p.descricao between ' + QuotedStr(qryProcuraProdutosInicialdescricao.AsString) +
                                               ' and ' + QuotedStr(qryProcuraProdutosFinaldescricao.AsString) + ')'
         end
         else begin
           if FProdutoFinal <> '' then
                qryProdutos_Fornecedor.Sql[WhereProduto]:= 'Where (p.descricao = ' + QuotedStr(qryProcuraProdutosFinaldescricao.AsString) + ')'
           else qryProdutos_Fornecedor.Sql[WhereProduto]:= 'Where (p.codigo > 0)';
         end;
       end;
  end;
end;

procedure TdtmProdutosFornecedor.GerarRelatorio;
begin
  if qryProdutos_Fornecedor.Active then
    qryProdutos_Fornecedor.Close;
  qryProdutos_Fornecedor.Open  
end;

procedure TdtmProdutosFornecedor.Imprimir;
Var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
begin
  qryProdutos_Fornecedor.DisableControls;
  frVariables['Rua']   := RuaFilialBase;
  frVariables['Bairro']:= BairroFilialBase + ' - CEP: ' + CEPFilialBase;
  frVariables['Cidade']:= CidadeFilialBase + ' - ' + EstadoFilialBase;
  frVariables['Fone']  := FoneFilialBase;
//  frpProdutos_Fornecedor.DesignReport;
  frmPreview := TfrmPreviewPadrao.create(self);
  try
    Relatorio := frmPreview.frCompositeReport;
    frmPreview.frCompositeReport.Reports.Clear;
    frmPreview.frCompositeReport.Reports.Add(frpProdutos_Fornecedor);
    Relatorio.Preview := frmPreview.frPreviewPadrao;
    Relatorio.ShowReport;
    frmPreview.ShowModal;
  finally
    frmPreview.Free
  end;
  qryProdutos_Fornecedor.EnableControls; 
end;

procedure TdtmProdutosFornecedor.frpProdutos_FornecedorBeforePrint(Memo: TStringList; View: TfrView);
begin
  inherited;
  if (View.Name = 'fpvLogo') then
    if FileExists(LogotipoFilialBase) then
      try
        TfrPictureView(View).Picture.LoadFromFile(LogotipoFilialBase)
      except
      end;
end;

end.


