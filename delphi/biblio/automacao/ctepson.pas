{********************************************************}
{                                                        }
{                                                        }
{                 Biblioteca de comandos                 }
{                          EPSON                         }
{                                                        }
{                   Ver 1.0 27/03/2003                   }
{********************************************************}

unit ctepson;

interface

const

{**************** Controle de Memoria e Dados *****************}

  EPS_INIT_PRINT            = #27#64;


{******************* Caracteres de Selecao  *******************}

  EPS_ON_UNDERLINE          = #27#45#1;
  EPS_OFF_UNDERLINE         = #27#45#0;
  EPS_ON_BOLD               = #27#69;
  EPS_OFF_BOLD              = #27#70;
  EPS_ON_ITALIC             = #27#52;
  EPS_OFF_ITALIC            = #27#53;
  EPS_OFF_CONDENSED         = #27#33#00;//#18;  //Caracteres normais
  EPS_ON_DWIDTH             = #27#87#1;         //Caracteres expandidos
  EPS_OFF_DWIDTH            = #27#87#0;         //Caracteres normais
  EPS_ON_DHEIGHT            = #27#119#1;
  EPS_OFF_DHEIGHT           = #27#119#0;
  EPS_SUPERSCRIPT           = #27#83#0;
  EPS_SUBSCRIPT             = #27#83#1;
  EPS_NORMALSCRIPT          = #27#84;
  EPS_ON_PROPORTIONAL       = #27#112#1;
  EPS_OFF_PROPORTIONAL      = #27#112#0;
  EPS_SET_MARGIN_LEFT       = #27#81;
  EPS_SET_MARGIN_RIGHT      = #27#108;
  EPS_SET_FORM_LINES        = #27#67;
  EPS_SMALL_BREAK           = #27#48;
  EPS_BIG_BREAK             = #27#50;

  EPS_ON_Condensado         = #015;
  EPS_OFF_Condensado        = #018;

  EPS_ON_Condensadoh        = #$0F;

  Esc12cpp          = #27+'M';        // Espaçamento horizontal em 12cpp
  Esc10cpp          = #27+'P';        // Espaçamento horizontal em 10cpp
  EscCondensedOn    = #15;            // Ativa o modo condensado
  EscCondensedOff   = #18;            // Desativa o modo condensado
  EscLargeOff       = #27+'W'+'0';    // Desativa o modo expandido

  Esc8lpp           = #27+'0';        // Espaçamento vertical de 8 linhas por polegada

  EscDraft          = #27+'x'+'0';    // Modo Draft




{********** Movimentacao da posicao da impressora  *********** **}

  EPS_LINE_FEED             = #10;
  EPS_CR                    = #13;
  EPS_FORM_FEED             = #12;
  EPS_VT_TAB                = #11;
  EPS_HZ_TAB                = #9;
  EPS_BACK                  = #8;
  EPS_MOVE_HEAD_TO_NN       = #27#36;


{****************** Definicao de Constantes  *******************}

  LINE                      = #$C4;

  EPS_20CPP = #27#33#05;
  EPS_15CPP = #27#103;

var
  EPS_ON_CONDENSED: string[03];   //EPS_ON_CONDENSED foi tranformada em variável
                                  //para permitir alterar a densidade de impressão
                                  //de caracteres condensados em EPS_15CPP ou
                                  //EPS_20CPP (o padrão)

implementation

begin
   EPS_ON_CONDENSED:= EPS_20CPP;
end.
