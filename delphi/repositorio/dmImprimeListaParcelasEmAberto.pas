(****************************************************************
  Está unit é reposnsavel pela impressão de parcelas em aberto.

  Copyright (c) 1998 TecSoft Tecnologia em Sistema.
                        contato@tecsoft.com.br

     All rights reserved.

 Criado em  : 17/07/2006
 Autor      : Ismael Leandro Faustino
 Última Atualização : 17/07/2006

***************************************************************)

unit dmImprimeListaParcelasEmAberto;

interface

uses
  SysUtils, Classes, DB, ZQuery, ZPgSqlQuery, cpquery, ctepson, clparametrossistema,
  biblio, ctconstantes, dmbasico, dmtecsoft, cltextprinter, clfinanceira,
  ZTransact;

type
  TdtmImprimeListaParcelasEmAberto = class(TdtmBasico)
    qryParcelasContrato: TtecQuery;
    qryParcelasContratocliente: TIntegerField;
    qryParcelasContratodatavenda: TDateField;
    qryParcelasContratoparcelaorigem: TStringField;
    qryParcelasContratocontrato: TStringField;
    qryParcelasContratodatavencto: TDateField;
    qryParcelasContratovalorvencto: TFloatField;
    qryParcelasContratonome: TStringField;
    qryParcelasContratonumero: TStringField;
    qryTotalAberto: TtecQuery;
    qryTotalAbertototal: TFloatField;
    qryParcelasContratofilialvenda: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { variaveis }
    FMaxCol   : Integer;
    FCliente  : String;
    FContrato : String;
    FText     : TStringList;
    { functions }
    function getText: TStringList;
    { Private declarations }
  public
    { functions }
    function executar: Boolean;
    { propertys }
    property Cliente  : String read FCliente  write FCliente;
    property Contrato : String read FContrato write FContrato;
  protected
    { Functions }
    function abreParcelas:Boolean;
    { procedures }
    procedure add(Value:String);
    procedure imprimir;
{    procedure imprimirWindows; }
    { propertys }
    property Text : TStringList read getText;
    { Public declarations }
  end;
implementation

{$R *.dfm}

{ TdtmImprimeListaParcelasEmAberto }

{-----------------------------------------------------------------------------
Nome       : add
Objetivo   : Adiciona uma linha de texto a propriedade local Text.
Retorno    : Não tem.
Parametros : - Value : String
                  Texto a ser adicionado.
Criado em  : 17/07/2006
Responsável: Ismael Leandro Faustino
--------------------------------------------------------------------------------
Histórico de alteração:
   - [Responsável] em [Data da alteração]
        [descrição da alteração]
-------------------------------------------------------------------------------}
procedure TdtmImprimeListaParcelasEmAberto.add(Value: String);
begin
  Text.Add(Value);
end;

{-----------------------------------------------------------------------------
Nome       : executar
Objetivo   : Executa o processo de impressão de parcelas em aberto.
Retorno    : Retorna um booleano com True se concluir o processo e false se não.
Parametros : Não tem parâmetros
Criado em  : 17/07/2006
Responsável: Ismael Leandro Faustino.
--------------------------------------------------------------------------------
Histórico de alteração:
   - [Responsável] em [Data da alteração]
        [descrição da alteração]
-------------------------------------------------------------------------------}
function TdtmImprimeListaParcelasEmAberto.executar: Boolean;
var
  Linha: String;
  valorFormat : String;
  valorParcela : Real;
  TotalEmAberto: Real;
begin
  Result := False;
  TotalEmAberto:=0;
  if abreParcelas then
  begin
    try
      Linha := 'PARCELAS EM ABERTO'+preencheString(FormatDateTime('dd/mm/yy hh:mm', now), ' ', 26, False);
      add(Linha);
      add('');
      Linha := 'CLIENTE: ' + preencheString(qryParcelasContratocliente.AsString, ' ', 10, False) + ' - ' + preencheString(qryParcelasContratonome.AsString, ' ', 23);
      add(Linha);
      add('');
      Linha := 'N CONTRATO   P  COMPRA    VENCTO    VLR.ATUAL';
      add(Linha);
      add(preencheString('', '-', 44));
      qryParcelasContrato.SortByField('datavencto');
      qryParcelasContrato.First;
      while not qryParcelasContrato.Eof do
      begin
        Linha := preencheString(qryParcelasContratonumero.AsString                                            ,' ', 10, False);
        Linha := Linha + preencheString(qryParcelasContratoparcelaorigem.AsString                             ,' ',  4, False);
        Linha := Linha + preencheString(FormatDateTime('dd/mm/yy',qryParcelasContratodatavenda.AsDateTime)    ,' ', 10, False);
        Linha := Linha + preencheString(FormatDateTime('dd/mm/yy',qryParcelasContratodatavencto.AsDateTime)   ,' ', 10, False);
        valorParcela := qryParcelasContratovalorvencto.AsCurrency + tecFinanceira.CalcularJuros(qryParcelasContratovalorvencto.AsCurrency, qryParcelasContratodatavencto.AsDateTime, Now, qryParcelasContratofilialvenda.asinteger);
        TotalEmAberto:=TotalEmAberto+ValorParcela;
        valorFormat := Format('%9s',[trim(Trocar(Trocar(Format('%6.2m',[valorParcela]),'R',''),'$',''))]);
        Linha := Linha + preencheString(valorFormat,' ', 10, False);
        add(Linha);
        qryParcelasContrato.Next;
      end;
      add('');
      add('');
      //valorFormat := Format('%9s',[trim(Trocar(Trocar(Format('%6.2m',[qryTotalAbertototal.AsFloat]),'R',''),'$',''))]);
      valorFormat := Format('%9s',[trim(Trocar(Trocar(Format('%6.2m',[TotalEmAberto]),'R',''),'$',''))]);
      Linha := '                TOTAL EM ABERTO R$'+preencheString(valorFormat, ' ', 10, False);
      add(Linha);
      imprimir;
      Result := True;
    except
      Result := False;
    end;
  end;
end;

{-----------------------------------------------------------------------------
Nome       : getText
Objetivo   : Utilizado na propriedade Text. Quando invocada a propriedade retorna a
             variavel FText que é a que esta sendo utilizada.
Retorno    : Retorna um StringList
Parametros : Não tem.
Criado em  : 17/07/2006
Responsável: Ismael Leandro Faustino
--------------------------------------------------------------------------------
Histórico de alteração:
   - [Responsável] em [Data da alteração]
        [descrição da alteração]
-------------------------------------------------------------------------------}
function TdtmImprimeListaParcelasEmAberto.getText: TStringList;
begin
  Result := FText;
  if not Assigned(FText) then
    FText := TStringList.Create;
end;

{-----------------------------------------------------------------------------
Nome       : imprimirLinux
Objetivo   : executa o processo de impressão para linux.
Retorno    : Não tem.
Parametros : Não tem.
Criado em  : 17/07/2006
Responsável: Ismael Leandro Faustino.
--------------------------------------------------------------------------------
Histórico de alteração:
   - [Responsável] em [Data da alteração]
        [descrição da alteração]
-------------------------------------------------------------------------------}
procedure TdtmImprimeListaParcelasEmAberto.imprimir;
var
  i : Integer;
begin
  NomeImpressoraEscolhida := ParSistema.NomeImpressoraFechamentoCaixa;
  //TextPrinter.BeginDoc('',False);
  if ParSistema.Autenticadora in [1,2,4] then
  begin
    TextPrinter.BeginDoc('',True);
    TextPrinter.writeText(#$0F,0);
  end
  else
  begin
    TextPrinter.BeginDoc('',True);
    TextPrinter.WriteText(EPS_ON_CONDENSED,0);
  end;

  for i := 0 to Text.Count-1 do
    TextPrinter.WriteTextln(Text.Strings[i], 0);

  if ParSistema.Autenticadora in [1,4] then
    TextPrinter.writeText(#$12, 0)
  else
    if ParSistema.Autenticadora = 2 then
      TextPrinter.writeText(#$56, 0)
    else
      TextPrinter.writeText(EPS_OFF_CONDENSED,0);

  TextPrinter.Writeln;
  TextPrinter.Writeln;
  TextPrinter.Writeln;
  TextPrinter.Writeln;
  TextPrinter.Writeln;
  TextPrinter.Writeln;
  TextPrinter.Writeln;
  TextPrinter.EndDoc('TecLUX - Imprimindo parcelas em Aberto.');
end;

{-----------------------------------------------------------------------------
Nome       : DataModuleCreate
Objetivo   : Constructor do data module.
Retorno    : Não tem.
Parametros : - Sender : TObject
                  Sender é do tipo TObject mas o valor contido nele é do tipo
                  TDataModule.
Criado em  : 17/07/2006
Responsável: Ismael Leandro Faustino
--------------------------------------------------------------------------------
Histórico de alteração:
   - [Responsável] em [Data da alteração]
        [descrição da alteração]
-------------------------------------------------------------------------------}
procedure TdtmImprimeListaParcelasEmAberto.DataModuleCreate(
  Sender: TObject);
begin
  inherited;
  FMaxCol := ParSistema.MaxColAutenticadora;
  FText   := TStringList.Create;
end;

{-----------------------------------------------------------------------------
Nome       : DataModuleDestroy
Objetivo   : Destrutor do data module.
Retorno    : Não tem.
Parametros : - Sender : TObject
                  Sender é do tipo TObject mas o valor contido nele é do tipo
                  TDataModule.
Criado em  : 17/07/2006
Responsável: Ismael Leandro Faustino
--------------------------------------------------------------------------------
Histórico de alteração:
   - [Responsável] em [Data da alteração]
        [descrição da alteração]
-------------------------------------------------------------------------------}
procedure TdtmImprimeListaParcelasEmAberto.DataModuleDestroy(
  Sender: TObject);
begin
  inherited;
  if Assigned(FText) then
    FText.Free;
end;

{-----------------------------------------------------------------------------
Nome       : abreParcelas
Objetivo   : Este processo valida os parêmetros necessários par fazer a impressão
             e executar a consulta no banco.
Retorno    : Retorna um booleano com True se não ocorrer erro e do contrario false.
Parametros : Não tem.
Criado em  : 17/07/2006
Responsável: Ismael Leandro Faustino.
--------------------------------------------------------------------------------
Histórico de alteração:
   - [Responsável] em [Data da alteração]
        [descrição da alteração]
-------------------------------------------------------------------------------}
function TdtmImprimeListaParcelasEmAberto.abreParcelas: Boolean;
var
  ok : Boolean;
begin
  ok := True;
  if Cliente = '' then
    ok := False;
  if ok then
  begin
//    qryParcelasContrato.Sql.Add('where c.cliente = :cliente and p.datapagto is null');
    qryParcelasContrato.ParamByName('cliente').AsString := Cliente;
//    qryTotalAberto.Sql.Add('where c.cliente = :cliente and p.datapagto is null');
    qryTotalAberto.ParamByName('cliente').AsString := Cliente;
    { Coloquei este if pois o contrato deve ser opcional }
    if FContrato <> '' then
    begin
      qryParcelasContrato.macrobyname('Condicao').asString := ' and c.contrato in (:contrato)';
      qryParcelasContrato.ParamByName('contrato').AsString := Contrato;
      qryTotalAberto.Sql.Strings[10] := ' and c.contrato in (:contrato)';
      qryTotalAberto.ParamByName('contrato').AsString := Contrato;
    end;
    try
      qryParcelasContrato.close;
      qryParcelasContrato.Open;
      qryTotalAberto     .Open;
      ok := True;
    except
      ok := False;
    end;
  end;
  Result := ok;
end;

end.

