unit dmimprimeboleto;
interface

uses
  SysUtils, Classes, Types, Variants, Graphics, Controls, Forms, Dialogs, DB,
  //Terceiros
  ZQuery, ZPgSqlQuery,
  //Biblio
  biblio, ctconstantes, clparametrossistema, clusuario,
  //Repositorio
  dmbasico, dmtecsoft, ACBrBoleto, ACBrBoletoFCFortesFr, 
  //Componentes
  cpquery, ACBrBase, ZTransact, RLConsts, ACBrBoletoConversao;

type
  TdtmImprimeBoleto = class(TdtmBasico)
    qryParcelas: TtecQuery;
    qryModelosBoletos: TtecQuery;
    qryModelosBoletoscodigo: TIntegerField;
    qryModelosBoletosconfigurar: TStringField;
    qryModelosBoletoscabecalho: TStringField;
    qryModelosBoletosemaberto: TStringField;
    qryModelosBoletoscomatraso: TStringField;
    qryModelosBoletossematraso: TStringField;
    qryModelosBoletosrodape: TStringField;
    qryModelosBoletosimprimirlayout: TBooleanField;
    qryParcelascontrato: TStringField;
    qryParcelasnumero: TIntegerField;
    qryParcelasdatavencto: TDateField;
    qryParcelasvalorvencto: TFloatField;
    qryParcelasdatapagto: TDateField;
    qryParcelasvalorpagto: TFloatField;
    qryParcelasjurosbloquete: TFloatField;
    qryParcelasjurodesconto: TFloatField;
    qryParcelasdiasatraso: TIntegerField;
    qryParcelasjurosdias: TFloatField;
    qryParcelascliente: TIntegerField;
    qryParcelasnome: TStringField;
    qryParcelasrua: TStringField;
    qryParcelaspessoanumero: TStringField;
    qryParcelasdata: TDateField;
    qryParcelascidadecliente: TStringField;
    qryParcelasbairrocliente: TStringField;
    qryParcelascepcliente: TStringField;
    qryParcelasestadofilial: TStringField;
    qryParcelasfilial: TIntegerField;
    qryParcelasrazaocarne: TStringField;
    qryParcelasestadocliente: TStringField;
    qryParcelasnomepessoanumero: TStringField;
    qryParcelasruacepcidadeestado: TStringField;
    qryParcelasdiasatraso1: TStringField;
    qryParcelasdiasatraso2: TStringField;
    qryParcelaspercentualatrasojuros1: TStringField;
    qryParcelaspercentualatrasojuros: TStringField;
    qryParcelaspercentualatrasomultas1: TStringField;
    qryParcelaspercentualatrasomultas2: TStringField;
    qryParcelasjurosatraso1: TFloatField;
    qryParcelasjurosatraso2: TFloatField;
    qryModelosBoletosmatricial: TBooleanField;
    qryContaCobranca: TtecQuery;
    qryParcelasjurosdiasreais: TFloatField;
    qryParcelaspessoanumeroformatado: TStringField;
    qryParcelasBanco: TtecQuery;
    qryParcelasBancocarteira: TStringField;
    qryParcelasBancocedente_codigocedente: TStringField;
    qryParcelasBancocedente_contabancaria_banco_codigo: TIntegerField;
    qryParcelasBancocedente_contabancaria_codigoagencia: TIntegerField;
    qryParcelasBancocedente_contabancaria_digitoconta: TStringField;
    qryParcelasBancocedente_contabancaria_numeroconta: TIntegerField;
    qryParcelasBancousodobanco: TStringField;
    qryParcelasBancocedente_endereco_bairro: TStringField;
    qryParcelasBancocedente_endereco_cep: TStringField;
    qryParcelasBancocedente_endereco_cidade: TStringField;
    qryParcelasBancocedente_endereco_estado: TStringField;
    qryParcelasBancocedente_endereco_rua: TStringField;
    qryParcelasBancocedente_nome: TStringField;
    qryParcelasBancocedente_numerocpfcgc: TStringField;
    qryParcelasBancodatadocumento: TDateField;
    qryParcelasBancopercentualdesconto: TFloatField;
    qryParcelasBancodiasatraso1: TStringField;
    qryParcelasBancopercentualmorajuros: TFloatField;
    qryParcelasBancodatavencto: TDateField;
    qryParcelasBancoinstrucoes: TStringField;
    qryParcelasBancolocalpagamento: TStringField;
    qryParcelasBanconotafiscal: TIntegerField;
    qryParcelasBancocontrato: TStringField;
    qryParcelasBancosacado_endereco_bairro: TStringField;
    qryParcelasBancosacado_endereco_cep: TStringField;
    qryParcelasBancosacado_endereco_cidade: TStringField;
    qryParcelasBancosacado_endereco_estado: TStringField;
    qryParcelasBancosacado_endereco_rua: TStringField;
    qryParcelasBancosacado_nome: TStringField;
    qryParcelasBancopessoatipo: TStringField;
    qryParcelasBancosacado_numerocpfcgc: TStringField;
    qryParcelasBancoseunumero: TMemoField;
    qryParcelasBancovalordocumento: TFloatField;
    qryParcelasBancoValorDesconto: TFloatField;
    qryParcelasBancoDataDesconto: TDateField;
    qryParcelasBancoDataMoraJuros: TDateField;
    qryParcelasBancoValorMoraJuros: TFloatField;
    qryParcelasBancoNumeroDocumento: TStringField;
    qryParcelasBancosacado_endereco_numero: TIntegerField;
    qryParcelasBancosacado_endereco_complemento: TStringField;
    qryParcelasBancosacado_email: TStringField;
    qryParcelasBancosacado_fone_numero: TIntegerField;
    qryParcelasBancosacado_fone_ddd: TIntegerField;
    qryParcelasBanconrviasboleto: TIntegerField;
    qryParcelasBancolocalpagamento2: TStringField;
    qryParcelasBanconumeroparcela: TIntegerField;
    qryParcelasnumeronota: TStringField;
    qryParcelasBanconossonumero: TLargeintField;
    qryParcelasBancocedente_contabancaria_digitoagencia: TStringField;
    qryParcelasBancojurosdiasreais: TFloatField;
    qryParcelasBancoPercentualMoraMulta: TFloatField;
    qryParcelasBancocedente_contabancaria_convenio: TLargeintField;
    qryParcelasBancorua_endcedente: TStringField;
    qryParcelasBancoestado_endcedente: TStringField;
    qryParcelasBancocidade_endcedente: TIntegerField;
    qryParcelasBancobairro_endcedente: TIntegerField;
    qryParcelasBanconomebairro_endcedente: TStringField;
    qryParcelasBancocep_endcedente: TIntegerField;
    qryParcelasBanconumero_endcedente: TIntegerField;
    qryParcelasBancocomplemento_endcedente: TStringField;
    qryParcelasBanconomecidade_endcedente: TStringField;
    qryParcelasBancocedente_endereco_numero: TIntegerField;
    qryParcelasBancocedente_endereco_complemento: TStringField;
    qryParcelasBancodigverificadornossonumero: TStringField;
    qryParcelasBancosacador_avalista: TStringField;
    qryParcelasBancocpf_cnpj_sacador_avalista: TStringField;
    BoletoPadrao: TACBrBoleto;
    BoletoPadraoImprimir: TACBrBoletoFCFortes;
    procedure qryParcelasBancoCalcFields(DataSet: TDataSet);
    procedure qryParcelasBancoBeforeOpen(DataSet: TDataSet);


  protected
    function ImprimirBoleto(SomenteAbertas: Boolean): Boolean;
    function ImprimirBoletoCodigodeBarras(Gerarpdf : boolean = false): Boolean;
    function ObterParcelas(Contrato: String): Boolean;overload;
    function ObterParcelas(Contrato: String; NumeroParcelas: vString): Boolean;overload;
    function ObterParcelas2(SQLParcelas: String): Boolean;

  private
    fContaBancaria: Integer;
    vListaBoletos : TStringList;
    function GetContaBancaria: Integer;
    { Private declarations }

  public
    { Public declarations }
    destructor  Destroy; override;

    function ImprimirBoletoContrato(Contrato: String; NumeroParcelas: vString): Boolean; overload;
    function ImprimirBoletoContrato(SQLParcelas: String; ContaBancaria: Integer = 0): Boolean; overload;

    property ContaBancaria: Integer read GetContaBancaria write fContaBancaria;

    class function GerarBoletoPDF(Contrato: String; var vListaBoletos: TStringList): boolean; overload;
    class function GerarBoletoPDF(Contrato: String; NumeroParcelas: vString; var vListaBoletos: TStringList): boolean; overload;

  end;

var
  dtmImprimeBoleto: TdtmImprimeBoleto;


implementation

uses //Componentes
       cltextprinter, DateUtils;
       {fmimprimeboletografico,}

       

{$R *.dfm}


function TdtmImprimeBoleto.ImprimirBoletoContrato(Contrato: String; NumeroParcelas: vString): Boolean;
var Parcela: String;
    c: Integer;
begin
  Result := False;
  if ObterParcelas(Contrato, NumeroParcelas) then
  begin
    try
      if qryModelosBoletosmatricial.AsBoolean then
        Result := ImprimirBoleto(false)
      else
        Result := ImprimirBoletoCodigodeBarras;
    except
      raise
    end
  end;
end;

//----------- IMPRESSAO BOLETO FRETTA & FRETTA ----------------------------------------------------------------------
function TdtmImprimeBoleto.ImprimirBoleto(SomenteAbertas: Boolean): Boolean;
begin
  Result := False;
  NomeImpressoraEscolhida:= parsistema.NomeImpressoraBoleto;

  with TextPrinter do begin
    BeginDoc(qryModelosBoletosconfigurar.AsString);
         qryParcelas.First;
         while not qryParcelas.Eof do begin
            if (qryParcelasvalorpagto.AsCurrency = 0) or not SomenteAbertas then begin
              BandString := qryModelosBoletosCABECALHO.AsString;
              WriteBand(qryParcelas.Fields);
              if (qryParcelasvalorpagto.AsCurrency > 0) then begin
                if not SomenteAbertas then begin
                  if (qryParcelasVALORPAGTO.AsCurrency > qryParcelasVALORVENCTO.AsCurrency) then begin
                     BandString:= qryModelosBoletosCOMATRASO.AsString;
                     BreakToLine;
                     WriteBand(qryParcelas.Fields);
                  end
                  else begin
                    BandString:= qryModelosBoletosSEMATRASO.AsString;
                    BreakToLine;
                    WriteBand(qryParcelas.Fields);
                  end;
                end;
              end
              else begin
                BandString:= qryModelosBoletosEMABERTO.AsString;
                BreakToLine;
                WriteBand(qryParcelas.Fields);
              end;

              if qryModelosBoletosImprimirlayout.AsBoolean and not SomenteAbertas then begin
                if qryModelosBoletosRODAPE.AsString <> '' then begin
                   BandString:= qryModelosBoletosRODAPE.AsString;
                   BreakToLine;
                   WriteBand(qryParcelas.Fields);
                end;
              end;
              FormFeed;
            end;
            qryParcelas.Next;
         end;
    EndDoc('TecLUX - Boleto');
  end;
end;


function TdtmImprimeBoleto.ImprimirBoletoCodigodeBarras(Gerarpdf : boolean = false): Boolean;
var i, j,
    NrParcelas: Integer;
    Titulo : TACBrTitulo;
//    BoletoPadrao: TACbrBoleto;
//    BoletoPadraoImprimir: TACBrBoletoFCFortes;

begin
   Result := False;
   qryParcelasBanco.Close;
   qryParcelasBanco.ParamByName('UsarDadosdaFilialBase').AsBoolean := ParSistema.Usar_dados_da_filial_base_na_impressao_de_boletos;
   qryParcelasBanco.ParamByName('FilialBoleto').AsInteger := FilialBase;
   qryParcelasBanco.Open;

   NrParcelas := qryParcelasBanco.RecordCount;

   if NrParcelas > 0 then
   begin
      BoletoPadrao                := TACBrBoleto.Create(Self);
      BoletoPadraoImprimir        := TACBrBoletoFCFortes.Create(BoletoPadrao);
      BoletoPadraoImprimir.DirLogo:= ParSistema.DiretorioImagens;
      BoletoPadrao.ACBrBoletoFC   := BoletoPadraoImprimir;
      BoletoPadrao.LayoutRemessa  := c240;

      try
         for i := 1 to NrParcelas do
         begin
             for j := 1 to qryParcelasBanconrviasboleto.AsInteger do begin
                 Titulo := BoletoPadrao.CriarTituloNaLista;
                 with Titulo do begin
                    with ACBrBoleto.Banco do begin
                       case qryParcelasBancocedente_contabancaria_banco_codigo.AsInteger of
                          001: TipoCobranca := cobBancoDoBrasil;
                          021: TipoCobranca := cobBanestes;

                          033,
                          353,
                          088: TipoCobranca := cobSantander;
                          085: TipoCobranca := cobBancoCECRED;

                          041,056: TipoCobranca := cobBanrisul;
                          104: TipoCobranca := cobCaixaEconomica;
                          237, 087: TipoCobranca := cobBradesco;
                          341: TipoCobranca := cobItau;
                          389: TipoCobranca := cobBancoMercantil;
                          748: TipoCobranca := cobSicred;
                          756: TipoCobranca := cobBancoob;
                          399: TipoCobranca := cobHSBC;
                       end;

//                     Numero := qryParcelasBancocedente_contabancaria_banco_codigo.AsInteger;
//                     Digito := StrToInt(Modulo11(qryParcelasBancocedente_contabancaria_banco_codigo.AsString));
                    end;


                    with ACBrBoleto.Cedente do begin
                       CodigoCedente := qryParcelasBancocedente_codigocedente.AsString;
                       Nome          := qryParcelasBancocedente_nome.AsString;

                       Agencia       := qryparcelasBancoCedente_ContaBancaria_CodigoAgencia.AsString;
                       if qryParcelasBancocedente_contabancaria_digitoagencia.AsString <> ''
                       then AgenciaDigito:=qryParcelasBancocedente_contabancaria_digitoagencia.AsString
                       else AgenciaDigito := Modulo11(qryparcelasBancoCedente_ContaBancaria_CodigoAgencia.AsString);

                       Conta         := qryParcelasBancocedente_contabancaria_numeroconta.AsString;
                       ContaDigito   := qryParcelasBancocedente_contabancaria_digitoconta.AsString;
                       Modalidade    := qryParcelasBancocarteira.AsString;
                       Convenio      := qryParcelasBancocedente_contabancaria_convenio.AsString;
                       CNPJCPF       := FormatarCPFouCGC(qryParcelasBancocedente_numerocpfcgc.AsString);
                       Logradouro    := qryParcelasBancorua_endcedente.asString;
                       NumeroRes     := qryParcelasBanconumero_endcedente.asString;
                       Complemento   := qryParcelasBancocomplemento_endcedente.asString;
                       Bairro        := qryParcelasBanconomebairro_endcedente.asString;
                       Cidade        := qryParcelasBanconomecidade_endcedente.asString;
                       UF            := qryParcelasBancoestado_endcedente.asString;
                       CEP           := FormatarCEP(qryParcelasBancocep_endcedente.asString);

                    end;

                    LocalPagamento:= qryParcelasBancolocalpagamento.AsString;
                    Vencimento     := qryParcelasBancodatavencto.AsDateTime;
                    DataDocumento  := qryParcelasBancodatadocumento.AsDateTime;
                    NumeroDocumento:= qryParcelasBancoNumeroDocumento.AsString;
                    ValorDocumento := qryParcelasBancovalordocumento.AsFloat;
                    EspecieDoc     := 'DM';
                    Aceite         := atNAO;
                    DataProcessamento := DataServidor;
                    Carteira       := qryParcelasBancocarteira.AsString;
                    NossoNumero    := qryParcelasBanconossonumero.AsString;
                    UsoBanco       := qryParcelasBancousodobanco.AsString;

                    SeuNumero      := qryParcelasBancoseunumero.AsString;

                    DataDesconto   := qryParcelasBancoDataDesconto.AsDateTime;
                    ValorDesconto  := qryParcelasBancovalordesconto.AsCurrency;
                    DataMoraJuros  := qryParcelasBancoDataMoraJuros.AsDateTime;
                    ValorMoraJuros := qryParcelasBancoValorMoraJuros.AsCurrency;
                    PercentualMulta:= qryParcelasBancoPercentualMoraMulta.AsCurrency;

                    Mensagem.Text  := qryParcelasBancoinstrucoes.AsString;
                    Mensagem.Text  := Trocar(Mensagem.Text, '<fjurosdiasreais>', 'R$ ' + FormatFloat('###,##0.00',qryParcelasBancojurosdiasreais.asfloat));
                    Mensagem.Text  := Trocar(Mensagem.Text, '<fmultareais>',     'R$ ' + FormatFloat('###,##0.00',(PercentualMulta/100.0) * ValorDocumento));

                    with Sacado do
                    begin
                       if qryParcelasBancopessoatipo.AsString = 'F'
                       then Pessoa := pFisica
                       else Pessoa := pJuridica;

                       NomeSacado := qryParcelasBancosacado_nome.AsString;

                       CNPJCPF  := FormatarCPFouCGC(qryParcelasBancosacado_numerocpfcgc.AsString);

                       Logradouro := qryParcelasBancosacado_endereco_rua.AsString;
                       Numero   := qryParcelasBancosacado_endereco_numero.AsString;
                       Complemento := qryParcelasBancosacado_endereco_complemento.AsString;
                       Bairro   := qryParcelasBancosacado_endereco_bairro.AsString;
                       Cidade   := qryParcelasBancosacado_endereco_cidade.AsString;
                       UF       := qryParcelasBancosacado_endereco_estado.AsString;
                       CEP      := FormatarCEP(qryParcelasBancosacado_endereco_cep.AsString);
                       Email    := qryParcelasBancosacado_email.AsString;
                       Fone     := FormatarFone(qryParcelasBancosacado_fone_ddd.AsString,qryParcelasBancosacado_fone_numero.AsString);
                       Avalista := qryParcelasBancosacador_avalista.AsString;

                       with SacadoAvalista do
                       begin
                         Logradouro    := qryParcelasBancocedente_endereco_rua.asString;
                         Numero     := qryParcelasBancocedente_endereco_numero.asString;
                         Complemento   := qryParcelasBancocedente_endereco_complemento.asString;
                         Bairro        := qryParcelasBancocedente_endereco_bairro.asString;
                         Cidade        := qryParcelasBancocedente_endereco_cidade.asString;
                         UF            := qryParcelasBancocedente_endereco_estado.asString;
                         CEP           := FormatarCEP(qryParcelasBancocedente_endereco_cep.asString);
                         Pessoa := pJuridica;
                         CNPJCPF       := qryParcelasBancocpf_cnpj_sacador_avalista.AsString;
                       end;
                    end;


                    BoletoPadrao.ImprimirMensagemPadrao:=false;
                    BoletoPadrao.AdicionarMensagensPadroes(Titulo,Mensagem);
                 end;
             end;
             qryParcelasBanco.Next;
         end;

         BoletoPadraoImprimir.MostrarPreview := False;

         if not Gerarpdf then
         begin
           BoletoPadraoImprimir.Filtro := fiNenhum;
           BoletoPadrao.Imprimir;
         end
         else
         begin
           BoletoPadraoImprimir.Filtro := fiPDF;

           BoletoPadrao.DirArqRemessa := extractfilepath(application.ExeName)+'Boletos';


           if not DirectoryExists(BoletoPadrao.DirArqRemessa) then
             if not CreateDir(BoletoPadrao.DirArqRemessa) then
              raise Exception.Create('Impossível criar o diretório '+BoletoPadrao.DirArqRemessa);

           BoletoPadraoImprimir.NomeArquivo := BoletoPadrao.DirArqRemessa + '\Boleto_'+qryParcelasBancocontrato.AsString+'_'+FormatDateTime('ddmmyyyy_hhnnss', datahoraservidor);
           BoletoPadrao.GerarPDF;
           self.vListaBoletos.append(BoletoPadraoimprimir.NomeArquivo);
         end;

      finally
         BoletoPadrao.Free;
      end;
      Result := True;
   end;

end;

function TdtmImprimeBoleto.ObterParcelas(Contrato: String): Boolean;
begin
  result := true;
  ReFazConsulta(qryModelosBoletos,[0],[ParSistema.ModeloBoleto]);

  if qryModelosBoletosmatricial.AsBoolean then
  begin
    qryParcelas.MacroByName('WhereContrato').AsString := '(p.contrato =:contrato)';
    RefazConsulta(qryParcelas,[0],[Contrato]);
    Result:= (qryParcelas.RecordCount > 0);
  end
  else
  begin

    qryParcelasBanco.Close;
    qryParcelasBanco.MacroByName('WhereContrato').AsString := '(p.contrato =:contrato) and';
    qryParcelasBanco.ParamByName('contrato').AsString := Contrato;
    qryParcelasBanco.MacroByName('WhereNumeroParcelas').AsString := '';
    qryParcelasBanco.ParamByName('UsarDadosdaFilialBase').AsBoolean := ParSistema.Usar_dados_da_filial_base_na_impressao_de_boletos;
    qryParcelasBanco.ParamByName('FilialBoleto').AsInteger := FilialBase;
    qryParcelasBanco.ParamByName('jurosatraso').Asfloat:= ParSistema.PercentualAtrasoJuros1;
    qryParcelasBanco.Open;

    Result:= (qryParcelasBanco.RecordCount > 0);

  end;


  if Result then
    if qryModelosBoletosmatricial.AsBoolean and
       qryModelosBoletos.IsEmpty then
    begin
       MensagemAviso(ctMODELOBOLETONAODEFINIDO);
       Result := False;
    end
    else
      if not qryModelosBoletosmatricial.AsBoolean and
         (ParSistema.ContaEmissaoBoleto=0) then
      begin
        MensagemAviso(ctCONTABOLETONAODEFINIDO);
        Result := False;
      end;
end;


function TdtmImprimeBoleto.ObterParcelas(Contrato: String;
  NumeroParcelas: vString): Boolean;
const
  SQLParcelas= 'and (p.numero in (%s))';
var
  i: Integer;
  parcelas: String;
begin
  result := true;
  ReFazConsulta(qryModelosBoletos,[0],[ParSistema.ModeloBoleto]);

  if Numeroparcelas<>nil then
  begin
    for i:=0 to length(numeroparcelas)-1 do
      parcelas := parcelas+NumeroParcelas[i]+',';

    delete(parcelas,length(parcelas),1);
  end
  else
    parcelas := '0';

  if qryModelosBoletosmatricial.AsBoolean then
  begin
    qryParcelas.MacroByName('WhereContrato').AsString := '(p.contrato =:contrato)';
    qryParcelas.MacroByName('WhereNumeroParcelas').AsString := format(SQLParcelas,[parcelas]);
    qryParcelas.ParamByName('jurosatraso').Asfloat:= ParSistema.PercentualAtrasoJuros1;
    RefazConsulta(qryParcelas,[1],[Contrato]);
    qryParcelas.First;
    Result:= (qryParcelas.RecordCount > 0);
  end
  else
  begin
    qryParcelasBanco.Close;
    qryParcelasBanco.MacroByName('WhereContrato').AsString := '(p.contrato =:contrato) and';
    qryParcelasBanco.ParamByName('contrato').AsString := Contrato;
    qryParcelasBanco.MacroByName('WhereNumeroParcelas').AsString := 'p.numero in ('+Parcelas+') and ';
    qryParcelasBanco.ParamByName('UsarDadosdaFilialBase').AsBoolean := ParSistema.Usar_dados_da_filial_base_na_impressao_de_boletos;
    qryParcelasBanco.ParamByName('FilialBoleto').AsInteger := FilialBase;
    qryParcelasBanco.ParamByName('jurosatraso').Asfloat:= ParSistema.PercentualAtrasoJuros1;
    qryParcelasBanco.Open;
    Result:= (qryParcelasBanco.RecordCount > 0);
  end;

  if Result then
    if qryModelosBoletos.IsEmpty then
    begin
       MensagemAviso(ctMODELOBOLETONAODEFINIDO);
       Result := False;
    end
    else
      if not qryModelosBoletosmatricial.AsBoolean and
         (ParSistema.ContaEmissaoBoleto=0) then
      begin
        MensagemAviso(ctCONTABOLETONAODEFINIDO);
        Result := False;
      end;
end;

procedure TdtmImprimeBoleto.qryParcelasBancoCalcFields(DataSet: TDataSet);
begin
  inherited;
  if qryParcelasBancopercentualdesconto.Ascurrency<>0 then
  begin
    qryParcelasBancoValorDesconto.AsCurrency := ((qryParcelasBancovalordocumento.AsCurrency *
                                             qryParcelasBancopercentualdesconto.Ascurrency)/100)/30;
    qryParcelasBancoDataDesconto.AsDateTime := qryParcelasBancodatavencto.AsDateTime - 1;
  end
  else
  begin
    qryParcelasBancoValorDesconto.AsCurrency := 0.00;
    qryParcelasBancoDataDesconto.Clear;
  end;

  if qryParcelasBancopercentualmorajuros.AsCurrency<>0 then
  begin
    if qryParcelasBancodiasatraso1.AsString<>'' then
      qryParcelasBancoDataMoraJuros.AsDateTime := qryParcelasBancodatavencto.AsDateTime + strtoint(qryParcelasBancodiasatraso1.AsString)
    else
      qryParcelasBancoDataMoraJuros.AsDateTime := qryParcelasBancodatavencto.AsDateTime + 1;
    qryParcelasBancoValorMoraJuros.AsCurrency := ((qryParcelasBancovalordocumento.AsCurrency *
                                             qryParcelasBancopercentualmorajuros.Ascurrency)/100)/30
  end
  else
  begin
    qryParcelasBancoDataMoraJuros.Clear;
    qryParcelasBancoValorMoraJuros.AsCurrency := 0.00;
  end;

  {
  if qryParcelasBancoQtdeNotasFiscais.AsInteger = 1
  then qryParcelasBancoNumeroDocumento.AsString := 'NF ' + qryParcelasBanconotafiscal.   AsString + '/'
                                                         + qryParcelasBanconumeroparcela.AsString

  else qryParcelasBancoNumeroDocumento.AsString := 'CT ' + qryParcelasBancocontrato.     AsString + '/'
                                                         + qryParcelasBanconumeroparcela.AsString;
  }

  if qryParcelasBanconotafiscal.AsInteger <> 0
  then qryParcelasBancoNumeroDocumento.AsString := 'NF ' + qryParcelasBanconotafiscal.   AsString + '/'
                                                         + qryParcelasBanconumeroparcela.AsString

  else qryParcelasBancoNumeroDocumento.AsString := 'CT ' + qryParcelasBancocontrato.     AsString + '/'
                                                         + qryParcelasBanconumeroparcela.AsString;

end;

function TdtmImprimeBoleto.ImprimirBoletoContrato(SQLParcelas: String; ContaBancaria: Integer): Boolean;
begin
  self.ContaBancaria := ContaBancaria;
  Result := False;
  if ObterParcelas2(SQLParcelas) then
  begin
    try
      if qryModelosBoletosmatricial.AsBoolean then
        Result := ImprimirBoleto(false)
      else
        Result := ImprimirBoletoCodigodeBarras;
    except
      raise
    end
  end;

end;

function TdtmImprimeBoleto.ObterParcelas2(SQLParcelas: String): Boolean;
begin
  result := true;
  ReFazConsulta(qryModelosBoletos,[0],[ParSistema.ModeloBoleto]);


  if qryModelosBoletosmatricial.AsBoolean then
  begin
    qryparcelas.Close;
    qryParcelas.MacroByName('WhereContrato').AsString := SQLParcelas;
    qryParcelas.MacroByName('WhereNumeroParcelas').AsString := '';
    qryParcelas.ParamByName('jurosatraso').Asfloat:= ParSistema.PercentualAtrasoJuros1;
    qryparcelas.Open;
    qryParcelas.First;
    Result:= (qryParcelas.RecordCount > 0);
  end
  else
  begin
    qryParcelasBanco.Close;
    qryParcelasBanco.MacroByName('WhereContrato').AsString := SQLParcelas+ ' and ';
    qryParcelasBanco.MacroByName('WhereNumeroParcelas').AsString := '';
    qryParcelasBanco.ParamByName('jurosatraso').Asfloat:= ParSistema.PercentualAtrasoJuros1;
    qryParcelasBanco.ParamByName('UsarDadosdaFilialBase').AsBoolean := ParSistema.Usar_dados_da_filial_base_na_impressao_de_boletos;
    qryParcelasBanco.ParamByName('FilialBoleto').AsInteger := FilialBase;
    qryParcelasBanco.Open;
    Result:= (qryParcelasBanco.RecordCount > 0);
  end;

  if Result then
    if qryModelosBoletos.IsEmpty then
    begin
       MensagemAviso(ctMODELOBOLETONAODEFINIDO);
       Result := False;
    end
    else
      if not qryModelosBoletosmatricial.AsBoolean and
         (ParSistema.ContaEmissaoBoleto=0) then
      begin
        MensagemAviso(ctCONTABOLETONAODEFINIDO);
        Result := False;
      end;

end;

function TdtmImprimeBoleto.GetContaBancaria: Integer;
begin
  if FContaBancaria = 0 then
    fcontaBancaria := ParSistema.ContaEmissaoBoleto;

  Result := fContaBancaria;
end;

procedure TdtmImprimeBoleto.qryParcelasBancoBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qryParcelasBanco.ParamByName('conta').AsInteger := ContaBancaria;
end;

class function TdtmImprimeBoleto.GerarBoletoPDF(Contrato: String;
  var vListaBoletos: TStringList): Boolean;
begin
//  if not assigned(dtmImprimeBoleto) then
    dtmImprimeBoleto := tdtmImprimeBoleto.Create(nil);

  dtmImprimeBoleto.vListaBoletos := vListaBoletos;

  try
    with dtmImprimeBoleto do
    begin
      if ObterParcelas(Contrato) then
        if not qryModelosBoletosmatricial.AsBoolean then
          Result := ImprimirBoletoCodigodeBarras(true);
    end;
  finally
    dtmImprimeBoleto.free;
  end;
end;

class function TdtmImprimeBoleto.GerarBoletoPDF(Contrato: String;
  NumeroParcelas: vString; var vListaBoletos: TStringList): boolean;
begin

//  if not assigned(dtmImprimeBoleto) then
    dtmImprimeBoleto := tdtmImprimeBoleto.Create(nil);

  dtmImprimeBoleto.vListaBoletos := vListaBoletos;

  try
    with dtmImprimeBoleto do
    begin
      if ObterParcelas(Contrato, NumeroParcelas) then
        if not qryModelosBoletosmatricial.AsBoolean then
          Result := ImprimirBoletoCodigodeBarras(true);
    end;
  finally
    dtmImprimeBoleto.free;
  end;

end;

destructor TdtmImprimeBoleto.Destroy;
begin

  inherited;
  dtmImprimeBoleto := nil;
end;

initialization
  RLConsts.SetVersion(3,72,'B');

end.

