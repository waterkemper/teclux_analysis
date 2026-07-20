{********************************************************}
{                                                        }
{                                                        }
{         Interface com a Biblioteca ECF32M              }
{          das impressoras fiscais Mecaf                 }
{                                                        }
{                   Ver 1.0 12/03/2003                   }
{********************************************************}

unit bbecf_mecaf;

interface

uses {$IFNDEF LINUX}Windows,{$ENDIF} Classes;

{$B-}
{$R-}
{$V-}
{$T-}
{$X+}
{$P+}
{$J+}
{$H+}

{***************** Definicao de Constantes da API ****************}

const

{$IFNDEF LINUX}
  LIB_NAME = 'ECF32M.dll';
  INI_FILE = 'Cif.ini';
  INI_PATH = 'c:\windows\system\';
{$ELSE}
  LIB_NAME = 'tececfmecaf.so';
//  INI_FILE = 'Cif.ini';
  INI_PATH = '/usr/lib/';
{$ENDIF}

  MECA_BUFFERVAZIO                              = 999;
  MECA_BUFFER_SIZE                              = 2000;
  MECA_INICIO_MSG                               = 6;
  MECA_OK                                       = 0;   { Sucesso }
  MECA_OK_CUPNF                                 = 3;   { Sucesso Abrindo Cupom Rel Gerencial }
  MECA_OK_CANCCUP                               = 2;   { Sucesso Cancelando Cupom }
  MECA_OK_PPAPEL                                = 1;   { Sucesso Detectado pouco papel }
  MECA_EMEXECUCAO                               = -85; { Comando nao recebido pelo ECF }
  MECA_IRRECUPERAVEL                            = -94; { Erro Irrecuperavel }
  MECA_SEMRETORNO                               = -97; { Sem Retorno }
  MECA_FIMRETORNO                               = 40;  { Retorno Valido }
  MECA_OVERFLOW                                 = -98; { Overflow }
  MECA_TIMEOUT                                  = -99; { TimeOut na execucao do comando }
  MECA_INVAL_CABECALHO                          = -1;
  MECA_INVAL_COMANDO                            = -2;
  MECA_INVAL_NUMERO                             = -3;
  MECA_INVAL_FAIXA                              = -4;
  MECA_INVAL_OPERADOR1                          = -5;
  MECA_INVAL_OPERADOR2                          = -6;
  MECA_INVAL_INTERVALO_DATA                     = -7;
  MECA_INVAL_TOTAL                              = -9;
  MECA_INVAL_SINTAXE                            = -10;
  MECA_INVAL_LINHAS                             = -11;
  MECA_INVAL_TERMINADOR                         = -12;
  MECA_INVAL_CHECKSUM                           = -13;
  MECA_INVAL_SITUACAO_TRIBUTO                   = -15;
  MECA_INVAL_DATA                               = -16;
  MECA_INVAL_HORA                               = -17;
  MECA_INVAL_INTERVALO_ALIQUOTA                 = -18;
  MECA_INVAL_SINAL                              = -19;
  MECA_INVAL_ALFANUMERIO                        = -59;
  MECA_ACPT_CUPOM_FISCAL                        = -23;
  MECA_ACPT_CUPOM_NAO_FISCAL                    = -25;
  MECA_MEM_NAO_VENDAS                           = -38;
  MECA_MEM_INTERVENCAO                          = -39;
  MECA_STAT_CMD_EXECUTANDO                      = -43;
  MECA_STAT_IMP_CHEQUE                          = -44;
  MECA_STAT_NAO_IMP_CHEQUE                      = -45;
  MECA_ERR_MODO_INTERVENCAO                     = -20;
  MECA_ERR_MODO_NORMAL                          = -21;
  MECA_ERR_ABRIR_CUPOM_FISCAL                   = -22;
  MECA_ERR_ABRIR_CUPOM_NAO_FISCAL               = -24;
  MECA_ERR_RELOGIO_VERAO                        = -26;
  MECA_ERR_RELOGIO_NAO_VERAO                    = -27;
  MECA_ERR_REALIZAR_REDUCAOZ                    = -28;
  MECA_ERR_FECHA_REDUCAOZ_EXECUTADO             = -29;
  MECA_ERR_PROGRAMAR_LEGENDA                    = -30;
  MECA_ERR_ITEM_CANCELADO                       = -31;
  MECA_ERR_CUPOM_NAO_PODE_CANCELAR              = -32;
  MECA_ERR_FALTA_PAPEL                          = -33;
  MECA_ERR_PROGRAMAR_ESTABELECIMENTO            = -36;
  MECA_ERR_REALIZAR_INTERVENCAO                 = -37;
  MECA_ERR_PROGRAMAR_RELOGIO                    = -40;
  MECA_ERR_ITENS_CUPOM                          = -41;
  MECA_ERR_AJUSTE_HORA                          = -42;
  MECA_ERR_INSERIR_CHEQUE                       = -46;
  MECA_ERR_INSERIR_BOBINA                       = -47;
  MECA_ERR_REALIZAR_LEITURAX                    = -48;
  MECA_ERR_IMPRESSORA                           = -49;
  MECA_ERR_CUPOM_TOTALIZADO                     = -50;
  MECA_ERR_TOTALIZAR_CUPOM                      = -51;
  MECA_ERR_FINALIZAR_CUPOM                      = -52;
  MECA_ERR_GRAVAR_MEMORIA                       = -53;
  MECA_ERR_NUMERO_ESTABELECIMENTO               = -54;
  MECA_ERR_MEMORIA_INICIADA                     = -55;
  MECA_ERR_ULTRAPASSA_PAGAMENTO                 = -56;
  MECA_ERR_TROCO_REALIZADO                      = -57;
  MECA_ERR_COMPLETAR_PAGAMENTO                  = -58;
  MECA_ERR_NUMERO_CARACTER                      = -60;
  MECA_ERR_TROCO_NAO_REALIZADO                  = -61;
  MECA_ERR_CMD_DESABILITADO                     = -62;
  MECA_ERR                                      = -84; { Falha Geral }
  MECA_ERR_CONFIG                               = -86; { Erro no Cif.ini }
  MECA_ERR_SERIAL                               = -87; { Falha na abertura da serial }
{$IFNDEF LINUX}
  MECA_ERR_SYS                                  = -88; { Erro na alocacao de recursos do windows}
{$ENDIF}
  MECA_ERR_ANSWER                               = -89; { Retorno nao identificado }
  MECA_ERR_READSER                              = -90; { Erro de TimeOut na Read Serial }
  MECA_ERR_TEMP                                 = -91; { Temperatura Alta }
  MECA_ERR_PPAPEL                               = -92; { Detectado pouco papel }
  MECA_ERR_MECANICO                             = -95; { Erro Mecanico }
  MECA_ERR_TABERTA                              = -96; { Tampa Aberta }


{************* Definicao de Tipos de Funçoes da API **************}

 type

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 Funções de Inicializacao e Finalizacao
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

    {$IFNDEF LINUX}
    TMeca_OpenCif = function: Integer; stdcall
    {$ELSE}
    TMeca_OpenCif = function(Porta: PChar): Integer; cdecl
    {$ENDIF};

    TMeca_CloseCif = procedure;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

{~~~~~~~~~~~~~~~~~~~~~~
 Funcoes da impressora
~~~~~~~~~~~~~~~~~~~~~~}

    TMeca_ImprimeValidacao = function(Leg, LinhaOp: PChar):Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TMeca_ModoChequeValidacao = function(Tipo, Load: Char):Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TMeca_ImprimeCheque = function(l1, c1, l2, c2, l3, c3, l4, l5, c5, l6, l7, c8: Char;
                                   Valor, Favorecido, local: PChar;
                                   Setano: Char;
                                   Data, Coment1, Coment2: PChar):Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TMeca_CancelaChequeValidacao = function: Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 Funcoes de Operacoes Fiscais
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

    TMeca_AbreCupomFiscal = function: Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TMeca_VendaItem = function(Fmt: Char; Qtd, punit, Tributo: PChar;
                               TDesc: Char;
                               Valor, Unidade, Codigo: PChar;
                               Ex: Char;
                               Descricao, LegendaOP: PChar):Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TMeca_DescontoItem = function(Toper: Char; Valor, Legop: PChar): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TMeca_TotalizarCupom = function(Oper, Toper: Char; Valor, LegendaOP: PChar): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TMeca_TotalizarCupomParcial = function: Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TMeca_PagamentoA = function(Reg, Vpagto: PChar; Subtr: Char): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TMeca_CancelamentoItem = function(Numitem: PChar): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TMeca_FechaCupomFiscalA = function(Tam_msg, Msg: PChar): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TMeca_CancelaCupomFiscal = function: Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TMeca_LeituraX = function(relGer: Char): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TMeca_ReducaoZ = function(relGer: Char): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TMeca_LeMemFiscalData = function(Datai, Dataf: PChar; Res: Char): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TMeca_LeMemFiscalReducaoA = function(Redi, Redf: PChar; Res: Char): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 Funcoes de operacoes nao sujeitas ao ICMS
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

    TMeca_AbreCupomVinculado = function: Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TMeca_AbreCupomNaoVinculado = function: Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TMeca_EncerraCupomNaoFiscal = function: Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TMeca_CancelaCupomNaoFiscal = function: Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TMeca_OperRegNaoVinculadoA = function(Reg, Valor: PChar; Oper, Toper: Char;
                                           ValorOp, LegOp: PChar): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TMeca_ImprimeLinhaNaoFiscalA = function(Par: Char; Msg: PChar): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TMeca_ImprimeNaoFiscal = function(Par: Char; Msg: PChar): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TMeca_ProgramaLegenda = function(eg, leg: PChar): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

{~~~~~~~~~~~~~~~~
 Funcoes Diversas
~~~~~~~~~~~~~~~~~}

    TMeca_AbrirGaveta = function(Tipo, Ton, Toff: Char): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TMeca_ProgramaHorarioVerao = function(hv: Char): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TMeca_ImprimeTotalizadores = function(reg: PChar): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TMeca_TransTabAliquotas = function: Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TMeca_TransTotCont = function: Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    {$IFNDEF LINUX}
    TMeca_TransStatus = function(bittest: Integer; bufStat: PChar): Integer; stdcall
    {$ELSE}
    TMeca_TransStatus = function(bittest: Integer; bufStat: PChar): Integer; cdecl
    {$ENDIF};

    TMeca_TransMemFiscalDataArq = function(DataI, DataF, Arq: PChar): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TMeca_TransDataHora = function: Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TMeca_EcfPar = function(par: PChar): Integer;
    {$IFNDEF LINUX} stdcall{$ELSE} cdecl {$ENDIF};

    TMeca_ProgLinhaAdicional = function(reg: PChar): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TMeca_AjusteHora = function(dir: Char; hora: PChar): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TMeca_EcfID = function: Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    {$IFNDEF LINUX}
     TMeca_ObtemRetorno = function(bufret: PChar):Integer; stdcall
    {$ELSE}
     TMeca_ObtemRetorno = function(var bufret: String):Integer; cdecl
    {$ENDIF};

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 Funcoes de Intervencao Tecnica
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

    TMeca_ProgRelogio = function(hora, data: PChar): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TMeca_GravaDados = function(cgc, ie, ccm: PChar):Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TMeca_RecompoeDadosNOVRAM = function: Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TMeca_ProgAliquotas = function(tot, aliq: PChar): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TMeca_ProgSimbolo = function(s1, s2, s3, s4, s5, s6,
                                 s7, s8, s9, s10, s11: Char):Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TMeca_ProgRazaoSocial = function(razsoc: PChar; numseq: PChar):Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TMeca_Prog_Moeda = function(sing, plur: PChar):Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TMeca_ProgArredondamento = function(par: Char):Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};


{**************** Variaveis para funçoes da API ******************}

var
    Meca_OpenCif                                : TMeca_OpenCif;
    Meca_CloseCif                               : TMeca_CloseCif;
    Meca_ImprimeValidacao                       : TMeca_ImprimeValidacao;
    Meca_ModoChequeValidacao                    : TMeca_ModoChequeValidacao;
    Meca_ImprimeCheque                          : TMeca_ImprimeCheque;
    Meca_CancelaChequeValidacao                 : TMeca_CancelaChequeValidacao;
    Meca_AbreCupomFiscal                        : TMeca_AbreCupomFiscal;
    Meca_VendaItem                              : TMeca_VendaItem;
    Meca_DescontoItem                           : TMeca_DescontoItem;
    Meca_TotalizarCupom                         : TMeca_TotalizarCupom;
    Meca_TotalizarCupomParcial                  : TMeca_TotalizarCupomParcial;
    Meca_PagamentoA                             : TMeca_PagamentoA;
    Meca_CancelamentoItem                       : TMeca_CancelamentoItem;
    Meca_FechaCupomFiscalA                      : TMeca_FechaCupomFiscalA;
    Meca_CancelaCupomFiscal                     : TMeca_CancelaCupomFiscal;
    Meca_LeituraX                               : TMeca_LeituraX;
    Meca_ReducaoZ                               : TMeca_ReducaoZ;
    Meca_LeMemFiscalData                        : TMeca_LeMemFiscalData;
    Meca_LeMemFiscalReducaoA                    : TMeca_LeMemFiscalReducaoA;
    Meca_AbreCupomVinculado                     : TMeca_AbreCupomVinculado;
    Meca_AbreCupomNaoVinculado                  : TMeca_AbreCupomNaoVinculado;
    Meca_EncerraCupomNaoFiscal                  : TMeca_EncerraCupomNaoFiscal;
    Meca_CancelaCupomNaoFiscal                  : TMeca_CancelaCupomNaoFiscal;
    Meca_OperRegNaoVinculadoA                   : TMeca_OperRegNaoVinculadoA;
    Meca_ImprimeLinhaNaoFiscalA                 : TMeca_ImprimeLinhaNaoFiscalA;
    Meca_ImprimeNaoFiscal                       : TMeca_ImprimeNaoFiscal;
    Meca_ProgramaLegenda                        : TMeca_ProgramaLegenda;
    Meca_AbrirGaveta                            : TMeca_AbrirGaveta;
    Meca_ProgramaHorarioVerao                   : TMeca_ProgramaHorarioVerao;
    Meca_ImprimeTotalizadores                   : TMeca_ImprimeTotalizadores;
    Meca_TransTabAliquotas                      : TMeca_TransTabAliquotas;
    Meca_TransTotCont                           : TMeca_TransTotCont;
    Meca_TransStatus                            : TMeca_TransStatus;
    Meca_TransMemFiscalDataArq                  : TMeca_TransMemFiscalDataArq;
    Meca_TransDataHora                          : TMeca_TransDataHora;
    Meca_EcfPar                                 : TMeca_EcfPar;
    Meca_ProgLinhaAdicional                     : TMeca_ProgLinhaAdicional;
    Meca_AjusteHora                             : TMeca_AjusteHora;
    Meca_EcfID                                  : TMeca_EcfID;
    Meca_ObtemRetorno                           : TMeca_ObtemRetorno;
    Meca_ProgRelogio                            : TMeca_ProgRelogio;
    Meca_GravaDados                             : TMeca_GravaDados;
    Meca_RecompoeDadosNOVRAM                    : TMeca_RecompoeDadosNOVRAM;
    Meca_ProgAliquotas                          : TMeca_ProgAliquotas;
    Meca_ProgSimbolo                            : TMeca_ProgSimbolo;
    Meca_ProgRazaoSocial                        : TMeca_ProgRazaoSocial;
    Meca_Prog_Moeda                             : TMeca_Prog_Moeda;
    Meca_ProgArredondamento                     : TMeca_ProgArredondamento;

    function MecafLoadLib: Boolean;

const
  Lib: string = LIB_NAME;
  hLib: THandle = 0;
  LibLoaded: Boolean = False;
  LibNotFound = 'A biblioteca %s não foi encontrada';

implementation

uses SysUtils;

function MecafLoadLib: Boolean;
begin
  Result := False;
  {Carrega biblioteca}
  if hLib = 0 then
  begin
    hLib := GetModuleHandle(PChar(Lib));
    LibLoaded := False;
    if hLib = 0 then
    begin
      hLib := LoadLibrary(PChar(Lib));
      LibLoaded := True;
    end;
  end;
  {Carrega funcoes contidas na biblioteca}
  if hLib <> 0 then
  begin
    @Meca_OpenCif                               := GetProcAddress(hLib, 'OpenCif');
    @Meca_CloseCif                              := GetProcAddress(hLib, 'CloseCif');
    @Meca_ImprimeValidacao                      := GetProcAddress(hLib, 'ImprimeValidacao');
    @Meca_ModoChequeValidacao                   := GetProcAddress(hLib, 'ModoChequeValidacao');
    @Meca_ImprimeCheque                         := GetProcAddress(hLib, 'ImprimeCheque');
    @Meca_CancelaChequeValidacao                := GetProcAddress(hLib, 'CancelaChequeValidacao');
    @Meca_AbreCupomFiscal                       := GetProcAddress(hLib, 'AbreCupomFiscal');
    @Meca_VendaItem                             := GetProcAddress(hLib, 'VendaItem');
    @Meca_DescontoItem                          := GetProcAddress(hLib, 'DescontoItem');
    @Meca_TotalizarCupom                        := GetProcAddress(hLib, 'TotalizarCupom');
    @Meca_TotalizarCupomParcial                 := GetProcAddress(hLib, 'TotalizarCupomParcial');
    @Meca_PagamentoA                            := GetProcAddress(hLib, 'Pagamento');
    @Meca_CancelamentoItem                      := GetProcAddress(hLib, 'CancelamentoItem');
    @Meca_FechaCupomFiscalA                     := GetProcAddress(hLib, 'FechaCupomFiscal');
    @Meca_CancelaCupomFiscal                    := GetProcAddress(hLib, 'CancelaCupomFiscal');
    @Meca_LeituraX                              := GetProcAddress(hLib, 'LeituraX');
    @Meca_ReducaoZ                              := GetProcAddress(hLib, 'ReducaoZ');
    @Meca_LeMemFiscalData                       := GetProcAddress(hLib, 'LeMemFiscalData');
    @Meca_LeMemFiscalReducaoA                   := GetProcAddress(hLib, 'LeMemFiscalReducao');
    @Meca_AbreCupomVinculado                    := GetProcAddress(hLib, 'AbreCupomVinculado');
    @Meca_AbreCupomNaoVinculado                 := GetProcAddress(hLib, 'AbreCupomNaoVinculado');
    @Meca_EncerraCupomNaoFiscal                 := GetProcAddress(hLib, 'EncerraCupomNaoFiscal');
    @Meca_CancelaCupomNaoFiscal                 := GetProcAddress(hLib, 'CancelaCupomNaoFiscal');
    @Meca_OperRegNaoVinculadoA                  := GetProcAddress(hLib, 'OperRegNaoVinculado');
    @Meca_ImprimeLinhaNaoFiscalA                := GetProcAddress(hLib, 'ImprimeLinhaNaoFiscal');
    @Meca_ImprimeNaoFiscal                      := GetProcAddress(hLib, 'ImprimeNaoFiscal');
    @Meca_ProgramaLegenda                       := GetProcAddress(hLib, 'ProgramaLegenda');
    @Meca_AbrirGaveta                           := GetProcAddress(hLib, 'AbrirGaveta');
    @Meca_ProgramaHorarioVerao                  := GetProcAddress(hLib, 'ProgramaHorarioVerao');
    @Meca_ImprimeTotalizadores                  := GetProcAddress(hLib, 'ImprimeTotalizadores');
    @Meca_TransTabAliquotas                     := GetProcAddress(hLib, 'TransTabAliquotas');
    @Meca_TransTotCont                          := GetProcAddress(hLib, 'TransTotCont');
    @Meca_TransStatus                           := GetProcAddress(hLib, 'TransStatus');
    @Meca_TransMemFiscalDataArq                 := GetProcAddress(hLib, 'TransMemFiscalDataArq');
    @Meca_TransDataHora                         := GetProcAddress(hLib, 'TransDataHora');
    @Meca_EcfPar                                := GetProcAddress(hLib, 'EcfPar');
    @Meca_ProgLinhaAdicional                    := GetProcAddress(hLib, 'ProgLinhaAdicional');
    @Meca_AjusteHora                            := GetProcAddress(hLib, 'AjusteHora');
    @Meca_EcfID                                 := GetProcAddress(hLib, 'EcfID');
    @Meca_ObtemRetorno                          := GetProcAddress(hLib, 'ObtemRetorno');
    @Meca_ProgRelogio                           := GetProcAddress(hLib, 'ProgRelogio');
    @Meca_GravaDados                            := GetProcAddress(hLib, 'GravaDados');
    @Meca_RecompoeDadosNOVRAM                   := GetProcAddress(hLib, 'RecompoeDadosNOVRAM');
    @Meca_ProgAliquotas                         := GetProcAddress(hLib, 'ProgAliquotas');
    @Meca_ProgSimbolo                           := GetProcAddress(hLib, 'ProgSimbolo');
    @Meca_ProgRazaoSocial                       := GetProcAddress(hLib, 'ProgRazaoSocial');
    @Meca_Prog_Moeda                            := GetProcAddress(hLib, 'Prog_Moeda');
    @Meca_ProgArredondamento                    := GetProcAddress(hLib, 'ProgArredondamento');
  end
  else
    raise Exception.Create(Format(LibNotFound,[Lib]));
end;

initialization

finalization
  if (hLib <> 0) and LibLoaded then
    FreeLibrary(hLib);

end.

