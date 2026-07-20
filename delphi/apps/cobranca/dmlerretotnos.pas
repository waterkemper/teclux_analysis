unit dmlerretotnos;

interface

uses
  SysUtils, Classes, DB, cpdatasource, ZQuery, ZPgSqlQuery, cpquery,
  dmbasico;

type
  TdtmLerRetornos = class(TdtmBasico)
    qryBancos: TtecQuery;
    qryBancoscodigo: TIntegerField;
    qryBancosnome: TStringField;
    qryBancossigla: TStringField;
    qryBancosinativo: TDateField;
    qryBancosmodelocheque: TIntegerField;
    qryBancosdiasuteisremessa: TIntegerField;
    qryBancosvalorlimitecheque: TFloatField;
    qryBancosqtdechequevista: TIntegerField;
    qryBancosqtdechequeprazo: TIntegerField;
    qryBancossequencial: TIntegerField;
    dsrBancos: TtecDataSource;
    qryConsultaBancos: TtecQuery;
    qryConsultaBancosnome: TStringField;
    qryConsultaBancossigla: TStringField;
    qryConsultaBancoscodigo: TIntegerField;
    dsrParcelas: TtecDataSource;
    qryParcelas: TtecQuery;
    qryParcelascontrato: TStringField;
    qryParcelasnumero: TIntegerField;
    qryParcelasdatavencto: TDateField;
    qryParcelasvalorvencto: TFloatField;
    qryParcelasdatapagto: TDateField;
    qryParcelasvalorpagto: TFloatField;
    qryParcelasremessa: TStringField;
    qryParcelascliente: TIntegerField;
    qryParcelasnome: TStringField;
    qryParcelasfilialvenda: TIntegerField;
    qryParcelasfaturamento: TDateField;
    qryParcelaspessoatipo: TStringField;
    qryParcelasdocumento: TStringField;
    qryParcelasrua: TStringField;
    qryParcelasinscricao: TStringField;
    qryParcelascep: TIntegerField;
    qryParcelasnomefilial: TStringField;
    qryAtualizarParcelas: TtecQuery;
    qryFiliais: TtecQuery;
    qryFiliaiscodigo: TIntegerField;
    qryFiliaisnome: TStringField;
    qryFiliaisinscricaoestadual: TStringField;
    dsrFiliais: TtecDataSource;
    qryConsultaFiliais: TtecQuery;
    qryConsultaFiliaisnome: TStringField;
    qryConsultaFiliaiscodigo: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Type  T_Header = Record
        H_TipoRegistro      :Array[001..001] of Char;  { 0        }
        H_IdentArquivo      :Array[002..002] of Char;  { 2        }
        H_LiteralRemessa    :Array[003..009] of Char;  { RETORNO  }
        H_CodigoServico     :Array[010..011] of Char;  { 01       }
        H_LiteralServico    :Array[012..026] of Char;  { COBRANCA }
        H_CodigoEmpresa     :Array[027..046] of Char;  {Fonecido pelo Bradesco}
        H_NomeEmpresa       :Array[047..076] of Char;  { Nome da Empresa}
        H_NumeroBradesco    :Array[077..079] of Char;  { 237      }
        H_NomeBanco         :Array[080..094] of Char;  { BRADESCO }
        H_DataGravacao      :Array[095..100] of Char;  { DDMMAA   }
        H_Brancos01         :Array[101..108] of Char;  { BRANCOS  }
        H_NrAvisoBancario   :Array[109..113] of Char;  { MX       }
        H_Brancos02         :Array[114..379] of Char;  { BRANCOS  }
        H_DataCredito       :Array[380..385] of Char;  { DDMMAA   }
        H_Brancos03         :Array[386..394] of Char;  { BRANCOS  }
        H_SequencialReg     :Array[395..400] of Char;  { 000001   }
        H_CrLf              :Array[401..402] of Char;
      End;

Type  T_Detalhe = Record
        D_TipoRegistro            :Array[001..001] of Char;   { 1            }
        D_TipoInscricao           :Array[002..003] of Char;   {01= CPF, 02= CGC, 03= PIS / PASEP, 98= NÃO TEM, 99= OUTROS.Ver nota explicativa 1 }
        D_NumeroInscricao         :Array[004..017] of Char;   { Conforme item acima }
        D_IndentEmpresa           :Array[018..037] of Char;   { Ver Obs 3      }
        D_ControleDoParticipante  :Array[038..062] of Char;   { Idem Remessa   }
        D_Zeros01                 :Array[063..070] of Char;   { 00000000       }
        D_IdentTitulo             :Array[071..082] of Char;   { Nosso Numero   }
        D_Zeros02                 :Array[083..107] of Char;   { 000000000000   }
        D_CodigoCarteira          :Array[108..108] of Char;   { BRANCOS        }
        D_IdentOcorrencia         :Array[109..110] of Char;   { O QUE OCORREU COM O TITULO VER TABELA }
        D_DataOcorrenciaBradesco  :Array[111..116] of Char;   { DDMMAA         }
        D_NrDuplicata             :Array[117..126] of Char;   { Numero Duplicata }
        D_IdentTituloBradesco     :Array[127..146] of Char;   { Ident. do Titulo no Bradesco }
        D_DataVenctoTitulo        :Array[147..152] of Char;   { DDMMAA  }
        D_ValorTitulo             :Array[153..165] of Char;   { Valor Titutulo }
        D_BancoCobrador           :Array[166..168] of Char;   { Codigo do Bando Cobrador    }
        D_AgenciCobradora         :Array[169..173] of Char;   { Codigo da Agencia Cobradora }
        D_EspecieTitulo           :Array[174..175] of Char;   { 1(Duplicata) ou Brancos }
        D_Zeros03                 :Array[176..253] of Char;   { Zeros }
        D_ValorPago               :Array[254..266] of Char;   { Valor Pago }
        D_Zzeros04                :Array[267..292] of Char;   { Endereco  }
        D_Brancos01               :Array[293..318] of Char;   { BRANCOS   }
        D_MotivosOcorrencias      :Array[319..320] of Char;   { Ver Tabela de Motivos }
        D_Zezros05                :Array[321..328] of Char;   { Zeros }
        D_Brancos02               :Array[329..394] of Char;   { BRANCOS   }
        D_SequencialReg           :Array[395..400] of Char;   { Sequencial}
        D_CrLf                    :Array[401..402] of Char;
      End;

Type  T_Trailler = Record
        T_TipoRegistro            :Array[001..001] of Char; { 9 }
        T_IdentRetorno            :Array[002..002] of Char; { 2 }
        T_IdentTipoRegisgitro     :Array[003..003] of Char; { 1 }
        T_CodigoBradesco          :Array[005..007] of Char; { 237 }
        T_Brancos01               :Array[008..017] of Char; { Sequencial }
        T_QtdeTitEmCobranca       :Array[018..025] of Char; { Qtde de Titulos em Cobrança }
        T_ValorTotalemCobranca    :Array[026..039] of Char; { Qtde de Titulos em Cobraçca }
        T_NumeroAvisoBancario     :Array[040..047] of Char; { Número do Aviso Bancário    }
        T_Brancos02               :Array[048..057] of Char; { Brancos }
        T_QtdeTitConfirmados      :Array[058..062] of Char; { Titulos Aceito ocorrência 2 }
        T_ValorTitConfirmados     :Array[063..074] of Char; { Total Titulos Confirmados   }
        T_ValorTitCreditados      :Array[075..086] of Char; { Total dos Titulos Creditados}
        T_QtdeTitLiquidados       :Array[087..091] of Char; { Ocorrencia 6 - Liquidação Normal}
        T_ValorTotalBaixados      :Array[092..103] of Char; { Valor Total dos Titulos Baixados }
        T_QtdeTitBaixadosAPedido  :Array[104..108] of Char; { Ocorrencia 9/10 Baixados a pedido da Empresa }
        T_ValorTitBaixadosPedido  :Array[109..120] of Char; { Ocorrencia 9/10 Valor Baixados a pedido pela Empresa}
        T_QtdeTitAbatimCancelado  :Array[121..125] of Char; { Ocorrencia 13 - Abatimento Cancelado }
        T_VAlorTitAbatimCancelado :Array[126..137] of Char; { Ocorrencia 13 - Valor Titulos Abatimento Cancelado }
        T_QtdeTitVenctoAlterado   :Array[138..142] of Char; { Ocorrencia 14 - Qtde Titulos Vencto Alterado }
        T_ValorTitVenctoAlterado  :Array[143..154] of Char; { Ocorrencia 14 - Valor Titulos Vencto Alterado }
        T_QtdeTitAbatimConcedido  :Array[155..159] of Char; { Ocorrencia 12 - Qtde Titullos Abatimento Concedido }
        T_ValorTitAbatimConcedido :Array[160..171] of Char; { Ocorrencia 12 - Valor Titulos Abatimento Concecido }
        T_QtdeTitProtesto         :Array[172..176] of Char; { Ocorrencia 19 - Qtde Titulos Confirmação de Protesto }
        T_ValorTitProtesto        :Array[177..188] of Char; { Ocorrencia 19 - Valor Titulos Confirmação de Protesto }
        T_Brancos3                :Array[189..362] of Char; { Brancos }
        T_Zeros01                 :Array[363..385] of Char; { Zeros   }
        T_Brancos4                :Array[386..394] of Char; { Brancos }
        T_SequencialReg           :Array[395..400] of Char; { Sequencial do Registro }
        T_CrLf                    :Array[401..402] of Char;
      End;

var
  dtmLerRetornos: TdtmLerRetornos;

implementation

{$R *.dfm}

end.
