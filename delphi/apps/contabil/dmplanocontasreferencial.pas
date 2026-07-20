unit dmplanocontasreferencial;

interface

uses
  SysUtils, Windows, Types, Classes, Variants, Controls, Forms, Dialogs, DB, {Qete,}
  fmpreviewpadrao,
  //Terceiros
  ZQuery, ZPgSqlQuery,
  //Componentes
  cpquery, cpdatasource,

  //Repositorio
  dmbasico, clparametrossistema, ZTransact, FR_DSet, FR_DBSet, FR_Class;

Const cmpCodigo          = 1;   PosicaoAtual = 0;
      cmpClassificacao   = 2;   Primeiro     = 1;
      cmpDescricao       = 3;   Anterior     = 2;
      {cmpDataValidoDesde = 4;}   Proximo      = 3;
      {cmpDataValidoAte   = 5;}   Ultimo       = 4;

type
  TdtmPlanoContasReferencial = class(TdtmBasico)
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
    dsrPlanoContasVinculado_Sinteticas: TtecDataSource;
    qryConsultaPlanostipo: TStringField;
    qryPlanoContasVinculado_Sinteticas: TtecQuery;
    qryPlanoContasVinculado_Sinteticasdescricao: TStringField;
    qryPlanoContasVinculado_Sinteticasclassificacao: TStringField;
    qryPlanoContasVinculado_Sinteticascodigo: TIntegerField;
    qryPlanoContasVinculado_Sinteticastipo: TStringField;
    frpPlano_Paisagem: TfrReport;
    fdsPlano: TfrDBDataSet;
    qryConsultaPlanosdescricaoedentada: TStringField;
    qryContaVinculada: TtecQuery;
    qryContaVinculadavinculadas: TLargeintField;
    qryPlanos: TtecQuery;
    qryPlanosdescricaoedentada: TStringField;
    qryPlanosdescricao: TStringField;
    qryPlanosclassificacao: TStringField;
    qryPlanoscodigo: TIntegerField;
    qryPlanostipo: TStringField;
    qryPlanoContasVinculado_Sinteticasnsinteticasultima: TLargeintField;
    qryPlanoContasVinculado_Sinteticasnanaliticasultima: TLargeintField;
    qryPlanoContasvalidodesde: TDateField;
    qryPlanoContasvalidoate: TDateField;
    qryPlanosorientacoes: TStringField;
    qryPlanosvalidodesde: TDateField;
    qryPlanosvalidoate: TDateField;
    qryPlanoContasorientacoes: TStringField;
    frpPlano_Retrato: TfrReport;
    procedure qryPlanoContasAfterInsert(DataSet: TDataSet);
    procedure qryPlanoContasAfterOpen(DataSet: TDataSet);
    procedure qryPlanoContasAfterClose(DataSet: TDataSet);
    procedure frpPlano_PaisagemBeforePrint(Memo: TStringList; View: TfrView);
    procedure dsrPlanoContasDataChange(Sender: TObject; Field: TField);
    procedure qryPlanoContasNewRecord(DataSet: TDataSet);
    procedure qryPlanoContasBeforeInsert(DataSet: TDataSet);
    procedure qryPlanoContasAfterCancel(DataSet: TDataSet);
    procedure qryPlanoContasAfterScroll(DataSet: TDataSet);
    procedure frpPlano_RetratoBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure qryPlanoContasBeforeOpen(DataSet: TDataSet);
    procedure qryConsultaPlanosBeforeOpen(DataSet: TDataSet);
    procedure qryPlanoContasVinculado_SinteticasBeforeOpen(
      DataSet: TDataSet);
    procedure qryContaVinculadaBeforeOpen(DataSet: TDataSet);
    procedure qryPlanosBeforeOpen(DataSet: TDataSet);
  private
    FVinculados: String;
    fultimaclassificacao: String;
    FPlanoContasVinculado_SinteticasAfterOpen: TNotifyEvent;
    fpenultimaclassificacao: String;
    FClassificacaoaVerificar: String;
    FSinteticaOriginal: String;
    fAntepenultimaclassificacao: String;
    { Private declarations }
  protected
    function  GetTabelaConsultarPlanoContas: TTecQuery;
    function  GetTabelaPlanoContas: TZDataSet;
    function ExisteContaVinculada: Boolean;
    function existeLancamento: Boolean;
  public
    NivelMascara: byte;
    UltimoNivel: byte;
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
    procedure VerificarMascaraClassificacao(classificacao: String);
    property vinculados: String read FVinculados write FVinculados;
    property ultimaclassificacao: String read fultimaclassificacao write fultimaclassificacao;
    property penultimaclassificacao: String read fpenultimaclassificacao write fpenultimaclassificacao;
    property Antepenultimaclassificacao: String read fAntepenultimaclassificacao write fAntepenultimaclassificacao;

//    procedure ValidarClassificacao;
    function  Inserindo:  Boolean;
    procedure  PercorrerPlanoContas(Campo: Byte; Key: Word; Shift: TShiftState);
    procedure ImprimirPlanoContas(ImprimirOrientacoes, Sintetico,
                                  Analitico, ContaSelecionada: Boolean;
                                  Ordenacao: integer;
                                  DataValidoDesde, DataValidoAte: String);
    property PlanoContasVinculado_SinteticasAfterOpen: TNotifyEvent
             read FPlanoContasVinculado_SinteticasAfterOpen
             write FPlanoContasVinculado_SinteticasAfterOpen;
    function VerificarClassificacao: Boolean;
    function AbilitarAnalitica: Boolean;
    function AbilitarSintetica: Boolean;
    property SinteticaOriginal: String read FSinteticaOriginal write FSinteticaOriginal;
  end;

var
  dtmPlanoContasReferencial: TdtmPlanoContasReferencial;

const
  CondicaoClassificacao_Sintetica = 'and btrim(btrim(p.classificacao,''. '')) in (%s)';
  //CondicaoClassificacao_Analitica = 'and position(btrim(btrim(%s,''. '')) in p.classificacao)=1';


implementation

uses
  //CLX
  ctconstantes, biblio;

{$R *.dfm}
constructor TdtmPlanoContasReferencial.Create(AOwner: TComponent);
begin
  inherited;
  qryConsultaPlanos.Tag := ctConsultaPlanoContas;
  if ParSistema.PermitirCODIGOnoPLANODECONTASinformado then
    qryPlanoContascodigo.AutoGenerateValue := arNone
  else
    qryPlanoContascodigo.AutoGenerateValue := arAutoInc;

  refazconsultapornome(qryPlanoContas,['campo','operacao','codigo', 'classificacao', 'descricao'], [0,0,0,null,null]);
  PercorrendoPlanoContas := True;
  PermitirExcluir := true;
end;

function TdtmPlanoContasReferencial.ExcluirPlanoContas: Boolean;
begin
  Result:= False;
  if not qryPlanoContas.IsEmpty then
  begin
    if MensagemConfirmacao(Format(ctCONFIRMEEXCLUIR, ['o registro do Plano de Contas'])) = smbok then
    begin
      result := true;
      if qryPlanoContastipo.AsString = 'S' then
      begin
        ReFazConsultapornome(qryContaVinculada,['conta'],[
         qryPlanoContasclassificacao.AsString]);
        if qryContaVinculadavinculadas.AsInteger<>1 then
        begin
          result := false;
          MensagemAviso(ctCONTANAOPODESEREXCLUIDA);
        end;
      end
      else
      begin
      {
        if existeLancamento then
        begin
          result := false;
          MensagemAviso(ctTIPOCONTANAOPODESERALTERADO);
        end;
       }
      end;

      if result then
      begin
        qryPlanoContas.Delete;
        result := Perpetrar([qryPlanoContas]);
      end;

    end
  end;
end;

function TdtmPlanoContasReferencial.ExistePlanoContas(campo, codigo: string): boolean;
begin
  if campo = 'descricaoedentada' then
    Result:= ExisteCodigo(qryConsultaPlanos, 'descricao', codigo)
  else
    Result:= ExisteCodigo(qryConsultaPlanos, campo, trim(codigo));
end;

function TdtmPlanoContasReferencial.GetTabelaConsultarPlanoContas: TTecQuery;
begin
  Result := qryConsultaPlanos;
end;

function TdtmPlanoContasReferencial.GetTabelaPlanoContas: TZDataSet;
begin
  Result:= qryPlanoContas;
end;

function TdtmPlanoContasReferencial.GravarPlanoContas: Boolean;
begin
  if qryPlanoContas.CheckRequiredFields then begin
    result := ValidarContas(false) and VerificarClassificacao;
{
    if (qryplanocontas.State <> dsInsert) and
       (qryPlanoContastipo.AsString = 'A') and
       (SinteticaOriginal <> penultimaclassificacao) and
       existeLancamento then
    begin
      result :=  MensagemConfirmacao(ctCONTAANALITICARECALCULO) = smbok;
      if result then
        qryAcumularSaldosContabeis.Params[0].AsInteger := ParSistema.EXERCICIOCONTABILIDADE
      else
        qryAcumularSaldosContabeis.Params[0].Clear;
    end;
}
    if result then
    begin
      if (qryPlanoContas.State in [dsInsert]) and
         (qryPlanoContascodigo.AsInteger=0) then begin
         spcPlanosProximo.Open;
         qryPlanoContascodigo.AsInteger := spcPlanosProximoCodigo.AsInteger;
         spcPlanosProximo.Close;
      end;

      qryPlanoContasclassificacao.AsString := trim(Trocar(qryPlanoContasclassificacao.AsString,'. ',''));

      if qryPlanoContas.State in [dsEdit,dsInsert] then begin
        qryPlanoContas.Post;
        Perpetrar([qryPlanoContas]);
{
        if not qryAcumularSaldosContabeis.Params[0].IsNull then
        begin
          ShowProcessando;
          qryAcumularSaldosContabeis.Open;
          qryAcumularSaldosContabeis.Close;
          ShowProcessando;
        end;
}        
      end;
      Result := True
    end;
  end else
   Result := False

end;

function TdtmPlanoContasReferencial.IncluirPlanoContas: Boolean;
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
 Result := True;
end;

function TdtmPlanoContasReferencial.PosicionarRegistroPlanoContas: Boolean;
begin
  Result:= ExistePlanoContas(qryPlanoContascodigo.FieldName, qryPlanoContascodigo.asString);
end;

procedure TdtmPlanoContasReferencial.SelecionarPlanoContas;
begin
  refazconsultapornome(qryPlanoContas, ['campo','operacao','codigo', 'classificacao', 'descricao'],
       [0,0,qryConsultaPlanosCodigo.AsVariant,
       qryConsultaPlanosClassificacao.AsVariant,
       qryConsultaPlanosDescricao.AsVariant]);
end;

function TdtmPlanoContasReferencial.SelecionarVinculados(
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
    Nivel := 1;
    //Tamanho := length(ParSistema.mascaracontabil[2].Strings[nivel])-4;
    //vmascara := copy(ParSistema.mascaracontabil[2].Strings[nivel],
    //            1,length(ParSistema.mascaracontabil[2].Strings[nivel])-4);

    vmascara := '9.99.99.99.99.99.99';

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
    begin
      penultimaclassificacao := aclassificacao[j-2];
      antepenultimaclassificacao := aclassificacao[j-2];
      if j>2 then
        antepenultimaclassificacao := aclassificacao[j-3];
    end
    else
    begin
//      penultimaclassificacao := '0';
      penultimaclassificacao := ultimaclassificacao;
      antepenultimaclassificacao := ultimaclassificacao;
    end;

    result := vretorno;
end;

procedure TdtmPlanoContasReferencial.VerificarMascaraClassificacao(classificacao: String);
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
  if PossuiNumero(classificacao) then
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

procedure TdtmPlanoContasReferencial.qryPlanoContasAfterInsert(DataSet: TDataSet);
begin
  inherited;
//  qryPlanoContasExercicio.AsVariant := ParSistema.EXERCICIOCONTABILIDADE;
end;

procedure TdtmPlanoContasReferencial.qryPlanoContasAfterOpen(DataSet: TDataSet);
begin
  inherited;
  VerificarMascaraClassificacao(qryPlanoContasclassificacao.AsString);
end;

{
procedure TdtmPlanoContasReferencial.ValidarClassificacao;
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

function TdtmPlanoContasReferencial.Inserindo: Boolean;
begin
  result := qryPlanoContas.State = dsinsert;
end;

procedure TdtmPlanoContasReferencial.PercorrerPlanoContas(Campo: Byte; Key: Word;
  Shift: TShiftState);
var Operacao: Byte;
    codigo: Integer;
    classificacao, descricao {, DataValidoDesde, DataValidoAte}:      String;
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

(*       cmpDataValidoDesde: case Operacao of
                            Primeiro,
                            Proximo:  MacroByName('Ordenacao').AsString:=
                                                  'ORDER BY validodesde, classificacao, UPPER(TO_ASCII(Descricao,''LATIN1'')), codigo LIMIT 1';
                            Anterior,
                            Ultimo:   MacroByName('Ordenacao').AsString:=
                                                  'ORDER BY validodesde DESC, classificacao DESC, UPPER(TO_ASCII(Descricao,''LATIN1'')) DESC, codigo DESC LIMIT 1';
                         end;

         cmpDataValidoAte: case Operacao of
                            Primeiro,
                            Proximo:  MacroByName('Ordenacao').AsString:=
                                                  'ORDER BY validoate, classificacao, UPPER(TO_ASCII(Descricao,''LATIN1'')), codigo LIMIT 1';
                            Anterior,
                            Ultimo:   MacroByName('Ordenacao').AsString:=
                                                  'ORDER BY validoate DESC, classificacao DESC, UPPER(TO_ASCII(Descricao,''LATIN1'')) DESC, codigo DESC LIMIT 1';
                         end;
 *)
      end;

      codigo         := qryPlanoContascodigo.         AsInteger;
      classificacao  := qryPlanoContasclassificacao.  AsString;
      descricao      := qryPlanoContasdescricao.      AsString;

{      DataValidoDesde:= qryPlanoContasvalidodesde.    AsString;
      DataValidoAte  := qryPlanoContasvalidoate.      AsString;

      if DataValidoDesde = '' then
        DataValidoDesde := '30/12/1899';

      if DataValidoAte = '' then
        DataValidoAte := '30/12/1899';
}

      RefazConsultapornome(qryPlanoContas, ['campo','operacao','codigo', 'classificacao', 'descricao'],
                    [Campo, Operacao, qryPlanoContascodigo.         AsInteger,
                                      qryPlanoContasclassificacao.  AsString,
                                      qryPlanoContasdescricao.      AsString{,
                                      DataValidoDesde,
                                      DataValidoAte}]);

      if qryPlanoContas.RecordCount = 0 then
      begin
         {
         if (campo = cmpDataValidoDesde) and (DataValidoDesde = '30/12/1899') then
           MensagemAviso('Não Existem contas validas desde')
         else
         if (campo = cmpDataValidoAte) and (DataValidoAte = '30/12/1899') then
           MensagemAviso('Não Existem contas validas até');
           }

         RefazConsultapornome(qryPlanoContas, ['campo','operacao','codigo', 'classificacao', 'descricao'],
                      [PosicaoAtual, PosicaoAtual, codigo, classificacao, descricao{, DataValidoDesde, DataValidoAte}]);

         case Operacao of
            Anterior,Primeiro: {case Campo of
                                 cmpDataValidoDesde : if (DataValidoDesde<>'30/12/1899') then
                                                    MensagemAviso('Esta é a 1ª conta válida desde');
                                 cmpDataValidoAte : if (DataValidoAte<>'30/12/1899') then
                                                    MensagemAviso('Esta é a 1ª conta válida até');
                               else}
                                 MensagemAviso('Esta é a 1ª conta')
                               {end};

            Proximo, Ultimo  : {case Campo of
                                 cmpDataValidoDesde : if (DataValidoDesde<>'30/12/1899') then
                                                    MensagemAviso('Esta é a última conta válida desde');
                                 cmpDataValidoAte : if (DataValidoAte<>'30/12/1899') then
                                                    MensagemAviso('Esta é a última conta válida até');
                               else}
                                 MensagemAviso('Esta é a última conta')
                               {end};
         end;


         case campo of
            1: qryPlanoContascodigo.FocusControl;
            2: qryPlanoContasclassificacao.FocusControl;
            3: qryPlanoContasdescricao.FocusControl;
            4: qryPlanoContasvalidodesde.FocusControl;
            5: qryPlanoContasvalidoate.FocusControl;
         end;
      end;
  //   EnableControls;
   end;
end;


procedure TdtmPlanoContasReferencial.qryPlanoContasAfterClose(DataSet: TDataSet);
begin
  inherited;
  qryPlanoContas.Params[0].AsInteger := 0;
  qryPlanoContas.Params[1].AsInteger := 0;
end;

procedure TdtmPlanoContasReferencial.ImprimirPlanoContas(ImprimirOrientacoes,
                         Sintetico, Analitico, ContaSelecionada: Boolean;
                         Ordenacao: integer;
                         DataValidoDesde, DataValidoAte: String);
const

  SQLConta = 'and position(btrim(btrim(%s,''. '')) in pl.classificacao)=1';

  SQLInatividade = ' and pl.inativo <= cast(%s as date)';
  SQLInatividade2 = ' and ((pl.inativo <= cast(%s as date)) or (pl.inativo is null))';
  SQLSemInativos = ' and pl.inativo is null ';
  SQLDataValidadeDesde = ' and (pl.ValidoDesde >= %s or pl.ValidoDesde is null)';
  SQLDataValidoAte = ' and (pl.ValidoAte <= %s or pl.ValidoAte is null)';

var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
  dataInicial, dataFinal : String;
begin
  frVariables['Ordenacao'] := Ordenacao;

  frVariables['Titulo']:= 'PLANO DE CONTAS REFERENCIAL - EXERCÍCIO '+inttostr(parsistema.EXERCICIOCONTABILIDADE);
  frVariables['subTitulo']:= '';

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

  if DataValidoDesde<>'' then
    qryPlanos.MacroByName('DataValidadeDesde').AsString := format(SQLDataValidadeDesde, [quotedstr(FormatDateTime('yyyy-mm-dd',strtodatetime(DataValidoDesde)))])
  else
    qryPlanos.MacroByName('DataValidadeDesde').AsString := '';

  if DataValidoAte<>'' then
     qryPlanos.MacroByName('DataValidoAte').AsString := format(SQLDataValidoAte, [quotedstr(FormatDateTime('yyyy-mm-dd',strtodatetime(DataValidoAte)))])
  else
     qryPlanos.MacroByName('DataValidoAte').AsString := '';

  case Ordenacao of
   0: qryPlanos.MacroByName('ordenacao').AsString := 'order by pl.classificacao, UPPER(TO_ASCII(pl.Descricao,''LATIN1'')), pl.codigo';
   1: qryPlanos.MacroByName('ordenacao').AsString := 'order by UPPER(TO_ASCII(pl.Descricao,''LATIN1'')), pl.classificacao, pl.codigo';
  end;

  refazconsulta(qryPlanos,[],[]);

//    frpPlanosFiliais.DesignReport;

  frmPreview := TfrmPreviewPadrao.create(self);
  frmPreview.cmbZoom.ItemIndex := 3; //125%
  try
   Relatorio := frmPreview.frCompositeReport;
   with frmPreview do
   begin
    frCompositeReport.Reports.Clear;
    if ImprimirOrientacoes then
      frCompositeReport.Reports.Add(frpPlano_Paisagem)
    else
      frCompositeReport.Reports.Add(frpPlano_Retrato);
   end;
   Relatorio.Preview := frmPreview.frPreviewPadrao;
   Relatorio.ShowReport;
   frmPreview.ShowModal;
  finally
   frmPreview.Free;
  end;
end;

procedure TdtmPlanoContasReferencial.frpPlano_PaisagemBeforePrint(Memo: TStringList;
  View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpPlano_Paisagem, view);
end;

procedure TdtmPlanoContasReferencial.dsrPlanoContasDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
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

function TdtmPlanoContasReferencial.ExisteContaVinculada: Boolean;
begin
  if qryPlanoContasclassificacao.AsString<>'' then
    ReFazConsultapornome(qryContaVinculada,['conta'],[qryPlanoContasclassificacao.AsString])
  else
    ReFazConsultapornome(qryContaVinculada,['conta'],[0]);

  result := qryContaVinculadavinculadas.AsInteger<>0;
end;

procedure TdtmPlanoContasReferencial.qryPlanoContasNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryPlanoContastipo.AsString := 'A';
end;

function TdtmPlanoContasReferencial.ValidarContas(ExibirMsg:Boolean): Boolean;
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

function TdtmPlanoContasReferencial.existeLancamento: Boolean;
var
 datainicial : String;
begin
{
  datainicial := '01/01/'+inttostr(parsistema.EXERCICIOCONTABILIDADE);
  ReFazConsulta(qryExisteLancto,[0,1], [qryPlanoContascodigo.AsVariant,datainicial]);
  result := qryExisteLanctoexiste.AsBoolean;
  }
end;

procedure TdtmPlanoContasReferencial.qryPlanoContasBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  qryPlanoContasVinculado_Sinteticas.close;
  //qryPlanoContasVinculado_Analiticas.close;
end;

function TdtmPlanoContasReferencial.VerificarClassificacao: Boolean;
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
          result :=(penultimaclassificacao = qryPlanoContasVinculado_Sinteticasclassificacao.AsString) or
                   (antepenultimaclassificacao = qryPlanoContasVinculado_Sinteticasclassificacao.AsString) or
                   (qryPlanoContasVinculado_Sinteticas.RecordCount=0);
      end
      else
      begin
        if qryPlanoContastipo.AsString = 'A' then
          result :=(penultimaclassificacao = qryPlanoContasVinculado_Sinteticasclassificacao.AsString) or
                   (antepenultimaclassificacao = qryPlanoContasVinculado_Sinteticasclassificacao.AsString) or
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

function TdtmPlanoContasReferencial.AbilitarAnalitica: Boolean;
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

function TdtmPlanoContasReferencial.AbilitarSintetica: Boolean;
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

procedure TdtmPlanoContasReferencial.qryPlanoContasAfterCancel(DataSet: TDataSet);
begin
  inherited;
  VerificarMascaraClassificacao(qryPlanoContasclassificacao.AsString);
end;

procedure TdtmPlanoContasReferencial.qryPlanoContasAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if qryPlanoContastipo.AsString = 'A' then
    SinteticaOriginal := penultimaclassificacao
end;

procedure TdtmPlanoContasReferencial.frpPlano_RetratoBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpPlano_Retrato, view);
end;

procedure TdtmPlanoContasReferencial.qryPlanoContasBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryPlanoContas.ParamByName('TipoPlano').AsString := parsistema.TiposPlanosReferenciais;
end;

procedure TdtmPlanoContasReferencial.qryConsultaPlanosBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryConsultaPlanos.ParamByName('TipoPlano').AsString := parsistema.TiposPlanosReferenciais;
end;

procedure TdtmPlanoContasReferencial.qryPlanoContasVinculado_SinteticasBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryPlanoContasVinculado_Sinteticas.ParamByName('TipoPlano').AsString := parsistema.TiposPlanosReferenciais;
end;

procedure TdtmPlanoContasReferencial.qryContaVinculadaBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryContaVinculada.ParamByName('TipoPlano').AsString := parsistema.TiposPlanosReferenciais;
end;

procedure TdtmPlanoContasReferencial.qryPlanosBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryPlanos.ParamByName('TipoPlano').AsString := parsistema.TiposPlanosReferenciais;
end;

end.

