unit ctbematech;

interface

const 
{$IFDEF LINUX}
  BEMA_OK                                       = 0;
  BEMA_ERR_COMUNICACAO                          = -1;
{$ELSE }
  BEMA_OK                                       = 1;
  BEMA_ERR_COMUNICACAO                          = 0;
  NAK                                           = 21;
{$ENDIF}
{ST1}
  BEMA_ERR_ININAOENCONTRADO                     = -4;
  BEMA_ERR_ABRIRPORTASERIAL                     = -5;


  BEMA_ERR_NROPARAMETROSINVALIDO                = 1;
  BEMA_ERR_CUPOMABERTO                          = 2;
  BEMA_ERR_COMANDOINEXISTENTE                   = 4;
  BEMA_ERR_PRIMEIROCODIGODIFEREDEESC            = 8;
  BEMA_ERR_IMPRESSORACOMERRO                    = 16;
  BEMA_ERR_ERRONORELOGIO                        = 32;
  BEMA_ERR_POUCOPAPEL                           = 64;
  BEMA_ERR_FIMPAPEL                             = 128;
{ST2}
  BEMA_ERR_COMANDONAOEXECUTADO                  = 1;
  BEMA_ERR_CGCIENAOPROGRAMADO                   = 2;
  BEMA_ERR_CANCELAMENTONAOPERMITIDO             = 4;
  BEMA_ERR_NROALIQLOTADA                        = 8;
  BEMA_ERR_ALIQUOTANAOPROGRAMADA                = 16;
  BEMA_ERR_ERRORAMCMOS                          = 32;
  BEMA_ERR_MEMORIAFISCALCHEIA                   = 64;
  BEMA_ERR_TIPOPARAMETROINVALIDO                = 128;

implementation

end.
