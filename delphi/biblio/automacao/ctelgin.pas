unit ctelgin;

interface

const 
{$IFDEF LINUX}
  ELGIN_OK                                       = 0;
  ELGIN_ERR_COMUNICACAO                          = -1;
{$ELSE }
  ELGIN_OK                                       = 1;
  ELGIN_ERR_COMUNICACAO                          = 0;
  NAK                                           = 21;
{$ENDIF}
{ST1}
  ELGIN_ERR_ININAOENCONTRADO                     = -4;
  ELGIN_ERR_ABRIRPORTASERIAL                     = -5;


  ELGIN_ERR_NROPARAMETROSINVALIDO                = 1;
  ELGIN_ERR_CUPOMABERTO                          = 2;
  ELGIN_ERR_COMANDOINEXISTENTE                   = 4;
  ELGIN_ERR_PRIMEIROCODIGODIFEREDEESC            = 8;
  ELGIN_ERR_IMPRESSORACOMERRO                    = 16;
  ELGIN_ERR_ERRONORELOGIO                        = 32;
  ELGIN_ERR_POUCOPAPEL                           = 64;
  ELGIN_ERR_FIMPAPEL                             = 128;
{ST2}
  ELGIN_ERR_COMANDONAOEXECUTADO                  = 1;
  ELGIN_ERR_CGCIENAOPROGRAMADO                   = 2;
  ELGIN_ERR_CANCELAMENTONAOPERMITIDO             = 4;
  ELGIN_ERR_NROALIQLOTADA                        = 8;
  ELGIN_ERR_ALIQUOTANAOPROGRAMADA                = 16;
  ELGIN_ERR_ERRORAMCMOS                          = 32;
  ELGIN_ERR_MEMORIAFISCALCHEIA                   = 64;
  ELGIN_ERR_TIPOPARAMETROINVALIDO                = 128;

implementation

end.

