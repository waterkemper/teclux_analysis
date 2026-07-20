unit dmplanocontas;

interface

uses
  SysUtils, Types, Windows, Classes, Variants, Controls, Forms, Dialogs, DB, {Qete,}
  fmpreviewpadrao,
  //Terceiros
  ZQuery, ZPgSqlQuery,
  //Componentes
  cpquery, cpdatasource,

  //Repositorio
  dmbasico, clparametrossistema, ZTransact, FR_DSet, FR_DBSet, FR_Class;

Const cmpcodigo        = 1;   PosicaoAtual = 0;
      cmpClassificacao = 2;   Primeiro     = 1;
      cmpDescricao     = 3;   Anterior     = 2;
      cmpDataInativo   = 4;   Proximo      = 3;
                              Ultimo       = 4;
type
  TdtmPlanoContas = class(TdtmBasico)
    dsrPlanoContas: TtecDataSource;
    qryConsultaPlanos: TtecQuery;
    qryConsultaPlanosDescricao: TStringField;
    qryConsultaPlanosCodigo: TIntegerField;
    qryConsultaPlanosClassificacao: TStringField;
    spcPlanosProximo: TtecQuery;
    spcPlanosProximoCodigo: TIntegerField;
    qryPlanoContas: TtecQuery;
    qryPlanoContascodigo: TIntegerField;
    qryPlanoContasclassificacao: TStringField;
    qryPlanoContastipo: TStringField;
    qryPlanoContasdescricao: TStringField;
    qryPlanoContasinativo: TDateField;
    dsrPlanoContasVinculado_Sinteticas: TtecDataSource;
    qryConsultaPlanostipo: TStringField;
    qryPlanoContasVinculado_Sinteticas: TtecQuery;
    qryPlanoContasVinculado_Sinteticasdescricao: TStringField;
    qryPlanoContasVinculado_Sinteticasclassificacao: TStringField;
    qryPlanoContasVinculado_Sinteticascodigo: TIntegerField;
    qryPlanoContasVinculado_Sinteticastipo: TStringField;
    frpPlano: TfrReport;
    fdsPlano: TfrDBDataSet;
    qryConsultaPlanosdescricaoedentada: TStringField;
    qryContaVinculada: TtecQuery;
    qryContaVinculadavinculadas: TLargeintField;
    qryExisteLancto: TtecQuery;
    frpPlanosFiliais: TfrReport;
    qryPlanosFiliais: TtecQuery;
    qryPlanos: TtecQuery;
    fdsPlanosFiliais: TfrDBDataSet;
    qryPlanosdescricaoedentada: TStringField;
    qryPlanosdescricao: TStringField;
    qryPlanosclassificacao: TStringField;
    qryPlanoscodigo: TIntegerField;
    qryPlanostipo: TStringField;
    qryPlanosFiliaisdescricaoedentada: TStringField;
    qryPlanosFiliaisclassificacao: TStringField;
    qryPlanosFiliaiscodigo: TIntegerField;
    qryPlanosFiliaistipo: TStringField;
    qryPlanosFiliaisfilial: TIntegerField;
    qryPlanosFiliaisrazao: TStringField;
    qryPlanosFiliaiscnpj: TStringField;
    qryPlanosFiliaisinscricaoestadual: TStringField;
    qryExisteLanctoexiste: TBooleanField;
    qryPlanosinativo: TDateField;
    qryPlanosFiliaisinativo: TDateField;
    qryPlanoContasVinculado_Sinteticasnsinteticasultima: TLargeintField;
    qryPlanoContasVinculado_Sinteticasnanaliticasultima: TLargeintField;
    qryPlanoContasreferencia: TIntegerField;
    qryPlanosclassificacaoreferencial: TStringField;
    qryPlanosdescricaoreferencial: TStringField;
    qryPlanosFiliaisclassificacaoreferencial: TStringField;
    qryPlanosFiliaisdescricaoreferencial: TStringField;
    qryParametros: TtecQuery;
    qryParametrosparametro: TIntegerField;
    qryParametrosfilial: TIntegerField;
    qryParametrosvalor: TStringField;
    qryApagarContaSaldosContabeis: TtecQuery;
    qryAtualizarNaturezas: TtecQuery;
    qryPlanoContasdataincalt: TDateField;
    qryPlanoContasnatureza: TStringField;
    qryPlanoContasVinculado_Sinteticasnatureza: TStringField;
    qryPlanoContasdemosped: TBooleanField;
    qryPlanoContasVinculado_SinteticasReferencial: TtecQuery;
    qryPlanoContasVinculado_SinteticasReferencialdescricao: TStringField;
    qryPlanoContasVinculado_SinteticasReferencialclassificacao: TStringField;
    qryPlanoContasVinculado_SinteticasReferencialcodigo: TIntegerField;
    qryPlanoContasVinculado_SinteticasReferencialtipo: TStringField;
    qryPlanoContasVinculado_SinteticasReferencialnsinteticasultima: TLargeintField;
    qryPlanoContasVinculado_SinteticasReferencialnanaliticasultima: TLargeintField;
    dsrPlanoContasVinculado_SinteticasReferencial: TtecDataSource;
    qryPlanoContasclassificacaoreferencial: TStringField;
    qryPlanoContastiporeferencial: TStringField;
    procedure qryPlanoContasAfterInsert(DataSet: TDataSet);
    procedure qryPlanoContasAfterOpen(DataSet: TDataSet);
    procedure qryPlanoContasAfterClose(DataSet: TDataSet);
    procedure frpPlanoBeforePrint(Memo: TStringList; View: TfrView);
    procedure dsrPlanoContasDataChange(Sender: TObject; Field: TField);
    procedure qryPlanoContasNewRecord(DataSet: TDataSet);
    procedure qryPlanoContasBeforeInsert(DataSet: TDataSet);
    procedure frpPlanosFiliaisBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure qryPlanoContasAfterCancel(DataSet: TDataSet);
    procedure qryPlanoContasAfterScroll(DataSet: TDataSet);
    procedure qryPlanoContasVinculado_SinteticasReferencialBeforeOpen(
      DataSet: TDataSet);
  private
    FVinculados: String;
    fultimaclassificacao: String;
    FPlanoContasVinculado_SinteticasAfterOpen: TNotifyEvent;
    fpenultimaclassificacao: String;
    FClassificacaoaVerificar: String;
    FSinteticaOriginal: String;
    fultimaclassificacaoreferencial: String;
    FVinculadosreferencial: String;
    fpenultimaclassificacaoreferencial: String;
    fAntepenultimaclassificacaoreferencial: String;
    { Private declarations }
  protected
    function  GetTabelaConsultarPlanoContas: TTecQuery;
    function  GetTabelaPlanoContas: TZDataSet;
    function ExisteContaVinculada: Boolean;
    function existeLancamento: Boolean;
  public
    NivelMascara: byte;
    NivelMascaraReferencial: byte;

    UltimoNivel: byte;
    UltimoNivelReferencial: byte;

    PermitirExcluir: Boolean;
    PercorrendoPlanoContas : Boolean;
    function ValidarContas(ExibirMsg: Boolean): Boolean;
    procedure SelecionarPlanoContas;
    function  ExistePlanoContas(campo, codigo: string): boolean;
    function  PosicionarRegistroPlanoContas: Boolean;
    function  IncluirPlanoContas: Boolean;
    function  ExcluirPlanoContas: Boolean;
    function  GravarPlanoContas: Boolean;
    constructor Create(AOwner: TComponent); override;
    property TabelaConsultarPlanoContas: TtecQuery read GetTabelaConsultarPlanoContas;
    property TabelaPlanoContas: TZDataset read GetTabelaPlanoContas;
    Function SelecionarVinculados(Classificacao:String): String;
    Function SelecionarVinculadosreferencial(Classificacao:String): String;
    procedure VerificarMascaraClassificacao(classificacao: String);
    procedure VerificarMascaraClassificacaoreferencial(classificacao: String);

    property vinculados: String read FVinculados write FVinculados;
    property vinculadosreferencial: String read FVinculadosreferencial write FVinculadosreferencial;

    property ultimaclassificacao: String read fultimaclassificacao write fultimaclassificacao;
    property ultimaclassificacaoreferencial: String read fultimaclassificacaoreferencial write fultimaclassificacaoreferencial;

    property penultimaclassificacao: String read fpenultimaclassificacao write fpenultimaclassificacao;
    property penultimaclassificacaoreferencial: String read fpenultimaclassificacaoreferencial write fpenultimaclassificacaoreferencial;
    property Antepenultimaclassificacaoreferencial: String read fAntepenultimaclassificacaoreferencial write fAntepenultimaclassificacaoreferencial;


//    procedure ValidarClassificacao;
    function  Inserindo:  Boolean;
    procedure  PercorrerPlanoContas(Campo: Byte; Key: Word; Shift: TShiftState);
    procedure ImprimirPlanoContas(
                Sintetico, Analitico, ParaoDiario, ContaSelecionada: Boolean;
                Livro, Pagina, Maximo, ListaFiliais: String;
                Ordenacao: integer;
                SoComMovto, SoComSaldo, TodasFiliais, AgruparFiliais: Boolean;
                Inativos: integer; DataInatividade: String);
    property PlanoContasVinculado_SinteticasAfterOpen: TNotifyEvent
             read FPlanoContasVinculado_SinteticasAfterOpen
             write FPlanoContasVinculado_SinteticasAfterOpen;
    function VerificarClassificacao: Boolean;
    function AbilitarAnalitica: Boolean;
    function AbilitarSintetica: Boolean;
    property SinteticaOriginal: String read FSinteticaOriginal write FSinteticaOriginal;
    procedure AtualizarNivelAbaixo;
  end;

var
  dtmPlanoContas: TdtmPlanoContas;

const
  CondicaoClassificacao_Sintetica = 'and btrim(btrim(p.classificacao,''. '')) in (%s)';

  //CondicaoClassificacao_Analitica = 'and position(btrim(btrim(%s,''. '')) in p.classificacao)=1';


implementation

uses
  //CLX
  ctconstantes, biblio;

{$R *.dfm}
constructor TdtmPlanoContas.Create(AOwner: TComponent);
begin
  inherited;
  qryConsultaPlanos.Tag := ctConsultaPlanoContas;
  if ParSistema.PermitirCODIGOnoPLANODECONTASinformado then
    qryPlanoContascodigo.AutoGenerateValue := arNone
  else
    qryPlanoContascodigo.AutoGenerateValue := arAutoInc;
  refazconsulta(qryPlanoContas,[0,1,2], [0,0,0]);
  PercorrendoPlanoContas := True;
  PermitirExcluir := true;
end;

function TdtmPlanoContas.ExcluirPlanoContas: Boolean;
begin
  Result:= False;
  if not qryPlanoContas.IsEmpty then
  begin
    if MensagemConfirmacao(Format(ctCONFIRMEEXCLUIR, ['o registro do Plano de Contas'])) = smbok then
    begin
      result := true;
      if qryPlanoContastipo.AsString = 'S' then
      begin
        ReFazConsulta(qryContaVinculada,[0],[
         qryPlanoContasclassificacao.AsString]);
        if qryContaVinculadavinculadas.AsInteger<>1 then
        begin
          result := false;
          MensagemAviso(ctCONTANAOPODESEREXCLUIDA);
        end;
      end
      else
      begin
        if existeLancamento then
        begin
          result := false;
          MensagemAviso(ctTIPOCONTANAOPODESERALTERADO);
        end;
      end;

      if result then
      begin
        qryApagarContaSaldosContabeis.ParamByName('conta').AsInteger :=
          qryPlanoContascodigo.AsInteger;
        qryApagarContaSaldosContabeis.ExecSql;
        qryPlanoContas.Delete;
        result := Perpetrar([qryApagarContaSaldosContabeis,qryPlanoContas]);
      end;
    end
  end;
end;

function TdtmPlanoContas.ExistePlanoContas(campo, codigo: string): boolean;
begin
  if campo = 'descricaoedentada' then
    Result:= ExisteCodigo(qryConsultaPlanos, 'descricao', codigo)
  else
    Result:= ExisteCodigo(qryConsultaPlanos, campo, trim(codigo));
end;

function TdtmPlanoContas.GetTabelaConsultarPlanoContas: TTecQuery;
begin
  Result := qryConsultaPlanos;
end;

function TdtmPlanoContas.GetTabelaPlanoContas: TZDataSet;
begin
  Result:= qryPlanoContas;
end;

function TdtmPlanoContas.GravarPlanoContas: Boolean;
begin
  result := true;

  qryPlanoContasreferencia.Required := (qryPlanoContastipo.AsString = 'A') and (qryPlanoContasNatureza.asString <> 'O');
  if (qryPlanoContastipo.AsString = 'A') and (qryPlanoContasNatureza.asString = 'O') and (qryPlanoContasreferencia.AsInteger <> 0) then
  begin
    result :=  MensagemConfirmacao('Contas com natureza [O]utras não pode ter conta referencial. A referência será desfeita.') = smbOK;
    if result then
      qryPlanoContasreferencia.clear;
  end;

  if result then
  begin

    if qryPlanoContas.CheckRequiredFields then
    begin
      result := ValidarContas(false) and VerificarClassificacao;

      if result then
      begin
        if (qryPlanoContasclassificacao.OldValue <> null) and
           (qryPlanoContasclassificacao.value <> qryPlanoContasclassificacao.OldValue) then
        begin
          if not qryParametros.Active then
          begin
            qryParametros.Open;

            qryParametros.First;
            while not qryParametros.Eof do
            begin
              qryParametros.Edit;
              qryParametrosvalor.AsString := 'True';
              qryParametros.Post;
              qryParametros.Next;
            end;
            ParSistema.ReatualizarSaldosContabeis := true;
          end;
        end;

        if qryPlanoContasnatureza.IsNull then
        begin
          qryPlanoContasVinculado_Sinteticas.Last;
          qryPlanoContasnatureza.AsString := qryPlanoContasVinculado_Sinteticasnatureza.AsString;
        end;

        if qryPlanoContastipo.asstring <> 'A' then
          if qryPlanoContasnatureza.value <> qryPlanoContasnatureza.OldValue then
            AtualizarNivelAbaixo;

        if (qryPlanoContas.State in [dsInsert]) and
           (qryPlanoContascodigo.AsInteger=0) then
        begin
           spcPlanosProximo.Open;
           qryPlanoContascodigo.AsInteger := spcPlanosProximoCodigo.AsInteger;
           spcPlanosProximo.Close;
        end;

        qryPlanoContasclassificacao.AsString := trim(Trocar(qryPlanoContasclassificacao.AsString,'. ',''));

        if qryPlanoContas.State in [dsEdit,dsInsert] then
        begin
          qryPlanoContas.Post;
          result := Perpetrar([qryPlanoContas, qryparametros]);
        end;

        Result := True
      end;
    end;
  end;

end;

function TdtmPlanoContas.IncluirPlanoContas: Boolean;
begin
  qryPlanoContasclassificacao.ReadOnly := false;
  qryplanocontas.Append;
  if ParSistema.PermitirCODIGOnoPLANODECONTASinformado then
  begin
    spcPlanosProximo.Open;
    qryPlanoContascodigo.AsInteger := spcPlanosProximoCodigo.AsInteger;
    spcPlanosProximo.Close;
 end;
 vinculados := '';
 vinculadosreferencial := '';

 Result := True;
end;

function TdtmPlanoContas.PosicionarRegistroPlanoContas: Boolean;
begin
  Result:= ExistePlanoContas(qryPlanoContascodigo.FieldName, qryPlanoContascodigo.asString);
end;

procedure TdtmPlanoContas.SelecionarPlanoContas;
begin
  refazconsulta(qryPlanoContas,[0,1,2,3,4],
       [0,0,qryConsultaPlanosCodigo.AsVariant,
       qryConsultaPlanosClassificacao.AsVariant,
       qryConsultaPlanosDescricao.AsVariant]);
end;

function TdtmPlanoContas.SelecionarVinculados(
  Classificacao: String): String;
var
 i,j, nivel, tamanho: integer;
 vretorno, vmascara  : String;
 aclassificacao: array of string[20];
begin
    j := 0;
    UltimoNivel := 1;
    vretorno := '';
//    Nivel := parsistema.mascaracontabil[1].indexof(copy(classificacao,1,1));
    if pos('.',classificacao)=-1 then
      Nivel := 0
    else
      Nivel := parsistema.mascaracontabil[1].indexof(inttostr(strtoint(copy(classificacao,1,pos('.',classificacao)-1))));
      
    //Tamanho := length(ParSistema.mascaracontabil[2].Strings[nivel])-4;
    vmascara := copy(ParSistema.mascaracontabil[2].Strings[nivel],
                1,length(ParSistema.mascaracontabil[2].Strings[nivel])-4);

    for i:=0 to length(vmascara)+1 do
      if (copy(vmascara, i, 1) = '.') then
         UltimoNivel := UltimoNivel + 1;
{
    if (length(classificacao)<>tamanho) and
       (qryplanocontastipo.AsString = 'A') then
      classificacao := classificacao+'.';
}
    classificacao := classificacao+'.';

    for i:=0 to length(Classificacao)+1 do
    begin
      if (copy(classificacao, i, 1) = ' ') then
        break;

      if (copy(classificacao, i, 1) = '.') then
      begin
        vretorno :=  vretorno + quotedstr(copy(classificacao, 1, i-1))+',';
        ultimaclassificacao := copy(classificacao, 1, i-1);
        j:=j+1;
        SetLength(aclassificacao,j);
        aclassificacao[j-1] := ultimaclassificacao;
      end;
    end;

    NivelMascara := J;

    if Length(classificacao)=1 then
      if PossuiNumero(Classificacao) then
      begin
        vretorno := classificacao+',';
        ultimaclassificacao :=classificacao;
        vinculados := '';
      end;

    if vretorno<>'' then
      vretorno := copy(vretorno,1,length(vretorno)-1)
    else
    begin
      vretorno := '0';
      ultimaclassificacao := vretorno;
    end;

    if j>1 then
      penultimaclassificacao := aclassificacao[j-2]
    else
//      penultimaclassificacao := '0';
      penultimaclassificacao := ultimaclassificacao;

    result := vretorno;
end;

procedure TdtmPlanoContas.VerificarMascaraClassificacao(classificacao: String);
var
 vvinculados: String;

  function ClassificacaoNaoExistente: Boolean;
  begin
    result := true;
    qryPlanoContasVinculado_Sinteticas.First;
    if qryPlanoContas.State = dsinsert then
    begin
      while not qryPlanoContasVinculado_Sinteticas.Eof do
      begin
        if (qryPlanoContasVinculado_Sinteticasclassificacao.AsString = ultimaClassificacao) then
        begin
          result := false;
          break;
        end;
        qryPlanoContasVinculado_Sinteticas.Next;
      end;
    end
    else
    begin
      while not qryPlanoContasVinculado_Sinteticas.Eof do
      begin
        if ((qryPlanoContasVinculado_Sinteticasclassificacao.AsString = penultimaClassificacao) and
            (qryPlanoContastipo.AsString = 'A')) or
           ((qryPlanoContasVinculado_Sinteticasclassificacao.AsString = ultimaClassificacao) and
            (qryPlanoContastipo.AsString = 'S')) then
        begin
          result := false;
          break;
        end;
        qryPlanoContasVinculado_Sinteticas.Next;
      end;
    end
  end;

begin
  if PossuiNumero(classificacao) and
     (pos('.',classificacao)<>0) then
  begin
    vvinculados := SelecionarVinculados(classificacao);
    if (Vinculados <> vvinculados) and
       (vvinculados <> '0') then
    begin
      Vinculados := vvinculados;

      if (qryPlanoContasclassificacao.Value <> qryPlanoContasclassificacao.OldValue) then
         qryPlanoContasVinculado_Sinteticas.params[1].Asinteger := qryPlanoContascodigo.AsInteger
      else
         qryPlanoContasVinculado_Sinteticas.params[1].Asinteger := 0;

      if qryPlanoContas.State = dsinsert then
        qryPlanoContasVinculado_Sinteticas.params[0].AsString := ultimaclassificacao
      else
      if qryPlanoContastipo.AsString = 'A' then
        qryPlanoContasVinculado_Sinteticas.params[0].AsString := penultimaclassificacao
      else
        qryPlanoContasVinculado_Sinteticas.params[0].AsString := ultimaclassificacao;

      qryPlanoContasVinculado_Sinteticas.MacroByName('WhereClassificacao').AsString :=
        format(CondicaoClassificacao_Sintetica, [vinculados]);

      ReFazConsulta(qryPlanoContasVinculado_Sinteticas,[],[]);

      if (not (qryPlanoContasVinculado_Sinteticas.IsEmpty)) and
        Inserindo then
        NivelMascara := NivelMascara + 1;

      if (( (not (ClassificacaonaoExistente)) or
             qryPlanoContasVinculado_Sinteticas.IsEmpty)
            and Inserindo) or
          ((not (ClassificacaonaoExistente)) and
            not Inserindo) then
      begin
        if Assigned(FPlanoContasVinculado_SinteticasAfterOpen) then
          FPlanoContasVinculado_SinteticasAfterOpen(qryPlanoContasVinculado_Sinteticas);
      end;

      if VerificarClassificacao then
        if not PercorrendoPlanoContas then
          if ClassificacaonaoExistente then
            qryPlanoContasdescricao.FocusControl;
    end;
  end;
end;

procedure TdtmPlanoContas.qryPlanoContasAfterInsert(DataSet: TDataSet);
begin
  inherited;
//  qryPlanoContasExercicio.AsVariant := ParSistema.EXERCICIOCONTABILIDADE;
end;

procedure TdtmPlanoContas.qryPlanoContasAfterOpen(DataSet: TDataSet);
begin
  inherited;
  VerificarMascaraClassificacao(qryPlanoContasclassificacao.AsString);
  VerificarMascaraClassificacaoReferencial(qryPlanoContasclassificacaoreferencial.AsString);

end;

{
procedure TdtmPlanoContas.ValidarClassificacao;
begin
  if qryPlanoContasVinculado.Active then
  begin
    qryPlanoContasVinculado_Analiticas.Last;
    if qryPlanoContasVinculado.RecordCount > 0 then
      if (qryPlanoContasVinculadotipo.AsString = 'A') and
         (qryPlanoContasVinculadoclassificacao.AsString <>
          trim(trocar(qryPlanoContasclassificacao.AsString,'. ',''))) and
         (qryplanocontas.State in [dsinsert, dsedit]) then
      begin
        MensagemAviso(ctCLASSIFICACAOINVALIDA);
        qryPlanoContasclassificacao.FocusControl;
      end;
  end;
end;

}

function TdtmPlanoContas.Inserindo: Boolean;
begin
  result := qryPlanoContas.State = dsinsert;
end;

procedure TdtmPlanoContas.PercorrerPlanoContas(Campo: Byte; Key: Word;
  Shift: TShiftState);
var Operacao: Byte;
    codigo: Integer;
    classificacao, descricao, DataInativo:      String;
begin
   Operacao := 0;
   with qryPlanoContas do begin
//     DisableControls;
      if ssCtrl in Shift
      then case Key of
              VK_HOME:     Operacao:= Primeiro;
              VK_END:      Operacao:= Ultimo;
           end
      else case Key of
              VK_PRIOR:   Operacao:= Anterior;
              VK_NEXT: Operacao:= Proximo;
           end;

      case Campo of
         cmpcodigo: case Operacao of
                            Primeiro,
                            Proximo:  MacroByName('Ordenacao').AsString:=
                                                  'ORDER BY codigo LIMIT 1';
                            Anterior,
                            Ultimo:   MacroByName('Ordenacao').AsString:=
                                                  'ORDER BY codigo DESC LIMIT 1';
                   end;

         cmpClassificacao:  case Operacao of
                              Primeiro,
                              Proximo:  MacroByName('Ordenacao').AsString:=
                                                  'ORDER BY classificacao, UPPER(TO_ASCII(Descricao,''LATIN1'')), codigo LIMIT 1';
                              Anterior,
                              Ultimo:   MacroByName('Ordenacao').AsString:=
                                                  'ORDER BY classificacao DESC, UPPER(TO_ASCII(Descricao,''LATIN1'')) DESC, codigo DESC LIMIT 1';
                            end;

         cmpDescricao: case Operacao of
                            Primeiro,
                            Proximo:  MacroByName('Ordenacao').AsString:=
                                                  'ORDER BY UPPER(TO_ASCII(Descricao,''LATIN1'')), classificacao, codigo LIMIT 1';
                            Anterior,
                            Ultimo:   MacroByName('Ordenacao').AsString:=
                                                  'ORDER BY UPPER(TO_ASCII(Descricao,''LATIN1'')) DESC, classificacao DESC, codigo DESC LIMIT 1';
                         end;
         cmpDataInativo: case Operacao of
                            Primeiro,
                            Proximo:  MacroByName('Ordenacao').AsString:=
                                                  'ORDER BY inativo, classificacao, UPPER(TO_ASCII(Descricao,''LATIN1'')), codigo LIMIT 1';
                            Anterior,
                            Ultimo:   MacroByName('Ordenacao').AsString:=
                                                  'ORDER BY inativo DESC, classificacao DESC, UPPER(TO_ASCII(Descricao,''LATIN1'')) DESC, codigo DESC LIMIT 1';
                         end;

      end;

      codigo         := qryPlanoContascodigo.         AsInteger;
      classificacao  := qryPlanoContasclassificacao.  AsString;
      descricao      := qryPlanoContasdescricao.      AsString;
      DataInativo    := qryPlanoContasinativo.        AsString;
      if DataInativo = '' then
        DataInativo := '30/12/1899';

      RefazConsulta(qryPlanoContas, [0,1, 2, 3, 4, 5],
                    [Campo, Operacao, qryPlanoContascodigo.         AsInteger,
                                      qryPlanoContasclassificacao.  AsString,
                                      qryPlanoContasdescricao.      AsString,
                                      DataInativo]);

      if qryPlanoContas.RecordCount = 0 then
      begin
         if (campo = cmpDataInativo) and (DataInativo = '30/12/1899') then
           MensagemAviso('Não Existem contas inativas');
         RefazConsulta(qryPlanoContas, [0,1, 2, 3, 4, 5],
                      [PosicaoAtual, PosicaoAtual, codigo, classificacao, descricao, DataInativo]);
         case Operacao of
            Anterior,Primeiro: case Campo of
                                 cmpDataInativo : if (DataInativo<>'30/12/1899') then
                                                    MensagemAviso('Esta é a 1ª conta inativa');
                               else
                                 MensagemAviso('Esta é a 1ª conta')
                               end;
            Proximo, Ultimo  : case Campo of
                                 cmpDataInativo : if (DataInativo<>'30/12/1899') then
                                                    MensagemAviso('Esta é a última conta inativa');
                               else
                                 MensagemAviso('Esta é a última conta')
                               end;
         end;
         case campo of
          1 : qryPlanoContascodigo.FocusControl;
          2 : qryPlanoContasclassificacao.FocusControl;
          3 : qryPlanoContasdescricao.FocusControl;
          4 : qryPlanoContasinativo.FocusControl;
         end;
      end;
  //   EnableControls;
   end;
end;


procedure TdtmPlanoContas.qryPlanoContasAfterClose(DataSet: TDataSet);
begin
  inherited;
  qryPlanoContas.Params[0].AsInteger := 0;
  qryPlanoContas.Params[1].AsInteger := 0;
end;

procedure TdtmPlanoContas.ImprimirPlanoContas(
                Sintetico, Analitico, ParaoDiario, ContaSelecionada: Boolean;
                Livro, Pagina, Maximo, ListaFiliais: String;
                Ordenacao: integer;
                SoComMovto, SoComSaldo, TodasFiliais, AgruparFiliais: Boolean;
                Inativos: integer;  DataInatividade: String);
const

  SQLFilial = 'and (sc.filial in (%S))';

  SQLConta = 'and position(btrim(btrim(%s,''. '')) in pl.classificacao)=1';

  SQLSoComMovtos = ' and contacommovto(pl.codigo, cast(%s as date), cast(%s as date)) ';
  SQLSoComMovtosFilial = ' and contacommovto(pl.codigo, sc.filial, cast(%s as date), cast(%s as date)) ';
  SQLSoComMovtosFiliais = ' and contacommovto(pl.codigo, %s, cast(%s as date), cast(%s as date)) ';

  SQLSoComSaldos = ' and ((saldocontabil(pl.codigo, cast(%s as date))<>0) and '+
                    ' (saldocontabil(pl.codigo, cast(%s as date))<>0)) ';

  SQLSoComSaldosFilial = ' and ((saldocontabil(coalesce(pl.codigo,0), sc.filial, cast(%s as date))<>0) and '+
                    ' (saldocontabil(coalesce(pl.codigo,0), sc.filial, cast(%s as date))<>0)) ';

  SQLSoComSaldosFiliais = ' and ((saldocontabil(coalesce(pl.codigo,0), %s, cast(%s as date))<>0) and '+
                           ' (saldocontabil(coalesce(pl.codigo,0), %s, cast(%s as date))<>0)) ';

  SQLSoComMovtoseSaldos = ' and (contacommovto(pl.codigo, cast(%s as date),  cast(%s as date)) '+
                           ' or ((saldocontabil(pl.codigo, cast(%s as date))<>0) and '+
                          '      (saldocontabil(pl.codigo, cast(%s as date))<>0))) ';

  SQLSoComMovtoseSaldosFilial = ' and (contacommovto(pl.codigo, sc.filial, cast(%s as date),  cast(%s as date)) '+
                                 ' or ((saldocontabil(pl.codigo, sc.filial, cast(%s as date))<>0) and '+
                                 ' (saldocontabil(pl.codigo, sc.filial, cast(%s as date))<>0))) ';


  SQLSoComMovtoseSaldosFiliais = ' and (contacommovto(pl.codigo, %s, cast(%s as date),  cast(%s as date)) '+
                                 ' or ((saldocontabil(pl.codigo, %s, cast(%s as date))<>0) and '+
                                 ' (saldocontabil(pl.codigo, %s, cast(%s as date))<>0))) ';

  SQLInatividade = ' and pl.inativo <= cast(%s as date)';
  SQLInatividade2 = ' and ((pl.inativo <= cast(%s as date)) or (pl.inativo is null))';
  SQLSemInativos = ' and pl.inativo is null ';
  SQLSoInativos = ' and pl.inativo is not null ';
  SQLExercicio = ' and ((sc.exercicio = EXTRACT(year from cast(%s as date))) '+  //DataInicial
                 ' or not cast(%s as boolean))';

var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
  dataInicial, dataFinal : String;
begin
    frVariables['Ordenacao'] := Ordenacao;
    if Livro='' then
      frVariables['Livro'] := 0
    else
      frVariables['Livro'] := Livro;
    frVariables['Pagina']:= Pagina;
    frVariables['Maximo']:= Maximo;
    frVariables['INATIVIDADE']:= Inativos;


    if ParaoDiario then
    begin
      frVariables['Titulo']:= 'LIVRO DIÁRIO';
      frVariables['subTitulo']:= 'PLANO DE CONTAS - EXERCICIO '+inttostr(parsistema.EXERCICIOCONTABILIDADE);
    end
    else
    begin
      frVariables['Titulo']:= 'PLANO DE CONTAS - EXERCICIO '+inttostr(parsistema.EXERCICIOCONTABILIDADE);
      frVariables['subTitulo']:= '';
    end;

  datainicial := '01/01/'+inttostr(parsistema.EXERCICIOCONTABILIDADE);
  datafinal := '31/12/'+inttostr(parsistema.EXERCICIOCONTABILIDADE);

  if AgruparFiliais then
  begin

    qryplanos.ParamByName('datainicial').asdatetime := StrToDate(datainicial);
    qryplanos.ParamByName('SoComSaldo').asBoolean := SoComSaldo;

    qryPlanos.MacroByName('Filiais').AsString := '';
    if Not TodasFiliais then
      qryPlanos.MacroByName('Filiais').AsString := format(SQLFilial, [ListaFiliais]);

    if (Sintetico and not Analitico) then
      qryPlanos.MacroByName('condicaotipo').AsString := 'and pl.tipo = ''S'''
    else if (not sintetico and Analitico) then
      qryPlanos.MacroByName('condicaotipo').AsString := 'and pl.tipo = ''A'''
    else
      qryPlanos.MacroByName('condicaotipo').AsString := '';

    qryPlanos.MacroByName('condicaoconta').AsString := '';

    if ContaSelecionada then
      if qryPlanoContasclassificacao.AsString<>'' then
        qryPlanos.MacroByName('condicaoconta').AsString := format(SQLConta, [quotedstr(qryPlanoContasclassificacao.AsString)]);

    if SoComMovto and SoComSaldo then
    begin
      if TodasFiliais then
        qryPlanos.MacroByName('Movtos').AsString :=
            format(SQLSoComMovtoseSaldos, [quotedstr(datainicial),
                                           quotedstr(datafinal),
                                           quotedstr(datainicial),
                                           quotedstr(datafinal)])
      else
        qryPlanos.MacroByName('Movtos').AsString :=
            format(SQLSoComMovtoseSaldosFiliais, [ListaFiliais, quotedstr(datainicial), quotedstr(datafinal),
                                                  ListaFiliais, quotedstr(datainicial),
                                                  ListaFiliais, quotedstr(datafinal)]);

    end
    else
      if SoComMovto then
      begin
        if TodasFiliais then
          qryPlanos.MacroByName('Movtos').AsString := format(SQLSoComMovtos,[quotedstr(datainicial), quotedstr(datafinal)])
        else
          qryPlanos.MacroByName('Movtos').AsString := format(SQLSoComMovtosFiliais, [ListaFiliais, quotedstr(datainicial), quotedstr(datafinal)]);
      end
      else
        if SoComSaldo then
        begin
          if TodasFiliais then
            qryPlanos.MacroByName('Movtos').AsString := format(SQLSoComSaldos, [quotedstr(datainicial), quotedstr(datafinal)])
          else
            qryPlanos.MacroByName('Movtos').AsString :=Format(SQLSoComSaldosFiliais,
               [ListaFiliais, quotedstr(datainicial), ListaFiliais, quotedstr(datafinal)]);
        end
        else
          qryPlanos.MacroByName('Movtos').AsString := '';

    case Inativos of
    0: qryPlanos.MacroByName('DataInatividade').AsString := SQLSemInativos;
    1: begin
        if DataInatividade<>'' then
          qryPlanos.MacroByName('DataInatividade').AsString := format(SQLInatividade2, [quotedstr(DataInatividade)])
        else qryPlanos.MacroByName('DataInatividade').AsString := '';
       end;
    2: begin
        if DataInatividade<>'' then
          qryPlanos.MacroByName('DataInatividade').AsString := format(SQLInatividade, [quotedstr(DataInatividade)])+SQLSoInativos
        else qryPlanos.MacroByName('DataInatividade').AsString := SQLSoInativos;
       end;
    end;

    case Ordenacao of
     0: qryPlanos.MacroByName('ordenacao').AsString := 'order by pl.classificacao, UPPER(TO_ASCII(pl.Descricao,''LATIN1'')), pl.codigo';
     1: qryPlanos.MacroByName('ordenacao').AsString := 'order by UPPER(TO_ASCII(pl.Descricao,''LATIN1'')), pl.classificacao, pl.codigo';
     2: qryPlanos.MacroByName('ordenacao').AsString := 'order by pl.codigo';
     3: qryPlanos.MacroByName('ordenacao').AsString := 'order by pl.inativo, pl.classificacao, UPPER(TO_ASCII(pl.Descricao,''LATIN1'')), pl.codigo';
    end;

    refazconsulta(qryPlanos,[],[]);

//    frpPlano.DesignReport;

    frmPreview := TfrmPreviewPadrao.create(self);
    frmPreview.cmbZoom.ItemIndex := 3; //125%
    try
     Relatorio := frmPreview.frCompositeReport;
     with frmPreview do
     begin
      frCompositeReport.Reports.Clear;
      frCompositeReport.Reports.Add(frpPlano);
     end;
     Relatorio.Preview := frmPreview.frPreviewPadrao;
     Relatorio.ShowReport;
     frmPreview.ShowModal;
    finally
     frmPreview.Free;
    end;
  end
  else
  begin
    qryplanosfiliais.ParamByName('datainicial').asdatetime := StrToDate(datainicial);
    qryplanosFiliais.ParamByName('SoComSaldo').asBoolean := SoComSaldo;
    qryPlanosFiliais.MacroByName('Filiais').AsString := '';
    if Not TodasFiliais then
      qryPlanosFiliais.MacroByName('Filiais').AsString := format(SQLFilial, [ListaFiliais]);

    if (Sintetico and not Analitico) then
      qryPlanosFiliais.MacroByName('condicaotipo').AsString := 'and pl.tipo = ''S'''
    else if (not sintetico and Analitico) then
      qryPlanosFiliais.MacroByName('condicaotipo').AsString := 'and pl.tipo = ''A'''
    else
      qryPlanosFiliais.MacroByName('condicaotipo').AsString := '';

    qryPlanosFiliais.MacroByName('condicaoconta').AsString := '';

    if ContaSelecionada then
      if qryPlanoContasclassificacao.AsString<>'' then
        qryPlanosFiliais.MacroByName('condicaoconta').AsString := format(SQLConta, [quotedstr(qryPlanoContasclassificacao.AsString)]);

    if SoComMovto and SoComSaldo then
      qryPlanosFiliais.MacroByName('Movtos').AsString :=
          format(SQLSoComMovtoseSaldosFilial, [quotedstr(datainicial),
                                               quotedstr(datafinal),
                                               quotedstr(datainicial),
                                               quotedstr(datafinal)])
    else
      if SoComMovto then
        qryPlanosFiliais.MacroByName('Movtos').AsString := format(SQLSoComMovtosFilial,[quotedstr(datainicial), quotedstr(datafinal)])
      else
        if SoComSaldo then
            qryPlanosFiliais.MacroByName('Movtos').AsString := format(SQLSoComSaldosFilial, [quotedstr(datainicial), quotedstr(datafinal)])
        else
          qryPlanosFiliais.MacroByName('Movtos').AsString := '';

    case Inativos of
    0: qryPlanosFiliais.MacroByName('DataInatividade').AsString := SQLSemInativos;
    1: begin
        if DataInatividade<>'' then
          qryPlanosFiliais.MacroByName('DataInatividade').AsString := format(SQLInatividade2, [quotedstr(DataInatividade)])
        else qryPlanosFiliais.MacroByName('DataInatividade').AsString := '';
       end;
    2: begin
        if DataInatividade<>'' then
          qryPlanosFiliais.MacroByName('DataInatividade').AsString := format(SQLInatividade, [quotedstr(DataInatividade)])+SQLSoInativos
        else qryPlanosFiliais.MacroByName('DataInatividade').AsString := SQLSoInativos;
       end;
    end;

    case Ordenacao of
     0: qryPlanosFiliais.MacroByName('ordenacao').AsString := 'order by sc.filial, pl.classificacao, UPPER(TO_ASCII(pl.Descricao,''LATIN1'')), pl.codigo';
     1: qryPlanosFiliais.MacroByName('ordenacao').AsString := 'order by sc.filial, UPPER(TO_ASCII(pl.Descricao,''LATIN1'')), pl.classificacao, pl.codigo';
     2: qryPlanosFiliais.MacroByName('ordenacao').AsString := 'order by sc.filial, pl.codigo';
     3: qryPlanosFiliais.MacroByName('ordenacao').AsString := 'order by sc.filial, pl.inativo, pl.classificacao, UPPER(TO_ASCII(pl.Descricao,''LATIN1'')), pl.codigo';
    end;

    refazconsulta(qryPlanosFiliais,[],[]);

//    frpPlanosFiliais.DesignReport;

    frmPreview := TfrmPreviewPadrao.create(self);
    frmPreview.cmbZoom.ItemIndex := 3; //125%
    try
     Relatorio := frmPreview.frCompositeReport;
     with frmPreview do
     begin
      frCompositeReport.Reports.Clear;
      frCompositeReport.Reports.Add(frpPlanosFiliais);
     end;
     Relatorio.Preview := frmPreview.frPreviewPadrao;
     Relatorio.ShowReport;
     frmPreview.ShowModal;
    finally
     frmPreview.Free;
    end;
  end
end;

procedure TdtmPlanoContas.frpPlanoBeforePrint(Memo: TStringList;
  View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpPlano, view);
end;

procedure TdtmPlanoContas.dsrPlanoContasDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;

  if field = qryPlanoContasclassificacaoreferencial then
     VerificarMascaraClassificacaoReferencial(qryPlanoContasclassificacaoreferencial.AsString);
  {
  if Field = qryPlanoContastipo then
  begin
    if not (qryPlanoContas.State in [dsinsert]) then
    begin
      if (qryPlanoContastipo.OldValue = 'S') then
      begin
        if (qryPlanoContastipo.asstring <> qryPlanoContastipo.OldValue) then
        begin
          if ExisteContavinculada then
          begin
            MensagemAviso(ctTIPOCONTANAOPODESERALTERADO);
            dsrPlanoContas.OnDataChange := nil;
            qryPlanoContastipo.AsString := 'S';
            dsrPlanoContas.OnDataChange := dsrPlanoContasDataChange;
          end
          else
            ValidarContas(true);
        end;
      end
      else
      begin
        if (qryPlanoContastipo.asstring <> qryPlanoContastipo.OldValue) then
        begin
          if ExisteLancamento then
          begin
            MensagemAviso(ctTIPOCONTANAOPODESERALTERADO);
            dsrPlanoContas.OnDataChange := nil;
            qryPlanoContastipo.AsString := 'A';
            dsrPlanoContas.OnDataChange := dsrPlanoContasDataChange;
          end
          else
            ValidarContas(true);
        end;
      end;
    end;
  end;
  }
end;

function TdtmPlanoContas.ExisteContaVinculada: Boolean;
begin
  if qryPlanoContasclassificacao.AsString<>'' then
    ReFazConsulta(qryContaVinculada,[0],[qryPlanoContasclassificacao.AsString])
  else
    ReFazConsulta(qryContaVinculada,[0],[0]);

  result := qryContaVinculadavinculadas.AsInteger<>0;
end;

procedure TdtmPlanoContas.qryPlanoContasNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryPlanoContastipo.AsString := 'A';
  qryPlanoContasdemosped.AsBoolean := false;
end;

function TdtmPlanoContas.ValidarContas(ExibirMsg:Boolean): Boolean;
begin
  result := true;
  if (trim(trocar(qryPlanoContasclassificacao.Value,'. ','')) <>
     qryPlanoContasclassificacao.OldValue) then
    if qryPlanoContasVinculado_Sinteticas.Active then
    begin
      qryPlanoContasVinculado_Sinteticas.last;
      if (trim(trocar(qryPlanoContasclassificacao.AsString,'. ','')) =
          qryPlanoContasVinculado_Sinteticasclassificacao.AsString) then
      begin
        result := false;
        if not result then
        begin
          if ExibirMsg then
            MensagemAviso(ctCLASSIFICACAOCADASTRADA);
          qryPlanoContasclassificacao.FocusControl;
        end;
      end;
    end;

  {
  if (qryPlanoContastipo.asstring = 'A') then
  begin
    if (qryPlanoContasdescricao.AsString<>'') then
    begin
      if ((qryPlanoContasVinculado_Analiticas.Params[0].AsString <> penultimaclassificacao) or
          (qryPlanoContasVinculado_Analiticas.Params[1].AsString <> qryPlanoContasdescricao.AsString)) or
         not qryPlanoContasVinculado_Analiticas.Active then
        ReFazConsulta(qryPlanoContasVinculado_Analiticas,[0,1],
          [quotedstr(penultimaclassificacao),
           quotedstr(qryPlanoContasdescricao.AsString)]);

      qryPlanoContasVinculado_Analiticas.first;
      while not qryPlanoContasVinculado_Analiticas.Eof do
      begin
        if (trim(trocar(qryPlanoContasclassificacao.AsString,'. ','')) =
                        qryPlanoContasVinculado_Analiticasclassificacao.AsString)
            and (qryPlanoContasdescricao.AsString =
                 qryPlanoContasVinculado_Analiticasdescricao.AsString)
            and (qryPlanoContascodigo.Asinteger <>
                 qryPlanoContasVinculado_Analiticascodigo.Asinteger) then
        begin
          result := false;
          if not result then
          begin
            if ExibirMsg then
              MensagemAviso(ctNOMECLASSIFICACAOCADASTRADA);
            qryPlanoContasclassificacao.FocusControl;
          end;
          break;
        end;
        qryPlanoContasVinculado_Analiticas.Next;
      end;
    end;
  end;
  }
end;

function TdtmPlanoContas.existeLancamento: Boolean;
var
 datainicial : String;
begin
  datainicial := '01/01/'+inttostr(parsistema.EXERCICIOCONTABILIDADE);
  ReFazConsulta(qryExisteLancto,[0,1], [qryPlanoContascodigo.AsVariant,datainicial]);
  result := qryExisteLanctoexiste.AsBoolean;
end;

procedure TdtmPlanoContas.qryPlanoContasBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  qryPlanoContasVinculado_Sinteticas.close;
  //qryPlanoContasVinculado_Analiticas.close;
end;

procedure TdtmPlanoContas.frpPlanosFiliaisBeforePrint(Memo: TStringList;
  View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpPlanosFiliais, view);
end;

function TdtmPlanoContas.VerificarClassificacao: Boolean;
begin
  result := true;
  if qryPlanoContasVinculado_Sinteticas.Active then
  begin
    qryPlanoContasVinculado_Sinteticas.first;
    while not qryPlanoContasVinculado_Sinteticas.Eof do
    begin
      if qryplanocontas.State = dsinsert then
      begin
        if qryPlanoContastipo.AsString = 'S' then
          result :=(penultimaclassificacao =
                     qryPlanoContasVinculado_Sinteticasclassificacao.AsString) or
                   (qryPlanoContasVinculado_Sinteticas.RecordCount=0);
      end
      else
      begin
        if qryPlanoContastipo.AsString = 'A' then
          result :=(penultimaclassificacao =
                     qryPlanoContasVinculado_Sinteticasclassificacao.AsString) or
                   (qryPlanoContasVinculado_Sinteticas.RecordCount=0);
      end;
      if result then
        break;
      qryPlanoContasVinculado_Sinteticas.Next;
    end;

    if not result then
      MensagemErro(format(ctCLASSIFICACAONAOCADASTRADA,[penultimaclassificacao]));
  end;
end;

function TdtmPlanoContas.AbilitarAnalitica: Boolean;
begin
  qryPlanoContasclassificacao.ReadOnly := false;
  qryPlanoContastipo.ReadOnly := false;
  if (qryPlanoContastipo.AsString = 'A') and
     (qryPlanoContas.State = dsedit) and
     (qryPlanoContasclassificacao.Value <> qryPlanoContasclassificacao.OldValue) and
     (existeLancamento) then
    qryPlanoContastipo.ReadOnly := true;

  PermitirExcluir := true;
  if (qryPlanoContas.State = dsinsert) or
     (qryPlanoContasclassificacao.Value <> qryPlanoContasclassificacao.OldValue) then
  begin
    if NivelMascara > 1 then
    begin
      if NivelMascara = UltimoNivel then
        result := true
      else
      begin
        if (qryPlanoContasVinculado_Sinteticasnsinteticasultima.AsInteger > 0) then
          result := false
        else
          result := true;
      end;
    end
    else
      result := false;

    if not result then
    begin
      if qryPlanoContastipo.ReadOnly then
        result := true
      else
      if qryPlanoContastipo.AsString <> 'S' then
        qryPlanoContastipo.AsString := 'S'
    end;
  end
  else
  begin
    if NivelMascara > 1 then
    begin
      if (NivelMascara = UltimoNivel) then
        result := true
      else
      begin
        if (qryPlanoContasVinculado_Sinteticasnsinteticasultima.AsInteger > 0) then
          result := false
        else
        if ((qryPlanoContasVinculado_Sinteticasnsinteticasultima.AsInteger = 0) and
            (qryPlanoContasVinculado_Sinteticasnanaliticasultima.AsInteger > 0)) and
            (qryPlanoContastipo.asstring = 'S') then
          result := false
        else
          result := true;
      end;
    end
    else
      result := false;

    if qryPlanoContasclassificacao.Value = qryPlanoContasclassificacao.OldValue then
      if qryPlanoContastipo.AsString = 'S' then
        if (qryPlanoContasVinculado_Sinteticasnsinteticasultima.AsInteger > 0)or
           (qryPlanoContasVinculado_Sinteticasnanaliticasultima.AsInteger > 0) then
        begin
          qryPlanoContasclassificacao.ReadOnly := true;
          PermitirExcluir := false;
        end
  end;
end;

function TdtmPlanoContas.AbilitarSintetica: Boolean;
begin
  if (qryPlanoContas.State = dsinsert) or
     (qryPlanoContasclassificacao.Value <> qryPlanoContasclassificacao.OldValue) then
  begin
    if NivelMascara > 1 then
    begin
      if NivelMascara = UltimoNivel then
        result := false
      else
      begin
       if (qryPlanoContasVinculado_Sinteticasnanaliticasultima.AsInteger > 0) then
         result := false
       else
         result := true;
      end;
    end
    else
      result := true;

    if qryPlanoContastipo.ReadOnly then
      result := false;

    if not result then
      if qryPlanoContastipo.AsString <> 'A' then
        qryPlanoContastipo.AsString := 'A'

  end
  else
  begin
    if NivelMascara > 1 then
    begin
      if NivelMascara = UltimoNivel then
        result := false
      else
      begin
        if (qryPlanoContasVinculado_Sinteticasnsinteticasultima.AsInteger > 0) then
          result := true
        else
        if (qryPlanoContasVinculado_Sinteticasnsinteticasultima.AsInteger = 0) and
           (qryPlanoContasVinculado_Sinteticasnanaliticasultima.AsInteger = 0) then
          result := true
        else
        if (qryPlanoContasVinculado_Sinteticasnsinteticasultima.AsInteger = 0) and
           (qryPlanoContasVinculado_Sinteticasnanaliticasultima.AsInteger = 1) and
           (qryPlanoContastipo.AsString = 'A') and
           (not existeLancamento) then
          result := true
        else
          result := false;
      end;
    end
    else
      result := false;

    if qryPlanoContastipo.ReadOnly then
      result := false;

  end;

end;

procedure TdtmPlanoContas.qryPlanoContasAfterCancel(DataSet: TDataSet);
begin
  inherited;
  VerificarMascaraClassificacao(qryPlanoContasclassificacao.AsString);
  VerificarMascaraClassificacaoReferencial(qryPlanoContasclassificacaoreferencial.AsString);
end;

procedure TdtmPlanoContas.qryPlanoContasAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if qryPlanoContastipo.AsString = 'A' then
    SinteticaOriginal := penultimaclassificacao
end;

procedure TdtmPlanoContas.AtualizarNivelAbaixo;
var s: string;
begin
  if MensagemConfirmacao('Confirma a atualização da naturezas nos níveis vinculados a esta conta?') = smbok then
  begin
    qryAtualizarNaturezas.ParamByName('natureza').AsString := qryPlanoContasnatureza.AsString;
    qryAtualizarNaturezas.ParamByName('classificacao').AsString := Trocar(
                                                                   Trocar(
                                                                   Trocar(qryPlanoContasclassificacao.AsString, '. ',''),
                                                                                                                ' .',''),
                                                                                                                ' ','');
    qryAtualizarNaturezas.ExecSql;
    Perpetrar([qryatualizarnaturezas]);
  end;
end;

procedure TdtmPlanoContas.VerificarMascaraClassificacaoreferencial(
  classificacao: String);
var
 vvinculados: String;

  function ClassificacaoNaoExistente: Boolean;
  begin
    result := true;
    qryPlanoContasVinculado_SinteticasReferencial.First;

    {
    if qryPlanoContas.State = dsinsert then
    begin
      while not qryPlanoContasVinculado_Sinteticas.Eof do
      begin
        if (qryPlanoContasVinculado_Sinteticasclassificacao.AsString = ultimaClassificacao) then
        begin
          result := false;
          break;
        end;
        qryPlanoContasVinculado_Sinteticas.Next;
      end;
    end
    else
    begin
    }
      while not qryPlanoContasVinculado_SinteticasReferencial.Eof do
      begin
        if ((qryPlanoContasVinculado_SinteticasReferencialclassificacao.AsString = penultimaclassificacaoreferencial) and
            (qryPlanoContastiporeferencial.AsString = 'A')) or
           ((qryPlanoContasVinculado_SinteticasReferencialclassificacao.AsString = ultimaclassificacaoreferencial) and
            (qryPlanoContastiporeferencial.AsString = 'S')) then
        begin
          result := false;
          break;
        end;
        qryPlanoContasVinculado_SinteticasReferencial.Next;
      end;
    //end
  end;

  procedure  FecharPlanoContasVinculado_SinteticasReferencial;
  begin
    if qryPlanoContasreferencia.AsInteger = 0 then
       qryPlanoContasVinculado_SinteticasReferencial.close;
    vinculadosreferencial := '';
  end;

begin
  if PossuiNumero(classificacao) then
  begin
    vvinculados := SelecionarVinculadosreferencial(classificacao);
    if (vinculadosreferencial <> vvinculados) and
       (vvinculados <> '0') then
    begin
      vinculadosreferencial := vvinculados;
      {
      if (qryPlanoContasclassificacaoreferencial.Value <> qryPlanoContasclassificacaoreferencial.OldValue) then    }
         qryPlanoContasVinculado_SinteticasReferencial.params[1].Asinteger := qryPlanoContasreferencia.AsInteger
      {
      else
         qryPlanoContasVinculado_SinteticasReferencial.params[1].Asinteger := 0};

      {
      if qryPlanoContas.State = dsinsert then
        qryPlanoContasVinculado_Sinteticas.params[0].AsString := ultimaclassificacao
      else
      }
      if qryPlanoContastiporeferencial.AsString = 'A' then
        qryPlanoContasVinculado_SinteticasReferencial.params[0].AsString := penultimaclassificacaoreferencial
      else
        qryPlanoContasVinculado_SinteticasReferencial.params[0].AsString := ultimaclassificacaoreferencial;

      qryPlanoContasVinculado_SinteticasReferencial.MacroByName('WhereClassificacao').AsString :=
        format(CondicaoClassificacao_Sintetica, [vinculadosreferencial]);

      ReFazConsulta(qryPlanoContasVinculado_SinteticasReferencial,[],[]);

      {
      if (not (qryPlanoContasVinculado_SinteticasReferencial.IsEmpty)) and
        Inserindo then
        NivelMascara := NivelMascara + 1;
        }

          {
      if (( (not (ClassificacaonaoExistente)) or
             qryPlanoContasVinculado_SinteticasReferencial.IsEmpty)
            and Inserindo) or

          ((not (ClassificacaonaoExistente)) and
            not Inserindo) then
      begin

        if Assigned(FPlanoContasVinculado_SinteticasAfterOpen) then
          FPlanoContasVinculado_SinteticasAfterOpen(qryPlanoContasVinculado_Sinteticas);
      end;
      }

      {
      if VerificarClassificacao then
        if not PercorrendoPlanoContas then
          if ClassificacaonaoExistente then
            qryPlanoContasdescricao.FocusControl;
            }
    end
    else
      FecharPlanoContasVinculado_SinteticasReferencial;
  end
  else
    FecharPlanoContasVinculado_SinteticasReferencial;
end;

function TdtmPlanoContas.SelecionarVinculadosreferencial(
  Classificacao: String): String;
var
 i,j, nivel, tamanho: integer;
 vretorno, vmascara  : String;
 aclassificacao: array of string[20];
begin
    j := 0;
    UltimoNivelReferencial := 1;
    vretorno := '';
//    Nivel := parsistema.mascaracontabil[1].indexof(copy(classificacao,1,1));
    Nivel := 1;
    //Tamanho := length(ParSistema.mascaracontabil[2].Strings[nivel])-4;
    //vmascara := copy(ParSistema.mascaracontabil[2].Strings[nivel],
    //            1,length(ParSistema.mascaracontabil[2].Strings[nivel])-4);

    vmascara := '9.99.99.99.99.99.99';

    for i:=0 to length(vmascara)+1 do
      if (copy(vmascara, i, 1) = '.') then
         UltimoNivelReferencial := UltimoNivelReferencial + 1;
{
    if (length(classificacao)<>tamanho) and
       (qryplanocontastipo.AsString = 'A') then
      classificacao := classificacao+'.';
}
    classificacao := classificacao+'.';

    for i:=0 to length(Classificacao)+1 do
    begin
      if (copy(classificacao, i, 1) = ' ') then
        break;

      if (copy(classificacao, i, 1) = '.') then
      begin
        vretorno :=  vretorno + quotedstr(copy(classificacao, 1, i-1))+',';
        ultimaclassificacaoreferencial := copy(classificacao, 1, i-1);
        j:=j+1;
        SetLength(aclassificacao,j);
        aclassificacao[j-1] := ultimaclassificacaoreferencial;
      end;
    end;

    NivelMascaraReferencial := J;

    if Length(classificacao)=1 then
      if PossuiNumero(Classificacao) then
      begin
        vretorno := classificacao+',';
        ultimaclassificacaoreferencial :=classificacao;
        vinculadosreferencial := '';
      end;

    if vretorno<>'' then
      vretorno := copy(vretorno,1,length(vretorno)-1)
    else
    begin
      vretorno := '0';
      ultimaclassificacaoreferencial := vretorno;
    end;

    if j>1 then
    begin
      penultimaclassificacaoreferencial := aclassificacao[j-2];
      Antepenultimaclassificacaoreferencial := aclassificacao[j-2];
      if j>2 then
        Antepenultimaclassificacaoreferencial := aclassificacao[j-3];
    end
    else
    begin
//      penultimaclassificacao := '0';
      penultimaclassificacaoreferencial := ultimaclassificacaoreferencial;
      Antepenultimaclassificacaoreferencial := ultimaclassificacaoreferencial;
    end;

    result := vretorno;
end;

procedure TdtmPlanoContas.qryPlanoContasVinculado_SinteticasReferencialBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryPlanoContasVinculado_SinteticasReferencial.ParamByName('TipoPlano').AsString := parsistema.TiposPlanosReferenciais;
end;

end.

